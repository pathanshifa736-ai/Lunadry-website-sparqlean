<?php
require_once __DIR__ . '/app/functions.php';
$pdo = getPDO();
$blogs = $pdo->query("SELECT * FROM blogs WHERE status='published' AND is_deleted=0 ORDER BY created_at DESC")->fetchAll(PDO::FETCH_ASSOC);
echo "<p>Blogs count: " . count($blogs) . "</p>";
foreach($blogs as $b) {
    echo "<p>✅ " . htmlspecialchars($b['title']) . "</p>";
}
?>