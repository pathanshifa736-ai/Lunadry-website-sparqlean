<?php require_once __DIR__ . '/includes/init.php'; ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <?php include('includes/link.php'); ?>
<link rel="stylesheet" href="assets/css/about.css">
    

  <title>About WashNova — Premium Laundry & Dry Cleaning in Surat</title>
  
</head>

<body>

<?php  include('includes/header.php'); ?>

  <!-- HERO SECTION -->
  <section class="hero">
    <div class="hero-container">
      <div class="hero-content">
        <h1 class="fade-in-up" style="animation-delay: 0s;">
          Premium laundry.<br>
          <span class="highlight">Delivered fresh.</span>
        </h1>
        <p class="fade-in-up" style="animation-delay: 0.1s;color:white;">
          We're redefining laundry service in Surat with dermatologist-tested detergents, fabric-safe processes, and doorstep convenience.
        </p>
        
        <div style="animation-delay: 0.2s;" class="fade-in-up">
          <button onclick="location.href='auth/login.php';" class="btn-hero">
            
            <span>Schedule Your First Pickup →</span>
          </button>
          
        </div>

        <div class="hero-stats fade-in-up" style="animation-delay: 0.3s;">
          <div class="stat">
            <div class="stat-number">50K+</div>
            <div class="stat-label" style="color:white;">Happy Customers</div>
          </div>
          <div class="stat">
            <div class="stat-number">24h</div>
            <div class="stat-label" style="color:white;">Turnaround</div>
          </div>
          <div class="stat">
            <div class="stat-number">99.8%</div>
            <div class="stat-label" style="color:white;">Satisfaction</div>
          </div>
        </div>
      </div>

      <div class="hero-visual fade-in-up" style="animation-delay: 0.2s;">
        <div class="hero-image">
          <img src="assets/imges/img/washnova_shop.png" alt="WashNova Premium Laundry Service" style="height: 150%;">
        </div>
        
        <div class="floating-badge badge-2">
          <span>✓</span> Eco-Friendly
        </div>
      </div>
    </div>
  </section>

  <!-- STORY SECTION -->
  <section class="section" id="story">
    <div class="container">
      <div class="story-grid">
        <div class="story-content reveal">
          <span class="section-label">Our Story</span>
          <h3>Built on quality, powered by care</h3>
          <p>
            Washnova started with a simple question: Why should premium laundry care be complicated? We saw an opportunity to bring laboratory-formulated detergents, German-grade equipment, and professional expertise directly to your doorstep.
          </p>
          <p>
            Today, we serve thousands of customers across Surat, handling everything from daily essentials to delicate garments with the same attention to detail that defines our brand.
          </p>
          <p>
            Every order is treated with care, processed through our fabric-specific protocols, and delivered with our signature long-lasting fragrance.
          </p>
        </div>
        <div class="story-visual reveal">
          <div class="story-image">
            <img src="assets/imges/img/washnova_about.png" alt="Washnova Facility">
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- VALUES SECTION -->
  <section class="section section-alt">
    <div class="container">
      <div class="section-header reveal">
        <span class="process-label">Our Values</span>
        <h2 style="font-size: 40px;font-weight:500;">What drives us every day</h2>
        <p>The principles that guide every decision, every process, and every customer interaction.</p>
      </div>

      <div class="values-grid">
        <div class="value-card reveal">
          <div class="value-icon">🧪</div>
          <h4>Science-First</h4>
          <p>We use dermatologically-tested, hypoallergenic formulations that are gentle on skin but tough on stains.</p>
        </div>

        <div class="value-card reveal">
          <div class="value-icon">🌱</div>
          <h4>Sustainability</h4>
          <p>Eco-aware detergents, water-efficient machines, and minimal waste practices at every step.</p>
        </div>

        <div class="value-card reveal">
          <div class="value-icon">⚡</div>
          <h4>Reliability</h4>
          <p>24-hour turnarounds, real-time tracking, and consistent quality across every order.</p>
        </div>

        <div class="value-card reveal">
          <div class="value-icon">🎯</div>
          <h4>Precision Care</h4>
          <p>Fabric-specific programs, manual stain treatments, and quality checks before delivery.</p>
        </div>

        <div class="value-card reveal">
          <div class="value-icon">🤝</div>
          <h4>Transparency</h4>
          <p>Clear pricing, open communication, and honest service from pickup to delivery.</p>
        </div>

        <div class="value-card reveal">
          <div class="value-icon">💯</div>
          <h4>Guaranteed</h4>
          <p>Not satisfied? We'll re-clean your order under our Care Guarantee—no questions asked.</p>
        </div>
      </div>
    </div>
  </section>

 <!-- PROCESS SECTION -->
<section class="process-section" id="process">
  <div class="process-container">
    <div class="process-header">
      <span class="process-label">How It Works</span>
      <h2 style="color:white;">Simple 4-Step Process</h2>
      <p>Professional laundry care made easy</p>
    </div>

    <div class="process-track">
      <div class="process-line">
        <div class="process-line-fill"></div>
      </div>
      
      <div class="process-cards">
        <div class="process-card" data-step="1">
          <div class="process-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
              <polyline points="9 22 9 12 15 12 15 22"></polyline>
            </svg>
          </div>
          <h3>Schedule Pickup</h3>
          <p>Book online in 30 seconds</p>
          <div class="process-time">Same day available</div>
        </div>

        <div class="process-card" data-step="2">
          <div class="process-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <circle cx="12" cy="12" r="10"></circle>
              <path d="M8 14s1.5 2 4 2 4-2 4-2"></path>
              <line x1="9" y1="9" x2="9.01" y2="9"></line>
              <line x1="15" y1="9" x2="15.01" y2="9"></line>
            </svg>
          </div>
          <h3>We Wash</h3>
          <p>Premium eco-friendly care</p>
          <div class="process-time">24hr process</div>
        </div>

        <div class="process-card" data-step="3">
          <div class="process-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
          </div>
          <h3>Quality Check</h3>
          <p>15-point inspection</p>
          <div class="process-time">100% guaranteed</div>
        </div>

        <div class="process-card" data-step="4">
          <div class="process-icon">
            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
              <rect x="1" y="3" width="15" height="13"></rect>
              <polygon points="16 8 20 8 23 11 23 16 16 16 16 8"></polygon>
              <circle cx="5.5" cy="18.5" r="2.5"></circle>
              <circle cx="18.5" cy="18.5" r="2.5"></circle>
            </svg>
          </div>
          <h3>Free Delivery</h3>
          <p>To your doorstep</p>
          <div class="process-time">Track real-time</div>
        </div>
      </div>
    </div>

    <div class="process-cta">
      
      <button onclick="location.href='auth/login.php';" class="btn-hero" id="openBookingForm">
            
            <span>Start Your First Order</span>
          </button>
    </div>
  </div>
</section>

  <!-- TESTIMONIALS SECTION -->
  <section class="section section-alt">
    <div class="container">
      <div class="section-header reveal">
        <span class="process-label">What People Say</span>
        <h2 style="font-size: 40px;font-weight:500;">Trusted by thousands in Surat</h2>
      </div>

      <div class="testimonials-grid">
        <div class="testimonial-card reveal">
          <div class="stars">★★★★★</div>
          <p class="testimonial-text">
            "The fragrance lasts for weeks! Finally found a service that treats my clothes with care. The pickup and delivery is seamless."
          </p>
          <div class="testimonial-author">
          
            <div class="author-info">
              <h5>Priya Sharma</h5>
              <p>Regular Customer</p>
            </div>
          </div>
        </div>

        <div class="testimonial-card reveal">
          <div class="stars">★★★★★</div>
          <p class="testimonial-text">
            "Professional service. They handled my delicate sarees perfectly and the colors still look brand new after multiple washes."
          </p>
          <div class="testimonial-author">
          
            <div class="author-info">
              <h5>Rajesh Patel</h5>
              <p>2 Years with Washnova</p>
            </div>
          </div>
        </div>

        <div class="testimonial-card reveal">
          <div class="stars">★★★★★</div>
          <p class="testimonial-text">
            "Best laundry service in Surat. My daughter has sensitive skin and their hypoallergenic detergent works perfectly for us."
          </p>
          <div class="testimonial-author">
           
            <div class="author-info">
              <h5>Anjali Mehta</h5>
              <p>Family of 4</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA BANNER -->
 <section 
  style="
    width: 100%;
    padding: 50px 20px;
    background: #244236;
    border-radius: 50px;
    display: flex;
    justify-content: center;
    align-items: center;
    box-sizing: border-box;
    margin: 0 auto;
    max-width:1200px;
    margin-bottom:30px;
  "
>
  <div 
    style="
      text-align: center;
      max-width: 900px;
      margin: auto;
    "
  >
    <h2 
      style="
        font-size: 48px;
        font-weight: 600;
        color: #ffffff;
        margin-bottom: 25px;
        line-height: 1.3;
      "
    >
      Experience premium laundry care
    </h2>

    <p 
      style="
        font-size: 20px;
        color: #e6e6e6;
        margin-bottom: 45px;
      "
    >
      Join thousands of satisfied customers. First pickup is free—no commitment required.
    </p>

    <a 
     onclick="location.href='auth/login.php';"
   
      style="
        display: inline-flex;
        align-items: center;
        gap: 10px;
        text-decoration: none;
        background: #ffffff;
        padding: 18px 35px;
        border-radius: 40px;
        font-size: 20px;
        font-weight: 600;
        color: #e6a800;
        transition: 0.3s;
      "
    >
      Get Started Today
      <span style="font-size: 24px;">→</span>
    </a>
  </div>
</section>


  <script>
    // Intersection Observer for reveal animations
    const observerOptions = {
      threshold: 0.1,
      rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('visible');
          observer.unobserve(entry.target);
        }
      });
    }, observerOptions);

    document.querySelectorAll('.reveal').forEach(el => {
      observer.observe(el);
    });

    // Parallax effect for hero image
    const heroImage = document.querySelector('.hero-image');
    if (heroImage && window.matchMedia('(min-width: 1024px)').matches) {
      document.addEventListener('mousemove', (e) => {
        const moveX = (e.clientX - window.innerWidth / 2) * 0.01;
        const moveY = (e.clientY - window.innerHeight / 2) * 0.01;
        heroImage.style.transform = `perspective(1000px) rotateY(${-5 + moveX}deg) rotateX(${moveY}deg)`;
      });
    }
  </script>

<?php include('includes/footer.php'); ?>
<script src="assets/js/script.js"></script>


</body>
</html>