# SparQlean - Backend (local)

1. Copy files into your project.
2. Create database and import `database/schema.sql`.
3. Copy `.env.example` -> `.env` and adjust values.
4. Ensure PHP (7.4+) and MySQL are running (XAMPP).
5. Visit your site and submit booking form.
6. (Optional) Configure cron to run `php app/whatsapp_worker.php` every minute.

Notes:
- Keep `.env` private. Commit `.env.example` only.
- If reCAPTCHA and WhatsApp API are not configured, the code falls back safely.
