<?php
// process-booking.php
declare(strict_types=1);

require_once __DIR__ . '/app/config.php';
require_once __DIR__ . '/app/functions.php';
require_once __DIR__ . '/includes/session.php';

header('Content-Type: application/json');

try {

    // ============================================
    // LOGIN CHECK
    // ============================================
    if (!isLoggedIn()) {
        echo json_encode([
            'success'       => false,
            'require_login' => true,
            'message'       => 'Please login to book a service.',
            'redirect'      => BASE_URL . 'auth/login.php'
        ]);
        exit;
    }

    // ============================================
    // ONLY POST ALLOWED
    // ============================================
    if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
        echo json_encode(['success' => false, 'message' => 'Invalid request method']);
        exit;
    }

    // ============================================
    // CSRF CHECK
    // ============================================
    if (!csrf_check($_POST['csrf_token'] ?? '')) {
        echo json_encode(['success' => false, 'message' => 'Session expired. Please refresh the page.']);
        exit;
    }

    // ============================================
    // RATE LIMITING (Max 10 bookings per hour)
    // ============================================
    $pdo = getPDO();
    $clientIP = $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';

    if (!check_rate_limit($pdo, $clientIP, 10)) {
        echo json_encode([
            'success' => false,
            'message' => 'Too many booking requests. Please try again later.'
        ]);
        exit;
    }

    // ============================================
    // SANITIZE INPUTS
    // ============================================
    $userId      = getUserId();
    $full_name   = sanitize($_POST['full_name'] ?? '', 100);
    $email       = sanitizeEmail($_POST['email'] ?? '');
    $mobile      = sanitizeMobile($_POST['mobile'] ?? '');
    $service     = sanitize($_POST['service'] ?? '', 100);
    $pickup_date = sanitize($_POST['pickup_date'] ?? '', 20);
    $time_slot   = sanitize($_POST['time_slot'] ?? '', 50);
    $instructions = sanitize($_POST['instructions'] ?? '', 500);
    $address     = sanitize($_POST['address'] ?? '', 500);
    $city        = sanitize($_POST['city'] ?? '', 100);
    $pincode     = sanitize($_POST['pincode'] ?? '', 10);

    // ============================================
    // VALIDATION
    // ============================================
    $errors = [];

    if (empty($full_name)) {
        $errors[] = 'Full name is required';
    }

    if (empty($mobile) || !preg_match('/^[0-9]{10}$/', $mobile)) {
        $errors[] = 'Valid 10-digit mobile number is required';
    }

    if (empty($service)) {
        $errors[] = 'Please select a service';
    }

    if (empty($pickup_date)) {
        $errors[] = 'Please select a pickup date';
    } else {
        // Check if pickup date is not in the past
        $pickupTimestamp = strtotime($pickup_date);
        $todayTimestamp = strtotime(date('Y-m-d'));

        if ($pickupTimestamp === false) {
            $errors[] = 'Invalid pickup date format';
        } elseif ($pickupTimestamp < $todayTimestamp) {
            $errors[] = 'Pickup date cannot be in the past';
        }

        // Check if pickup date is not more than 30 days ahead
        $maxDate = strtotime('+30 days');
        if ($pickupTimestamp > $maxDate) {
            $errors[] = 'Pickup date cannot be more than 30 days ahead';
        }
    }

    if (empty($time_slot)) {
        $errors[] = 'Please select a time slot';
    }

    // Validate time slot values
    $validTimeSlots = [
        '08:00-10:00',
        '10:00-12:00',
        '12:00-14:00',
        '14:00-16:00',
        '16:00-18:00',
        '18:00-20:00',
    ];

    if (!empty($time_slot) && !in_array($time_slot, $validTimeSlots)) {
        $errors[] = 'Invalid time slot selected';
    }

    if ($email && !filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $errors[] = 'Invalid email format';
    }

    if ($pincode && !preg_match('/^[0-9]{6}$/', $pincode)) {
        $errors[] = 'Invalid pincode';
    }

    if (!empty($errors)) {
        echo json_encode([
            'success' => false,
            'message' => implode('. ', $errors)
        ]);
        exit;
    }

    // ============================================
    // CHECK FOR DUPLICATE BOOKING (Same user, same date, same slot)
    // ============================================
    $duplicateCheck = $pdo->prepare("
        SELECT id FROM bookings 
        WHERE user_id = ? 
        AND pickup_date = ? 
        AND time_slot = ? 
        AND status NOT IN ('cancelled', 'converted_to_order')
        AND is_deleted = 0
    ");
    $duplicateCheck->execute([$userId, $pickup_date, $time_slot]);

    if ($duplicateCheck->fetch()) {
        echo json_encode([
            'success' => false,
            'message' => 'You already have a booking for this date and time slot.'
        ]);
        exit;
    }

    // ============================================
    // DETERMINE BOOKING SOURCE
    // ============================================
    $userAgent = strtolower($_SERVER['HTTP_USER_AGENT'] ?? '');
    $bookingSource = 'website';

    if (str_contains($userAgent, 'mobile') || str_contains($userAgent, 'android') || str_contains($userAgent, 'iphone')) {
        $bookingSource = 'app';
    }

    // ============================================
    // INSERT BOOKING
    // ============================================
    $stmt = $pdo->prepare("
        INSERT INTO bookings (
            user_id, full_name, mobile, email, service, 
            pickup_date, time_slot, instructions, 
            address, booking_source, status, 
            is_deleted, created_at
        ) VALUES (
            ?, ?, ?, ?, ?, 
            ?, ?, ?, 
            ?, ?, 'new', 
            0, NOW()
        )
    ");

    $stmt->execute([
        $userId,
        $full_name,
        $mobile,
        $email ?: null,
        $service,
        $pickup_date,
        $time_slot,
        $instructions ?: null,
        $address ?: null,
        $bookingSource,
    ]);

    $bookingId = (int)$pdo->lastInsertId();

    // ============================================
    // LOG RATE HIT
    // ============================================
    log_rate_hit($pdo, $clientIP);

    // ============================================
    // CREATE NOTIFICATION FOR USER
    // ============================================
    try {
        createNotification(
            $pdo,
            $userId,
            'Booking Received! 🧺',
            "Your booking for {$service} on " . formatDate($pickup_date) . " ({$time_slot}) has been received. We'll confirm it shortly!",
            'order',
            $bookingId,
            'booking'
        );
    } catch (Throwable $e) {
        // Silent fail
    }

    // ============================================
    // CREATE NOTIFICATION FOR ADMIN
    // ============================================
    try {
        // Notify all admins
        $admins = $pdo->query("SELECT id FROM users WHERE role IN ('" . ROLE_SUPER_ADMIN . "', '" . ROLE_ADMIN . "') AND status = 'active' AND is_deleted = 0")->fetchAll();

        foreach ($admins as $admin) {
            createNotification(
                $pdo,
                (int)$admin['id'],
                'New Booking Received! 📋',
                "New booking from {$full_name} ({$mobile}) for {$service} on " . formatDate($pickup_date) . ".",
                'order',
                $bookingId,
                'booking'
            );
        }
    } catch (Throwable $e) {
        // Silent fail
    }

    // ============================================
    // SEND WHATSAPP CONFIRMATION (Optional)
    // ============================================
    try {
        $whatsappMsg = "🧺 *" . APP_NAME . " - Booking Received!*\n\n"
            . "Hi {$full_name},\n"
            . "Your booking has been received!\n\n"
            . "📋 Service: {$service}\n"
            . "📅 Date: " . formatDate($pickup_date) . "\n"
            . "🕐 Time: {$time_slot}\n\n"
            . "We'll confirm your booking shortly.\n"
            . "Thank you for choosing " . APP_NAME . "! ✨";

        sendWhatsApp($mobile, $whatsappMsg);
    } catch (Throwable $e) {
        // Silent fail - WhatsApp is optional
    }

    // ============================================
    // LOG ACTIVITY
    // ============================================
    log_activity(
        $pdo,
        'Booking',
        'create',
        "New booking #{$bookingId} by {$full_name} ({$mobile}) for {$service} on {$pickup_date}"
    );

    // ============================================
    // LOG APP EVENT
    // ============================================
    app_log('info', 'New booking created', [
        'booking_id'  => $bookingId,
        'user_id'     => $userId,
        'service'     => $service,
        'pickup_date' => $pickup_date,
        'time_slot'   => $time_slot,
        'source'      => $bookingSource,
        'ip'          => $clientIP,
    ]);

    // ============================================
    // SUCCESS RESPONSE
    // ============================================
    echo json_encode([
        'success'    => true,
        'message'    => 'Booking successful! We will contact you shortly to confirm.',
        'booking_id' => $bookingId,
        'details'    => [
            'service'     => $service,
            'pickup_date' => formatDate($pickup_date),
            'time_slot'   => $time_slot,
        ]
    ]);

} catch (Throwable $e) {

    // Log Error
    app_log('error', 'Booking failed', [
        'error'   => $e->getMessage(),
        'file'    => $e->getFile(),
        'line'    => $e->getLine(),
        'user_id' => getUserId() ?? 0,
        'ip'      => $_SERVER['REMOTE_ADDR'] ?? '',
    ]);

    error_log("Booking error: " . $e->getMessage());

    echo json_encode([
        'success' => false,
        'message' => 'Something went wrong. Please try again later.'
    ]);
}
exit;