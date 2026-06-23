<main id="main-content" tabindex="-1">

  <!-- HERO VIDEO SECTION -->
  <section class="hero-section" id="home-hero">
    <video class="hero-video" id="hero-video" autoplay muted playsinline loop preload="auto">
      <source src="./assets/videos/home.webm" type="video/webm">
      <source src="./assets/videos/home.mp4" type="video/mp4">
    </video>

    <div class="video-overlay" style="
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.2); /* semi-transparent dark */
    backdrop-filter: blur(8px);      /* blur effect */
    -webkit-backdrop-filter: blur(8px); /* Safari support */
    z-index: 1;
"></div>

    <button class="video-control" id="video-control" aria-label="Pause video">
      <i class="fas fa-pause"></i>
    </button>

    <div class="hero-content" style="margin-top:90px;">
      <h1 class="hero-title">
        <span class="line1">WE TAKE CARE OF CLOTHES,</span>

        <span class="highlight"> YOU TAKE CARE OF YOU.</span>
      </h1>

      <div class="hero-subtitle ">
        Pickup. Clean. Deliver
      </div>

      <button onclick="location.href='auth/login.php';" class="btn-hero open-booking-btn">
        <i class="fas fa-truck"></i>
        <span>Schedule Pickup</span>
      </button>
      <!-- href="javascript:void(0)" -->




      <div class="rating-widget">
        <div class="rating-logos">
          <div class="rating-logo-box">
            <i class="fab fa-apple"></i>
          </div>
          <div class="rating-logo-box">
            <i class="fab fa-google"></i>
          </div>
          <div class="rating-logo-box">
            <i class="fas fa-star"></i>
          </div>
        </div>

        <div class="rating-stars">
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star"></i>
          <i class="fas fa-star-half-alt"></i>
        </div>

        <p class="rating-text" style="color:white;">6,000+ happy customers in Surat</p>
      </div>
    </div>


  </section>

  <!-- FEATURES SECTION -->
  <section class="features-section">
    <h2 class="features-title">
      Work Process of Washnova
    </h2>

    <div class="features-grid">

      <!-- Step 1 -->
      <div class="feature-card">
        <div class="feature-icon">
          <span style="font-weight: 700;">24</span>
        </div>
        <p class="feature-text">24-hour turnaround</p>
      </div>

      <!-- Step 2 -->
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-truck"></i>
        </div>
        <p class="feature-text">Free pickup & delivery</p>
      </div>

      <!-- Step 3 -->
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-headset"></i>
        </div>
        <p class="feature-text">24/7 customer care</p>
      </div>

      <!-- Step 4 (NEW) -->
      <div class="feature-card">
        <div class="feature-icon">
          <i class="fas fa-soap"></i>
        </div>
        <p class="feature-text">Premium quality wash</p>
      </div>


    </div>
  </section>


  <!-- ANIMATED SERVICES SECTION -->
  <section class="services-section" id="services">
    <div class="services-container">

      <!-- Left Sticky Side -->
      <div class="services-left" style="margin-left: 30px;">
        <div class="service-icon-wrapper" id="service-icon">
          <img src="./assets/graphics/wash_fold.webp" alt="Service Icon" class="service-bag-icon" id="service-icon-img">
        </div>

        <h5 class="service-title" id="service-title">Wash & Fold</h5>

        <p class="service-description" id="service-desc">
          Effortless laundry care, designed for busy lives.
        </p>

        <div class="service-buttons" id="service-buttons">
          <a href="javascript:void(0)" class="btn-primary-service open-booking-btn">
            Schedule pickup
          </a>
          <a href="./services.php?service=wash-fold" class="btn-secondary-service">
            Learn more about Wash & Fold
          </a>
        </div>

      </div>

      <!-- Right Scrolling Side -->
      <div class="services-right" id="services-right">

        <!-- WASH & FOLD -->
        <div class="service-content" data-service="wash-fold" data-title="Wash & Fold"
          data-desc="Effortless laundry care, designed for busy lives."
          data-icon="./assets/graphics/wash_fold.webp">

          <div class="service-header">
            <img src="./assets/graphics/wash_fold.webp" alt="Wash & Fold" class="service-header-icon">
            <h3 class="service-header-title">Wash & Fold</h3>
          </div>

          <img src="assets/imges/img/wash1.png" alt="Wash & Fold Service" class="service-image">

          <ul class="service-features">
            <li>
              <div class="service-feature-title">
                <i class="fas fa-calendar-check"></i>
                Easy scheduling
              </div>
              <p class="service-feature-desc">Book any day of the week. Your delivery partner arrives with free laundry bags.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-water"></i>
                Professional care
              </div>
              <p class="service-feature-desc">Lights and darks separated. Cold wash. Hypoallergenic detergent options available.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-shirt"></i>
                Ready to wear
              </div>
              <p class="service-feature-desc">Delivered fresh, crisp, folded, and ready for your wardrobe.</p>
            </li>
          </ul>

          <div class="service-info-cards">
            <div class="service-info-card">
              <h4 class="info-card-title">Pay Per Use</h4>
              <p class="info-card-desc">Flexible pricing per kg. 3–4 day standard turnaround with express options available.</p>
            </div>

            <div class="service-info-card">
              <h4 class="info-card-title">Monthly Plans</h4>
              <p class="info-card-desc">Convenient flat-rate packages for regular customers. Contact us for details.</p>
            </div>
          </div>
        </div>

        <!-- DRY CLEANING -->
        <div class="service-content" data-service="dry-cleaning" data-title="Dry Cleaning"
          data-desc="Professional dry cleaning with convenient pickup and delivery to keep you looking sharp."
          data-icon="./assets/graphics/dry_cleaning.webp">

          <div class="service-header">
            <img src="./assets/graphics/dry_cleaning.webp" alt="Dry Cleaning" class="service-header-icon">
            <h3 class="service-header-title">Dry Cleaning</h3>
          </div>

          <img src="assets/imges/img/wash3.png" alt="Dry Cleaning Service" class="service-image">

          <ul class="service-features">
            <li>
              <div class="service-feature-title">
                <i class="fas fa-camera-retro"></i>
                Item tracking
              </div>
              <p class="service-feature-desc">Digital inventory with photos of every item for complete transparency.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-spray-can"></i>
                Expert stain removal
              </div>
              <p class="service-feature-desc">Specialized treatments following manufacturer care labels with precision.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-hanger"></i>
                Protected delivery
              </div>
              <p class="service-feature-desc">Professionally pressed and delivered on hangers in protective garment bags.</p>
            </li>
          </ul>

          <div class="service-info-cards">
            <div class="service-info-card">
              <h4 class="info-card-title">Standard Service</h4>
              <p class="info-card-desc">3–4 day turnaround for all dry cleaning items. Perfect for regular maintenance.</p>
            </div>

            <div class="service-info-card">
              <h4 class="info-card-title">Express Option</h4>
              <p class="info-card-desc">Rush service available for urgent needs. Contact us for same-day options.</p>
            </div>
          </div>
        </div>


        <!-- Steam IRON -->
        <div class="service-content" data-service="wash-iron" data-title="Steam Ironing"
          data-desc="Professional washing and steam pressing for a crisp, polished look every time."
          data-icon="./assets/graphics/iron.png">

          <div class="service-header">
            <img src="./assets/graphics/iron.png" alt="Wash & Iron" class="service-header-icon">
            <h3 class="service-header-title">Steam Ironing</h3>
          </div>

          <img src="./assets/imges/img/wash2.png" alt="Steam Ironing Service" class="service-image">

          <ul class="service-features">
            <li>
              <div class="service-feature-title">
                <i class="fas fa-droplet"></i>
                premium cleaning
              </div>
              <p class="service-feature-desc">Premium detergents and fabric conditioners for thorough, gentle cleaning.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-fire-flame-curved"></i>
                Steam pressing
              </div>
              <p class="service-feature-desc">Professional steam iron technology for crisp, wrinkle-free results.</p>
            </li>

            <li>
              <div class="service-feature-title">
                <i class="fas fa-circle-check"></i>
                Quality inspection
              </div>
              <p class="service-feature-desc">Every garment individually inspected before careful packaging.</p>
            </li>
          </ul>

          <div class="service-info-cards">
            <div class="service-info-card">
              <h4 class="info-card-title">Premium Care</h4>
              <p class="info-card-desc">Ideal for formal wear, delicates, and special fabrics requiring expert attention.</p>
            </div>

            <div class="service-info-card">
              <h4 class="info-card-title">Quick Turnaround</h4>
              <p class="info-card-desc">Standard 24-48 hour service with express 12-hour option for urgent requirements.</p>
            </div>
          </div>
        </div>


      </div>
    </div>
  </section>
 
  <!--about us section-->
  <?php include('main3.php') ?>

  <!-- CUSTOMER REVIEWS SECTION -->

  <?php include('reviews.php') ?>

  <!-- BLOG SECTION -->
  <?php
  // Fetch latest blogs dynamically
  $pdo = getPDO();
  $stmt = $pdo->query("SELECT title, featured_image, slug FROM blogs WHERE status='published' and is_deleted = 0 ORDER BY created_at DESC LIMIT 4");
  $blogs = $stmt->fetchAll(PDO::FETCH_ASSOC);
  ?>



  <!-- GUARANTEE SECTION -->
  <section class="guarantee-section">
    <div class="guarantee-title">
      <h2>
        The <span class="guarantee-highlight">WashNova</span> Promise.
      </h2>
    </div>

    <div class="guarantee-content">
      <div class="guarantee-stars">
        <i class="fas fa-star"></i>
        <i class="fas fa-star"></i>
        <i class="fas fa-star"></i>
        <i class="fas fa-star"></i>
        <i class="fas fa-star"></i>
      </div>

      <p class="guarantee-text">
        Every order comes with our industry-leading satisfaction guarantee.
        If you're not completely satisfied with your cleaning,
        we'll re-clean your items at no additional charge.
      </p>
    </div>
  </section>

</main>

<script src="assets/js/landing-script.js"></script>
</body>

</html>