<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WashNova Laundry - Login & Signup</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

       
        .container {
            max-width: 1000px;
            width: 100%;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 50px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            display: flex;
            min-height: 600px;
            position: relative;
        }

        .form-box {
            width: 50%;
            display: flex;
            position: absolute;
            transition: all 0.6s ease-in-out;
        }

        .form-box.login {
            left: 0;
            z-index: 1;
        }

        .form-box.signup {
            left: 100%;
            opacity: 0;
            z-index: 0;
        }

        .container.active .form-box.login {
            left: -100%;
            opacity: 0;
            z-index: 0;
        }

        .container.active .form-box.signup {
            left: 50%;
            opacity: 1;
            z-index: 1;
        }

        .form-details {
            width: 100%;
            background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%);
            padding: 60px 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            color: #000;
            position: relative;
            overflow: hidden;
        }

        .form-details::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%);
            animation: pulse 15s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: translate(0, 0) scale(1); }
            50% { transform: translate(20px, 20px) scale(1.1); }
        }

        .form-details h2 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 15px;
            position: relative;
            z-index: 1;
        }

        .form-details p {
            font-size: 16px;
            line-height: 1.6;
            opacity: 0.9;
            position: relative;
            z-index: 1;
        }

        .form-content {
            width: 100%;
            padding: 60px 50px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-content h2 {
            font-size: 32px;
            color: #000;
            margin-bottom: 30px;
            font-weight: 700;
        }

        .input-field {
            position: relative;
            margin-bottom: 25px;
        }

        .input-field input {
            width: 100%;
            padding: 15px 10px 5px;
            border: none;
            border-bottom: 2px solid #ddd;
            background: transparent;
            font-size: 16px;
            color: #000;
            outline: none;
            transition: all 0.3s ease;
        }

        .input-field input:focus {
            border-bottom-color: #FFD700;
        }

        .input-field label {
            position: absolute;
            left: 10px;
            top: 15px;
            color: #666;
            font-size: 16px;
            pointer-events: none;
            transition: all 0.3s ease;
        }

        .input-field input:focus ~ label,
        .input-field input:valid ~ label {
            top: 0;
            font-size: 12px;
            color: #FFD700;
        }

        .forgot-pass-link {
            color: #000;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            margin: 10px 0 20px;
            transition: color 0.3s ease;
        }

        .forgot-pass-link:hover {
            color: #FFD700;
        }

        button[type="submit"] {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #FFD700 0%, #FFA500 100%);
            border: none;
            border-radius: 8px;
            color: #000;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }

        button[type="submit"]:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 20px rgba(255, 215, 0, 0.4);
        }

        .policy-text {
            margin: 15px 0;
            display: flex;
            align-items: center;
            font-size: 14px;
            color: #666;
        }

        .policy-text input[type="checkbox"] {
            margin-right: 8px;
            cursor: pointer;
        }

        .policy-text .option {
            color: #FFD700;
            text-decoration: none;
            margin-left: 4px;
        }

        .policy-text .option:hover {
            text-decoration: underline;
        }

        .bottom-link {
            text-align: center;
            margin-top: 25px;
            font-size: 14px;
            color: #666;
        }

        .bottom-link a {
            color: #FFD700;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
            transition: color 0.3s ease;
        }

        .bottom-link a:hover {
            color: #FFA500;
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .form-box {
                width: 100%;
                position: relative;
            }

            .form-box.login,
            .form-box.signup {
                position: relative;
                left: 0 !important;
                opacity: 1 !important;
            }

            .form-box.signup {
                display: none;
            }

            .container.active .form-box.login {
                display: none;
            }

            .container.active .form-box.signup {
                display: flex;
            }

            .form-details {
                padding: 40px 30px;
            }

            .form-content {
                padding: 40px 30px;
            }

            .form-details h2 {
                font-size: 32px;
            }

            .form-content h2 {
                font-size: 26px;
            }
        }
    </style>
</head>
<body>
    <div class="container" id="container">
        <!-- ========== LOGIN FORM ========== -->
        <div class="form-box login">
            <div class="form-details">
                <h2>Welcome Back</h2>
                <p>Please log in to continue your laundry services with WashNova.</p>
            </div>

            <div class="form-content">
                <h2>LOGIN</h2>

                <form action="login_process.php" method="POST">
                    <div class="input-field">
                        <input type="text" name="email" required>
                        <label>Email</label>
                    </div>

                    <div class="input-field">
                        <input type="password" name="password" required>
                        <label>Password</label>
                    </div>

                    <a href="forget_password.php" class="forgot-pass-link">Forgot password?</a>

                    <button type="submit">Log In</button>
                </form>

                <div class="bottom-link">
                    Don't have an account?
                    <a href="#" id="signup-link">Signup</a>
                </div>
            </div>
        </div>

        <!-- ========== SIGNUP FORM ========== -->
        <div class="form-box signup">
            <div class="form-content">
                <h2>SIGNUP</h2>

                <form action="signup_process.php" method="POST">
                    <div class="input-field">
                        <input type="text" name="full_name" required>
                        <label>Full Name</label>
                    </div>

                    <div class="input-field">
                        <input type="text" name="mobile" required>
                        <label>Mobile Number</label>
                    </div>

                    <div class="input-field">
                        <input type="email" name="email" required>
                        <label>Email Address</label>
                    </div>

                    <div class="input-field">
                        <input type="password" name="password" required>
                        <label>Create Password</label>
                    </div>

                    <div class="input-field">
                        <input type="password" name="confirm_password" required>
                        <label>Confirm Password</label>
                    </div>

                    <div class="policy-text">
                        <input type="checkbox" id="policy" required>
                        <label for="policy">
                            I agree the
                            <a href="#" class="option">Terms & Conditions</a>
                        </label>
                    </div>

                    <button type="submit">Sign Up</button>
                </form>

                <div class="bottom-link">
                    Already have an account?
                    <a href="#" id="login-link">Login</a>
                </div>
            </div>

            <div class="form-details">
                <h2>Create Account</h2>
                <p>Join WashNova and get premium laundry services delivered to your doorstep.</p>
            </div>
        </div>
    </div>

    <script>
        const container = document.getElementById('container');
        const signupLink = document.getElementById('signup-link');
        const loginLink = document.getElementById('login-link');

        signupLink.addEventListener('click', (e) => {
            e.preventDefault();
            container.classList.add('active');
        });

        loginLink.addEventListener('click', (e) => {
            e.preventDefault();
            container.classList.remove('active');
        });
    </script>
</body>
</html>