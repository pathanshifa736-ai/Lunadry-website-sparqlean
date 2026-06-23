<?php require_once __DIR__ . '/includes/init.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WashNova</title>

    <!-- Favicon for browser address bar -->
    <link rel="icon" type="image/x-icon" href="assets/logo/second.png">

    <?php include('includes/link.php') ?>
    <style>
        /* BACKDROP */
        .offer-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.55);
            backdrop-filter: blur(2px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 999999;
            opacity: 0;
            animation: fadeIn 0.35s forwards ease-out;
        }

        /* MODAL CARD */
        .offer-card {
            width: 420px;
            background: #fff;
            border-radius: 22px;
            overflow: hidden;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.25);
            transform: translateY(40px);
            animation: slideUp 0.45s forwards ease-out;
        }

        /* HEADER IMAGE */
        .offer-card img {
            width: 100%;
            height: auto;
            display: block;
            object-fit: cover;
        }

        /* CLOSE BUTTON */
        .offer-close-btn {
            position: absolute;
            top: 14px;
            right: 14px;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(8px);
            border: none;
            cursor: pointer;
            font-size: 22px;
            color: #333;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.2s ease;
        }

        .offer-close-btn:hover {
            background: rgba(255, 255, 255, 1);
            transform: scale(1.08);
        }

        /* ANIMATIONS */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes slideUp {
            from {
                transform: translateY(40px);
                opacity: 0.6;
            }

            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
    </style>


</head>

<body id="home" class="body--with-announcement-banner body--relative preload-sticky page--home with-image no-touch background--image-dark">
    <?php include('includes/header.php') ?>
    <?php include('landing.php') ?>
    <?php include('includes/footer.php') ?>


    <!-- Blog Hover Zoom (Keeps UX Smooth) -->
    <script>
        document.querySelectorAll("#sparqlean-blogs img").forEach(img => {
            img.parentElement.addEventListener("mouseenter", () => img.style.transform = "scale(1.1)");
            img.parentElement.addEventListener("mouseleave", () => img.style.transform = "scale(1)");
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", async () => {
            try {
                const res = await fetch("app/get-offer.php");
                const offer = await res.json();
                if (!offer) return;

                let imgPath = "uploads/offers/" + offer.image;

                const backdrop = document.createElement("div");
                backdrop.classList.add("offer-backdrop");

                const modal = document.createElement("div");
                modal.classList.add("offer-card");
                modal.style.position = "relative";

                modal.innerHTML = `
            <button class="offer-close-btn">&times;</button>
            <img src="${imgPath}" alt="Offer">
        `;

                backdrop.appendChild(modal);
                document.body.appendChild(backdrop);

                document.querySelector(".offer-close-btn").onclick = () => {
                    backdrop.style.opacity = "0";
                    setTimeout(() => backdrop.remove(), 250);
                };

            } catch (error) {
                console.error("Offer modal error:", error);
            }
        });
    </script>

</body>

</html>