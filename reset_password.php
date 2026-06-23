<?php
session_start();
require_once __DIR__ . '/config.php';

$pdo = getPDO();
$err = '';
$success = '';

// 🔐 SESSION VALIDATION
if (
    !isset($_SESSION['reset_email']) ||
    !isset($_SESSION['reset_user_id']) ||
    !isset($_SESSION['otp_verified']) ||
    $_SESSION['otp_verified'] !== true
) {
    header("Location: forget_password.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $password = $_POST['password'] ?? '';
    $confirm  = $_POST['confirm'] ?? '';

    if ($password === '' || $confirm === '') {
        $err = 'All fields are required.';
    } elseif ($password !== $confirm) {
        $err = 'Passwords do not match.';
    } elseif (strlen($password) < 6) {
        $err = 'Password must be at least 6 characters long.';
    } else {

        // 🔒 HASH PASSWORD
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        // 🔄 UPDATE USER PASSWORD
        $stmt = $pdo->prepare("
            UPDATE users 
            SET password = :password 
            WHERE id = :user_id
        ");
        $stmt->execute([
            ':password' => $hashedPassword,
            ':user_id'  => $_SESSION['reset_user_id']
        ]);

        // ✅ MARK OTP AS USED
        $stmt = $pdo->prepare("
            UPDATE users_password_reset_otp
            SET used = 1
            WHERE user_id = :user_id
        ");
        $stmt->execute([
            ':user_id' => $_SESSION['reset_user_id']
        ]);

        // 🧹 CLEAR SESSION
        unset(
            $_SESSION['reset_email'],
            $_SESSION['reset_user_id'],
            $_SESSION['otp_verified']
        );

        // 🎉 SUCCESS PAGE WITH AUTO REDIRECT
        echo '
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="refresh" content="2;url=index.php">
<title>Password Reset Success</title>

<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;600;700&display=swap");
* { margin:0; padding:0; box-sizing:border-box; font-family:"Open Sans", sans-serif; }
body {
  display:flex; justify-content:center; align-items:center;
  min-height:100vh;
  background:url("assets/img/hero-bg.jpg") center/cover no-repeat;
}
.wrapper {
  width:400px;
  padding:35px;
  background:rgba(0,0,0,0.35);
  border-radius:12px;
  text-align:center;
  color:#fff;
  backdrop-filter:blur(12px);
}
.success {
  padding:15px;
  background:rgba(40,167,69,0.2);
  border:1px solid rgba(40,167,69,0.5);
  color:#5fff8a;
  border-radius:6px;
  margin:20px 0;
}
</style>
</head>

<body>
<div class="wrapper">
<h2>✔ Success</h2>
<div class="success">Your password has been reset successfully.</div>
<p>Redirecting to login page...</p>
</div>
</body>
</html>';
        exit;
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

<!-- SAME CSS AS YOUR ORIGINAL (UNCHANGED) -->
<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;600;700&display=swap");
* { margin:0; padding:0; box-sizing:border-box; font-family:"Open Sans", sans-serif; }
body {
  display:flex; justify-content:center; align-items:center;
  min-height:100vh;
  background:url("assets/img/hero-bg.jpg") center/cover no-repeat;
}
.wrapper {
  width:400px;
  padding:35px;
  background:rgba(0,0,0,0.35);
  border-radius:12px;
  color:#fff;
  backdrop-filter:blur(12px);
}
.input-field {
  margin:15px 0;
  padding:8px;
  background:rgba(255,255,255,0.15);
  border-radius:8px;
}
.input-field input {
  width:100%;
  background:transparent;
  border:none;
  outline:none;
  color:#fff;
}
.alert {
  background:rgba(220,53,69,0.2);
  border:1px solid rgba(220,53,69,0.5);
  color:#ff6b6b;
  padding:10px;
  margin-bottom:15px;
}
button {
  background:#ffd84d;
  border:none;
  padding:12px;
  width:100%;
  font-weight:700;
  border-radius:6px;
}
</style>
</head>

<body>
<div class="wrapper">
<form method="POST">

<h2>Reset Password</h2>

<?php if ($err): ?>
<div class="alert"><?= htmlspecialchars($err) ?></div>
<?php endif; ?>

<div class="input-field">
<input type="password" name="password" placeholder="New Password" required>
</div>

<div class="input-field">
<input type="password" name="confirm" placeholder="Confirm Password" required>
</div>

<button type="submit">Reset Password</button>

<p style="margin-top:20px;">
<a href="index.php" style="color:#ffd84d;">← Back to Login</a>
</p>

</form>
</div>
</body>
</html>
