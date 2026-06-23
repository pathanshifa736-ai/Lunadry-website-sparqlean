<style>
  @import url('https://fonts.googleapis.com/css2?family=Exo:wght@400;600&display=swap');

  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Exo", sans-serif;
    font-weight: 400;
    font-style: normal;
  }

  .wrap {
    max-width: 1200px;
    margin: 0 auto;
    padding: 56px 20px;
  }

  .header {
    display: grid;
    grid-template-columns: 1.2fr .8fr;
    gap: 24px;
    align-items: center;
    margin-bottom: 22px;
  }

  @media (max-width: 860px) {
    .header {
      grid-template-columns: 1fr;
    }
  }

  .eyebrow {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    font-weight: 600;
    letter-spacing: .02em;
    color: var(--ink, #111317);
    margin-bottom: 8px;
  }

  .eyebrow::before {
    content: "";
    width: 18px;
    height: 2px;
    background: var(--gold, #F4D44C);
    border-radius: 2px;
  }

  h2 {
    margin: 0 0 10px;
    font-size: clamp(22px, 4.5vw, 32px);
    line-height: 1.15;
  }

  .sub {
    color: var(--muted, #6b7280);
    font-size: 15px;
    margin-bottom: 12px;
  }

  .hero-art img {
    width: 100%;
    max-width: 380px;
    height: auto;
  }

  .grid {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 16px;
    margin-top: 28px;
  }

  @media (max-width: 992px) {
    .grid {
      grid-template-columns: repeat(3, 1fr);
    }
  }

  @media (max-width: 640px) {
    .grid {
      grid-template-columns: repeat(2, 1fr);
    }
  }

  .card {
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

  .card:hover {
    transform: translateY(-6px) scale(1.04);
    box-shadow: 0 12px 30px rgba(244, 212, 76, 0.2), 0 0 20px rgba(75, 103, 248, 0.12);
    border-color: rgba(244, 212, 76, 0.4);
  }

  .logo {
    max-width: 200px;
    max-height: 90px;
    width: auto;
    height: auto;
    object-fit: contain;
  }
</style>

<section class="wrap">
  <div class="header">
    <div>
      <div class="eyebrow">Trusted by leading companies</div>
      <h2>Companies using WashNova for commercial laundry</h2>
      <p class="sub">At WashNova, we redefine laundry care for businesses by combining precision cleaning with eco-friendly technology. From hotels and restaurants to healthcare and corporate offices, our solutions ensure every uniform and linen reflects professionalism and trust.</p>
      <p class="sub">We specialize in handling high-volume commercial loads without compromising on quality. WashNova's advanced processes protect fabric integrity, extend garment life, and deliver a spotless finish that strengthens your brand image.</p>
      <p class="sub">Partnering with WashNova means more than just clean clothes — it’s about reliability, consistency, and a premium service experience. Our dedicated team ensures timely pickups, seamless delivery, and unmatched attention to detail for every client.</p>
      <p class="sub">With WashNova, companies gain a trusted partner who values sustainability and excellence. We help organizations maintain a polished, professional look while reducing environmental impact through modern, responsible laundry practices.</p>
    </div>
    <div class="hero-art" aria-hidden="true">
      <img src="assets/imges/img/bu.png" alt="Premium hanger illustration" />
    </div>
  </div>

  <div class="grid" aria-label="Client logo grid">
    <div class="card"><img class="logo" src="assets/logo/mari.jpg" alt="Marriott" /></div>
    <div class="card"><img class="logo" src="assets/logo/sales.jpg" alt="Salesforce" /></div>
    <div class="card"><img class="logo" src="assets/logo/blue.jpg" alt="Blue Bottle Coffee" /></div>
    <div class="card"><img class="logo" src="assets/logo/better.jpg" alt="BetterHelp" /></div>
    <div class="card"><img class="logo" src="assets/logo/grey.jpg" alt="GreyCorp" /></div>
    <div class="card"><img class="logo" src="assets/logo/vertias.jpg" alt="Veritas" /></div>
    <div class="card"><img class="logo" src="assets/logo/sec.jpg" alt="Securitas" /></div>
    <div class="card"><img class="logo" src="assets/logo/alo.jpg" alt="Alo Yoga" /></div>
  </div>
</section>
