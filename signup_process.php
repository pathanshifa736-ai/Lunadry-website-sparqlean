<?php
declare(strict_types=1);
require_once __DIR__ . "/app/config.php";


$pdo = getPDO();

// Input Fetch
$full_name = trim(string: $_POST['full_name'] ?? '');
$mobile = trim($_POST['mobile'] ?? '');
$email = trim($_POST['email'] ?? '');
$password = trim($_POST['password'] ?? '');
$confirm_password = trim($_POST['confirm_password'] ?? '');

// Required fields
if ($full_name === '' || $mobile === '' || $email === '' || $password === '' || $confirm_password === '') {
    die("<script>alert('All fields required!'); window.history.back();</script>");
}

// Mobile validation
if (!preg_match('/^[0-9]{10}$/', $mobile)) {
    die("<script>alert('Please enter 10-digit mobile number'); window.history.back();</script>");
}

// Email validation
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    die("<script>alert('Invalid email address'); window.history.back();</script>");
}

// Password match
if ($password !== $confirm_password) {
    die("<script>alert('Passwords do not match'); window.history.back();</script>");
}

// Strong password rule
if (strlen($password) < 6) {
    die("<script>alert('Password must be minimum 6 characters'); window.history.back();</script>");
}

/* ----------------------------------------------
   Check for duplicate email
---------------------------------------------- */
$stmt = $pdo->prepare("SELECT id FROM users WHERE email = ? AND is_delete = 0 LIMIT 1");
$stmt->execute([$email]);

if ($stmt->rowCount() > 0) {
    die("<script>alert('Email already registered!'); window.location='index.php';</script>");
}

/* ----------------------------------------------
   Check for duplicate mobile
---------------------------------------------- */
$stmt = $pdo->prepare("SELECT id FROM users WHERE mobile = ? AND is_delete = 0 LIMIT 1");
$stmt->execute([$mobile]);

if ($stmt->rowCount() > 0) {
    die("<script>alert('Mobile number already exists!'); window.history.back();</script>");
}

// Hash password
$hashed = password_hash($password, PASSWORD_DEFAULT);

/* ----------------------------------------------
   INSERT USER
---------------------------------------------- */
$stmt = $pdo->prepare("
    INSERT INTO users(full_name, mobile, email, password, is_delete) 
    VALUES(?, ?, ?, ?, 0)
");

if ($stmt->execute([$full_name, $mobile, $email, $hashed])) {
    echo "<script>alert('Signup successful! Please login.'); window.location='login_user.php';</script>";
} else {
    echo "<script>alert('Error while saving data!'); window.history.back();</script>";
}
?>
