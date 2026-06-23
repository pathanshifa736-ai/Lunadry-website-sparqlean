<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require __DIR__ . '/app/phpmailer/src/PHPMailer.php';
require __DIR__ . '/app/phpmailer/src/SMTP.php';
require __DIR__ . '/app/phpmailer/src/Exception.php';

$mail = new PHPMailer(true);
$mail->SMTPDebug = 2; // debug on
$mail->isSMTP();
$mail->Host = 'smtp.gmail.com';
$mail->SMTPAuth = true;
$mail->Username = 'pathanshifa736@gmail.com';
$mail->Password = 'grfdcqykuanbgmsi';
$mail->SMTPSecure = 'tls';  // या ssl
$mail->Port = 587;          // tls → 587, ssl → 465

$mail->setFrom('pathanshifa736@gmail.com', 'Test Mail');
$mail->addAddress('recipient@gmail.com'); // अपनी या किसी और email

$mail->Subject = 'Test Mail';
$mail->Body = 'This is a test mail';

try {
    $mail->send();
    echo 'Mail sent successfully!';
} catch (Exception $e) {
    echo 'Mail failed: ' . $mail->ErrorInfo;
}
