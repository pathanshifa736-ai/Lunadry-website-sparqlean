<?php
session_start();
require_once __DIR__ . "/app/config.php";

require_once __DIR__ . '/mail.php';

$pdo = getPDO();
$err = '';
$success = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $email = trim($_POST['email'] ?? '');

    if ($email === '') {
        $err = 'Please enter your email.';
    } else {

        // 🔍 CHECK USER IN users TABLE
        $stmt = $pdo->prepare("
            SELECT id 
            FROM users 
            WHERE email = :email AND is_delete = 0
            LIMIT 1
        ");
        $stmt->execute([':email' => $email]);
        $user = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$user) {
            $err = 'Email not found.';
        } else {

            // 🔐 Generate OTP
            $otp = sprintf("%06d", random_int(100000, 999999));

            // 🗄 Insert OTP into users_password_reset_otp
            $stmt = $pdo->prepare("
                INSERT INTO users_password_reset_otp
                (user_id, email, otp, created_at, expires_at, used)
                VALUES
                (:user_id, :email, :otp, NOW(), DATE_ADD(NOW(), INTERVAL 10 MINUTE), 0)
            ");

            $stmt->execute([
                ':user_id' => $user['id'],
                ':email'   => $email,
                ':otp'     => $otp
            ]);

            // 💾 Store session data
            $_SESSION['reset_user_id']  = $user['id'];
            $_SESSION['reset_email']    = $email;
            $_SESSION['otp_verified']   = false;

            // 📧 Send OTP Email
            if (sendOTP($email, $otp)) {
                header("Location: verify_otp.php");
                exit;
            } else {
                $err = "Failed to send OTP. Please try again.";
            }
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Forgot Password</title>

<style>
/* === SAME CSS YOU PROVIDED (unchanged) === */
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap");

* { margin: 0; padding: 0; box-sizing: border-box; font-family: "Open Sans", sans-serif; }

body {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  padding: 0 10px;
}
body::before {
  content: "";
  position: absolute;
  width: 100%;
  height: 100%;
  background: url("assets/img/hero-bg.jpg") no-repeat center;
  background-size: cover;
}

.wrapper {
  width: 400px;
  border-radius: 12px;
  padding: 35px;
  background: rgba(0,0,0,0.35);
  backdrop-filter: blur(12px);
  border: 1px solid rgba(255,255,255,0.4);
  color: #fff;
  text-align: center;
}

.input-field {
  margin: 18px 0;
  padding: 8px;
  background: rgba(255,255,255,0.15);
  border-radius: 8px;
}

.input-field input {
  width: 100%;
  background: transparent;
  border: none;
  color: #fff;
  font-size: 16px;
  outline: none;
}

.alert {
  padding: 10px;
  background: rgba(220,53,69,0.2);
  border: 1px solid rgba(220,53,69,0.5);
  color: #ff6b6b;
  margin-bottom: 15px;
}

button {
  background: #ffd84d;
  border: none;
  padding: 12px;
  width: 100%;
  border-radius: 6px;
  font-weight: bold;
  cursor: pointer;
}
</style>
</head>

<body>
<div class="wrapper">
<form method="POST">

<h2>Forgot Password</h2>
<p>Enter your registered email to receive OTP</p>

<?php if ($err): ?>
<div class="alert"><?= htmlspecialchars($err) ?></div>
<?php endif; ?>

<div class="input-field">
<input type="email" name="email" required placeholder="Enter your email">
</div>

<button type="submit">Generate OTP</button>

<p style="margin-top:20px;">
<a href="index.php" style="color:#ffd84d;">Back to Login</a>
</p>

</form>
</div>
</body>
</html>
