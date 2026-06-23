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

    // Rate limit
    $pdo = getPDO();
    $ip = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    if (!check_rate_limit($pdo, (string)$ip, 50)) {
        http_response_code(429);
        echo json_encode(['success' => false, 'message' => 'Too many requests. Try again later.']);
        exit;
    }
    log_rate_hit($pdo, (string)$ip);

    // Inputs
    $name = sanitize((string)($_POST['name'] ?? ''), 150);
    $phone_raw = (string)($_POST['phone'] ?? '');
    $email = sanitize((string)($_POST['email'] ?? ''), 200);
    $subject = sanitize((string)($_POST['subject'] ?? ''), 100);
    $message = sanitize((string)($_POST['message'] ?? ''), 2000);

    // Validate
    $errors = [];
    if (mb_strlen($name) < 2) $errors[] = 'Enter valid name.';
    $phone = preg_replace('/\D+/', '', $phone_raw);
    if (!preg_match('/^[0-9]{10}$/', $phone)) $errors[] = 'Invalid phone number.';
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) $errors[] = 'Invalid email.';
    if (mb_strlen($message) < 5) $errors[] = 'Message is too short.';

    if ($errors) {
        http_response_code(400);
        echo json_encode(['success' => false, 'message' => implode(' ', $errors)]);
        exit;
    }

    // Insert into DB
    $sql = "INSERT INTO contact_messages 
           (name, phone, email, subject, message, created_at)
           VALUES (:name, :phone, :email, :subject, :message, NOW())";

    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':name' => $name,
        ':phone' => $phone,
        ':email' => $email,
        ':subject' => $subject,
        ':message' => $message,
    ]);

    $contact_id = (int)$pdo->lastInsertId();

    app_log('info', 'New contact form message', [
        'contact_id' => $contact_id,
        'name' => $name,
        'phone' => $phone
    ]);

    echo json_encode([
        'success' => true,
        'message' => 'Your message has been received. We will contact you shortly.',
        'contact_id' => $contact_id
    ]);
    exit;

} catch (Throwable $ex) {
    @ob_end_clean();
    http_response_code(500);

    app_log('error', 'Contact form processing failed', [
        'error' => $ex->getMessage(),
        'trace' => $ex->getTraceAsString()
    ]);

    echo json_encode([
        'success' => false,
        'message' => 'Server error. Try again later.'
    ]);
    exit;
}
?>