<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Services | WashNova</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
  body { font-family: Arial, sans-serif; margin:0; padding:0; }
  .services-section { display: flex; max-width: 1200px; margin: auto; padding: 50px 20px; gap: 30px; }
  .services-left { position: sticky; top: 50px; flex: 1; padding: 20px; border-right: 1px solid #ccc; }
  .services-right { flex: 2; padding: 20px; }
  .service-content { margin-bottom: 50px; }
  .service-image { max-width: 100%; margin-top: 10px; border-radius: 8px; }
  .btn-primary-service, .btn-secondary-service { display: inline-block; margin: 10px 0; padding: 8px 15px; border-radius: 5px; text-decoration: none; }
  .btn-primary-service { background: #28a745; color: #fff; }
  .btn-secondary-service { background: #007bff; color: #fff; margin-left: 10px; }
  .service-features li { margin: 15px 0; }
  .service-features i { margin-right: 8px; color: #28a745; }
</style>
</head>
<body>

<!-- LEFT STICKY SECTION -->
<div class="services-section">
  <div class="services-left">
    <div class="service-icon-wrapper">
      <img src="./assets/graphics/wash_fold.webp" alt="Service Icon" class="service-bag-icon" id="service-icon-img" width="100">
    </div>
    <h5 class="service-title" id="service-title">Wash & Fold</h5>
    <p class="service-description" id="service-desc">
      Effortless laundry care, designed for busy lives.
    </p>
    <div class="service-buttons">
      <a href="javascript:void(0)" class="btn-primary-service open-booking-btn">Schedule a Wash & Fold pickup</a>
      <a href="./services.php?service=wash" class="btn-secondary-service">Learn more about Wash & Fold</a>
      <a href="./services.php?service=dry" class="btn-secondary-service">Learn more about Dry Cleaning</a>
      <a href="./services.php?service=iron" class="btn-secondary-service">Learn more about Steam Ironing</a>
    </div>
  </div>

  <!-- RIGHT SCROLLING SECTION -->
  <div class="services-right" id="services-right">
    
    <!-- WASH & FOLD -->
    <div class="service-content" id="wash">
      <div class="service-header">
        <img src="./assets/graphics/wash_fold.webp" alt="Wash & Fold" class="service-header-icon" width="50">
        <h3 class="service-header-title">Wash & Fold</h3>
      </div>
      <img src="assets/rebrand/img/landing/images/b_add_this_logo_on_bag.jpeg" alt="Wash & Fold Service" class="service-image">
      <ul class="service-features">
        <li><i class="fas fa-calendar-check"></i>Easy scheduling - Book any day. Free laundry bags provided.</li>
        <li><i class="fas fa-water"></i>Professional care - Lights & darks separated. Hypoallergenic detergent.</li>
        <li><i class="fas fa-shirt"></i>Ready to wear - Fresh, crisp, folded, and ready for your wardrobe.</li>
      </ul>
    </div>

    <!-- DRY CLEANING -->
    <div class="service-content" id="dry">
      <div class="service-header">
        <img src="./assets/graphics/dry_cleaning.webp" alt="Dry Cleaning" class="service-header-icon" width="50">
        <h3 class="service-header-title">Dry Cleaning</h3>
      </div>
      <img src="assets/rebrand/img/landing/images/dry_cleaning.jpeg" alt="Dry Cleaning Service" class="service-image">
      <ul class="service-features">
        <li><i class="fas fa-camera-retro"></i>Item tracking - Photos of every item for transparency.</li>
        <li><i class="fas fa-spray-can"></i>Expert stain removal - Specialized treatments per care label.</li>
        <li><i class="fas fa-hanger"></i>Protected delivery - Professionally pressed, delivered on hangers.</li>
      </ul>
    </div>

    <!-- STEAM IRONING -->
    <div class="service-content" id="iron">
      <div class="service-header">
        <img src="./assets/graphics/iron.png" alt="Steam Ironing" class="service-header-icon" width="50">
        <h3 class="service-header-title">Steam Ironing</h3>
      </div>
      <img src="./assets/imges/img/ironing.png" alt="Steam Ironing Service" class="service-image">
      <ul class="service-features">
        <li><i class="fas fa-droplet"></i>Premium cleaning - Gentle detergents & conditioners.</li>
        <li><i class="fas fa-fire-flame-curved"></i>Steam pressing - Crisp, wrinkle-free results.</li>
        <li><i class="fas fa-circle-check"></i>Quality inspection - Every garment checked before packaging.</li>
      </ul>
    </div>

  </div>
</div>

<script>
document.addEventListener("DOMContentLoaded", function() {

  const learnMoreLinks = document.querySelectorAll('.btn-secondary-service');
  const serviceIcon = document.getElementById('service-icon-img');
  const serviceTitle = document.getElementById('service-title');
  const serviceDesc = document.getElementById('service-desc');

  const serviceData = {
    wash: {
      title: "Wash & Fold",
      desc: "Effortless laundry care, designed for busy lives.",
      icon: "./assets/graphics/wash_fold.webp"
    },
    dry: {
      title: "Dry Cleaning",
      desc: "Professional dry cleaning with convenient pickup and delivery.",
      icon: "./assets/graphics/dry_cleaning.webp"
    },
    iron: {
      title: "Steam Ironing",
      desc: "Professional washing and steam pressing for crisp, polished look.",
      icon: "./assets/graphics/iron.png"
    }
  };

  learnMoreLinks.forEach(link => {
    link.addEventListener('click', function(e) {
      e.preventDefault();
      const url = new URL(this.href, window.location.origin);
      const service = url.searchParams.get('service');

      if (service && serviceData[service]) {
        // Update left section
        serviceIcon.src = serviceData[service].icon;
        serviceTitle.textContent = serviceData[service].title;
        serviceDesc.textContent = serviceData[service].desc;

        // Scroll to section
        const target = document.getElementById(service);
        if (target) {
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
          target.style.transition = 'background 0.5s';
          target.style.background = '#f0f9ff';
          setTimeout(() => { target.style.background = ''; }, 1000);
        }
      }
    });
  });

});
</script>

</body>
</html>
