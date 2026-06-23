<?php
/**
 * SparQlean Setup Diagnostic Tool
 * Run this file to check your configuration
 */
require_once __DIR__ . '/app/functions.php';

header('Content-Type: text/html; charset=utf-8');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WashNova Setup Test</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif; background: #f3f4f6; padding: 20px; }
        .container { max-width: 900px; margin: 0 auto; background: white; border-radius: 12px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); padding: 30px; }
        h1 { color: #1f2937; margin-bottom: 10px; }
        .subtitle { color: #6b7280; margin-bottom: 30px; }
        .test-item { padding: 15px; margin-bottom: 15px; border-radius: 8px; border-left: 4px solid #d1d5db; background: #f9fafb; }
        .test-item.success { border-left-color: #10b981; background: #ecfdf5; }
        .test-item.error { border-left-color: #ef4444; background: #fef2f2; }
        .test-item.warning { border-left-color: #f59e0b; background: #fffbeb; }
        .test-title { font-weight: 600; color: #1f2937; margin-bottom: 5px; display: flex; align-items: center; gap: 8px; }
        .test-message { color: #6b7280; font-size: 14px; margin-top: 5px; }
        .test-details { background: #ffffff; padding: 10px; border-radius: 6px; margin-top: 8px; font-size: 13px; color: #4b5563; font-family: 'Courier New', monospace; }
        .icon { display: inline-block; width: 20px; height: 20px; text-align: center; }
        .section { margin-top: 30px; padding-top: 20px; border-top: 2px solid #e5e7eb; }
        .code { background: #1f2937; color: #10b981; padding: 15px; border-radius: 8px; font-family: 'Courier New', monospace; font-size: 13px; margin-top: 10px; overflow-x: auto; }
        .btn { display: inline-block; padding: 10px 20px; background: #3b82f6; color: white; text-decoration: none; border-radius: 6px; margin-top: 10px; font-weight: 600; }
        .btn:hover { background: #2563eb; }
    </style>
</head>
<body>
    <div class="container">
        <h1>🔍 WashNova Setup Diagnostic</h1>
        <p class="subtitle">Testing your system configuration...</p>

        <?php
        $errors = 0;
        $warnings = 0;

        // Test 1: Database Connection
        echo '<div class="test-item ';
        try {
            $pdo = getPDO();
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> Database Connection</div>';
            echo '<div class="test-message">Successfully connected to database: ' . env('DB_NAME') . '</div>';
        } catch (Exception $e) {
            $errors++;
            echo 'error">';
            echo '<div class="test-title"><span class="icon">❌</span> Database Connection Failed</div>';
            echo '<div class="test-message">Error: ' . htmlspecialchars($e->getMessage()) . '</div>';
            echo '<div class="test-details">Check your .env file database credentials</div>';
        }
        echo '</div>';

        // Test 2: Required Tables
        if (isset($pdo)) {
            $requiredTables = ['bookings', 'notification_queue', 'booking_rate_limit', 'app_logs'];
            $missingTables = [];
            
            foreach ($requiredTables as $table) {
                try {
                    $stmt = $pdo->query("SELECT 1 FROM `$table` LIMIT 1");
                } catch (Exception $e) {
                    $missingTables[] = $table;
                }
            }
            
            echo '<div class="test-item ';
            if (empty($missingTables)) {
                echo 'success">';
                echo '<div class="test-title"><span class="icon">✅</span> Database Tables</div>';
                echo '<div class="test-message">All required tables exist</div>';
            } else {
                $errors++;
                echo 'error">';
                echo '<div class="test-title"><span class="icon">❌</span> Missing Database Tables</div>';
                echo '<div class="test-message">Missing tables: ' . implode(', ', $missingTables) . '</div>';
                echo '<div class="test-details">Run the SQL schema to create missing tables</div>';
            }
            echo '</div>';
        }

        // Test 3: PHP Extensions
        $requiredExtensions = ['pdo_mysql', 'curl', 'mbstring', 'json'];
        $missingExtensions = [];
        
        foreach ($requiredExtensions as $ext) {
            if (!extension_loaded($ext)) {
                $missingExtensions[] = $ext;
            }
        }
        
        echo '<div class="test-item ';
        if (empty($missingExtensions)) {
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> PHP Extensions</div>';
            echo '<div class="test-message">All required PHP extensions are loaded</div>';
        } else {
            $errors++;
            echo 'error">';
            echo '<div class="test-title"><span class="icon">❌</span> Missing PHP Extensions</div>';
            echo '<div class="test-message">Missing: ' . implode(', ', $missingExtensions) . '</div>';
            echo '<div class="test-details">Install missing extensions using: sudo apt-get install php-' . implode(' php-', $missingExtensions) . '</div>';
        }
        echo '</div>';

        // Test 4: WhatsApp API Configuration
        $waToken = env('WHATSAPP_API_TOKEN', '');
        $waPhoneId = env('WHATSAPP_PHONE_NUMBER_ID', '');
        
        echo '<div class="test-item ';
        if (!empty($waToken) && !empty($waPhoneId)) {
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> WhatsApp API Configured</div>';
            echo '<div class="test-message">API credentials are set (Token: ' . substr($waToken, 0, 10) . '...)</div>';
            echo '<div class="test-details">Phone Number ID: ' . htmlspecialchars($waPhoneId) . '</div>';
        } else {
            $warnings++;
            echo 'warning">';
            echo '<div class="test-title"><span class="icon">⚠️</span> WhatsApp API Not Configured</div>';
            echo '<div class="test-message">Using fallback mode - WhatsApp web links will be provided instead</div>';
            echo '<div class="test-details">Set WHATSAPP_API_TOKEN and WHATSAPP_PHONE_NUMBER_ID in .env for automatic notifications</div>';
        }
        echo '</div>';

        // Test 5: File Permissions
        $writableDirs = [__DIR__];
        $permissionIssues = [];
        
        foreach ($writableDirs as $dir) {
            if (!is_writable($dir)) {
                $permissionIssues[] = $dir;
            }
        }
        
        echo '<div class="test-item ';
        if (empty($permissionIssues)) {
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> File Permissions</div>';
            echo '<div class="test-message">Application directory is writable</div>';
        } else {
            $warnings++;
            echo 'warning">';
            echo '<div class="test-title"><span class="icon">⚠️</span> Permission Issues</div>';
            echo '<div class="test-message">Some directories are not writable</div>';
            echo '<div class="test-details">chmod 755 ' . implode(' ', $permissionIssues) . '</div>';
        }
        echo '</div>';

        // Test 6: reCAPTCHA
        $recaptchaSite = env('RECAPTCHA_SITE_KEY', '');
        $recaptchaSecret = env('RECAPTCHA_SECRET_KEY', '');
        
        echo '<div class="test-item ';
        if (!empty($recaptchaSite) && !empty($recaptchaSecret)) {
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> reCAPTCHA Configured</div>';
            echo '<div class="test-message">Bot protection is enabled</div>';
        } else {
            $warnings++;
            echo 'warning">';
            echo '<div class="test-title"><span class="icon">⚠️</span> reCAPTCHA Not Configured</div>';
            echo '<div class="test-message">Forms are not protected from bots (recommended for production)</div>';
            echo '<div class="test-details">Get keys from: https://www.google.com/recaptcha</div>';
        }
        echo '</div>';

        // Test 7: Session Configuration
        echo '<div class="test-item ';
        if (session_status() === PHP_SESSION_ACTIVE) {
            echo 'success">';
            echo '<div class="test-title"><span class="icon">✅</span> Session Management</div>';
            echo '<div class="test-message">Sessions are working correctly</div>';
        } else {
            $errors++;
            echo 'error">';
            echo '<div class="test-title"><span class="icon">❌</span> Session Problem</div>';
            echo '<div class="test-message">PHP sessions are not starting properly</div>';
        }
        echo '</div>';

        // Summary Section
        echo '<div class="section">';
        echo '<h2 style="color: #1f2937; margin-bottom: 15px;">📊 Summary</h2>';
        
        if ($errors === 0 && $warnings === 0) {
            echo '<div style="padding: 20px; background: #ecfdf5; border-radius: 8px; border: 2px solid #10b981;">';
            echo '<div style="font-size: 18px; font-weight: 600; color: #059669; margin-bottom: 10px;">✅ Perfect! Your system is ready</div>';
            echo '<div style="color: #047857;">All tests passed. You can start accepting bookings now.</div>';
            echo '<a href="./" class="btn" style="margin-top: 15px;">Go to Homepage</a>';
            echo '</div>';
        } elseif ($errors === 0) {
            echo '<div style="padding: 20px; background: #fffbeb; border-radius: 8px; border: 2px solid #f59e0b;">';
            echo '<div style="font-size: 18px; font-weight: 600; color: #d97706; margin-bottom: 10px;">⚠️ System is functional with warnings</div>';
            echo '<div style="color: #92400e;">Found ' . $warnings . ' warning(s). System will work but consider fixing these for production.</div>';
            echo '<a href="./" class="btn" style="margin-top: 15px;">Go to Homepage</a>';
            echo '</div>';
        } else {
            echo '<div style="padding: 20px; background: #fef2f2; border-radius: 8px; border: 2px solid #ef4444;">';
            echo '<div style="font-size: 18px; font-weight: 600; color: #dc2626; margin-bottom: 10px;">❌ Critical issues found</div>';
            echo '<div style="color: #991b1b;">Found ' . $errors . ' error(s) and ' . $warnings . ' warning(s). Please fix errors before using the system.</div>';
            echo '</div>';
        }
        echo '</div>';

        // Quick Actions
        echo '<div class="section">';
        echo '<h2 style="color: #1f2937; margin-bottom: 15px;">🚀 Quick Actions</h2>';
        
        if (isset($pdo)) {
            try {
                $bookingCount = $pdo->query("SELECT COUNT(*) FROM bookings")->fetchColumn();
                $pendingNotifs = $pdo->query("SELECT COUNT(*) FROM notification_queue WHERE status = 'pending'")->fetchColumn();
                
                echo '<div class="test-details">';
                echo '<strong>📊 Statistics:</strong><br>';
                echo '• Total Bookings: ' . $bookingCount . '<br>';
                echo '• Pending Notifications: ' . $pendingNotifs . '<br>';
                echo '</div>';
                
                if ($pendingNotifs > 0 && !empty($waToken)) {
                    echo '<div style="margin-top: 15px; padding: 15px; background: #eff6ff; border-radius: 8px;">';
                    echo '<strong>💡 Tip:</strong> You have pending notifications. Run the background worker:';
                    echo '<div class="code">php app/whatsapp_worker.php</div>';
                    echo '</div>';
                }
            } catch (Exception $e) {
                // Ignore
            }
        }
        echo '</div>';

        // Environment Info
        echo '<div class="section">';
        echo '<h2 style="color: #1f2937; margin-bottom: 15px;">ℹ️ Environment Information</h2>';
        echo '<div class="test-details">';
        echo '<strong>PHP Version:</strong> ' . PHP_VERSION . '<br>';
        echo '<strong>Server Software:</strong> ' . ($_SERVER['SERVER_SOFTWARE'] ?? 'Unknown') . '<br>';
        echo '<strong>App Environment:</strong> ' . env('APP_ENV', 'not set') . '<br>';
        echo '<strong>Debug Mode:</strong> ' . (env('APP_DEBUG', false) ? 'Enabled' : 'Disabled') . '<br>';
        echo '<strong>Timezone:</strong> ' . date_default_timezone_get() . '<br>';
        echo '</div>';
        echo '</div>';
        ?>

    </div>
</body>
</html>