<?php
require_once __DIR__ . '/app/functions.php';

$pdo = getPDO();

// Fetch all published blogs
$sql = "SELECT * FROM blogs WHERE status='published' AND is_deleted = 0 ORDER BY created_at DESC";
$stmt = $pdo->query($sql);
$blogs = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Fetch categories
$cat_stmt = $pdo->query("
    SELECT DISTINCT category 
    FROM blogs 
    WHERE status='published' AND is_deleted = 0 AND category IS NOT NULL
    ORDER BY category
");
$categories = $cat_stmt->fetchAll(PDO::FETCH_ASSOC);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Blog - Laundry Tips & Fabric Care | WashNova</title>
  <?php include('includes/link.php'); ?>
  <link rel="stylesheet" href="assets/css/blog-main.css">

<style>
.blog-card {
    opacity: 0;
    transform: translateY(15px);
    transition: all .35s ease;
}
.blog-card.show {
    opacity: 1;
    transform: translateY(0);
}
.js-pagination {
    margin-top: 40px;
    text-align: center;
}
.js-page-btn {
    padding: 8px 14px;
    margin: 3px;
    border-radius: 6px;
    background: #eee;
    cursor: pointer;
    display: inline-block;
    transition: .2s;
}
.js-page-btn.active {
    background: #333;
    color: #fff;
}
.no-results {
    display: none;
    text-align: center;
    padding: 50px 0;
    animation: fadeIn .4s ease;
}
.no-results i { font-size: 40px; color: #666; }
@keyframes fadeIn { from {opacity:0;} to {opacity:1;} }
</style>

</head>
<body>

<?php include('includes/header.php'); ?>

<section class="blog-hero">
    <h1>Washnova Blog</h1>
    <p>Expert laundry tips, fabric care guides & time-saving hacks</p>
</section>

<div class="container">

    <!-- CONTROLS -->
    <div class="blog-controls">
        <div class="category-filters">
            <a href="#" class="category-btn active" data-cat="all">All</a>
            <?php foreach ($categories as $cat): ?>
                <?php if (!empty($cat['category'])): ?>
                <a href="#" class="category-btn" data-cat="<?= htmlspecialchars($cat['category']); ?>">
                    <?= htmlspecialchars($cat['category']); ?>
                </a>
                <?php endif; ?>
            <?php endforeach; ?>
        </div>

        <form class="search-box" onsubmit="return false;">
            <input type="text" class="search-input" placeholder="Search blog posts...">
            <button type="button" class="search-btn"><i class="fas fa-search"></i></button>
        </form>
    </div>

    <!-- BLOG GRID -->
    <div class="blog-grid" id="blogGrid">
    <?php foreach ($blogs as $blog): ?>
        <?php
            // Tags — JSON array ya plain string
            $tagsRaw     = $blog['tags'] ?? '';
            $tagsDecoded = json_decode($tagsRaw, true);
            $tagsString  = is_array($tagsDecoded) ? implode(', ', $tagsDecoded) : $tagsRaw;

            // Featured image — DB mein stored: uploads/blog/filename.jpg
            // blog.php sparqlean/ root mein hai, so path seedha kaam karta hai
            $imgPath = !empty($blog['featured_image'])
                        ? htmlspecialchars($blog['featured_image'])
                        : 'assets/images/blog-placeholder.jpg';

            

            // Author
            $author = !empty($blog['author_name']) ? $blog['author_name'] : 'Washnova';
        ?>
        <article class="blog-card"
            data-title="<?= htmlspecialchars($blog['title']) ?>"
            data-excerpt="<?= htmlspecialchars($blog['excerpt'] ?? '') ?>"
            data-tags="<?= htmlspecialchars($tagsString) ?>"
            data-category="<?= htmlspecialchars($blog['category'] ?? '') ?>">

            <div class="blog-thumbnail" style="background-image: url('<?= $imgPath ?>');">
                <div class="blog-category"><?= htmlspecialchars($blog['category'] ?? 'General'); ?></div>
            </div>

            <div class="blog-content">
                <h3 class="blog-title"><?= htmlspecialchars($blog['title']); ?></h3>
                <p class="blog-excerpt"><?= htmlspecialchars($blog['excerpt'] ?? ''); ?></p>

                <?php if (!empty($tagsString)): ?>
                <div class="blog-tags">
                    Tags: <span><?= htmlspecialchars($tagsString); ?></span>
                </div>
                <?php endif; ?>

             

                <a href="blog-single.php?slug=<?= urlencode($blog['slug'] ?? ''); ?>" class="read-more-btn">
                    Read More →
                </a>
            </div>

        </article>
    <?php endforeach; ?>
    </div>

    <!-- NO RESULTS -->
    <div class="no-results" id="noResults">
        <i class="fas fa-search"></i>
        <h3>No matching blog posts found</h3>
        <p>Try different keywords</p>
    </div>

    <!-- PAGINATION -->
    <div class="js-pagination" id="pagination"></div>

</div>

<?php include('includes/footer.php'); ?>

<script>
const searchInput  = document.querySelector('.search-input');
const categoryBtns = document.querySelectorAll('.category-btn');
const blogCards    = [...document.querySelectorAll('.blog-card')];
const noResults    = document.getElementById("noResults");
const pagination   = document.getElementById("pagination");

function fuzzyMatch(str, query) {
    str = str.toLowerCase(); query = query.toLowerCase();
    let t = 0, q = 0;
    while (t < str.length && q < query.length) {
        if (str[t] === query[q]) q++;
        t++;
    }
    return q === query.length;
}

let currentPage = 1;
const perPage = 9;

function filterBlogs() {
    const q = searchInput.value.toLowerCase().trim();
    const activeCat = document.querySelector('.category-btn.active').dataset.cat.toLowerCase();
    let visible = [];

    blogCards.forEach(card => {
        const title    = card.dataset.title.toLowerCase();
        const excerpt  = card.dataset.excerpt.toLowerCase();
        const category = card.dataset.category.toLowerCase();
        const tags     = (card.dataset.tags || "").toLowerCase();

        const matchesSearch = !q ||
            title.includes(q) || excerpt.includes(q) || tags.includes(q) ||
            fuzzyMatch(title, q) || fuzzyMatch(excerpt, q) || fuzzyMatch(tags, q);

        const matchesCategory = activeCat === 'all' || category === activeCat;

        if (matchesSearch && matchesCategory) visible.push(card);
    });

    renderPage(visible);
}

function renderPage(items) {
    blogCards.forEach(c => { c.style.display = "none"; c.classList.remove("show"); });

    if (items.length === 0) {
        noResults.style.display = "block";
        pagination.innerHTML = "";
        return;
    }

    noResults.style.display = "none";
    let totalPages = Math.ceil(items.length / perPage);
    if (currentPage > totalPages) currentPage = 1;

    let pageItems = items.slice((currentPage - 1) * perPage, currentPage * perPage);
    pageItems.forEach(card => {
        card.style.display = "";
        setTimeout(() => card.classList.add("show"), 10);
    });

    renderPagination(totalPages);
}

function renderPagination(totalPages) {
    pagination.innerHTML = "";
    if (totalPages <= 1) return;
    for (let i = 1; i <= totalPages; i++) {
        let btn = document.createElement("span");
        btn.className = "js-page-btn" + (i === currentPage ? " active" : "");
        btn.textContent = i;
        btn.addEventListener("click", () => {
            currentPage = i;
            filterBlogs();
            window.scrollTo({ top: 0, behavior: 'smooth' });
        });
        pagination.appendChild(btn);
    }
}

searchInput.addEventListener('input', () => { currentPage = 1; filterBlogs(); });

categoryBtns.forEach(btn => {
    btn.addEventListener('click', function(e) {
        e.preventDefault();
        categoryBtns.forEach(b => b.classList.remove('active'));
        this.classList.add('active');
        currentPage = 1;
        filterBlogs();
    });
});

// Initial load
filterBlogs();
</script>

</body>
</html>