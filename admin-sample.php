<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Laundry Admin - Water Glass</title>

<style>
body {
    margin: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(to bottom, #4facfe, #00f2fe);
    overflow-x: hidden;
}

/* ================= BUBBLES ================= */

.bubbles {
    position: fixed;
    width: 100%;
    height: 100%;
    overflow: hidden;
    z-index: 0;
}

.bubbles span {
    position: absolute;
    bottom: -100px;
    width: 20px;
    height: 20px;
    background: rgba(255,255,255,0.3);
    border-radius: 50%;
    animation: rise 15s linear infinite;
}

@keyframes rise {
    0% {
        transform: translateY(0) scale(1);
        opacity: 0.6;
    }
    100% {
        transform: translateY(-110vh) scale(1.5);
        opacity: 0;
    }
}

/* Random positions */
.bubbles span:nth-child(1) { left: 10%; width:15px; height:15px; animation-duration: 12s;}
.bubbles span:nth-child(2) { left: 25%; width:25px; height:25px; animation-duration: 18s;}
.bubbles span:nth-child(3) { left: 40%; width:20px; height:20px; animation-duration: 15s;}
.bubbles span:nth-child(4) { left: 55%; width:30px; height:30px; animation-duration: 20s;}
.bubbles span:nth-child(5) { left: 70%; width:18px; height:18px; animation-duration: 14s;}
.bubbles span:nth-child(6) { left: 85%; width:22px; height:22px; animation-duration: 17s;}

/* ================= GLASS PANEL ================= */

.container {
    position: relative;
    z-index: 1;
    padding: 40px;
}

.section {
    margin-bottom: 30px;
    padding: 30px;
    border-radius: 20px;
    color: #000;
    background: rgba(255, 255, 255, 0.1);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    border: 1px solid rgba(255,255,255,0.3);
    box-shadow: 0 8px 32px rgba(0,0,0,0.2);
}

.card {
    margin-top: 15px;
    padding: 15px;
    border-radius: 12px;
    background: rgba(255,255,255,0.2);
    backdrop-filter: blur(15px);
}

h2 {
    margin-top: 0;
}

</style>
</head>

<body>

<!-- Bubbles Background -->
<div class="bubbles">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>

<!-- Glass Admin Content -->
<div class="container">

    <div class="section">
        <h2>💧 Laundry Dashboard</h2>
        <div class="card">Total Orders: 120</div>
        <div class="card">Pending Pickups: 15</div>
    </div>

    <div class="section">
        <h2>📊 Revenue</h2>
        <div class="card">Today: ₹8,500</div>
        <div class="card">This Month: ₹1,20,000</div>
    </div>

</div>

</body>
</html>