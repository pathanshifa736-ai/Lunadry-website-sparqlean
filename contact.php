<?php require_once __DIR__ . '/includes/init.php'; ?>
<?php
// ─── Fetch FAQs: message = question, reply_message = answer ──────────────────
$faqs = [];
try {
    $pdo  = getPDO();
    $stmt = $pdo->prepare("
        SELECT message AS question, reply_message AS answer
        FROM contact_messages
        WHERE is_deleted = 0
          AND message IS NOT NULL
          AND reply_message IS NOT NULL
        ORDER BY created_at DESC
        LIMIT 6
    ");
    $stmt->execute();
    $faqs = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    error_log("FAQ fetch error: " . $e->getMessage());
}

// Fallback static FAQs if DB empty
if (empty($faqs)) {
    $faqs = [
        ['question' => 'How do I schedule a pickup?',           'answer' => 'You can schedule a pickup online at our booking portal, call us at +91 878-052-9628, or send us a WhatsApp message. We\'ll confirm your slot within 2 hours.'],
        ['question' => 'What are your service areas in Surat?', 'answer' => 'We currently serve Adajan, Vesu, Pal, and nearby areas in Surat. Contact us to check if we deliver to your location.'],
        ['question' => 'Do you offer same-day service?',        'answer' => 'Yes! We offer express same-day service for urgent orders. Additional charges apply. Contact us before 11 AM for same-day delivery.'],
        ['question' => 'Can I visit the store directly?',       'answer' => 'Absolutely! Our store is open Mon-Sat, 9 AM - 8 PM. Visit us at G4 Fortune, High Street, Adajan. Walk-ins welcome — no appointment needed.'],
        ['question' => 'What payment methods do you accept?',   'answer' => 'We accept cash, UPI, credit/debit cards, and online payments. You can pay at pickup, delivery, or through our online portal.'],
        ['question' => 'How can I track my order?',             'answer' => 'Once your order is confirmed, we\'ll send you a tracking link via SMS and WhatsApp. You can also call us for real-time updates.'],
    ];
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>sparQlean - Contact Us</title>
  <link rel="icon" type="image/x-icon" href="assets/logo/second.png">
  <meta name="description" content="Get in touch with SparQlean for premium laundry and dry cleaning services in Surat.">
  <meta name="keywords" content="contact SparQlean, laundry service Surat, dry cleaning Surat contact">
  <meta name="author" content="SparQlean">
  <?php include('includes/link.php') ?>
  <link rel="stylesheet" href="./assets/css/contact.css">
</head>
<body>

  <?php include('includes/header.php'); ?>

  <!-- HERO SECTION -->
  <section class="hero">
    <div class="hero-content">
      <h1 class="fade-in">Get in touch with SparQlean</h1>
      <p class="fade-in" style="animation-delay: 0.1s;">
        Visit our store in Adajan, schedule a pickup, or reach out online. We're here to make your laundry experience effortless.
      </p>
      <div class="hero-badges fade-in" style="animation-delay: 0.2s;">
        <div class="hero-badge"><div class="icon">📍</div><span>Visit Our Store</span></div>
        <div class="hero-badge"><div class="icon">📞</div><span>Call Us Anytime</span></div>
        <div class="hero-badge"><div class="icon">💬</div><span>Chat Support</span></div>
      </div>
    </div>
  </section>

  <!-- CONTACT SECTION -->
  <section class="contact-section">
    <div class="container">
      <div class="contact-grid">

        <!-- Contact Info Cards -->
        <div class="contact-info">

          <div class="info-card reveal">
            <div class="info-card-header">
              <div class="info-icon">📍</div>
              <div>
                <div class="label">Visit Us</div>
                <h3>Our Store Location</h3>
              </div>
            </div>
            <div class="info-content">
              <p>
                <strong>SparQlean Premium Dry Cleaning</strong><br>
                G4 Fortune, High Street<br>
                Opposite Western Arena Complex<br>
                Adajan, Surat, Gujarat 395009
              </p>
              <a href="https://maps.app.goo.gl/YXrn4WX3PmX7Nyoj7" target="_blank" class="cta-button" style="color:black">
                Get Directions
              </a>
            </div>
          </div>

          <div class="info-card reveal">
            <div class="info-card-header">
              <div class="info-icon">📞</div>
              <div>
                <div class="label">Call Us</div>
                <h3>Phone Numbers</h3>
              </div>
            </div>
            <div class="info-content">
              <p>
                <strong>Customer Support:</strong><br>
                <a href="tel:+9979491075">+91 9979491075</a>
              </p>
              <p style="font-size: 14px; color: var(--muted); margin-top: 8px;">
                Available: Mon-Sat, 9:00 AM - 8:00 PM
              </p>
            </div>
          </div>

          <div class="info-card reveal">
            <div class="info-card-header">
              <div class="info-icon">💬</div>
              <div>
                <div class="label">Digital Support</div>
                <h3>Online Channels</h3>
              </div>
            </div>
            <div class="info-content">
              <p>
                <strong>Email:</strong><br>
                <a href="mailto:support.SparQlean@gmail.com">support.SparQlean@gmail.com</a>
              </p>
            </div>
          </div>

        </div>

        <!-- Contact Form -->
        <div class="contact-form reveal">
          <div class="form-header">
            <h2 style="font-size: 40px; font-weight:500;">Send us a message</h2>
            <p>Fill out the form and we'll get back to you within 24 hours</p>
          </div>

          <form id="contactForm" method="POST" action="process-contact.php">
            <input type="hidden" name="csrf_token" value="<?php echo htmlspecialchars(csrf_token()); ?>">

            <div class="form-row">
              <div class="form-group">
                <label>Your Name *</label>
                <input type="text" name="name" placeholder="sohil khan" required>
              </div>
              <div class="form-group">
                <label>Phone Number *</label>
                <input type="tel" name="phone" placeholder="9727262224" required>
              </div>
            </div>

            <div class="form-group">
              <label>Email Address *</label>
              <input type="email" name="email" placeholder="sohilkhb7@gmail.com" required>
            </div>

            <div class="form-group">
              <label>Subject</label>
              <select name="subject">
                <option value="">Select a subject</option>
                <option value="pickup">Schedule a Pickup</option>
                <option value="pricing">Pricing Inquiry</option>
                <option value="business">Business Partnership</option>
                <option value="feedback">Feedback</option>
                <option value="complaint">Complaint</option>
                <option value="other">Other</option>
              </select>
            </div>

            <div class="form-group">
              <label>Message *</label>
              <textarea name="message" placeholder="Tell us how we can help you..." required></textarea>
            </div>

            <button type="submit" class="submit-btn">Send Message</button>

            <div class="form-note">
              🔒 Your information is secure and will never be shared
            </div>
          </form>
        </div>

      </div>
    </div>
  </section>

  <!-- MAP SECTION -->
  <section class="map-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Find Us</span>
        <h2 class="features-title">Visit Our Store in Adajan</h2>
        <p>Conveniently located opposite Western Arena Complex with ample parking</p>
      </div>
      <div class="map-container reveal">
        <iframe
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3720.5628845963844!2d72.82194647520895!3d21.17176298055567!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3be04f1b5e0e5555%3A0x1234567890abcdef!2sG4%20Fortune%2C%20High%20Street%2C%20Adajan%2C%20Surat!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin"
          allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>
    </div>
  </section>

  <!-- HOURS SECTION -->
  <section class="hours-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Service Hours</span>
        <h2 style="font-size:40px; font-weight:500;">When we're available</h2>
      </div>
      <div class="hours-grid">
        <div class="hours-card reveal">
          <div class="icon">🏪</div>
          <h3>Store Hours</h3>
          <p>Monday - Saturday<br><span class="highlight">9:00 AM - 8:00 PM</span></p>
          <p style="margin-top: 12px; font-size: 14px; color: var(--muted);">Sunday: Closed</p>
        </div>
        <div class="hours-card reveal">
          <div class="icon">🚚</div>
          <h3>Pickup & Delivery</h3>
          <p>Monday - Saturday<br><span class="highlight">9:00 AM - 7:00 PM</span></p>
          <p style="margin-top: 12px; font-size: 14px; color: var(--muted);">Same-day pickup available</p>
        </div>
        <div class="hours-card reveal">
          <div class="icon">💬</div>
          <h3>Customer Support</h3>
          <p>Monday - Saturday<br><span class="highlight">9:00 AM - 8:00 PM</span></p>
          <p style="margin-top: 12px; font-size: 14px; color: var(--muted);">Email support 24/7</p>
        </div>
      </div>
    </div>
  </section>

  <!-- FAQ SECTION — Dynamic: message=question, reply_message=answer -->
  <section class="faq-section">
    <div class="container">
      <div class="section-header reveal">
        <span class="section-label">Quick Help</span>
        <h2 style="font-size:40px; font-weight:500;">Frequently asked questions</h2>
        <p>Find answers to common questions about our services</p>
      </div>

      <div class="faq-grid">
        <?php foreach ($faqs as $faq): ?>
        <div class="faq-item reveal">
          <div class="faq-question">
            <span class="faq-icon">Q</span>
            <span><?= htmlspecialchars($faq['question']) ?></span>
          </div>
          <div class="faq-answer">
            <?= htmlspecialchars($faq['answer']) ?>
          </div>
        </div>
        <?php endforeach; ?>
      </div>

    </div>
  </section>

  <!-- CTA BANNER -->
  <section class="contact-section">
    <div class="container">
      <div class="cta-banner reveal">
        <h2>Ready to experience premium laundry care?</h2>
        <p>Schedule your first pickup today and get 25% OFF with code: SPARQ25</p>
        <a onclick="location.href='auth/login.php';" class="cta-button" id="openBookingForm">
          Schedule Free Pickup →
        </a>
      </div>
    </div>
  </section>

  <?php include('includes/footer.php'); ?>

  <script>
    document.getElementById("contactForm").addEventListener("submit", async function(e) {
      e.preventDefault();
      const form = new FormData(this);
      const res  = await fetch("process-contact.php", { method: "POST", body: form });
      const data = await res.json();
      if (data.success) {
        alert("Message sent successfully.");
        this.reset();
      } else {
        alert(data.message || "Something went wrong.");
      }
    });
  </script>

  <script src="assets/js/contact-script.js"></script>

  <script>
    const modal2   = document.getElementById("bookingModal");
    const closeBtn = document.getElementById("closeModalBtn");

    document.querySelectorAll(".open-booking-btn").forEach(btn => {
      btn.addEventListener("click", () => {
        modal2.classList.add("active");
        document.body.classList.add("modal-open");
      });
    });

    if (closeBtn) {
      closeBtn.addEventListener("click", () => {
        modal2.classList.remove("active");
        document.body.classList.remove("modal-open");
      });
    }

    if (modal2) {
      modal2.addEventListener("click", (e) => {
        if (e.target === modal2) {
          modal2.classList.remove("active");
          document.body.classList.remove("modal-open");
        }
      });
    }

    document.addEventListener("keydown", (e) => {
      if (e.key === "Escape" && modal2) {
        modal2.classList.remove("active");
        document.body.classList.remove("modal-open");
      }
    });
  </script>

</body>
</html>