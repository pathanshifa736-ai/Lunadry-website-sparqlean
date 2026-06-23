<?php
session_start();
require_once __DIR__ . '/config.php';

$pdo = getPDO();
$err = '';
$success = '';

// 🔐 SESSION CHECK
if (
    !isset($_SESSION['reset_email']) ||
    !isset($_SESSION['reset_user_id'])
) {
    header("Location: forget_password.php");
    exit;
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    $otp_input = trim($_POST['otp'] ?? '');

    if ($otp_input === '') {
        $err = 'Please enter the OTP.';
    } else {

        // 🔍 VERIFY OTP
        $stmt = $pdo->prepare("
            SELECT id, otp, expires_at
            FROM users_password_reset_otp
            WHERE user_id = :user_id
              AND email = :email
              AND otp = :otp
              AND used = 0
            ORDER BY created_at DESC
            LIMIT 1
        ");

        $stmt->execute([
            ':user_id' => $_SESSION['reset_user_id'],
            ':email'   => $_SESSION['reset_email'],
            ':otp'     => $otp_input
        ]);

        $otp_record = $stmt->fetch(PDO::FETCH_ASSOC);

        if (!$otp_record) {
            $err = 'Invalid OTP. Please try again.';
        } elseif (strtotime($otp_record['expires_at']) < time()) {
            $err = 'OTP expired. Please request a new one.';
        } else {

            // ✅ OTP VERIFIED
            $_SESSION['otp_verified'] = true;

            // 🔒 MARK OTP AS USED
            $stmt = $pdo->prepare("
                UPDATE users_password_reset_otp
                SET used = 1
                WHERE id = :id
            ");
            $stmt->execute([
                ':id' => $otp_record['id']
            ]);

            header("Location: reset_password.php");
            exit;
        }
    }
}
?>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>

<style>
@import url("https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;600;700&display=swap");

* { margin:0; padding:0; box-sizing:border-box; font-family:"Open Sans", sans-serif; }

body {
  display:flex;
  align-items:center;
  justify-content:center;
  min-height:100vh;
  background:url("assets/img/hero-bg.jpg") no-repeat center/cover;
}

.wrapper {
  width:400px;
  padding:35px;
  border-radius:12px;
  background:rgba(0,0,0,0.35);
  backdrop-filter:blur(12px);
  text-align:center;
  color:#fff;
}

.input-field {
  margin:18px 0;
  padding:8px;
  background:rgba(255,255,255,0.15);
  border-radius:8px;
}

.input-field input {
  width:100%;
  border:none;
  outline:none;
  background:transparent;
  color:#fff;
  font-size:18px;
  letter-spacing:8px;
  text-align:center;
}

.alert {
  background:rgba(220,53,69,0.2);
  border:1px solid rgba(220,53,69,0.5);
  color:#ff6b6b;
  padding:12px;
  margin-bottom:15px;
}

button {
  background:#ffd84d;
  border:none;
  padding:12px;
  width:100%;
  font-weight:700;
  border-radius:6px;
  cursor:pointer;
}
</style>
</head>

<body>
<div class="wrapper">

<form method="POST">

<h2>Verify OTP</h2>

<p style="margin-bottom:15px;">
We’ve sent a 6-digit OTP to
</p>

<p style="color:#ffd84d; font-weight:600;">
<?= htmlspecialchars($_SESSION['reset_email']) ?>
</p>

<?php if ($err): ?>
<div class="alert"><?= htmlspecialchars($err) ?></div>
<?php endif; ?>

<div class="input-field">
<input type="text"
       name="otp"
       maxlength="6"
       pattern="[0-9]{6}"
       placeholder="______"
       required>
</div>

<button type="submit">Verify OTP</button>

<p style="margin-top:20px;">
<a href="forget_password.php" style="color:#ffd84d;">Resend OTP</a>
</p>

<p style="margin-top:10px;">
<a href="forget_password.php" style="color:#ffd84d;">← Back</a>
</p>

</form>

</div>
</body>
</html>
