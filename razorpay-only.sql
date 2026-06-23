-- ============================================================
--  RAZORPAY ONLY — SQL Queries
--  Run these on your existing database.
--  Nothing else is touched.
-- ============================================================

-- ── 1. Add Razorpay columns to your existing payments table ──
ALTER TABLE `payments`
    ADD COLUMN IF NOT EXISTS `razorpay_order_id`      VARCHAR(60)   NULL COMMENT 'order_XXXXXXXXXXXXXXXX'  AFTER `transaction_id`,
    ADD COLUMN IF NOT EXISTS `razorpay_payment_id`    VARCHAR(60)   NULL COMMENT 'pay_XXXXXXXXXXXXXXXX'    AFTER `razorpay_order_id`,
    ADD COLUMN IF NOT EXISTS `razorpay_signature`     VARCHAR(256)  NULL COMMENT 'HMAC-SHA256 signature'   AFTER `razorpay_payment_id`,
    ADD COLUMN IF NOT EXISTS `razorpay_method`        VARCHAR(30)   NULL COMMENT 'upi/card/netbanking/wallet' AFTER `razorpay_signature`,
    ADD COLUMN IF NOT EXISTS `razorpay_vpa`           VARCHAR(80)   NULL COMMENT 'UPI ID e.g. user@okicici' AFTER `razorpay_method`,
    ADD COLUMN IF NOT EXISTS `razorpay_bank`          VARCHAR(60)   NULL COMMENT 'Bank code for netbanking' AFTER `razorpay_vpa`,
    ADD COLUMN IF NOT EXISTS `razorpay_wallet`        VARCHAR(30)   NULL COMMENT 'Wallet name if method=wallet' AFTER `razorpay_bank`,
    ADD COLUMN IF NOT EXISTS `razorpay_international` TINYINT(1)    NOT NULL DEFAULT 0 AFTER `razorpay_wallet`,
    ADD COLUMN IF NOT EXISTS `webhook_received`       TINYINT(1)    NOT NULL DEFAULT 0 AFTER `razorpay_international`,
    ADD COLUMN IF NOT EXISTS `webhook_event`          VARCHAR(50)   NULL               AFTER `webhook_received`,
    ADD COLUMN IF NOT EXISTS `webhook_at`             DATETIME      NULL               AFTER `webhook_event`,
    ADD COLUMN IF NOT EXISTS `refund_id`              VARCHAR(80)   NULL COMMENT 'rfnd_XXXXXXXXXXXXXXXX' AFTER `webhook_at`,
    ADD COLUMN IF NOT EXISTS `refund_amount`          DECIMAL(10,2) NULL               AFTER `refund_id`,
    ADD COLUMN IF NOT EXISTS `refund_status`          VARCHAR(20)   NULL               AFTER `refund_amount`,
    ADD COLUMN IF NOT EXISTS `refund_at`              DATETIME      NULL               AFTER `refund_status`;

-- ── 2. Add indexes for fast lookups ──────────────────────────
ALTER TABLE `payments`
    ADD INDEX IF NOT EXISTS `idx_razorpay_order_id`   (`razorpay_order_id`),
    ADD INDEX IF NOT EXISTS `idx_razorpay_payment_id` (`razorpay_payment_id`),
    ADD INDEX IF NOT EXISTS `idx_webhook_received`    (`webhook_received`);

-- ── 3. Expand payment_method ENUM on payments table ──────────
ALTER TABLE `payments`
    MODIFY COLUMN `payment_method`
        ENUM('cod','razorpay','upi','card','netbanking','wallet','cash','online')
        NOT NULL DEFAULT 'cod';

-- ── 4. Expand payment_method ENUM on orders table ────────────
ALTER TABLE `orders`
    MODIFY COLUMN `payment_method`
        ENUM('cod','razorpay','upi','card','netbanking','wallet','cash','online')
        NOT NULL DEFAULT 'cod';

-- ── 5. Razorpay Orders Log ───────────────────────────────────
--  Stores every Razorpay order created before payment opens
CREATE TABLE IF NOT EXISTS `razorpay_orders` (
    `id`            INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user_id`       INT UNSIGNED NOT NULL,
    `app_order_id`  INT UNSIGNED     NULL COMMENT 'orders.id — NULL until order placed',
    `rzp_order_id`  VARCHAR(60)  NOT NULL COMMENT 'order_XXXXXXXXXXXXXXXX from Razorpay',
    `amount_paise`  INT UNSIGNED NOT NULL COMMENT 'Amount in paise (multiply INR × 100)',
    `currency`      CHAR(3)      NOT NULL DEFAULT 'INR',
    `receipt`       VARCHAR(60)      NULL,
    `status`        VARCHAR(20)  NOT NULL DEFAULT 'created'
                        COMMENT 'created / attempted / paid / failed',
    `attempts`      INT          NOT NULL DEFAULT 0,
    `rzp_response`  JSON             NULL COMMENT 'Full JSON response from Razorpay API',
    `created_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at`    TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `uq_rzp_order_id`  (`rzp_order_id`),
    KEY `idx_user_id`             (`user_id`),
    KEY `idx_app_order_id`        (`app_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── 6. Razorpay Webhook Log ──────────────────────────────────
--  Every webhook event from Razorpay stored here (raw)
CREATE TABLE IF NOT EXISTS `razorpay_webhook_log` (
    `id`          INT UNSIGNED  NOT NULL AUTO_INCREMENT,
    `event`       VARCHAR(50)   NOT NULL COMMENT 'e.g. payment.captured',
    `payment_id`  VARCHAR(60)       NULL COMMENT 'pay_XXXXXXXXXXXXXXXX',
    `order_id`    VARCHAR(60)       NULL COMMENT 'order_XXXXXXXXXXXXXXXX',
    `amount`      DECIMAL(10,2)     NULL,
    `status`      VARCHAR(20)       NULL,
    `raw_payload` MEDIUMTEXT        NULL COMMENT 'Full JSON body from Razorpay',
    `processed`   TINYINT(1)    NOT NULL DEFAULT 0,
    `received_at` TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    KEY `idx_event`      (`event`),
    KEY `idx_payment_id` (`payment_id`),
    KEY `idx_order_id`   (`order_id`),
    KEY `idx_processed`  (`processed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ── DONE ✅ ──────────────────────────────────────────────────
