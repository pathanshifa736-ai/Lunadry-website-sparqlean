<?php
require_once __DIR__ . '/app/config.php';
require_once __DIR__ . '/app/functions.php';
require_once __DIR__ . '/includes/session.php';

$reviews = [];

try {
    $pdo  = getPDO();
    $stmt = $pdo->prepare("
        SELECT f.rating, f.message, f.created_at, u.full_name AS user_name
        FROM feedback f
        LEFT JOIN users u ON u.id = f.user_id
        WHERE f.status IN ('reviewed', 'resolved')
          AND f.feedback_type IN ('service', 'general', 'delivery')
          AND f.message IS NOT NULL
          AND f.rating >= 4
        ORDER BY f.created_at DESC
        LIMIT 20
    ");
    $stmt->execute();
    $reviews = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log("Reviews fetch error: " . $e->getMessage());
    $reviews = [];
}

if (empty($reviews)) {
    $reviews = [
        ['user_name' => 'Ambrish Kahar',        'rating' => 5, 'message' => 'Received great discount on my navratri outfit. Dry cleaning service is perfect, they removed the stain which was not removed by tumble dry. The shine and fragrance of my kurtas is awesome!'],
        ['user_name' => 'Prafulchandra Panwala', 'rating' => 5, 'message' => 'Outstanding service! WashNova truly stands out in Adajan for premium dry cleaning. Clothes came fresh, crisp, and with long lasting fragrance.'],
        ['user_name' => 'Hiral Vaghela',         'rating' => 5, 'message' => 'Excellent service! My clothes came back spotless, neatly pressed, and smelling fresh. Highly recommended.'],
        ['user_name' => 'Ashvin Jain',            'rating' => 5, 'message' => 'I received my curtains like new — crisp and wrinkle-free. More affordable than other stores. Highly recommended.'],
        ['user_name' => 'Dharmesh Limbachiya',    'rating' => 5, 'message' => 'Best fragrance and better service than tumble dry and hindustan. Must try WashNova.'],
    ];
}

function renderStars(int $rating): string {
    $r = max(0, min(5, $rating));
    return str_repeat('★', $r) . str_repeat('☆', 5 - $r);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WashNova — Customer Reviews</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Playfair+Display:wght@600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"/>

<style>
:root {
    --gold:        #f5c518;
    --gold-light:  #fff3c4;
    --gold-border: #ffe680;
    --text-dark:   #1a1a1a;
    --text-mid:    #444;
    --text-light:  #888;
    --card-bg:     #ffffff;
    --shadow:      0 6px 28px rgba(0,0,0,0.07);
    --radius:      20px;
    --font-body:   'DM Sans', sans-serif;
    --font-head:   'Playfair Display', serif;
    --card-height: 320px; /* ← ek jagah se change karo */
}

* { box-sizing: border-box; margin: 0; padding: 0; }

body {
    font-family: var(--font-body);
    background: #fafafa;
    color: var(--text-dark);
}

.reviews-section {
    padding: 70px 20px 80px;
    background: linear-gradient(160deg, #fffdf0 0%, #ffffff 60%);
}

.reviews-heading { text-align: center; margin-bottom: 48px; }
.reviews-heading .pre-title {
    font-size: 13px; font-weight: 700; letter-spacing: 3px;
    text-transform: uppercase; color: var(--gold);
    margin-bottom: 10px; display: block;
}
.reviews-heading h2 {
    font-family: var(--font-head);
    font-size: clamp(28px, 4vw, 44px);
    color: var(--text-dark); line-height: 1.2;
}
.reviews-heading h2 span { color: var(--gold); }

.reviews-slider-wrap { max-width: 1200px; margin: 0 auto; }
.reviews-slider-wrap .owl-carousel { position: relative; }

/* ── Owl item — fixed height ── */
.owl-item {
    display: flex;
}

/* ── Card — FIXED height, never grows ── */
.review-card {
    background: var(--card-bg);
    border-radius: var(--radius);
    padding: 28px 24px 22px;
    width: 100%;
    height: var(--card-height);      /* fixed */
    display: flex;
    flex-direction: column;
    box-shadow: var(--shadow);
    border: 1.5px solid var(--gold-border);
    position: relative;
    overflow: hidden;                /* clip anything that overflows */
    animation: fadeUp 0.6s ease both;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}
.review-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 14px 40px rgba(0,0,0,0.11);
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(20px); }
    to   { opacity: 1; transform: translateY(0); }
}

/* Decorative quote watermark */
.review-card::before {
    content: '\201C';
    font-family: var(--font-head);
    font-size: 100px;
    color: var(--gold-light);
    line-height: 1;
    position: absolute;
    top: 6px; left: 16px;
    pointer-events: none;
    user-select: none;
    z-index: 0;
}

/* ── Google badge ── */
.google-badge {
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 12px;
    flex-shrink: 0;   /* never shrink */
    position: relative;
    z-index: 1;
}
.google-badge-inner {
    width: 40px; height: 40px; border-radius: 50%;
    border: 2.5px solid var(--gold-border); background: #fff;
    display: flex; align-items: center; justify-content: center;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
}
.google-badge-inner img { width: 22px; height: 22px; }

/* ── Review text — scrollable inside fixed card ── */
.review-text {
    font-size: 14px;
    color: var(--text-mid);
    line-height: 1.65;
    text-align: center;
    padding: 0 4px;
    position: relative;
    z-index: 1;
    flex: 1;              /* takes remaining space */
    overflow-y: auto;     /* scroll if text is long */
    overflow-x: hidden;
    word-break: break-word;
    margin-bottom: 14px;
    /* hide scrollbar visually but keep it functional */
    scrollbar-width: none;
    -ms-overflow-style: none;
}
.review-text::-webkit-scrollbar { display: none; }

/* Fade-out at bottom of text to signal more content */
.review-text-wrap {
    position: relative;
    flex: 1;
    display: flex;
    flex-direction: column;
    overflow: hidden;
    margin-bottom: 14px;
}
.review-text-wrap::after {
    content: '';
    position: absolute;
    bottom: 0; left: 0; right: 0;
    height: 32px;
    background: linear-gradient(transparent, var(--card-bg));
    pointer-events: none;
    z-index: 2;
}

/* ── Footer — fixed at bottom, never pushed out ── */
.review-footer {
    text-align: center;
    border-top: 1px solid #f0e8c0;
    padding-top: 14px;
    flex-shrink: 0;   /* never shrink */
    position: relative;
    z-index: 1;
}
.review-name {
    font-weight: 700; font-size: 15px;
    color: var(--text-dark); margin-bottom: 4px;
}
.review-stars {
    color: var(--gold); font-size: 17px; letter-spacing: 2px;
}

/* ── Nav arrows ── */
.owl-prev, .owl-next {
    position: absolute; top: 50%; transform: translateY(-50%);
    width: 42px !important; height: 42px !important;
    border-radius: 50% !important; background: #fff !important;
    border: 2px solid var(--gold-border) !important;
    box-shadow: 0 3px 12px rgba(0,0,0,0.1) !important;
    display: flex !important; align-items: center; justify-content: center;
    color: var(--text-dark) !important; font-size: 20px !important;
    transition: background 0.2s; z-index: 10;
}
.owl-prev:hover, .owl-next:hover { background: var(--gold) !important; color: #fff !important; }
.owl-prev { left: -20px; }
.owl-next { right: -20px; }
.owl-prev span, .owl-next span { line-height: 1; }
.owl-dots { display: none !important; }

.no-reviews {
    text-align: center; color: var(--text-light);
    padding: 40px 0; font-size: 15px;
}
</style>
</head>
<body>

<section class="reviews-section">

    <div class="reviews-heading">
        <span class="pre-title">Google Reviews</span>
        <h2>What our <span>customers</span> have to say</h2>
    </div>

    <div class="reviews-slider-wrap">

        <?php if (!empty($reviews)): ?>
        <div class="owl-carousel owl-theme">
            <?php foreach ($reviews as $r):
                $name    = htmlspecialchars($r['user_name'] ?? 'Customer');
                $message = htmlspecialchars($r['message']  ?? '');
                $rating  = (int)($r['rating'] ?? 5);
                $stars   = renderStars($rating);
            ?>
            <div class="review-card">
                <div class="google-badge">
                    <div class="google-badge-inner">
                        <img src="https://static-prod.rinse.com/assets/rebrand/img/icons/google.sha256-badb1a66d5.svg" alt="Google">
                    </div>
                </div>
                <div class="review-text-wrap">
                    <p class="review-text"><?= $message ?></p>
                </div>
                <div class="review-footer">
                    <p class="review-name"><?= $name ?></p>
                    <div class="review-stars"><?= $stars ?></div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>

        <?php else: ?>
            <p class="no-reviews">No reviews found yet. Be the first to share your experience!</p>
        <?php endif; ?>

    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
$(document).ready(function(){
    $(".owl-carousel").owlCarousel({
        items: 3,
        loop: true,
        margin: 24,
        nav: true,
        navText: ["&#8592;","&#8594;"],
        autoplay: true,
        autoplayTimeout: 3000,
        autoplayHoverPause: true,
        smartSpeed: 700,
        responsive: {
            0:    { items: 1, nav: false },
            640:  { items: 1, nav: true  },
            900:  { items: 2, nav: true  },
            1200: { items: 3, nav: true  }
        }
    });
});
</script>

</body>
</html>