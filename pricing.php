<?php require_once __DIR__ . '/includes/init.php'; ?>
<?php
// ─── Fetch 4 active service categories ───────────────────────────────────────
$categories = [];
try {
    $pdo  = getPDO();
    $stmt = $pdo->prepare("
        SELECT id, category_name, category_code, description, icon_image
        FROM service_categories
        WHERE status = 'active' AND is_deleted = 0
        ORDER BY display_order ASC
        LIMIT 4
    ");
    $stmt->execute();
    $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log("Categories fetch error: " . $e->getMessage());
}

// ─── For each category fetch items that have item_image + pricing ─────────────
$categoryItems = [];
if (!empty($categories)) {
    $catIds = array_column($categories, 'id');
    $inPlaceholders = implode(',', array_fill(0, count($catIds), '?'));

    try {
        $stmt = $pdo->prepare("
            SELECT
                sp.category_id,
                si.item_name,
                si.item_image,
                si.gender,
                si.item_type,
                sp.base_price,
                sp.discounted_price,
                sp.unit_type,
                sp.display_order
            FROM service_pricing sp
            INNER JOIN service_items si ON si.id = sp.item_id
            WHERE sp.category_id IN ($inPlaceholders)
              AND sp.status  = 'active'
              AND sp.is_deleted = 0
              AND si.status  = 'active'
              AND si.is_deleted = 0
              AND si.item_image IS NOT NULL
              AND si.item_image != ''
            ORDER BY sp.category_id ASC, sp.display_order ASC
        ");
        $stmt->execute($catIds);
        $rows = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Group by category_id
        foreach ($rows as $row) {
            $categoryItems[$row['category_id']][] = $row;
        }
    } catch (PDOException $e) {
        error_log("Items fetch error: " . $e->getMessage());
    }
}

// ─── Helper: format unit label ────────────────────────────────────────────────
function unitLabel(string $unit): string {
    return match($unit) {
        'per_kg'    => '/kg',
        'per_pair'  => '/pair',
        'per_sqft'  => '/sqft',
        default     => '/piece',
    };
}

// ─── Helper: gender icon ─────────────────────────────────────────────────────
function genderIcon(string $gender): string {
    return match($gender) {
        'men'   => '👔',
        'women' => '👗',
        'kids'  => '👶',
        'home'  => '🏠',
        default => '✨',
    };
}

// ─── Helper: gender label ────────────────────────────────────────────────────
function genderLabel(string $gender): string {
    return match($gender) {
        'men'   => "Men's Wear",
        'women' => "Women's Wear",
        'kids'  => "Kids Wear",
        'home'  => "Home Items",
        default => "Items",
    };
}

// ─── Group items by gender within a category ─────────────────────────────────
function groupByGender(array $items): array {
    $grouped = [];
    foreach ($items as $item) {
        $grouped[$item['gender']][] = $item;
    }
    return $grouped;
}

// ─── Category badge labels ────────────────────────────────────────────────────
function categoryBadge(string $code): string {
    return match(strtolower($code)) {
        'wash_fold'      => 'Most Popular',
        'wash_iron'      => 'Premium',
        'dry_clean'      => 'Luxury',
        'home_textiles'  => 'Home Care',
        default          => 'Popular',
    };
}

// ─── Starting price for selector card ────────────────────────────────────────
function startingPrice(array $items): string {
    if (empty($items)) return '—';
    $prices = array_map(fn($i) => (float)($i['discounted_price'] ?? $i['base_price']), $items);
    $min    = min($prices);
    $unit   = unitLabel($items[0]['unit_type'] ?? 'per_piece');
    return '₹' . number_format($min, 0) . $unit;
}

// ─── Selector icons fallback ──────────────────────────────────────────────────
function selectorIcon(string $code): string {
    return match(strtolower($code)) {
        'wash_fold'     => '👕',
        'wash_iron'     => '✨',
        'dry_clean'     => '🤵',
        'home_textiles' => '🛏️',
        default         => '🧺',
    };
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Pricing — WashNova Professional Laundry Services</title>
  <link rel="icon" type="image/x-icon" href="assets/imges/img/logo1.png">
  <?php include('includes/link.php'); ?>
  <link rel="stylesheet" href="assets/css/pricing.css">
</head>
<body>

<?php include('includes/header.php'); ?>

<!-- HERO SECTION -->
<section class="pricing-hero">
  <div class="hero-overlay"></div>
  <div class="hero-content">
    <h1 class="hero-title">Our <span class="highlight">Pricing</span></h1>
    <p class="hero-subtitle">Quality laundry services at transparent, affordable prices</p>
    <div class="hero-features">
      <div class="hero-feature"><span class="feature-icon">✓</span><span>Free Pickup & Delivery</span></div>
      <div class="hero-feature"><span class="feature-icon">✓</span><span>No Minimum Order</span></div>
      <div class="hero-feature"><span class="feature-icon">✓</span><span>24-48 Hour Service</span></div>
    </div>
  </div>
</section>

<!-- SERVICE SELECTOR MENU — dynamic 4 cards -->
<div class="service-selector-wrapper">
  <div class="service-selector">
    <div class="container">
      <div class="selector-grid">
        <?php foreach ($categories as $i => $cat):
            $allItems = $categoryItems[$cat['id']] ?? [];
            $icon     = $cat['icon_image']
                          ? '<img src="admin/' . htmlspecialchars($cat['icon_image']) . '" alt="" style="height:32px;width:32px;object-fit:contain;">'
                          : selectorIcon($cat['category_code'] ?? '');
            $slug     = 'service-' . $cat['id'];
        ?>
        <a href="#<?= $slug ?>" class="selector-card <?= $i === 0 ? 'active' : '' ?>" data-service="<?= $slug ?>">
          <div class="selector-icon"><?= $icon ?></div>
          <div class="selector-info">
            <h3><?= htmlspecialchars($cat['category_name']) ?></h3>
            <span class="selector-price"><?= startingPrice($allItems) ?></span>
          </div>
        </a>
        <?php endforeach; ?>
      </div>
    </div>
  </div>
</div>

<!-- PRICING SECTION — dynamic -->
<section class="pricing-section">
  <div class="container">

    <?php foreach ($categories as $cat):
        $allItems   = $categoryItems[$cat['id']] ?? [];
        $grouped    = groupByGender($allItems);
        $slug       = 'service-' . $cat['id'];
        $badge      = categoryBadge($cat['category_code'] ?? '');
        $catImg     = $cat['icon_image'] ?? '';
    ?>
    <div class="service-block" id="<?= $slug ?>">

      <!-- Service Header -->
      <div class="service-header">
        <div class="service-image">
          <?php if ($catImg): ?>
            <img src="admin/<?= htmlspecialchars($catImg) ?>" alt="<?= htmlspecialchars($cat['category_name']) ?>">
          <?php else: ?>
            <div style="display:flex;align-items:center;justify-content:center;height:100%;font-size:64px;">
              <?= selectorIcon($cat['category_code'] ?? '') ?>
            </div>
          <?php endif; ?>
          <div class="image-badge"><?= $badge ?></div>
        </div>

        <div class="service-info">
          <h2 class="service-title"><?= htmlspecialchars($cat['category_name']) ?></h2>
          <?php if ($cat['description']): ?>
          <p class="service-description"><?= htmlspecialchars($cat['description']) ?></p>
          <?php endif; ?>

          <?php if (!empty($allItems)): ?>
          <div class="service-price-tag">
            <span class="price-label">Starting from</span>
            <span class="price-amount"><?= startingPrice($allItems) ?></span>
          </div>
          <?php endif; ?>

          <ul class="service-benefits">
            <li><span class="check-icon">✓</span> Professional grade cleaning</li>
            <li><span class="check-icon">✓</span> Free pickup & delivery</li>
            <li><span class="check-icon">✓</span> 24-48 hour turnaround</li>
            <li><span class="check-icon">✓</span> Eco-friendly packaging</li>
          </ul>
        </div>
      </div>

      <!-- Pricing Tables grouped by gender -->
      <?php if (!empty($grouped)): ?>
      <div class="pricing-tables">
        <?php foreach ($grouped as $gender => $items): ?>
        <div class="pricing-table">
          <div class="table-title">
            <span class="title-icon"><?= genderIcon($gender) ?></span>
            <h3><?= genderLabel($gender) ?></h3>
          </div>
          <div class="price-list">
            <?php foreach ($items as $item):
                $price    = $item['discounted_price'] ?? $item['base_price'];
                $unit     = unitLabel($item['unit_type'] ?? 'per_piece');
                $hasDisc  = !empty($item['discounted_price']) && $item['discounted_price'] < $item['base_price'];
            ?>
            <div class="price-row">
              <?php if ($item['item_image']): ?>
              <img src="admin/<?= htmlspecialchars($item['item_image']) ?>"
                   alt="<?= htmlspecialchars($item['item_name']) ?>"
                   style="width:150px;height:50px;object-fit:cover;border-radius:6px;margin-right:8px;flex-shrink:0;">
              <?php endif; ?>
              <span class="item"><?= htmlspecialchars($item['item_name']) ?></span>
              <span class="dots"></span>
              <span class="price">
                <?php if ($hasDisc): ?>
                  <del style="color:#aaa;font-size:12px;">₹<?= number_format($item['base_price'], 0) ?></del>
                  ₹<?= number_format($price, 0) ?><?= $unit ?>
                <?php else: ?>
                  ₹<?= number_format($price, 0) ?><?= $unit ?>
                <?php endif; ?>
              </span>
            </div>
            <?php endforeach; ?>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

      <?php else: ?>
        <p style="text-align:center;color:#888;padding:30px 0;">No items available for this service yet.</p>
      <?php endif; ?>

    </div>
    <?php endforeach; ?>

    <?php if (empty($categories)): ?>
      <p style="text-align:center;color:#888;padding:60px 0;font-size:16px;">
        Service pricing not available right now. Please check back soon.
      </p>
    <?php endif; ?>

  </div>
</section>

<!-- WHY CHOOSE US -->
<section class="why-choose">
  <div class="container">
    <h2 class="section-title">Why Choose WashNova?</h2>
    <div class="benefits-grid">
      <div class="benefit-box">
        <div class="benefit-icon">🚚</div>
        <h3>Free Pickup & Delivery</h3>
        <p>Convenient doorstep service across Surat. Schedule pickup at your preferred time slot.</p>
      </div>
      <div class="benefit-box">
        <div class="benefit-icon">⚡</div>
        <h3>Quick Turnaround</h3>
        <p>Standard 24-48 hour service. Express same-day options available for urgent needs.</p>
      </div>
      <div class="benefit-box">
        <div class="benefit-icon">✨</div>
        <h3>Premium Quality</h3>
        <p>Professional-grade machines, premium detergents, and expert care for every garment.</p>
      </div>
      <div class="benefit-box">
        <div class="benefit-icon">💰</div>
        <h3>Transparent Pricing</h3>
        <p>No hidden charges. What you see is what you pay. Simple and honest.</p>
      </div>
      <div class="benefit-box">
        <div class="benefit-icon">🔒</div>
        <h3>100% Safe & Secure</h3>
        <p>RFID tracking, insurance coverage, and complete accountability for your clothes.</p>
      </div>
      <div class="benefit-box">
        <div class="benefit-icon">🌿</div>
        <h3>Eco-Friendly</h3>
        <p>Biodegradable detergents and sustainable practices. Care for clothes and planet.</p>
      </div>
    </div>
  </div>
</section>

<!-- CTA SECTION -->
<section class="cta-section">
  <div class="cta-content">
    <h2>Ready to Experience Professional Laundry Service?</h2>
    <p>Join thousands of satisfied customers in Surat. Book your first pickup today!</p>
    <button class="cta-button" onclick="location.href='auth/login.php';">Schedule Free Pickup</button>
    <p class="cta-note">⭐ First-time customers get 10% off their first order!</p>
  </div>
</section>

<?php include('includes/footer.php'); ?>

<script src="assets/js/script.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function () {

  const selectorCards  = document.querySelectorAll('.selector-card');
  const serviceBlocks  = document.querySelectorAll('.service-block');
  const selectorWrapper = document.querySelector('.service-selector-wrapper');

  // Sticky on scroll
  window.addEventListener('scroll', function () {
    selectorWrapper.classList.toggle('sticky', window.scrollY > 100);
  });

  // Click → smooth scroll
  selectorCards.forEach(card => {
    card.addEventListener('click', function (e) {
      e.preventDefault();
      selectorCards.forEach(c => c.classList.remove('active'));
      this.classList.add('active');

      const target = document.querySelector(this.getAttribute('href'));
      if (target) {
        window.scrollTo({
          top: target.getBoundingClientRect().top + window.pageYOffset - 180,
          behavior: 'smooth'
        });
      }
    });
  });

  // Scroll → update active selector
  function updateActive() {
    let currentId  = null;
    let minDist    = Infinity;
    serviceBlocks.forEach(block => {
      const top  = block.getBoundingClientRect().top;
      const dist = Math.abs(top - 200);
      if (top < window.innerHeight / 2 && block.getBoundingClientRect().bottom > 0 && dist < minDist) {
        minDist   = dist;
        currentId = block.getAttribute('id');
      }
    });
    if (currentId) {
      selectorCards.forEach(card => {
        card.classList.toggle('active', card.getAttribute('href') === '#' + currentId);
      });
    }
  }

  let raf;
  window.addEventListener('scroll', function () {
    if (raf) cancelAnimationFrame(raf);
    raf = requestAnimationFrame(updateActive);
  });
  updateActive();

  // Fade-in animation
  const observer = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.style.opacity = '1';
        e.target.style.transform = 'translateY(0)';
      }
    });
  }, { threshold: 0.1, rootMargin: '0px 0px -50px 0px' });

  serviceBlocks.forEach(b => {
    b.style.opacity = '0';
    b.style.transform = 'translateY(30px)';
    b.style.transition = 'all 0.6s ease';
    observer.observe(b);
  });

  document.querySelectorAll('.benefit-box').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(30px)';
    el.style.transition = 'all 0.6s ease';
    observer.observe(el);
  });
});
</script>

</body>
</html>