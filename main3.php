<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>

  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Exo', sans-serif;
    }

    .about-intro {
      padding: 5rem 8%;
      background: linear-gradient(180deg, #fdfdfb 0%, #f7fff9 100%);
    }

    .about-intro h2 {
      text-align: center;
      color: black;
      margin-bottom: 2.5rem;
    }

    .about-split {
      display: grid;
      grid-template-columns: 1.05fr 0.95fr;
      gap: 3rem;
      align-items: center;
    }

    .about-split p {
      color: #222;
      font-size: 1.08rem;
      line-height: 1.8;
    }

    .about-split img {
      width: 100%;
      max-width: 460px;
      border-radius: 20px;
      box-shadow: 0 8px 35px rgba(0, 0, 0, 0.15);
      filter: brightness(0.96) contrast(1.02);
      mix-blend-mode: multiply;
      transition: all 0.4s ease;
    }

    .about-split img:hover {
      transform: scale(1.02);
      filter: brightness(1.03);
    }

    .about-split strong,
    .about-split em {
      color: #F4D44C;
    }

    /* =================  RESPONSIVE DESIGN  ================= */

    /* --- Tablet --- */
    @media (max-width: 991px) {
      .about-intro {
        padding: 3.5rem 5%;
      }

      .about-intro h2 {
        font-size: 32px;
      }

      .about-split {
        grid-template-columns: 1fr;
        text-align: center;
      }

      .about-split p {
        font-size: 1rem;
      }

      .about-split img {
        margin: 0 auto;
        max-width: 380px;
      }
    }

    /* --- Mobile Large & Medium --- */
    @media (max-width: 768px) {
      .about-intro {
        padding: 3rem 4%;
      }

      .about-intro h2 {
        font-size: 28px;
      }

      .about-split {
        gap: 2rem;
      }

      .about-split p {
        font-size: 0.95rem;
        line-height: 1.7;
      }

      .about-split img {
        max-width: 330px;
      }
    }

    /* --- Mobile Small (Phones) --- */
    @media (max-width: 480px) {

      .about-intro {
        padding: 2.5rem 4%;
      }

      .about-intro h2 {
        font-size: 24px;
      }

      .about-split p {
        font-size: 0.9rem;
        line-height: 1.6;
        text-align: left;
      }

      .about-split {
        gap: 1.8rem;
      }

      .about-split img {
        max-width: 100%;
        height: auto;
      }
    }
  </style>



</head>

<body>




  <!-- =================== WHO WE ARE =================== -->
  <section class="about-intro animate-fadeInUp">
    <div class="container">
      <h2 class="features-title">Meet WashNova</h2>
      <div class="about-split">
        <div class="text">
          <p>
            WashNova is Surat’s most trusted name for <strong style="color: brown;">premium laundry and dry cleaning</strong>.
            We bring together innovation, precision, and care to ensure your clothes are as elegant as you.
            Each fabric receives individualized treatment using <em style="color: brown;">eco-friendly detergents</em> and
            <strong style="color: brown;">German-grade equipment</strong> — ensuring cleanliness without compromise.
          </p>
          <p>
            Founded with the goal of redefining convenience, WashNova offers <strong style="color: brown;">doorstep pickup</strong>,
            <strong style="color: brown;">express delivery</strong>, and <strong style="color: brown;">custom garment care</strong>.
            From wedding wear to everyday outfits — we make laundry effortless.
          </p>
        </div>
        <div class="photo">
          <img src="./assets/imges/img/washnova_shop.png" alt="Professional Laundry Service" style="height:400px;">
        </div>
      </div>
    </div>
  </section>

  <!-- =================== LEADERSHIP =================== -->


  <!-- =================== OUR PROMISE =================== -->


  <!-- =================== MISSION & VISION =================== -->



</body>

</html>