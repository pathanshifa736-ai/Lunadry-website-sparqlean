<?php
require_once __DIR__ . '/app/functions.php';

$pdo = getPDO();

// Validate slug
$slug = sanitize($_GET['slug'] ?? '', 200);
if ($slug === '') {
    header("Location: blog.php");
    exit;
}

// Fetch blog
$stmt = $pdo->prepare("SELECT * FROM blogs WHERE slug = :slug AND status = 'published' AND is_deleted = 0 LIMIT 1");
$stmt->execute([':slug' => $slug]);
$blog = $stmt->fetch(PDO::FETCH_ASSOC);

if (!$blog) {
    header("Location: blog.php");
    exit;
}

// Update views
$pdo->prepare("UPDATE blogs SET views = views + 1 WHERE id = :id")->execute([':id' => $blog['id']]);

// Related posts
$related_stmt = $pdo->prepare("
    SELECT id, title, slug, excerpt, featured_image 
    FROM blogs 
    WHERE category = :cat AND id != :id AND status = 'published' AND is_deleted = 0
    ORDER BY RAND() LIMIT 3
");
$related_stmt->execute([':cat' => $blog['category'], ':id' => $blog['id']]);
$related_posts = $related_stmt->fetchAll(PDO::FETCH_ASSOC);

// Tags — JSON array ya plain string
$tagsRaw     = $blog['tags'] ?? '';
$tagsDecoded = json_decode($tagsRaw, true);
$tagsArray   = is_array($tagsDecoded) ? $tagsDecoded : (($tagsRaw !== '') ? explode(',', $tagsRaw) : []);

// Author — DB column is author_name


// Featured image — DB mein stored: uploads/blog/filename.jpg (already full relative path)
$featuredImg = !empty($blog['featured_image']) ? $blog['featured_image'] : 'assets/images/blog-placeholder.jpg';

// Read time


// SEO
$page_title       = htmlspecialchars($blog['title']) . " | WashNova Blog";
$page_description = htmlspecialchars($blog['excerpt'] ?? '');

// Dynamic URL
$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on') ? "https" : "http";
$full_url  = $protocol . "://" . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title><?= $page_title ?></title>
  <meta name="description" content="<?= $page_description ?>">
  <meta name="keywords" content="<?= htmlspecialchars(implode(', ', $tagsArray)) ?>">

  <!-- Open Graph -->
  <meta property="og:title"       content="<?= htmlspecialchars($blog['title']) ?>">
  <meta property="og:description" content="<?= $page_description ?>">
  <meta property="og:image"       content="<?= htmlspecialchars($featuredImg) ?>">
  <meta property="og:type"        content="article">

  <?php include('includes/link.php'); ?>
  <link rel="stylesheet" href="assets/css/blog-single.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

  <?php include('includes/header.php'); ?>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <div class="breadcrumb">
        <a href="blog.php"><i class="fas fa-arrow-left"></i> Back to Blog</a>
      </div>

      <div class="hero-category"><?= htmlspecialchars($blog['category'] ?? 'General'); ?></div>

      <h1 class="hero-title"><?= htmlspecialchars($blog['title']); ?></h1>

     
    </div>
  </section>

  <!-- Featured Image -->
  <?php if (!empty($blog['featured_image'])): ?>
  <div class="article-featured-image">
    <div class="featured-image-wrapper">
      <img src="<?= htmlspecialchars($featuredImg); ?>"
           alt="<?= htmlspecialchars($blog['title']); ?>">
    </div>
  </div>
  <?php endif; ?>

  <!-- Article Content -->
  <article class="article-container">
    <div class="article-content">
      <?= $blog['content']; ?>
    </div>
  </article>

  <!-- Article Footer -->
  <section class="article-footer">

    <?php if (!empty($tagsArray)): ?>
    <div class="article-tags">
      <h4>Tags:</h4>
      <div class="tag-list">
        <?php foreach ($tagsArray as $tag): ?>
          <span class="tag"><?= htmlspecialchars(trim($tag)); ?></span>
        <?php endforeach; ?>
      </div>
    </div>
    <?php endif; ?>

    <div class="share-section">
      <h4>Share this article:</h4>
      <div class="share-buttons">
        <a class="share-btn facebook" target="_blank"
           href="https://www.facebook.com/sharer/sharer.php?u=<?= urlencode($full_url); ?>">
          <i class="fab fa-facebook-f"></i> Facebook
        </a>
        <a class="share-btn twitter" target="_blank"
           href="https://twitter.com/intent/tweet?url=<?= urlencode($full_url); ?>&text=<?= urlencode($blog['title']); ?>">
          <i class="fab fa-twitter"></i> Twitter
        </a>
        <a class="share-btn linkedin" target="_blank"
           href="https://www.linkedin.com/sharing/share-offsite/?url=<?= urlencode($full_url); ?>">
          <i class="fab fa-linkedin-in"></i> LinkedIn
        </a>
        <a class="share-btn whatsapp" target="_blank"
           href="https://wa.me/?text=<?= urlencode($blog['title'] . ' - ' . $full_url); ?>">
          <i class="fab fa-whatsapp"></i> WhatsApp
        </a>
      </div>
    </div>
  </section>

  <!-- Related Posts -->
  <?php if (!empty($related_posts)): ?>
  <section class="related-posts">
    <h3>Related Articles</h3>
    <div class="related-grid">
      <?php foreach ($related_posts as $rel): ?>
        <?php
          // Related post image — same logic, DB mein full relative path stored hai
          $relImg = !empty($rel['featured_image'])
                    ? htmlspecialchars($rel['featured_image'])
                    : 'assets/images/blog-placeholder.jpg';
        ?>
        <a href="blog-single.php?slug=<?= urlencode($rel['slug']); ?>" class="related-card">
          <div class="related-thumb"
               style="background-image: url('<?= $relImg; ?>');"></div>
          <div class="related-content">
            <h4 class="related-title"><?= htmlspecialchars($rel['title']); ?></h4>
            <p class="related-excerpt"><?= htmlspecialchars($rel['excerpt'] ?? ''); ?></p>
          </div>
        </a>
      <?php endforeach; ?>
    </div>
  </section>
  <?php endif; ?>

  <?php include('includes/footer.php'); ?>

  <!-- Back to Top -->
  <div class="back-to-top" id="backToTop">
    <i class="fas fa-arrow-up"></i>
  </div>

  <script>
    // Back to Top
    const backToTop = document.getElementById('backToTop');
    window.addEventListener('scroll', () => {
      backToTop.classList.toggle('visible', window.pageYOffset > 300);
    });
    backToTop.addEventListener('click', () => {
      window.scrollTo({ top: 0, behavior: 'smooth' });
    });

    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function(e) {
        const href = this.getAttribute('href');
        if (href !== '#' && document.querySelector(href)) {
          e.preventDefault();
          document.querySelector(href).scrollIntoView({ behavior: 'smooth' });
        }
      });
    });
  </script>

</body>
</html>