<?php require_once __DIR__ . '/includes/init.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>WashNova</title>

  <!-- Favicon for browser address bar -->
  <link rel="icon" type="image/x-icon" href="assets/logo/second.png">
  <meta name="description" content="Explore WashNova's premium laundry services in Surat - Wash & Fold, Dry Cleaning, Steam Iron, Shoe Cleaning, and more. Professional care for all your fabrics.">
  <link rel="stylesheet" href="assets/css/service.css">
  <!-- <link rel="icon" type="image/x-icon" href="assets/imges/img/logo1.png"> -->
  <?php include('includes/link.php'); ?>
</head>

<body>

  <?php include('includes/header.php'); ?>


  <!-- HERO SECTION -->
  <section class="services-hero" id="servicesHero">
    <h1>Our <span class="highlight">Premium Services</span></h1>
    <p>Professional laundry care for every fabric, every need, delivered to your door</p>
  </section>


  <!-- EMPTY ANCHORS -->
  <div id="wash"></div>
  <div id="dry"></div>
  <div id="premium"></div>
  <div id="shoe"></div>
  <div id="iron"></div>
  <div id="premium-clean"></div>
  <div id="carpet"></div>
  <div id="stain"></div>


  <!-- SERVICE TABS -->
  <div class="service-tabs-container">
    <div class="service-tabs">
      <button onclick="selectService('wash', this)" class="service-btn active" id="btn-wash">
        <span class="icon">🧺</span> Wash
      </button>
      <button onclick="selectService('dry', this)" class="service-btn" id="btn-dry">
        <span class="icon">👔</span> Dry Cleaning
      </button>
      <button onclick="selectService('premium', this)" class="service-btn" id="btn-premium">
        <span class="icon">💎</span> Premium Laundry
      </button>
      <button onclick="selectService('shoe', this)" class="service-btn" id="btn-shoe">
        <span class="icon">👟</span> Shoe Cleaning
      </button>
      <button onclick="selectService('iron', this)" class="service-btn" id="btn-iron">
        <span class="icon">🧥</span> Steam Iron
      </button>
      <button onclick="selectService('premium-clean', this)" class="service-btn" id="btn-premium-clean">
        <span class="icon">🧼</span> Premium Cleaning
      </button>
      <button onclick="selectService('carpet', this)" class="service-btn" id="btn-carpet">
        <span class="icon">🧹</span> Carpet & Curtain
      </button>
      <button onclick="selectService('stain', this)" class="service-btn" id="btn-stain">
        <span class="icon">🧳</span> Stain Removal
      </button>
    </div>
  </div>



  <!-- SERVICE CONTENT -->
  <section class="service-content-section">
    <div class="service-text active" id="service-text">
      <h2 id="service-title">Wash</h2>
      <p class="desc-1" id="service-desc1">
        Experience the ultimate in cleanliness and care with WashNova — from wash to delivery, every fabric receives premium attention.
      </p>
      <p class="desc-2" id="service-desc2">
        Clothes are carefully washed, dried, and folded using eco-friendly detergents and advanced machinery. Enjoy doorstep pickup and quick delivery.
      </p>
      <div class="service-footer" id="service-footer">
        WashNova – where <span class='highlight'>freshness</span> meets <span class='highlight'>perfection</span>.
      </div>
    </div>

    <div class="service-media active" id="service-media">
      <video id="service-video" autoplay muted loop playsinline class="service-video">
        <source src="./assets/videos/wash.mp4" type="video/mp4">
      </video>
      <img id="service-image" src="" alt="Service" class="service-image" style="display:none;">
    </div>
  </section>



  <!-- HOW IT WORKS SECTION -->
  <section class="how-it-works">
    <h2>How <span class="highlight">WashNova</span> Works</h2>

    <div class="steps-grid">
      <div class="step-card">
        <div class="step-number">1</div>
        <div class="step-icon">📱</div>
        <h3>Request Pickup</h3>
        <p>Select your service & schedule pickup. WashNova arrives right at your door.</p>
      </div>

      <div class="step-card">
        <div class="step-number">2</div>
        <div class="step-icon">🧼</div>
        <h3>Premium Cleaning</h3>
        <p>Premium detergents + fabric-safe process for a Premium, refreshing clean.</p>
      </div>

      <div class="step-card">
        <div class="step-number">3</div>
        <div class="step-icon">✨</div>
        <h3>Iron & Finish</h3>
        <p>Steam-pressed & quality-checked clothes for a crisp, wrinkle-free look.</p>
      </div>

      <div class="step-card">
        <div class="step-number">4</div>
        <div class="step-icon">🚚</div>
        <h3>Fresh Delivery</h3>
        <p>Perfectly packed fresh clothes delivered right on time.</p>
      </div>
    </div>
  </section>



  <!-- CTA BANNER -->
  <section class="cta-banner-section">
    <div class="cta-banner">
      <div class="cta-img">
        <img src="./assets/imges/img/washnova_beg.png" alt="WashNova Service">
      </div>
      <div class="cta-content">
        <h2>Leave your laundry to the experts and save 3+ hours per week</h2>
        <button onclick="location.href='auth/login.php';" class="btn-cta" id="openBookingForm">
          <i class="fa-solid fa-truck"></i>
          Schedule Pickup & Delivery
        </button>
      </div>
    </div>
  </section>



  <?php include('includes/footer.php'); ?>





  <!-- SERVICE DATA + SWITCH FUNCTION -->
  <script>
    const services = {
      wash: {
        title: "Wash & Fold",
        desc1: "Experience the ultimate convenience with our Wash & Fold service, designed to save you time while keeping your clothes fresh and clean.",
        desc2: "Clothes are carefully sorted, washed with premium detergents, and folded neatly to maintain their shape and quality, ensuring a fresh wardrobe every time.",
        footer: "WashNova – where <span style='font-weight:bold; color: brown;'>freshness</span> meets <span style='font-weight:bold; color: brown;'>perfection</span>.",
        media: "./assets/videos/wash.mp4",
        type: "video"
      },
      dry: {
        title: "Dry Cleaning",
        desc1: "Give your clothes professional care with our Dry Cleaning service, ideal for delicate fabrics, suits, and designer wear.",
        desc2: "We handle each garment with precision, using eco-friendly solvents and advanced techniques to restore their pristine condition without any damage.",
        footer: "WashNova – your <span style='font-weight:bold; color: brown;'>trusted partner</span> for elegant and spotless clothing.",
        media: "./assets/videos/video.mp4",
        type: "video"
      },
      premium: {
        title: "Premium Laundry",
        desc1: "Step into luxury with our Premium Laundry service, designed for high-end fabrics and designer collections.",
        desc2: "Ideal for delicate fabrics, silk, and designer wear, we use specialized detergents, gentle washing cycles, and expert folding techniques.",
        footer: "WashNova – redefining <span style='font-weight:bold; color: brown;'>luxury care</span> for your wardrobe.",
        media: "./assets/videos/premium.mp4",
        type: "video"
      },
      shoe: {
        title: "Shoe Cleaning",
        desc1: "Restore your footwear to its original glory with our specialized Shoe Cleaning service.",
        desc2: "We use premium cleaning solutions, brushes, and polishing techniques to remove dirt, stains, and odors, keeping your shoes looking new.",
        footer: "WashNova – where every step feels <span style='font-weight:bold; color: brown;'>fresh and refined</span>.",
        media: "./assets/videos/shoe_cleaning.mp4",
        type: "video"
      },
      iron: {
        title: "Steam Iron & Pressing",
        desc1: "Keep your wardrobe flawless with our Steam Iron & Pressing service, ensuring crisp and perfectly pressed garments.",
        desc2: "Every garment is carefully steamed and ironed to remove wrinkles while maintaining fabric integrity, leaving your clothes ready to wear.",
        footer: "WashNova – bringing <span style='font-weight:bold; color: brown;'>perfection</span> to every crease.",
        media: "./assets/videos/iorn.mp4",
        type: "video"
      },
      "premium-clean": {
        title: "Premium Cleaning",
        desc1: "For tough stains and heavily soiled garments, our Premium Cleaning service delivers professional results.",
        desc2: "We use specialized stain removal techniques and advanced cleaning solutions to give your garments a fresh, like-new look.",
        footer: "WashNova – giving your garments a <span style='font-weight:bold; color: brown;'>new life</span>.",
        media: "./assets/videos/clean.mp4",
        type: "video"
      },
      carpet: {
        title: "Carpet & Curtain Cleaning",
        desc1: "Refresh your interiors with our Carpet & Curtain Cleaning service, removing dust, dirt, and allergens.",
        desc2: "We employ professional-grade equipment and eco-friendly solutions to deep clean fabrics, extending their life and enhancing your home’s hygiene.",
        footer: "WashNova – turning your home fabrics <span style='font-weight:bold; color: brown;'>cleaner and healthier</span>.",
        media: "./assets/videos/carpet.mp4",
        type: "video"
      },
      stain: {
        title: "Stain Removal",
        desc1: "Tough stains? No problem! Our expert stain removal service targets stubborn marks effectively.",
        desc2: "We identify fabric types and apply precise cleaning methods to remove stains without harming your garments, restoring their original look.",
        footer: "WashNova – restoring <span style='font-weight:bold; color: brown;'>spotless perfection</span> to your clothes.",
        media: "./assets/videos/steam.mp4",
        type: "video"
      }
    };

    function selectService(id, btn) {
      const data = services[id];

      const textEl = document.getElementById("service-text");
      const mediaEl = document.getElementById("service-media");

      textEl.classList.remove("active");
      mediaEl.classList.remove("active");

      setTimeout(() => {
        document.getElementById("service-title").innerHTML = data.title;
        document.getElementById("service-desc1").innerHTML = data.desc1;
        document.getElementById("service-desc2").innerHTML = data.desc2;
        document.getElementById("service-footer").innerHTML = data.footer;

        const video = document.getElementById("service-video");
        const image = document.getElementById("service-image");

        if (data.type === "video") {
          video.style.display = "block";
          image.style.display = "none";
          video.querySelector("source").src = data.media;
          video.load();
        }

        setTimeout(() => {
          textEl.classList.add("active");
          mediaEl.classList.add("active");
        }, 50);
      }, 300);

      document.querySelectorAll(".service-btn").forEach(b => b.classList.remove("active"));
      btn.classList.add("active");
    }

    window.addEventListener("DOMContentLoaded", function() {

      const urlParams = new URLSearchParams(window.location.search);
      const selectedService = urlParams.get("service");

      if (selectedService) {
        const btn = document.querySelector(`.service-btn[onclick*="${selectedService}"]`);
        if (btn) {
          selectService(selectedService, btn);
        }
      } else {
        // ✅ DEFAULT LOAD FIX
        const defaultBtn = document.getElementById("btn-wash");
        if (defaultBtn) {
          selectService("wash", defaultBtn);
        }
      }

    });
  </script>


  <!-- URL AUTO OPEN SERVICE -->
  <script>
    window.addEventListener("DOMContentLoaded", function() {
      const urlParams = new URLSearchParams(window.location.search);
      const selectedService = urlParams.get("service");

      if (selectedService) {
        const btn = document.querySelector(`.service-btn[onclick*="${selectedService}"]`);

        if (btn) {
          selectService(selectedService, btn);
          btn.classList.add("active");

          setTimeout(() => {
            document.getElementById(selectedService).scrollIntoView({
              behavior: "smooth",
              block: "start"
            });
          }, 400);
        }
      }
    });
  </script>
  <!--- booking model --->
  <script>
    const modal2 = document.getElementById("bookingModal");
    const closeBtn = document.getElementById("closeModalBtn");

    // Open modal from ANY button with class .open-booking-btn
    document.querySelectorAll(".open-booking-btn").forEach(btn => {
      btn.addEventListener("click", () => {
        modal2.classList.add("active");
        document.body.classList.add("modal-open");
      });
    });

    // Close button
    closeBtn.addEventListener("click", () => {
      modal2.classList.remove("active");
      document.body.classList.remove("modal-open");
    });

    // Outside click close
    modal.addEventListener("click", (e) => {
      if (e.target === modal) {
        modal2.classList.remove("active");
        document.body.classList.remove("modal-open");
      }
    });

    // ESC close
    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape") {
        modal2.classList.remove("active");
        document.body.classList.remove("modal-open");
      }
    });
  </script>


</body>

</html>