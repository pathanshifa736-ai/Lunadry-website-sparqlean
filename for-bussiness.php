<?php require_once __DIR__ . '/includes/init.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Business Solutions — WashNova Professional Laundry Services</title>
  <link rel="icon" type="image/x-icon" href="assets/imges/img/logo1.png">
  <?php include('includes/link.php'); ?>
  <link rel="stylesheet" href="assets/css/bussiness.css">
</head>

<body>

  <?php include('includes/header.php'); ?>

  <!-- HERO SECTION -->
  <section class="hero">
    <div class="hero-container">
      <div class="hero-content">
        <h1 class="fade-in">
          Partner with <span class="highlight">WashNova</span> for all your laundry needs
        </h1>
        <p class="fade-in" style="animation-delay: 0.1s;">
          Professional laundry solutions for hotels, restaurants, salons, gyms, and corporate offices in Surat. Premium quality, reliable service, competitive pricing.
        </p>

        <div class="hero-benefits fade-in" style="animation-delay: 0.2s;">
          <div class="benefit-item">
            <div class="icon">✓</div>
            <span>Customized SLAs with guaranteed turnaround times</span>
          </div>
          <div class="benefit-item">
            <div class="icon">✓</div>
            <span>Dedicated account manager and priority support</span>
          </div>
          <div class="benefit-item">
            <div class="icon">✓</div>
            <span>Flexible pickup & delivery schedules</span>
          </div>
          <div class="benefit-item">
            <div class="icon">✓</div>
            <span>Volume-based pricing with no hidden fees</span>
          </div>
        </div>

        <!-- Collapsible Services Section -->
        <div class="fade-in" style="animation-delay: 0.25s;">
          <div class="hero-services-toggle" id="servicesToggle">
            <span>🏢 Our Services — See What We Offer</span>
            <span class="toggle-icon">▼</span>
          </div>

          <div class="hero-services-content" id="servicesContent">
            <div class="hero-services-grid">
              <div class="hero-service-item">
                <div class="service-icon-small">🏨</div>
                <h5>Hotels & Resorts</h5>
                <p>Bed linens, towels, bathrobes & more</p>
              </div>
              <div class="hero-service-item">
                <div class="service-icon-small">🍽️</div>
                <h5>Restaurants</h5>
                <p>Chef uniforms, tablecloths, napkins</p>
              </div>

              <div class="hero-service-item">
                <div class="service-icon-small">🏢</div>
                <h5>Corporate Offices</h5>
                <p>Staff uniforms, workwear</p>
              </div>

            </div>
          </div>
        </div>

        <div class="fade-in" style="animation-delay: 0.3s;">
          <a onclick="location.href='auth/login.php';" class="cta-primary" id="openBookingForm">
            pickup & Delivery
            <span>→</span>
          </a>

        </div>
      </div>

      <div class="hero-form fade-in" style="animation-delay: 0.2s;" id="contact">
        <div class="form-header">
          <h3>Get Started Today</h3>
          <p>Fill out the form and we'll reach out within 24 hours</p>
        </div>

        <form id="businessForm" method="POST" action="process-business.php">

          <input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars(csrf_token()); ?>">

          <div class="form-row">
            <div class="form-group">
              <label>Full Name *</label>
              <input type="text" name="full_name" placeholder="Sohil khan" required>
            </div>
            <div class="form-group">
              <label>Business Name *</label>
              <input type="text" name="business_name" placeholder="Mr.Blue" required>
            </div>
          </div>

          <div class="form-row">
            <div class="form-group">
              <label>Email Address *</label>
              <input type="email" name="email" placeholder="sohilkhb7@gmail.com" required>
            </div>
            <div class="form-group">
              <label>Phone Number *</label>
              <input type="tel" name="phone" placeholder="9727262224" required>
            </div>
          </div>

          <div class="form-group">
            <label>Business Type *</label>
            <select name="business_type" required>
              <option value="">Select your business type</option>
              <option value="hotel">Hotel / Resort</option>
              <option value="restaurant">Restaurant / Cafe</option>
              <option value="salon">Salon / Spa</option>
              <option value="gym">Gym / Fitness Center</option>
              <option value="hospital">Hospital / Clinic</option>
              <option value="corporate">Corporate Office</option>
              <option value="other">Other</option>
            </select>
          </div>
          <div class="form-group">
            <label>Additional Requirements</label>
            <textarea name="requirements" placeholder="Tell us about your specific needs, preferred schedule, special requirements..."></textarea>
          </div>

          <button type="submit" class="submit-btn">Request Partnership Details</button>

          <div class="form-note">
            <span>🔒</span>
            <span>Your information is secure and confidential</span>
          </div>
        </form>
      </div>
    </div>
  </section>

  <!-- SERVICES SECTION -->
  <section class="section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Our Services</span>
        <h2>Comprehensive solutions for every business</h2>
        <p>From daily linen management to specialized fabric care, we handle it all with professional-grade equipment and processes.</p>
      </div>

      <div class="services-grid">
        <div class="service-card reveal">
          <div class="service-icon">🏨</div>
          <h3>Hotel </h3>
          <p>Bed linens, towels, bathrobes, and table linens with fast turnaround and consistent quality. RFID tracking available.</p>

        </div>

        <div class="service-card reveal">
          <div class="service-icon">🍽️</div>
          <h3>Restaurants & Cafes</h3>
          <p>Chef uniforms, tablecloths, napkins, and aprons. Stain removal expertise and food-safe cleaning processes.</p>

        </div>

        <div class="service-card reveal">
          <div class="service-icon">💆</div>
          <h3>Salons & Spas</h3>
          <p>Towels, robes, bed sheets, and salon capes. Hygienic cleaning with dermatologically-tested detergents.</p>

        </div>

        <div class="service-card reveal">
          <div class="service-icon">💪</div>
          <h3>Gyms & Fitness</h3>
          <p>Workout towels, yoga mats covers, and staff uniforms. Antibacterial wash cycles and odor elimination.</p>

        </div>

        <div class="service-card reveal">
          <div class="service-icon">🏢</div>
          <h3>Corporate Offices</h3>
          <p>Staff uniforms, workwear, and office textiles. Flexible scheduling and individual employee tracking.</p>

        </div>

        <div class="service-card reveal">
          <div class="service-icon">🎯</div>
          <h3>Custom Solutions</h3>
          <p>Tailored programs for schools, clinics, event venues, and more. Contact us to discuss your specific needs.</p>

        </div>
      </div>
    </div>
  </section>

  <!-- REASONS SECTION -->
  <section class="section reasons-section">
    <div class="container">
      <div class="reasons-grid">
        <div class="reasons-image reveal">
          <img src="./assets/imges/img/washnova_about.png" alt="WashNova Commercial Facility">
        </div>

        <div class="reasons-list">
          <div class="reveal">
            <span class="section-label">Why Partner With Us</span>
            <h2 style="font-size: 42px; font-weight: 800; margin: 16px 0 40px;">Built for business reliability</h2>
          </div>

          <div class="reason-item reveal">
            <div class="reason-icon">⚡</div>
            <div class="reason-content">
              <h4>Best-in-class Cleaning</h4>
              <p>German-grade commercial machines, premium detergents, and fabric-specific programs ensure superior results every time.</p>
            </div>
          </div>



          <div class="reason-item reveal">
            <div class="reason-icon">📊</div>
            <div class="reason-content">
              <h4>Multi-location Service</h4>
              <p>Serving businesses across Surat with consistent quality. Flexible pickup schedules tailored to your operation hours.</p>
            </div>
          </div>

          <div class="reason-item reveal">
            <div class="reason-icon">🔒</div>
            <div class="reason-content">
              <h4>Advanced Technology</h4>
              <p>RFID tracking, digital invoicing, and online portal access for complete visibility and control over your orders.</p>
            </div>
          </div>

          <div class="reason-item reveal">
            <div class="reason-icon">✓</div>
            <div class="reason-content">
              <h4>Quality Verified</h4>
              <p>Multi-stage QC process with documented hygiene protocols. We stand behind our work with a satisfaction guarantee.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CLIENTS SECTION -->
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Exo:wght@400;600&display=swap');

    .client-section {
      font-family: "Exo", sans-serif;
      font-weight: 400;
      font-style: normal;
      max-width: 1200px;
      margin: 0 auto;
      padding: 56px 20px;
    }

    .client-section .header {
      display: grid;
      grid-template-columns: 1.2fr .8fr;
      gap: 24px;
      align-items: center;
      margin-bottom: 22px;
    }

    @media (max-width: 860px) {
      .client-section .header {
        grid-template-columns: 1fr;
      }
    }

    .client-section .eyebrow {
      display: inline-flex;
      align-items: center;
      gap: 10px;
      font-weight: 600;
      letter-spacing: .02em;
      color: #111317;
      margin-bottom: 8px;
    }

    .client-section .eyebrow::before {
      content: "";
      width: 18px;
      height: 2px;
      background: #F4D44C;
      border-radius: 2px;
    }

    .client-section h2 {
      margin: 0 0 10px;
      font-size: clamp(22px, 4.5vw, 32px);
      line-height: 1.15;
    }

    .client-section .sub {
      color: #6b7280;
      font-size: 15px;
      margin-bottom: 12px;
    }

    .client-section .hero-art img {
      width: 100%;
      max-width: 380px;
      height: auto;
    }

    .client-section .grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 16px;
      margin-top: 28px;
    }

    @media (max-width: 992px) {
      .client-section .grid {
        grid-template-columns: repeat(3, 1fr);
      }
    }

    @media (max-width: 640px) {
      .client-section .grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    .client-section .card {
      background: linear-gradient(135deg, #ffffff 0%, #fbfcff 100%);
      border: 2px solid rgba(244, 212, 76, 0.18);
      border-radius: 16px;
      padding: 10px;
      min-height: 80px;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all .3s ease;
      position: relative;
      overflow: hidden;
    }

    .client-section .card:hover {
      transform: translateY(-6px) scale(1.04);
      box-shadow: 0 12px 30px rgba(244, 212, 76, 0.2), 0 0 20px rgba(75, 103, 248, 0.12);
      border-color: rgba(244, 212, 76, 0.4);
    }

    .client-section .logo {
      max-width: 200px;
      max-height: 90px;
      width: auto;
      height: auto;
      object-fit: contain;
    }
  </style>




  <!-- PROCESS SECTION -->
  <section class="section process-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">How It Works</span>
        <h2>Simple, streamlined process</h2>
        <p>From onboarding to daily operations, we make business laundry effortless</p>
      </div>

      <div class="process-steps">
        <div class="process-step reveal">
          <div class="process-number">1</div>
          <h4>Consultation</h4>
          <p>We assess your needs, volume, and schedule to create a customized solution.</p>
        </div>

        <div class="process-step reveal">
          <div class="process-number">2</div>
          <h4>Setup & Training</h4>
          <p>Quick onboarding with RFID setup, portal access, and team briefing.</p>
        </div>

        <div class="process-step reveal">
          <div class="process-number">3</div>
          <h4>Regular Service</h4>
          <p>Scheduled pickups and deliveries with real-time tracking and updates.</p>
        </div>

        <div class="process-step reveal">
          <div class="process-number">4</div>
          <h4>Ongoing Support</h4>
          <p>Dedicated support, monthly reviews, and continuous optimization.</p>
        </div>
      </div>
    </div>
  </section>

  <!-- TESTIMONIALS SECTION -->
  <section class="section testimonials-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Client Stories</span>
        <h2>What our partners say</h2>
      </div>

      <div class="testimonials-slider">
        <div class="testimonial-card reveal">
          <div class="testimonial-header">
            <div class="testimonial-avatar">RG</div>
            <div class="testimonial-info">
              <h5>Rajesh Gupta</h5>
              <p>Hotel Manager, Grand Residency</p>
            </div>
          </div>
          <div class="testimonial-stars">★★★★★</div>
          <p class="testimonial-text">
            "WashNova has been handling our hotel linens for over a year now. The consistency is impressive—every delivery meets our standards. Their RFID tracking system has eliminated all inventory issues."
          </p>
        </div>

        <div class="testimonial-card reveal">
          <div class="testimonial-header">
            <div class="testimonial-avatar">PM</div>
            <div class="testimonial-info">
              <h5>Priya Mehta</h5>
              <p>Owner, Serenity Spa & Salon</p>
            </div>
          </div>
          <div class="testimonial-stars">★★★★★</div>
          <p class="testimonial-text">
            "As a spa, hygiene is everything. WashNova's dermatologically-tested detergents and steam finishing give us complete confidence. Our clients often comment on how fresh our towels smell."
          </p>
        </div>

        <div class="testimonial-card reveal">
          <div class="testimonial-header">
            <div class="testimonial-avatar">AS</div>
            <div class="testimonial-info">
              <h5>Amit Shah</h5>
              <p>Operations Head, FitZone Gym Chain</p>
            </div>
          </div>
          <div class="testimonial-stars">★★★★★</div>
          <p class="testimonial-text">
            "Managing laundry across 3 gym locations was a nightmare until we found WashNova. Their antibacterial wash cycles handle our high volume perfectly, and the pricing is very competitive."
          </p>
        </div>

        <div class="testimonial-card reveal">
          <div class="testimonial-header">
            <div class="testimonial-avatar">NK</div>
            <div class="testimonial-info">
              <h5>Neha Kapoor</h5>
              <p>Restaurant Owner, Spice Garden</p>
            </div>
          </div>
          <div class="testimonial-stars">★★★★★</div>
          <p class="testimonial-text">
            "Their stain removal team is exceptional. Chef whites, table linens, napkins—everything comes back pristine. The flexible pickup times work perfectly with our restaurant schedule."
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ SECTION -->
  <section class="section faq-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Questions?</span>
        <h2>Frequently asked questions</h2>
      </div>

      <div class="faq-grid">
        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>What are your minimum order requirements?</span>
          </div>
          <div class="faq-answer">
            We work with businesses of all sizes. Minimum volume is typically 200 kg/month, but we can accommodate smaller operations on a case-by-case basis.
          </div>
        </div>

        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>How quickly can you turn around orders?</span>
          </div>
          <div class="faq-answer">
            Standard turnaround is 24-48 hours. We also offer same-day and express services for urgent needs at premium rates. SLAs can be customized based on your requirements.
          </div>
        </div>

        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>Do you provide linen rental services?</span>
          </div>
          <div class="faq-answer">
            Not currently, but we can recommend trusted linen suppliers in Surat. We focus exclusively on professional cleaning and care of your existing inventory.
          </div>
        </div>

        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>What if items are damaged or lost?</span>
          </div>
          <div class="faq-answer">
            All items are tracked via RFID or barcode. In the rare case of damage or loss, we provide fair compensation based on item value. Our loss rate is under 0.1%.
          </div>
        </div>

        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>Can I change my pickup schedule?</span>
          </div>
          <div class="faq-answer">
            Absolutely. We understand business needs change. You can adjust pickup frequency and timing through your account manager or our online portal with 24 hours notice.
          </div>
        </div>

        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span>How do you handle billing?</span>
          </div>
          <div class="faq-answer">
            Digital invoicing on monthly or bi-weekly cycles. Payment via bank transfer, cheque, or online. Detailed breakdowns available through your portal with per-item tracking.
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- CTA SECTION -->
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
  ">
    <div
      style="
      text-align: center;
      max-width: 900px;
      margin: auto;
    ">
      <h2
        style="
        font-size: 48px;
        font-weight: 600;
        color: #ffffff;
        margin-bottom: 25px;
        line-height: 1.3;
      ">
        Ready to elevate your laundry operations?
      </h2>

      <p
        style="
        font-size: 20px;
        color: #e6e6e6;
        margin-bottom: 45px;
      ">
        Join successful businesses across Surat who trust WashNova for professional laundry solutions.
      </p>

      <a
        onclick="location.href='auth/login.php';"
        id="openBookingForm"
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
      ">
        Request a Custom Quote
        <span style="font-size: 24px;">→</span>
      </a>
    </div>
  </section>



  <?php include('includes/footer.php'); ?>
  <script src="assets/js/script.js"></script>

  <script>
    // Process animation on scroll
    const processObserver = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          entry.target.classList.add('in-view');

          // Animate progress line
          const line = document.querySelector('.process-line-fill');
          if (line) {
            line.style.width = '100%';
          }
        }
      });
    }, {
      threshold: 0.3
    });

    document.querySelectorAll('.process-card').forEach(card => {
      processObserver.observe(card);
    });

    // Hover effect for cards
    document.querySelectorAll('.process-card').forEach((card, index) => {
      card.addEventListener('mouseenter', () => {
        card.style.animationDelay = '0s';
      });
    });

    document.getElementById("businessForm").addEventListener("submit", async function(e) {
      e.preventDefault();

      const form = new FormData(this);

      const res = await fetch("process-business.php", {
        method: "POST",
        body: form
      });

      const data = await res.json();

      if (data.success) {
        alert("Submitted successfully. Our team will contact you.");
        this.reset();
      } else {
        alert(data.message || "Something went wrong.");
      }
    });
  </script>

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