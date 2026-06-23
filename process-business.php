<?php
declare(strict_types=1);

// JSON + error buffer
ob_start();

set_error_handler(function($severity, $message, $file, $line) {
    if (!(error_reporting() & $severity)) return false;
    throw new ErrorException($message, 0, $severity, $file, $line);
});

register_shutdown_function(function() {
    $err = error_get_last();
    if ($err !== null) {
        @ob_end_clean();
        header('Content-Type: application/json; charset=utf-8', true, 500);
        echo json_encode([
            'success' => false,
            'message' => 'Fatal: ' . ($err['message'] ?? 'unknown'),
        ]);
    }
});

header('Content-Type: application/json; charset=utf-8');

try {
    require_once __DIR__ . '/includes/init.php';

    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Invalid request method']);
        exit;
    }

    // CSRF
    $csrf = $_POST['csrf_token'] ?? '';
    if (!csrf_check((string)$csrf)) {
        http_response_code(403);
        echo json_encode(['success' => false, 'message' => 'Invalid security token']);
        exit;
    }

    // Rate Limit
    $pdo = getPDO();
    $ip = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    if (!check_rate_limit($pdo, $ip, 30)) {
        http_response_code(429);
        echo json_encode(['success' => false, 'message' => 'Too many requests. Try again later.']);
        exit;
    }
    log_rate_hit($pdo, $ip);

    // Input
    $name = sanitize((string)($_POST['full_name'] ?? ''), 150);
    $business = sanitize((string)($_POST['business_name'] ?? ''), 150);
    $email = sanitize((string)($_POST['email'] ?? ''), 200);
    $phone_raw = (string)($_POST['phone'] ?? '');
    $type = sanitize((string)($_POST['business_type'] ?? ''), 50);
    $requirements = sanitize((string)($_POST['requirements'] ?? ''), 1000);

    // Validation
    $errors = [];

    if (mb_strlen($name) < 2) $errors[] = "Enter valid full name.";
    if (mb_strlen($business) < 2) $errors[] = "Enter valid business name.";
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = "Invalid email.";
    
    $phone = preg_replace('/\D+/', '', $phone_raw);
    if (!preg_match('/^[0-9]{10}$/', $phone))
        $errors[] = "Invalid phone number.";

    if ($type === '') $errors[] = "Select business type.";

    if ($errors) {
        http_response_code(400);
        echo json_encode(['success'=>false,'message'=>implode(' ', $errors)]);
        exit;
    }

    // Insert
    $sql = "INSERT INTO business_inquiries 
            (full_name, business_name, email, phone, business_type, requirements, created_at)
            VALUES (:name, :business, :email, :phone, :type,:requirements, NOW())";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':business' => $business,
        ':email' => $email,
        ':phone' => $phone,
        ':type' => $type,
        ':requirements' => $requirements,
    ]);

    $id = (int)$pdo->lastInsertId();

    app_log('info', 'Business Inquiry Received', [
        'business_id' => $id,
        'company' => $business,
        'contact' => $phone
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Your request has been submitted. Our team will contact you shortly.',
        'business_id' => $id
    ]);
    exit;

} catch (Throwable $ex) {
    @ob_end_clean();
    http_response_code(500);

    app_log('error', 'Business Form Error', [
        'error'=>$ex->getMessage(),
        'trace'=>$ex->getTraceAsString()
    ]);

    echo json_encode([
        'success' => false,
        'message' => 'Internal server error. Try again later.'
    ]);
    exit;
}
