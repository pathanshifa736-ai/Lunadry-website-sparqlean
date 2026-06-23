-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2026 at 11:53 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sparqlean_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_role` varchar(30) DEFAULT NULL,
  `module` varchar(100) NOT NULL,
  `action` enum('create','read','update','delete','login','logout','export','import') NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(50) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `old_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_data`)),
  `new_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_data`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_id`, `user_name`, `user_role`, `module`, `action`, `details`, `ip_address`, `user_agent`, `old_data`, `new_data`, `created_at`) VALUES
(1, 26, 'Mahi patel', 'customer', 'Authentication', 'login', 'User logged in: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-22 23:11:44'),
(2, 26, 'Mahi patel', 'customer', 'Authentication', 'login', 'User logged in: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 03:49:45'),
(3, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-03-23 03:50:47'),
(4, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 03:50:48'),
(5, 19, 'Nitu patel', 'admin', 'Authentication', 'login', 'User logged in: nitu@gmail.com (Role: admin)', '::1', NULL, NULL, NULL, '2026-03-23 03:52:00'),
(6, 19, 'Nitu patel', 'admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 03:52:01'),
(7, 20, 'Raj', 'delivery_boy', 'Authentication', 'login', 'User logged in: raj@gmail.com (Role: delivery_boy)', '::1', NULL, NULL, NULL, '2026-03-23 03:52:38'),
(8, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 03:53:05'),
(9, 20, 'Raj', 'delivery_boy', 'Authentication', 'login', 'User logged in: raj@gmail.com (Role: delivery_boy)', '::1', NULL, NULL, NULL, '2026-03-23 03:53:54'),
(10, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 03:56:34'),
(11, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-1133FBB0 status: pending → cancelled (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-03-23 03:56:48'),
(12, 19, 'Nitu patel', 'admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 03:58:04'),
(13, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 03:58:06'),
(14, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-EEE38EE5 status: pending → confirmed (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 03:58:49'),
(15, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 03:59:17'),
(16, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-EEE38EE5 status: confirmed → pickup_scheduled (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 03:59:26'),
(17, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 03:59:50'),
(18, 19, 'Nitu patel', 'admin', 'Delivery', 'create', 'Assigned boy #20 to order #32 for pickup', '::1', NULL, NULL, NULL, '2026-03-23 04:00:14'),
(19, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:01:37'),
(20, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:01:40'),
(21, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:01:41'),
(22, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:01:42'),
(23, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:01:47'),
(24, 26, 'Mahi patel', 'customer', 'Authentication', 'logout', 'User logged out: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 04:02:59'),
(29, 30, 'nhvhg', 'customer', 'Authentication', 'login', 'User logged in: chauhan.mahekben.d2023@tmtbcasurat.org (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 04:06:31'),
(30, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:08:48'),
(31, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: pending → confirmed (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:08:55'),
(32, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: confirmed → pickup_scheduled (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:10:44'),
(33, 19, 'Nitu patel', 'admin', 'Delivery', 'create', 'Assigned boy #20 to order #40 for pickup', '::1', NULL, NULL, NULL, '2026-03-23 04:10:57'),
(34, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:12:03'),
(35, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:12:06'),
(36, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: picked_up → in_process (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:12:22'),
(37, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: in_process → washing (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:12:27'),
(38, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: washing → ironing (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:12:34'),
(39, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: ironing → quality_check (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:12:39'),
(40, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-13E1D8EC status: quality_check → ready_for_delivery (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 04:12:45'),
(41, 19, 'Nitu patel', 'admin', 'Delivery', 'create', 'Assigned boy #20 to order #40 for delivery', '::1', NULL, NULL, NULL, '2026-03-23 04:12:56'),
(42, 19, 'Nitu patel', 'admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 04:15:59'),
(43, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:23:47'),
(44, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 04:23:52'),
(45, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 04:25:37'),
(46, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 04:26:06'),
(47, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 04:26:58'),
(48, 30, 'nhvhg', 'customer', 'Authentication', 'logout', 'User logged out: chauhan.mahekben.d2023@tmtbcasurat.org (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 04:33:36'),
(49, 19, 'Nitu patel', 'admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 04:33:48'),
(50, 1, 'Super Admin', 'super_admin', 'Authentication', 'logout', 'User logged out: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-03-23 04:33:57'),
(51, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-03-23 04:38:02'),
(52, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 04:38:03'),
(53, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 04:38:08'),
(54, 1, 'Super Admin', 'super_admin', 'Authentication', 'logout', 'User logged out: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-03-23 04:39:44'),
(56, 31, 'sohil pathan', 'customer', 'Authentication', 'login', 'User logged in: sohil@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 05:12:18'),
(57, 31, 'sohil pathan', 'customer', 'Authentication', 'logout', 'User logged out: sohil@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 05:13:57'),
(58, 19, 'Nitu patel', 'admin', 'Authentication', 'login', 'User logged in: nitu@gmail.com (Role: admin)', '::1', NULL, NULL, NULL, '2026-03-23 05:14:58'),
(59, 19, 'Nitu patel', 'admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 05:14:59'),
(60, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:15:10'),
(61, 19, 'Nitu patel', 'admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 05:15:26'),
(62, 19, 'Nitu patel', 'admin', 'Authentication', 'logout', 'User logged out: nitu@gmail.com (Role: admin)', '::1', NULL, NULL, NULL, '2026-03-23 05:17:01'),
(66, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-03-23 05:18:13'),
(67, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 05:18:14'),
(68, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:18:20'),
(69, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 05:18:54'),
(70, 1, 'Super Admin', 'super_admin', 'Customers', 'read', 'Viewed customers list', '::1', NULL, NULL, NULL, '2026-03-23 05:24:32'),
(71, 31, 'sohil pathan', 'customer', 'Authentication', 'login', 'User logged in: sohil@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-03-23 05:25:33'),
(72, 19, 'Nitu patel', 'admin', 'Authentication', 'login', 'User logged in: nitu@gmail.com (Role: admin)', '::1', NULL, NULL, NULL, '2026-03-23 05:28:46'),
(73, 19, 'Nitu patel', 'admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-03-23 05:28:47'),
(74, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:28:54'),
(75, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-2B6A5ED8 status: pending → confirmed (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 05:29:01'),
(76, 19, 'Nitu patel', 'admin', 'Order', 'update', 'Order SPQ-2B6A5ED8 status: confirmed → pickup_scheduled (Admin: Nitu patel)', '::1', NULL, NULL, NULL, '2026-03-23 05:29:27'),
(77, 1, 'Super Admin', 'super_admin', 'Delivery', 'create', 'Assigned boy #20 to order #41 for pickup', '::1', NULL, NULL, NULL, '2026-03-23 05:29:55'),
(78, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:30:43'),
(79, 19, 'Nitu patel', 'admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:31:23'),
(80, 20, 'Raj', 'delivery_boy', 'Authentication', 'login', 'User logged in: raj@gmail.com (Role: delivery_boy)', '::1', NULL, NULL, NULL, '2026-03-23 05:32:06'),
(81, 1, 'Super Admin', 'super_admin', 'Order', 'read', 'Viewed order: SPQ-13E1D8EC', '::1', NULL, NULL, NULL, '2026-03-23 05:37:14'),
(82, 1, 'Super Admin', 'super_admin', 'Invoice', '', 'Invoice shared for order SPQ-13E1D8EC', '::1', NULL, NULL, NULL, '2026-03-23 05:37:37'),
(83, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-03-23 05:37:47'),
(84, 1, 'Super Admin', 'super_admin', 'Order', 'read', 'Viewed order: SPQ-13E1D8EC', '::1', NULL, NULL, NULL, '2026-03-23 05:37:50'),
(85, 1, 'Super Admin', 'super_admin', 'Invoice', 'update', 'Invoice emailed to chauhan.mahekben.d2023@tmtbcasurat.org for Order #SPQ-13E1D8EC', '::1', NULL, NULL, NULL, '2026-03-23 05:38:01'),
(86, 26, 'Mahi patel', 'customer', 'Authentication', 'login', 'User logged in: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-04-01 02:35:27'),
(87, 26, 'Mahi patel', 'customer', 'Authentication', 'logout', 'User logged out: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-04-01 03:13:04'),
(88, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-04-01 03:14:12'),
(89, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-04-01 03:14:13'),
(90, 26, 'Mahi patel', 'customer', 'Authentication', 'login', 'User logged in: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-04-01 08:29:12'),
(91, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:31:02'),
(92, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-04-01 08:31:03'),
(93, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-01 08:31:06'),
(94, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: pending → confirmed (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:31:19'),
(95, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: confirmed → pickup_scheduled (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:31:24'),
(96, 1, 'Super Admin', 'super_admin', 'Delivery', 'create', 'Assigned boy #20 to order #42 for pickup', '::1', NULL, NULL, NULL, '2026-04-01 08:31:44'),
(97, 20, 'Raj', 'delivery_boy', 'Authentication', 'login', 'User logged in: raj@gmail.com (Role: delivery_boy)', '::1', NULL, NULL, NULL, '2026-04-01 08:32:51'),
(98, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-01 08:33:27'),
(99, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: picked_up → in_process (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:33:32'),
(100, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: in_process → washing (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:33:37'),
(101, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: washing → ironing (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:33:43'),
(102, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: ironing → quality_check (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:33:50'),
(103, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-BDFAEA6E status: quality_check → ready_for_delivery (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:33:57'),
(104, 1, 'Super Admin', 'super_admin', 'Delivery', 'create', 'Assigned boy #20 to order #42 for delivery', '::1', NULL, NULL, NULL, '2026-04-01 08:34:06'),
(105, 26, 'Mahi patel', 'customer', 'Authentication', 'logout', 'User logged out: mahi@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-04-01 08:46:05'),
(106, 31, 'sohil pathan', 'customer', 'Authentication', 'login', 'User logged in: sohil@gmail.com (Role: customer)', '::1', NULL, NULL, NULL, '2026-04-01 08:46:19'),
(107, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-01 08:46:57'),
(108, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-CDC3A474 status: pending → confirmed (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:47:02'),
(109, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-CDC3A474 status: confirmed → pickup_scheduled (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 08:47:24'),
(110, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-01 09:09:01'),
(111, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-0C5B9A30 status: pending → confirmed (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 09:09:08'),
(112, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-0C5B9A30 status: confirmed → pickup_scheduled (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-01 09:09:35'),
(113, 1, 'Super Admin', 'super_admin', 'Authentication', 'login', 'User logged in: pathanshifa736@gmail.com (Role: super_admin)', '::1', NULL, NULL, NULL, '2026-04-02 14:47:15'),
(114, 1, 'Super Admin', 'super_admin', 'Dashboard', 'read', 'Viewed admin dashboard', '::1', NULL, NULL, NULL, '2026-04-02 14:47:16'),
(115, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:47:19'),
(116, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:47:24'),
(117, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:47:26'),
(118, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-0C5B9A30 status: pickup_scheduled → cancelled (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-02 14:47:33'),
(119, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:49:59'),
(120, 1, 'Super Admin', 'super_admin', 'Delivery', 'create', 'Assigned boy #20 to order #43 for pickup', '::1', NULL, NULL, NULL, '2026-04-02 14:50:14'),
(121, 20, 'Raj', 'delivery_boy', 'Authentication', 'login', 'User logged in: raj@gmail.com (Role: delivery_boy)', '::1', NULL, NULL, NULL, '2026-04-02 14:51:23'),
(122, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:52:00'),
(123, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-CDC3A474 status: picked_up → in_process (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-02 14:52:11'),
(124, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 14:59:16'),
(125, 1, 'Super Admin', 'super_admin', 'Order', 'update', 'Order SPQ-CDC3A474 status: in_process → washing (Admin: Super Admin)', '::1', NULL, NULL, NULL, '2026-04-02 14:59:25'),
(126, 1, 'Super Admin', 'super_admin', 'Orders', 'read', 'Viewed orders list', '::1', NULL, NULL, NULL, '2026-04-02 15:01:08');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(300) NOT NULL,
  `slug` varchar(300) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `content` longtext NOT NULL,
  `featured_image` varchar(255) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `author_id` int(11) DEFAULT NULL,
  `author_name` varchar(100) DEFAULT NULL,
  `read_time` int(11) DEFAULT 5,
  `views` int(11) DEFAULT 0,
  `status` enum('draft','published','archived') DEFAULT 'draft',
  `published_at` datetime DEFAULT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `slug`, `excerpt`, `content`, `featured_image`, `category`, `tags`, `author_id`, `author_name`, `read_time`, `views`, `status`, `published_at`, `scheduled_at`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(9, 'Sohillan', 'sohillan', 'afdnfms sd gf', 'd gd gdg gdf dgsvfd gsdg g fggvdgvdavfvgg gdfgxsdgs esg sd sdf', 'uploads/blog/blog_1773315418_41767881.png', 'Laundry Tips', NULL, 1, 'Super Admin', 10, 2, 'published', NULL, NULL, '2026-03-12 11:36:58', '2026-03-18 09:53:02', 1, '2026-03-18 15:23:02'),
(10, 'Fast Laundry System for Busy People', 'quick-laundry-system-for-busy-people', 'A simple laundry routine for people with a busy schedule.', 'Managing laundry doesn’t have to be stressful. With a quick system, you can stay on top of it easily. Wash small loads 2–3 times a week instead of piling everything up. Sort clothes immediately after use and keep separate baskets for colors and whites.\r\n\r\nSet a fixed time for laundry and stick to it. Dry and fold clothes right away to avoid clutter. This simple routine saves time and keeps your home organized.', 'uploads/blog/blog_1773983790_8b398b1f.jpg', 'Tips', NULL, 1, 'Super Admin', 5, 2, 'published', NULL, NULL, '2026-03-20 05:16:30', '2026-03-23 05:09:24', 0, NULL),
(11, 'Minimal Laundry System That Actually Works', 'minimal-laundry-system-that-actually-works', 'Simplify your laundry routine with a minimal approach.', 'A minimal laundry system focuses on doing less but smarter. Keep fewer clothes, wash regularly, and avoid overloading machines. Use one good detergent for most clothes and skip unnecessary products.\r\n\r\nBy reducing choices and steps, laundry becomes faster and easier to manage.', 'uploads/blog/blog_1773983993_ff21aa37.jpg', 'Lifestyle', NULL, 19, 'Nitu patel', 5, 0, 'published', NULL, NULL, '2026-03-20 05:19:53', '2026-03-20 05:19:53', 0, NULL),
(12, 'Benefits of Steam Wash for Your Clothes', 'benefits-of-steam-wash-for-your-clothes', 'Steam wash is an advanced cleaning method that removes tough stains, kills bacteria, and keeps clothes fresh while being gentle on fabrics.', 'Steam wash is a modern laundry technique that uses high-temperature steam to deeply clean fabrics. Unlike traditional washing, steam penetrates fibers more effectively, helping to remove stubborn dirt, bacteria, and allergens.\r\n\r\nOne of the biggest advantages of steam wash is its ability to sanitize clothes without the need for harsh chemicals. This makes it an excellent choice for delicate garments and people with sensitive skin. Additionally, steam helps reduce wrinkles, making ironing easier and saving time.\r\n\r\nSteam washing also eliminates unpleasant odors, leaving clothes smelling fresh and hygienic. It is especially useful for items like bedding, baby clothes, and office wear that require extra cleanliness.\r\n\r\nOverall, steam wash is a safe, efficient, and eco-friendly solution for maintaining the quality and longevity of your clothes. Choosing steam wash ensures better hygiene and a premium laundry experience.', 'uploads/blog/blog_1774017109_cc5603d9.jpg', 'Guide', NULL, 1, 'Super Admin', 5, 0, 'published', NULL, NULL, '2026-03-20 14:31:49', '2026-03-20 14:31:49', 0, NULL),
(13, 'How Regular Laundry Services Save Your Time and Effort', 'how-regular-laundry-services-save-your-time-and-effort', 'Professional laundry services help you save time, reduce stress, and keep your clothes clean, fresh, and well-maintained.', 'In today’s busy lifestyle, managing daily chores like laundry can be time-consuming and stressful. Regular laundry services offer a convenient solution by taking care of washing, drying, and ironing your clothes efficiently.\r\n\r\nOne of the main benefits of using a professional laundry service is time-saving. Instead of spending hours sorting, washing, and folding clothes, you can focus on more important tasks or simply relax. This is especially helpful for working professionals and families.\r\n\r\nLaundry services also ensure better cleaning results. With the use of advanced machines and quality detergents, clothes are cleaned more effectively and handled with care. This helps maintain fabric quality and extends the life of your garments.\r\n\r\nAnother advantage is consistency. Your clothes are cleaned, dried, and delivered on time, every time. Many services also offer doorstep pickup and delivery, adding extra convenience.\r\n\r\nOverall, regular laundry services make life easier by saving time, providing professional care, and ensuring your clothes always look fresh and well-maintained.', 'uploads/blog/blog_1774017267_4b6f48e8.jpg', 'Tips', NULL, 1, 'Super Admin', 5, 4, 'published', NULL, NULL, '2026-03-20 14:34:27', '2026-04-01 10:27:30', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `business_inquiries`
--

CREATE TABLE `business_inquiries` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `business_name` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `phone` varchar(15) NOT NULL,
  `business_type` enum('franchise','partner','vendor','other') DEFAULT 'partner',
  `requirements` text DEFAULT NULL,
  `status` enum('new','contacted','approved','rejected','on_hold') DEFAULT 'new',
  `admin_notes` text DEFAULT NULL,
  `handled_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `business_inquiries`
--

INSERT INTO `business_inquiries` (`id`, `full_name`, `business_name`, `email`, `phone`, `business_type`, `requirements`, `status`, `admin_notes`, `handled_by`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(3, 'john patel', 'fresh launadry', 'john@gmail.com', '9678364525', 'other', 'this is the', 'new', NULL, NULL, '2026-03-19 23:24:07', '2026-03-19 23:24:07', 0, NULL),
(4, 'sonu khan', 'A one Hotel', 'sonu@gmail.com', '9845743621', '', 'abcd', 'approved', NULL, 1, '2026-03-19 23:24:57', '2026-03-20 14:50:20', 0, NULL),
(5, 'sohil pathan', 'microsoft', 'sohil@gmail.com', '9727225462', '', 'hhhhh', 'new', NULL, NULL, '2026-03-23 05:09:58', '2026-03-23 05:09:58', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pricing_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `is_express` tinyint(1) DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `special_instructions` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pricing_id`, `category_id`, `is_express`, `quantity`, `unit_price`, `total_price`, `special_instructions`, `created_at`, `updated_at`) VALUES
(47, 30, 60, 13, 0, 1, 250.00, 250.00, NULL, '2026-03-23 04:32:46', '2026-03-23 04:32:46');

-- --------------------------------------------------------

--
-- Table structure for table `category_items`
--

CREATE TABLE `category_items` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `display_order` int(11) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_items`
--

INSERT INTO `category_items` (`id`, `category_id`, `item_id`, `display_order`, `is_active`, `created_at`) VALUES
(6, 10, 26, 3, 1, '2026-03-02 10:39:39'),
(9, 18, 49, 0, 1, '2026-03-19 04:41:16'),
(10, 18, 50, 0, 1, '2026-03-19 04:43:35'),
(11, 18, 51, 0, 1, '2026-03-19 04:44:43'),
(12, 18, 52, 0, 1, '2026-03-19 04:46:17'),
(13, 18, 53, 0, 1, '2026-03-19 04:47:31'),
(15, 18, 55, 0, 1, '2026-03-19 04:57:08'),
(16, 17, 56, 0, 1, '2026-03-19 05:01:30'),
(18, 17, 58, 0, 1, '2026-03-19 05:05:34'),
(19, 17, 59, 0, 1, '2026-03-19 05:06:12'),
(20, 17, 60, 0, 1, '2026-03-19 05:07:46'),
(21, 17, 61, 0, 1, '2026-03-19 05:08:57'),
(22, 14, 62, 0, 1, '2026-03-19 05:12:43'),
(23, 14, 63, 0, 1, '2026-03-19 05:13:49'),
(24, 14, 64, 0, 1, '2026-03-19 05:15:40'),
(25, 14, 65, 0, 1, '2026-03-19 05:16:46'),
(26, 15, 66, 0, 1, '2026-03-19 23:04:01'),
(27, 15, 67, 0, 1, '2026-03-19 23:05:05'),
(28, 15, 68, 0, 1, '2026-03-19 23:06:56'),
(29, 15, 69, 0, 1, '2026-03-19 23:07:50'),
(30, 13, 70, 0, 1, '2026-03-19 23:47:42'),
(31, 13, 71, 0, 1, '2026-03-19 23:48:58'),
(32, 13, 72, 0, 1, '2026-03-19 23:50:08'),
(33, 13, 73, 0, 1, '2026-03-19 23:51:03'),
(34, 13, 74, 0, 1, '2026-03-19 23:52:38'),
(35, 13, 75, 0, 1, '2026-03-19 23:53:41'),
(36, 12, 76, 0, 1, '2026-03-20 22:35:49'),
(37, 12, 77, 0, 1, '2026-03-20 22:38:17'),
(38, 12, 78, 0, 1, '2026-03-20 22:38:50'),
(39, 12, 79, 0, 1, '2026-03-20 22:40:21'),
(41, 12, 82, 0, 1, '2026-03-20 22:44:06'),
(42, 12, 83, 0, 1, '2026-03-20 22:45:53'),
(43, 11, 84, 0, 1, '2026-03-20 23:00:43'),
(44, 11, 85, 0, 1, '2026-03-20 23:02:01'),
(45, 11, 86, 0, 1, '2026-03-20 23:03:10'),
(46, 11, 87, 0, 1, '2026-03-20 23:03:46'),
(47, 11, 88, 0, 1, '2026-03-20 23:05:06'),
(48, 19, 89, 0, 1, '2026-03-23 05:21:14');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `replied_by` int(11) DEFAULT NULL,
  `reply_message` text DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `phone`, `email`, `subject`, `message`, `is_read`, `replied_by`, `reply_message`, `replied_at`, `created_at`, `is_deleted`, `deleted_at`) VALUES
(15, 'Rajesh Mehta', '9876543210', 'rajesh.mehta@gmail.com', 'What is the price of pickup and delivery?', 'What is the price of pickup and delivery?', 1, NULL, 'Pickup and delivery is completely FREE for orders above ₹299. For orders below ₹299, a nominal delivery charge of ₹49 applies. Same-day express delivery charges may vary.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(16, 'Priya Sharma', '9512367840', 'priya.sharma@gmail.com', 'How do I schedule a pickup?', 'How do I schedule a pickup?', 1, NULL, 'You can schedule a pickup online at our booking portal, call us at +91 878-052-9628, or send us a WhatsApp message. We will confirm your slot within 2 hours.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(17, 'Amit Patel', '7845612390', 'amit.patel@gmail.com', 'What are your service areas in Surat?', 'What are your service areas in Surat?', 1, NULL, 'We currently serve Adajan, Vesu, Pal, and nearby areas in Surat. Contact us to check if we deliver to your location.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(18, 'Sneha Desai', '9632587410', 'sneha.desai@gmail.com', 'Do you offer same-day service?', 'Do you offer same-day service?', 1, NULL, 'Yes! We offer express same-day service for urgent orders. Additional charges apply. Contact us before 11 AM for same-day delivery.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(19, 'Kiran Joshi', '8745236190', 'kiran.joshi@gmail.com', 'Can I visit the store directly?', 'Can I visit the store directly?', 1, NULL, 'Absolutely! Our store is open Mon-Sat, 9 AM - 8 PM. Visit us at G4 Fortune, High Street, Adajan. Walk-ins welcome, no appointment needed.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(20, 'Deepak Verma', '9123456780', 'deepak.verma@gmail.com', 'What payment methods do you accept?', 'What payment methods do you accept?', 1, NULL, 'We accept cash, UPI, credit/debit cards, and online payments. You can pay at pickup, delivery, or through our online portal.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(21, 'Pooja Nair', '8956123470', 'pooja.nair@gmail.com', 'How can I track my order?', 'How can I track my order?', 1, NULL, 'Once your order is confirmed, we will send you a tracking link via SMS and WhatsApp. You can also call us for real-time updates.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(22, 'Vikas Gupta', '7412589630', 'vikas.gupta@gmail.com', 'How long does dry cleaning take?', 'How long does dry cleaning take?', 1, NULL, 'Standard dry cleaning takes 48 to 72 hours. Express service is available within 24 hours for an additional charge. We will notify you as soon as your order is ready.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(23, 'Anjali Singh', '9874123650', 'anjali.singh@gmail.com', 'Do you clean curtains and heavy items?', 'Do you clean curtains and heavy items?', 1, NULL, 'Yes! We specialize in cleaning curtains, blankets, duvets, sofa covers, and all heavy household items. Special pricing applies based on size and weight.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(24, 'Mohit Shah', '8521479630', 'mohit.shah@gmail.com', 'Is my clothing safe with WashNova?', 'Is my clothing safe with WashNova?', 1, NULL, 'Absolutely. We handle every garment with care using premium international-grade cleaning solutions. Each item is inspected before and after cleaning to ensure quality.', '2026-04-01 08:51:19', '2026-04-01 03:21:19', 0, NULL),
(25, 'niti mohan', '7896352645', 'niti@gmail.com', 'complaint', 'Delivery was late and cleaning quality was not satisfactory. Please resolve this issue', 1, 1, 'Thank you for your feedback. We apologize for the inconvenience caused due to the delay and cleaning quality. Your concern has been noted, and we are working to improve our service. We appreciate your patience and support.', '2026-04-01 14:09:54', '2026-04-01 08:39:08', 0, NULL),
(26, 'siya patel', '9081094688', 'siya@gmail.com', 'feedback', '“The service was good, but delivery took a bit longer than expected. Please try to improve the timing', 1, 1, 'Thank you for your feedback. We’re glad you liked the service. We will work on improving our delivery time for a better experience.”', '2026-04-01 14:11:33', '2026-04-01 08:41:04', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `coupon_code` varchar(30) NOT NULL,
  `discount_type` enum('percentage','flat') NOT NULL DEFAULT 'percentage',
  `discount_value` decimal(8,2) NOT NULL,
  `max_discount` decimal(8,2) DEFAULT NULL,
  `min_order` decimal(8,2) NOT NULL DEFAULT 0.00,
  `usage_limit` int(11) DEFAULT NULL COMMENT 'NULL = unlimited',
  `used_count` int(11) NOT NULL DEFAULT 0,
  `valid_from` date DEFAULT NULL,
  `valid_to` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_code`, `discount_type`, `discount_value`, `max_discount`, `min_order`, `usage_limit`, `used_count`, `valid_from`, `valid_to`, `is_active`, `created_at`) VALUES
(1, '20', 'percentage', 20.00, 100.00, 100.00, 50, 1, '2026-03-17', '2026-03-31', 1, '2026-03-17 14:08:18'),
(2, 'SUMMER20', 'percentage', 20.00, 200.00, 100.00, 2, 0, '2026-03-20', '2026-03-22', 1, '2026-03-20 14:48:19'),
(3, 'SUMMER_OFFER', 'percentage', 20.00, 200.00, 50.00, 1, 0, '2026-03-23', '2026-03-27', 1, '2026-03-22 23:11:11');

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `note_type` enum('general','complaint','preference','important','follow_up') DEFAULT 'general',
  `note` text NOT NULL,
  `added_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `delivery_assignments`
--

CREATE TABLE `delivery_assignments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `assignment_type` enum('pickup','delivery') NOT NULL,
  `status` enum('assigned','accepted','in_transit','completed','failed','reassigned') DEFAULT 'assigned',
  `proof_image` varchar(255) DEFAULT NULL,
  `customer_signature` varchar(255) DEFAULT NULL,
  `otp_verified` tinyint(1) DEFAULT 0,
  `pickup_lat` decimal(10,8) DEFAULT NULL,
  `pickup_lng` decimal(11,8) DEFAULT NULL,
  `delivery_lat` decimal(10,8) DEFAULT NULL,
  `delivery_lng` decimal(11,8) DEFAULT NULL,
  `assigned_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepted_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `admin_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_assignments`
--

INSERT INTO `delivery_assignments` (`id`, `order_id`, `delivery_boy_id`, `assignment_type`, `status`, `proof_image`, `customer_signature`, `otp_verified`, `pickup_lat`, `pickup_lng`, `delivery_lat`, `delivery_lng`, `assigned_at`, `accepted_at`, `started_at`, `completed_at`, `notes`, `admin_notes`) VALUES
(29, 29, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-19 22:54:14', NULL, NULL, '2026-03-20 04:27:35', NULL, NULL),
(30, 29, 20, 'delivery', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-19 23:31:17', NULL, NULL, '2026-03-20 09:30:40', NULL, NULL),
(32, 31, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-20 05:02:59', '2026-03-20 10:34:17', '2026-03-20 10:34:36', '2026-03-20 10:34:42', NULL, NULL),
(33, 31, 20, 'delivery', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-20 05:07:54', NULL, NULL, '2026-03-20 10:39:00', NULL, NULL),
(34, 36, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-22 20:36:46', NULL, NULL, '2026-03-23 02:07:39', NULL, NULL),
(36, 32, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-23 04:00:14', NULL, NULL, '2026-03-23 09:31:12', NULL, NULL),
(37, 40, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-23 04:10:57', NULL, NULL, '2026-03-23 09:41:25', NULL, NULL),
(38, 40, 20, 'delivery', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-23 04:12:56', NULL, NULL, '2026-03-23 09:43:20', NULL, NULL),
(39, 41, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-03-23 05:29:55', NULL, NULL, '2026-03-23 11:02:32', NULL, NULL),
(40, 42, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-04-01 08:31:44', NULL, NULL, '2026-04-01 14:03:12', NULL, NULL),
(41, 42, 20, 'delivery', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-04-01 08:34:06', NULL, NULL, '2026-04-01 14:04:26', NULL, NULL),
(42, 43, 20, 'pickup', 'completed', NULL, NULL, 0, NULL, NULL, NULL, NULL, '2026-04-02 14:50:14', NULL, NULL, '2026-04-02 20:21:45', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `delivery_earnings`
--

CREATE TABLE `delivery_earnings` (
  `id` int(11) NOT NULL,
  `delivery_boy_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `earning_type` enum('pickup','delivery','bonus','penalty') NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid','held') DEFAULT 'pending',
  `paid_date` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `delivery_earnings`
--

INSERT INTO `delivery_earnings` (`id`, `delivery_boy_id`, `order_id`, `assignment_id`, `earning_type`, `amount`, `status`, `paid_date`, `created_at`) VALUES
(12, 20, 29, 30, 'delivery', 147.00, 'pending', NULL, '2026-03-20 04:00:40'),
(13, 20, 31, 32, 'pickup', 30.00, 'pending', NULL, '2026-03-20 05:04:42'),
(14, 20, 31, 33, 'delivery', 41.75, 'pending', NULL, '2026-03-20 05:09:00'),
(15, 20, 40, 38, 'delivery', 42.00, 'pending', NULL, '2026-03-23 04:13:20'),
(16, 20, 42, 41, 'delivery', 168.00, 'pending', NULL, '2026-04-01 08:34:26');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `delivery_boy_id` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `message` text DEFAULT NULL,
  `feedback_type` enum('service','delivery','app','general') DEFAULT 'service',
  `admin_reply` text DEFAULT NULL,
  `replied_by` int(11) DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL,
  `status` enum('pending','reviewed','resolved') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feedback`
--

INSERT INTO `feedback` (`id`, `user_id`, `order_id`, `delivery_boy_id`, `rating`, `message`, `feedback_type`, `admin_reply`, `replied_by`, `replied_at`, `status`, `created_at`) VALUES
(7, 26, 31, 20, 5, 'The service quality was excellent, with prompt response and professional handling of the request. Overall, the experience was smooth and satisfying, meeting expectations effectively.', 'service', 'Thank you for your valuable feedback! We’re glad to hear that you had a smooth and satisfying experience with our service.Your appreciation motivates us to continue delivering high-quality service, and we look forward to serving you again soon.', 1, '2026-03-20 19:57:21', 'resolved', '2026-03-20 14:26:10'),
(8, 26, 31, 20, 5, 'Delivery rating', 'delivery', NULL, NULL, NULL, 'pending', '2026-03-20 14:26:10'),
(12, 26, 29, 29, 5, 'The Best Service Of Washnova .', 'service', NULL, NULL, NULL, 'reviewed', '2026-04-01 02:42:49'),
(13, 26, 31, 31, 5, 'Best Experince for me to use washnova service.', 'delivery', NULL, NULL, NULL, 'reviewed', '2026-04-01 02:42:49'),
(14, 31, 41, 29, 5, 'shoe cleaning service is the best dervices of washnova', 'general', 'ok i will resolve my service', 1, '2026-04-01 14:13:40', 'resolved', '2026-04-01 02:42:49'),
(15, 26, 42, 20, 5, 'Overall, my experience with Washnova Laundry Service was good. The pickup and delivery were timely, and the clothes were cleaned properly with good care. The staff was polite and responsive.', 'general', 'THANK YOU', 1, '2026-04-01 14:07:12', 'resolved', '2026-04-01 08:35:53'),
(16, 26, 42, 20, 5, 'Delivery rating', 'delivery', NULL, NULL, NULL, 'pending', '2026-04-01 08:35:53');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `invoice_number` varchar(50) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `customer_phone` varchar(15) DEFAULT NULL,
  `customer_address` text DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `discount` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL,
  `payment_status` enum('paid','unpaid','partial') DEFAULT 'unpaid',
  `payment_mode` varchar(50) DEFAULT NULL,
  `invoice_type` enum('customer','admin','offline') DEFAULT 'customer',
  `generated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `invoice_number`, `order_id`, `user_id`, `customer_name`, `customer_phone`, `customer_address`, `subtotal`, `discount`, `tax_amount`, `total_amount`, `payment_status`, `payment_mode`, `invoice_type`, `generated_at`, `is_deleted`, `deleted_at`) VALUES
(14, 'INV-20260320-20644D', 29, 26, 'Mahi patel', '9934567890', NULL, 1400.00, 0.00, 70.00, 1470.00, 'paid', 'cod', 'customer', '2026-03-20 04:00:40', 0, NULL),
(16, 'INV-20260320-D1D71D', 31, 26, 'Mahi patel', '9934567890', NULL, 350.00, 0.00, 17.50, 417.50, 'paid', 'cod', 'customer', '2026-03-20 05:09:00', 0, NULL),
(17, 'INV-20260323-D901FD', 40, 30, 'Mahek', '7016131729', NULL, 500.00, 100.00, 20.00, 420.00, 'paid', 'cod', 'customer', '2026-03-23 04:13:20', 0, NULL),
(18, 'INV-20260401-95170B', 42, 26, 'Mahi patel', '9979491075', NULL, 1600.00, 0.00, 80.00, 1680.00, 'paid', 'cod', 'customer', '2026-04-01 08:34:26', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `type` enum('order','payment','delivery','offer','system','reminder') NOT NULL,
  `reference_id` int(11) DEFAULT NULL,
  `reference_type` varchar(50) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `read_at` datetime DEFAULT NULL,
  `sent_via` enum('app','sms','email','push','whatsapp') DEFAULT 'app',
  `sent_status` enum('pending','sent','failed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `title`, `message`, `type`, `reference_id`, `reference_type`, `is_read`, `read_at`, `sent_via`, `sent_status`, `created_at`, `is_deleted`) VALUES
(57, 20, 'New Pickup Assignment 🚚', 'Order SPQ-53244C67 assigned to you for Pickup. Please accept it.', 'delivery', 23, 'order', 1, '2026-03-05 13:53:20', 'app', 'pending', '2026-03-02 11:05:26', 1),
(64, 20, 'New Delivery Assignment 🚚', 'Order SPQ-53244C67 assigned to you for Delivery. Please accept it.', 'delivery', 23, 'order', 1, '2026-03-05 13:53:28', 'app', 'pending', '2026-03-02 11:12:34', 1),
(69, 20, 'New Pickup Assignment 🚚', 'Order SPQ-63CAE063 assigned to you for Pickup. Please accept it.', 'delivery', 24, 'order', 1, '2026-03-05 16:19:28', 'app', 'pending', '2026-03-05 10:38:41', 0),
(78, 20, 'New Delivery Assignment 🚚', 'Order SPQ-63CAE063 assigned to you for Delivery. Please accept it.', 'delivery', 24, 'order', 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-05 10:54:59', 0),
(85, 20, 'New Pickup Assignment 🚚', 'Order SPQ-5C9DA14B assigned to you for Pickup. Please accept it.', 'delivery', 25, 'order', 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-12 11:22:59', 0),
(94, 20, 'New Delivery Assignment 🚚', 'Order SPQ-5C9DA14B assigned to you for Delivery. Please accept it.', 'delivery', 25, 'order', 1, '2026-03-12 16:55:58', 'app', 'pending', '2026-03-12 11:24:51', 0),
(100, 20, 'New Pickup Assignment 🚚', 'Order SPQ-115CB55C assigned to you for Pickup. Please accept it.', 'delivery', 26, 'order', 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-14 04:35:15', 0),
(109, 20, 'New Delivery Assignment 🚚', 'Order SPQ-115CB55C assigned to you for Delivery. Please accept it.', 'delivery', 26, 'order', 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-14 04:37:58', 0),
(116, 20, 'New Pickup Assignment 🚚', 'Order SPQ-A95D1374 assigned to you for Pickup. Please accept it.', 'delivery', 27, 'order', 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-18 09:22:34', 0),
(122, 20, 'New Delivery Assignment 🚚', 'Order SPQ-A95D1374 assigned to you for Delivery. Please accept it.', 'delivery', 27, 'order', 1, '2026-03-19 10:02:12', 'app', 'pending', '2026-03-18 09:30:27', 0),
(127, 20, 'New Pickup Assignment 🚚', 'Order SPQ-D8815ED2 assigned to you for Pickup. Please accept it.', 'delivery', 28, 'order', 1, '2026-03-19 10:02:09', 'app', 'pending', '2026-03-18 10:04:06', 0),
(133, 20, 'New Delivery Assignment 🚚', 'Order SPQ-D8815ED2 assigned to you for Delivery. Please accept it.', 'delivery', 28, 'order', 1, '2026-03-19 10:02:07', 'app', 'pending', '2026-03-18 10:06:25', 0),
(136, 26, 'Welcome to WashNova!', 'Your account has been created successfully. Start booking your laundry service today!', 'system', NULL, NULL, 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-18 10:24:55', 0),
(137, 1, 'Password Changed', 'Your password has been successfully changed. If you did not make this change, please contact support immediately.', 'system', NULL, NULL, 1, '2026-03-19 10:02:35', 'app', 'pending', '2026-03-19 04:22:52', 0),
(138, 26, 'Order SPQ-22B2C766 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 22:54:01', 0),
(139, 26, 'Order SPQ-22B2C766 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 22:54:06', 0),
(140, 20, 'New Pickup Assignment 🚚', 'Order SPQ-22B2C766 assigned to you for Pickup. Please accept it.', 'delivery', 29, 'order', 1, '2026-03-20 10:12:44', 'app', 'pending', '2026-03-19 22:54:14', 0),
(141, 26, 'Order SPQ-22B2C766 - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 22:57:35', 0),
(142, 26, 'Order SPQ-22B2C766 - In Process', '🔄 Your laundry is now being processed.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 22:57:50', 0),
(143, 26, 'Order SPQ-22B2C766 - Washing', '🧺 Your clothes are being washed.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 23:30:11', 0),
(144, 26, 'Order SPQ-22B2C766 - Ironing', '♨️ Your clothes are being ironed.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 23:30:28', 0),
(145, 26, 'Order SPQ-22B2C766 - Quality Check', '✅ Your clothes are in quality check.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 23:30:46', 0),
(146, 26, 'Order SPQ-22B2C766 - Ready For Delivery', '📋 Your order is ready! Will be delivered soon.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-19 23:31:01', 0),
(147, 20, 'New Delivery Assignment 🚚', 'Order SPQ-22B2C766 assigned to you for Delivery. Please accept it.', 'delivery', 29, 'order', 1, '2026-03-20 10:12:51', 'app', 'pending', '2026-03-19 23:31:17', 0),
(148, 1, 'Password Changed', 'Your password has been successfully changed. If you did not make this change, please contact support immediately.', 'system', NULL, NULL, 0, NULL, 'app', 'pending', '2026-03-20 03:57:17', 0),
(149, 26, 'Order SPQ-22B2C766 - Out for Delivery 🚚', '🚚 Your clean laundry is on its way! Get ready to receive it.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-20 03:59:09', 0),
(150, 26, 'Order SPQ-22B2C766 Delivered! ✅', '✅ Your laundry has been delivered successfully! Thank you for choosing us. ⭐ Please rate our service.', 'order', 29, 'order', 1, NULL, 'app', 'pending', '2026-03-20 04:00:40', 0),
(151, 20, 'New Pickup Assignment 🚚', 'Order ORD-20260320-C5EDA2 assigned to you for Pickup.', 'delivery', 30, 'order', 1, '2026-03-20 10:14:05', 'app', 'pending', '2026-03-20 04:07:04', 0),
(153, 26, 'Order SPQ-79F955C3 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:00:00', 0),
(154, 26, 'Order SPQ-79F955C3 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:02:39', 0),
(155, 20, 'New Pickup Assignment 🚚', 'Order SPQ-79F955C3 assigned to you for Pickup. Please accept it.', 'delivery', 31, 'order', 1, '2026-03-20 10:34:10', 'app', 'pending', '2026-03-20 05:02:59', 0),
(156, 26, 'Order Update', 'Your order #SPQ-79F955C3 has been accepted by delivery partner.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:04:17', 0),
(157, 26, 'Order Update', 'Delivery partner is on the way for pickup.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:04:36', 0),
(158, 26, 'Order Completed', 'Your laundry has been picked up successfully.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:04:42', 0),
(159, 26, 'Order SPQ-79F955C3 - In Process', '🔄 Your laundry is now being processed.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:06:16', 0),
(160, 26, 'Order SPQ-79F955C3 - Washing', '🧺 Your clothes are being washed.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:06:32', 0),
(161, 26, 'Order SPQ-79F955C3 - Ironing', '♨️ Your clothes are being ironed.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:06:52', 0),
(162, 26, 'Order SPQ-79F955C3 - Quality Check', '✅ Your clothes are in quality check.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:07:09', 0),
(163, 26, 'Order SPQ-79F955C3 - Ready For Delivery', '📋 Your order is ready! Will be delivered soon.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:07:44', 0),
(164, 20, 'New Delivery Assignment 🚚', 'Order SPQ-79F955C3 assigned to you for Delivery. Please accept it.', 'delivery', 31, 'order', 1, '2026-03-20 10:38:28', 'app', 'pending', '2026-03-20 05:07:54', 0),
(165, 26, 'Order SPQ-79F955C3 - Out for Delivery 🚚', '🚚 Your clean laundry is on its way! Get ready to receive it.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:08:54', 0),
(166, 26, 'Order SPQ-79F955C3 Delivered! ✅', '✅ Your laundry has been delivered successfully! Thank you for choosing us. ⭐ Please rate our service.', 'order', 31, 'order', 1, NULL, 'app', 'pending', '2026-03-20 05:09:00', 0),
(167, 26, 'Order SPQ-1869DFE0 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 32, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:26:21', 0),
(168, 26, 'Order Placed: SPQ-E4E6D93E', '🎉 Your reorder has been placed successfully! We\'ll confirm it shortly.', 'order', 34, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:30:41', 0),
(169, 26, 'Order SPQ-E4E6D93E - Cancelled', '❌ Your order has been cancelled. Contact support for queries.', 'order', 34, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:31:11', 0),
(170, 19, 'Order Cancelled', '⚠️ Order SPQ-E4E6D93E has been Cancelled', 'order', 34, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:31:13', 0),
(171, 29, 'Order Cancelled', '⚠️ Order SPQ-E4E6D93E has been Cancelled', 'order', 34, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:31:13', 0),
(172, 25, 'Order SPQ-757FDBD4 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 35, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:35:22', 0),
(173, 25, 'Order SPQ-757FDBD4 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 35, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:35:27', 0),
(174, 25, 'Order SPQ-40A17F29 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 36, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:36:16', 0),
(175, 25, 'Order SPQ-40A17F29 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 36, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:36:34', 0),
(176, 20, 'New Pickup Assignment 🚚', 'Order SPQ-40A17F29 assigned to you for Pickup. Please accept it.', 'delivery', 36, 'order', 1, '2026-03-23 09:30:38', 'app', 'pending', '2026-03-22 20:36:46', 0),
(177, 25, 'Order SPQ-40A17F29 - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 36, 'order', 0, NULL, 'app', 'pending', '2026-03-22 20:37:39', 0),
(180, 20, 'New Pickup Assignment 🚚', 'Order SPQ-548E100D assigned to you for Pickup. Please accept it.', 'delivery', 37, 'order', 1, '2026-03-23 09:30:38', 'app', 'pending', '2026-03-22 20:39:51', 0),
(183, 26, 'Order SPQ-1133FBB0 - Cancelled', '❌ Your order has been cancelled. Contact support for queries.', 'order', 38, 'order', 0, NULL, 'app', 'pending', '2026-03-23 03:56:47', 0),
(184, 19, 'Order Cancelled', '⚠️ Order SPQ-1133FBB0 has been Cancelled', 'order', 38, 'order', 0, NULL, 'app', 'pending', '2026-03-23 03:56:48', 0),
(185, 29, 'Order Cancelled', '⚠️ Order SPQ-1133FBB0 has been Cancelled', 'order', 38, 'order', 0, NULL, 'app', 'pending', '2026-03-23 03:56:48', 0),
(186, 26, 'Order SPQ-EEE38EE5 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 39, 'order', 0, NULL, 'app', 'pending', '2026-03-23 03:58:40', 0),
(187, 26, 'Order SPQ-EEE38EE5 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 39, 'order', 0, NULL, 'app', 'pending', '2026-03-23 03:59:24', 0),
(188, 20, 'New Pickup Assignment 🚚', 'Order SPQ-1869DFE0 assigned to you for Pickup. Please accept it.', 'delivery', 32, 'order', 1, '2026-03-23 09:30:38', 'app', 'pending', '2026-03-23 04:00:14', 0),
(189, 26, 'Order SPQ-1869DFE0 - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 32, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:01:12', 0),
(190, 30, 'Welcome to WashNova!', 'Your account has been created successfully. Start booking your laundry service today!', 'system', NULL, NULL, 0, NULL, 'app', 'pending', '2026-03-23 04:05:00', 0),
(191, 30, 'Password Changed', 'Your password has been successfully changed. If you did not make this change, please contact support immediately.', 'system', NULL, NULL, 0, NULL, 'app', 'pending', '2026-03-23 04:06:12', 0),
(192, 30, 'Order SPQ-13E1D8EC - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:08:54', 0),
(193, 30, 'Order SPQ-13E1D8EC - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:10:42', 0),
(194, 20, 'New Pickup Assignment 🚚', 'Order SPQ-13E1D8EC assigned to you for Pickup. Please accept it.', 'delivery', 40, 'order', 1, '2026-04-01 14:19:25', 'app', 'pending', '2026-03-23 04:10:57', 0),
(195, 30, 'Order SPQ-13E1D8EC - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:11:25', 0),
(196, 30, 'Order SPQ-13E1D8EC - In Process', '🔄 Your laundry is now being processed.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:12:20', 0),
(197, 30, 'Order SPQ-13E1D8EC - Washing', '🧺 Your clothes are being washed.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:12:25', 0),
(198, 30, 'Order SPQ-13E1D8EC - Ironing', '♨️ Your clothes are being ironed.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:12:32', 0),
(199, 30, 'Order SPQ-13E1D8EC - Quality Check', '✅ Your clothes are in quality check.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:12:37', 0),
(200, 30, 'Order SPQ-13E1D8EC - Ready For Delivery', '📋 Your order is ready! Will be delivered soon.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:12:44', 0),
(201, 20, 'New Delivery Assignment 🚚', 'Order SPQ-13E1D8EC assigned to you for Delivery. Please accept it.', 'delivery', 40, 'order', 1, '2026-04-01 14:19:25', 'app', 'pending', '2026-03-23 04:12:56', 0),
(202, 30, 'Order SPQ-13E1D8EC - Out for Delivery 🚚', '🚚 Your clean laundry is on its way! Get ready to receive it.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:13:14', 0),
(203, 30, 'Order SPQ-13E1D8EC Delivered! ✅', '✅ Your laundry has been delivered successfully! Thank you for choosing us. ⭐ Please rate our service.', 'order', 40, 'order', 0, NULL, 'app', 'pending', '2026-03-23 04:13:20', 0),
(204, 31, 'Welcome to WashNova!', 'Your account has been created successfully. Start booking your laundry service today!', 'system', NULL, NULL, 0, NULL, 'app', 'pending', '2026-03-23 05:11:51', 0),
(205, 1, 'Password Changed', 'Your password has been successfully changed. If you did not make this change, please contact support immediately.', 'system', NULL, NULL, 0, NULL, 'app', 'pending', '2026-03-23 05:17:56', 0),
(206, 31, 'Order SPQ-2B6A5ED8 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 41, 'order', 0, NULL, 'app', 'pending', '2026-03-23 05:28:59', 0),
(207, 31, 'Order SPQ-2B6A5ED8 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 41, 'order', 0, NULL, 'app', 'pending', '2026-03-23 05:29:25', 0),
(208, 20, 'New Pickup Assignment 🚚', 'Order SPQ-2B6A5ED8 assigned to you for Pickup. Please accept it.', 'delivery', 41, 'order', 1, '2026-04-01 14:19:25', 'app', 'pending', '2026-03-23 05:29:55', 0),
(209, 31, 'Order SPQ-2B6A5ED8 - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 41, 'order', 0, NULL, 'app', 'pending', '2026-03-23 05:32:32', 0),
(210, 26, 'Order SPQ-BDFAEA6E - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:31:18', 0),
(211, 26, 'Order SPQ-BDFAEA6E - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:31:23', 0),
(212, 20, 'New Pickup Assignment 🚚', 'Order SPQ-BDFAEA6E assigned to you for Pickup. Please accept it.', 'delivery', 42, 'order', 1, '2026-04-01 14:19:25', 'app', 'pending', '2026-04-01 08:31:44', 0),
(213, 26, 'Order SPQ-BDFAEA6E - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:12', 0),
(214, 26, 'Order SPQ-BDFAEA6E - In Process', '🔄 Your laundry is now being processed.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:31', 0),
(215, 26, 'Order SPQ-BDFAEA6E - Washing', '🧺 Your clothes are being washed.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:36', 0),
(216, 26, 'Order SPQ-BDFAEA6E - Ironing', '♨️ Your clothes are being ironed.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:42', 0),
(217, 26, 'Order SPQ-BDFAEA6E - Quality Check', '✅ Your clothes are in quality check.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:49', 0),
(218, 26, 'Order SPQ-BDFAEA6E - Ready For Delivery', '📋 Your order is ready! Will be delivered soon.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:33:56', 0),
(219, 20, 'New Delivery Assignment 🚚', 'Order SPQ-BDFAEA6E assigned to you for Delivery. Please accept it.', 'delivery', 42, 'order', 1, '2026-04-01 14:19:25', 'app', 'pending', '2026-04-01 08:34:06', 0),
(220, 26, 'Order SPQ-BDFAEA6E - Out for Delivery 🚚', '🚚 Your clean laundry is on its way! Get ready to receive it.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:34:20', 0),
(221, 26, 'Order SPQ-BDFAEA6E Delivered! ✅', '✅ Your laundry has been delivered successfully! Thank you for choosing us. ⭐ Please rate our service.', 'order', 42, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:34:26', 0),
(222, 31, 'Order SPQ-CDC3A474 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:47:01', 0),
(223, 31, 'Order SPQ-CDC3A474 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-01 08:47:21', 0),
(224, 31, 'Order SPQ-0C5B9A30 - Confirmed', '✔️ Your order has been confirmed! We will schedule pickup soon.', 'order', 44, 'order', 0, NULL, 'app', 'pending', '2026-04-01 09:09:06', 0),
(225, 31, 'Order SPQ-0C5B9A30 - Pickup Scheduled', '📅 Pickup has been scheduled. Please keep your laundry ready!', 'order', 44, 'order', 0, NULL, 'app', 'pending', '2026-04-01 09:09:33', 0),
(226, 31, 'Order SPQ-0C5B9A30 - Cancelled', '❌ Your order has been cancelled. Contact support for queries.', 'order', 44, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:47:32', 0),
(227, 19, 'Order Cancelled', '⚠️ Order SPQ-0C5B9A30 has been Cancelled', 'order', 44, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:47:33', 0),
(228, 29, 'Order Cancelled', '⚠️ Order SPQ-0C5B9A30 has been Cancelled', 'order', 44, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:47:33', 0),
(229, 20, 'New Pickup Assignment 🚚', 'Order SPQ-CDC3A474 assigned to you for Pickup. Please accept it.', 'delivery', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:50:14', 0),
(230, 31, 'Order SPQ-CDC3A474 - Picked Up 📦', '📦 Your laundry has been picked up successfully! We\'ll start processing it now.', 'order', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:51:45', 0),
(231, 31, 'Order SPQ-CDC3A474 - In Process', '🔄 Your laundry is now being processed.', 'order', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:52:10', 0),
(232, 31, 'Order SPQ-CDC3A474 - Washing', '🧺 Your clothes are being washed.', 'order', 43, 'order', 0, NULL, 'app', 'pending', '2026-04-02 14:59:24', 0);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `discount_type` enum('percentage','fixed') NOT NULL,
  `discount_value` decimal(10,2) NOT NULL,
  `min_order_amount` decimal(10,2) DEFAULT 0.00,
  `max_discount_amount` decimal(10,2) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `applicable_services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applicable_services`)),
  `applicable_roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`applicable_roles`)),
  `usage_limit` int(11) DEFAULT NULL,
  `used_count` int(11) DEFAULT 0,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `status` enum('active','inactive','expired') DEFAULT 'active',
  `created_by` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `title`, `description`, `image`, `discount_type`, `discount_value`, `min_order_amount`, `max_discount_amount`, `coupon_code`, `applicable_services`, `applicable_roles`, `usage_limit`, `used_count`, `start_date`, `end_date`, `status`, `created_by`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(6, 'internship', 'this  is the internship offer', 'uploads/offers/offer_1772507717_a4d560c4.jpg', 'percentage', 20.00, 700.00, NULL, 'INTERN', NULL, NULL, NULL, 0, '2026-03-04', '2026-03-13', 'active', 1, '2026-03-03 03:15:17', '2026-03-03 03:15:17', 0, NULL),
(7, 'Save 20', 'Shave your 20 % on shopping above 100', 'uploads/offers/offer_1773756388_c3ee9373.png', 'percentage', 20.00, 100.00, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-17', '2026-03-31', 'active', 1, '2026-03-17 14:06:28', '2026-03-17 14:06:28', 0, NULL),
(8, 'Summer sale 20%', 'Enjoy our exclusive summer sale with special discounts on laundry services. Keep your clothes fresh, clean, and hygienic all season long.', 'uploads/offers/offer_1774017929_cab24e1a.webp', 'percentage', 20.00, 100.00, NULL, NULL, NULL, NULL, NULL, 0, '2026-03-20', '2026-03-26', 'active', 1, '2026-03-20 14:45:29', '2026-03-20 14:45:29', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_number` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `discount` decimal(10,2) DEFAULT 0.00,
  `tax_amount` decimal(10,2) DEFAULT 0.00,
  `delivery_charge` decimal(10,2) DEFAULT 0.00,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `offer_id` int(11) DEFAULT NULL,
  `coupon_code` varchar(50) DEFAULT NULL,
  `pickup_date` date DEFAULT NULL,
  `pickup_time` varchar(50) DEFAULT NULL,
  `pickup_address` text DEFAULT NULL,
  `pickup_city` varchar(100) DEFAULT NULL,
  `pickup_pincode` varchar(10) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL,
  `delivery_time` varchar(50) DEFAULT NULL,
  `delivery_address` text DEFAULT NULL,
  `delivery_city` varchar(100) DEFAULT NULL,
  `delivery_pincode` varchar(10) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `order_status` enum('pending','confirmed','pickup_scheduled','picked_up','in_process','washing','ironing','quality_check','ready_for_delivery','out_for_delivery','delivered','cancelled','refunded') DEFAULT 'pending',
  `payment_status` enum('pending','paid','partial','failed','refunded') DEFAULT 'pending',
  `payment_method` enum('cod','razorpay','upi','card','netbanking','wallet','cash','online') NOT NULL DEFAULT 'cod',
  `booking_source` enum('app','website','offline_walk_in','offline_phone','offline_admin','pos') DEFAULT 'app',
  `delivery_boy_id` int(11) DEFAULT NULL,
  `is_recurring` tinyint(1) DEFAULT 0,
  `recurring_type` enum('weekly','biweekly','monthly') DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `is_offline_order` tinyint(1) DEFAULT 0,
  `offline_customer_name` varchar(100) DEFAULT NULL,
  `offline_customer_mobile` varchar(15) DEFAULT NULL,
  `offline_notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `invoice_shared` tinyint(1) DEFAULT 0,
  `invoice_shared_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `subtotal`, `discount`, `tax_amount`, `delivery_charge`, `total_amount`, `offer_id`, `coupon_code`, `pickup_date`, `pickup_time`, `pickup_address`, `pickup_city`, `pickup_pincode`, `delivery_date`, `delivery_time`, `delivery_address`, `delivery_city`, `delivery_pincode`, `instructions`, `order_status`, `payment_status`, `payment_method`, `booking_source`, `delivery_boy_id`, `is_recurring`, `recurring_type`, `created_by`, `is_offline_order`, `offline_customer_name`, `offline_customer_mobile`, `offline_notes`, `created_at`, `updated_at`, `is_deleted`, `invoice_shared`, `invoice_shared_at`, `deleted_at`) VALUES
(29, 'SPQ-22B2C766', 26, 1400.00, 0.00, 70.00, 0.00, 1470.00, NULL, NULL, '2026-03-21', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'delivered', 'paid', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-19 22:53:39', '2026-03-20 04:00:40', 0, 0, NULL, NULL),
(31, 'SPQ-79F955C3', 26, 350.00, 0.00, 17.50, 50.00, 417.50, NULL, NULL, '2026-03-21', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', 'hghbh', 'delivered', 'paid', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-20 04:58:39', '2026-03-20 05:09:00', 0, 0, NULL, NULL),
(32, 'SPQ-1869DFE0', 26, 1000.00, 100.00, 45.00, 0.00, 945.00, NULL, '20', '2026-03-24', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'picked_up', 'pending', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-22 20:25:03', '2026-03-23 04:01:12', 0, 0, NULL, NULL),
(33, 'SPQ-04B97F33', 26, 680.00, 100.00, 29.00, 0.00, 609.00, NULL, '20', '2026-03-24', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'pending', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-22 20:26:03', '2026-03-22 20:26:03', 0, 0, NULL, NULL),
(34, 'SPQ-E4E6D93E', 26, 350.00, 70.00, 14.00, 50.00, 344.00, NULL, '20', '2026-03-24', '11:00-13:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', 'hghbh', 'cancelled', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-22 20:30:41', '2026-03-22 20:31:11', 0, 0, NULL, NULL),
(35, 'SPQ-757FDBD4', 25, 1200.00, 100.00, 55.00, 0.00, 1155.00, NULL, '20', '2026-03-24', '09:00-11:00', 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', '394210', NULL, NULL, 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', '394210', '', 'pickup_scheduled', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-22 20:35:07', '2026-03-22 20:35:27', 0, 0, NULL, NULL),
(36, 'SPQ-40A17F29', 25, 4400.00, 100.00, 215.00, 0.00, 4515.00, NULL, '20', '2026-03-24', '09:00-11:00', 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', '394210', NULL, NULL, 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', '394210', '', 'picked_up', 'pending', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-22 20:36:02', '2026-03-22 20:37:39', 0, 0, NULL, NULL),
(38, 'SPQ-1133FBB0', 26, 1450.00, 200.00, 62.50, 0.00, 1312.50, NULL, 'SUMMER_OFFER', '2026-03-24', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'cancelled', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-23 03:55:35', '2026-03-23 03:56:47', 0, 0, NULL, NULL),
(39, 'SPQ-EEE38EE5', 26, 1000.00, 200.00, 40.00, 0.00, 840.00, NULL, 'SUMMER_OFFER', '2026-03-24', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'pickup_scheduled', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-23 03:57:51', '2026-03-23 03:59:24', 0, 0, NULL, NULL),
(40, 'SPQ-13E1D8EC', 30, 500.00, 100.00, 20.00, 0.00, 420.00, NULL, '20', '2026-03-24', '09:00-11:00', 'HPO', 'Surat', '395005', NULL, NULL, 'HPO', 'Surat', '395005', '', 'delivered', 'paid', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-23 04:07:36', '2026-03-23 05:38:01', 0, 1, '2026-03-23 11:08:01', NULL),
(41, 'SPQ-2B6A5ED8', 31, 500.00, 100.00, 20.00, 0.00, 420.00, NULL, 'SUMMER_OFFER', '2026-03-24', '09:00-11:00', 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', NULL, NULL, 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', '', 'picked_up', 'paid', 'razorpay', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-03-23 05:27:57', '2026-03-23 05:32:32', 0, 0, NULL, NULL),
(42, 'SPQ-BDFAEA6E', 26, 1600.00, 0.00, 80.00, 0.00, 1680.00, NULL, NULL, '2026-04-02', '09:00-11:00', 'udhna, surat station, near udhna', 'surat', '394213', NULL, NULL, 'udhna, surat station, near udhna', 'surat', '394213', '', 'delivered', 'paid', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-04-01 08:29:47', '2026-04-01 08:34:26', 0, 0, NULL, NULL),
(43, 'SPQ-CDC3A474', 31, 2930.00, 0.00, 146.50, 0.00, 3076.50, NULL, NULL, '2026-04-02', '09:00-11:00', 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', NULL, NULL, 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', '', 'washing', 'pending', 'cod', 'app', 20, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-04-01 08:46:51', '2026-04-02 14:59:24', 0, 0, NULL, NULL),
(44, 'SPQ-0C5B9A30', 31, 5000.00, 0.00, 250.00, 0.00, 5250.00, NULL, NULL, '2026-04-02', '09:00-11:00', 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', NULL, NULL, 'plot no.15 behind the railawy library udhna surat', 'surat', '394210', '', 'cancelled', 'pending', 'cod', 'app', NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, '2026-04-01 09:08:20', '2026-04-02 14:47:32', 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `pricing_id` int(11) DEFAULT NULL,
  `service_name` varchar(150) NOT NULL,
  `service_category` varchar(50) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `total_price` decimal(10,2) NOT NULL,
  `special_instructions` text DEFAULT NULL,
  `item_status` enum('pending','washing','ironing','ready','delivered') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `service_id`, `pricing_id`, `service_name`, `service_category`, `quantity`, `unit_price`, `total_price`, `special_instructions`, `item_status`, `created_at`) VALUES
(18, 29, 63, NULL, 'Kids Shoes Cleaning', 'Shoe Cleaning', 2, 100.00, 200.00, NULL, 'delivered', '2026-03-19 22:53:39'),
(19, 29, 59, NULL, 'Large Carpet Cleaning', 'Carpet and Curatin Cleaning', 2, 400.00, 800.00, NULL, 'delivered', '2026-03-19 22:53:39'),
(20, 29, 55, NULL, 'Laptop Bag', 'Bag Cleaning', 2, 200.00, 400.00, NULL, 'delivered', '2026-03-19 22:53:39'),
(22, 31, 66, NULL, 'Oil Stain Removal', 'Stain Removal', 2, 100.00, 200.00, NULL, 'delivered', '2026-03-20 04:58:39'),
(23, 31, 69, NULL, 'Wine Stain Removal', 'Stain Removal', 1, 150.00, 150.00, NULL, 'delivered', '2026-03-20 04:58:39'),
(24, 32, 64, NULL, 'Leather Shoes Cleaning', 'Shoe Cleaning', 5, 200.00, 1000.00, NULL, 'pending', '2026-03-22 20:25:03'),
(25, 33, 75, NULL, 'Jeans Dry Clean', 'Dry Cleaning', 2, 150.00, 300.00, NULL, 'pending', '2026-03-22 20:26:03'),
(26, 33, 69, NULL, 'Wine Stain Removal', 'Stain Removal', 1, 150.00, 150.00, NULL, 'pending', '2026-03-22 20:26:03'),
(27, 33, 67, NULL, 'Ink Stain Removal', 'Stain Removal', 1, 130.00, 130.00, NULL, 'pending', '2026-03-22 20:26:03'),
(28, 33, 63, NULL, 'Kids Shoes Cleaning', 'Shoe Cleaning', 1, 100.00, 100.00, NULL, 'pending', '2026-03-22 20:26:03'),
(29, 34, 66, 55, 'Oil Stain Removal', 'Stain Removal', 2, 100.00, 200.00, NULL, 'pending', '2026-03-22 20:30:41'),
(30, 34, 69, 58, 'Wine Stain Removal', 'Stain Removal', 1, 150.00, 150.00, NULL, 'pending', '2026-03-22 20:30:41'),
(31, 35, 75, NULL, 'Jeans Dry Clean', 'Dry Cleaning', 8, 150.00, 1200.00, NULL, 'pending', '2026-03-22 20:35:07'),
(32, 36, 70, NULL, 'Wedding Dress Dry Cleaning', 'Dry Cleaning', 11, 400.00, 4400.00, NULL, 'pending', '2026-03-22 20:36:02'),
(34, 38, 63, NULL, 'Kids Shoes Cleaning', 'Shoe Cleaning', 7, 100.00, 700.00, NULL, 'pending', '2026-03-23 03:55:35'),
(35, 38, 71, NULL, 'Jacket Dry Clean', 'Dry Cleaning', 3, 250.00, 750.00, NULL, 'pending', '2026-03-23 03:55:35'),
(36, 39, 73, NULL, 'Saree Dry Clean', 'Dry Cleaning', 5, 200.00, 1000.00, NULL, 'pending', '2026-03-23 03:57:51'),
(37, 40, 71, NULL, 'Jacket Dry Clean', 'Dry Cleaning', 2, 250.00, 500.00, NULL, 'delivered', '2026-03-23 04:07:36'),
(38, 41, 71, NULL, 'Jacket Dry Clean', 'Dry Cleaning', 2, 250.00, 500.00, NULL, 'pending', '2026-03-23 05:27:57'),
(39, 42, 64, NULL, 'Leather Shoes Cleaning', 'Shoe Cleaning', 8, 200.00, 1600.00, NULL, 'delivered', '2026-04-01 08:29:47'),
(40, 43, 71, NULL, 'Jacket Dry Clean', 'Dry Cleaning', 4, 250.00, 1000.00, NULL, 'washing', '2026-04-01 08:46:51'),
(41, 43, 73, NULL, 'Saree Dry Clean', 'Dry Cleaning', 4, 150.00, 600.00, NULL, 'washing', '2026-04-01 08:46:51'),
(42, 43, 64, NULL, 'Leather Shoes Cleaning', 'Shoe Cleaning', 3, 200.00, 600.00, NULL, 'washing', '2026-04-01 08:46:51'),
(43, 43, 69, NULL, 'Wine Stain Removal', 'Stain Removal', 2, 150.00, 300.00, NULL, 'washing', '2026-04-01 08:46:51'),
(44, 43, 79, NULL, 'Bulk Washing (5kg+)', 'WASH N IRON', 2, 100.00, 200.00, NULL, 'washing', '2026-04-01 08:46:51'),
(45, 43, 82, NULL, 'Daily Wear Wash', 'Washing', 1, 50.00, 50.00, NULL, 'washing', '2026-04-01 08:46:51'),
(46, 43, 77, NULL, 'Wash & Fold', 'Washing', 1, 80.00, 80.00, NULL, 'washing', '2026-04-01 08:46:51'),
(47, 43, 78, NULL, 'Wash & Iron', 'Washing', 1, 100.00, 100.00, NULL, 'washing', '2026-04-01 08:46:51'),
(48, 44, 71, NULL, 'Jacket Dry Clean', 'Dry Cleaning', 20, 250.00, 5000.00, NULL, 'pending', '2026-04-01 09:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_otp`
--

CREATE TABLE `password_reset_otp` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `otp` varchar(10) NOT NULL,
  `purpose` enum('password_reset','login','verification') DEFAULT 'password_reset',
  `is_used` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_reset_otp`
--

INSERT INTO `password_reset_otp` (`id`, `user_id`, `email`, `mobile`, `otp`, `purpose`, `is_used`, `created_at`, `expires_at`) VALUES
(3, 1, 'pathanshifa736@gmail.com', NULL, '858767', 'password_reset', 1, '2026-03-19 04:22:05', '2026-03-19 10:07:05'),
(4, 1, 'pathanshifa736@gmail.com', NULL, '630974', 'password_reset', 1, '2026-03-20 03:55:58', '2026-03-20 09:40:58'),
(5, 30, 'chauhan.mahekben.d2023@tmtbcasurat.org', NULL, '100931', 'password_reset', 1, '2026-03-23 04:05:12', '2026-03-23 09:50:12'),
(6, 1, 'pathanshifa736@gmail.com', NULL, '464114', 'password_reset', 1, '2026-03-23 05:17:21', '2026-03-23 11:02:21');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cod','razorpay','upi','card','netbanking','wallet','cash','online') NOT NULL DEFAULT 'cod',
  `payment_status` enum('pending','success','failed','refunded','cancelled') DEFAULT 'pending',
  `admin_note` text DEFAULT NULL,
  `transaction_id` varchar(100) DEFAULT NULL,
  `razorpay_order_id` varchar(60) DEFAULT NULL COMMENT 'order_XXXXXXXXXXXXXXXX',
  `razorpay_payment_id` varchar(60) DEFAULT NULL COMMENT 'pay_XXXXXXXXXXXXXXXX',
  `razorpay_signature` varchar(256) DEFAULT NULL COMMENT 'HMAC-SHA256 signature',
  `razorpay_method` varchar(30) DEFAULT NULL COMMENT 'upi/card/netbanking/wallet',
  `razorpay_vpa` varchar(80) DEFAULT NULL COMMENT 'UPI ID e.g. user@okicici',
  `razorpay_bank` varchar(60) DEFAULT NULL COMMENT 'Bank code for netbanking',
  `razorpay_wallet` varchar(30) DEFAULT NULL COMMENT 'Wallet name if method=wallet',
  `razorpay_international` tinyint(1) NOT NULL DEFAULT 0,
  `webhook_received` tinyint(1) NOT NULL DEFAULT 0,
  `webhook_event` varchar(50) DEFAULT NULL,
  `webhook_at` datetime DEFAULT NULL,
  `refund_id` varchar(80) DEFAULT NULL COMMENT 'rfnd_XXXXXXXXXXXXXXXX',
  `gateway_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`gateway_response`)),
  `payment_date` datetime DEFAULT NULL,
  `refund_amount` decimal(10,2) DEFAULT 0.00,
  `refund_status` varchar(20) DEFAULT NULL,
  `refund_at` datetime DEFAULT NULL,
  `refund_date` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `order_id`, `user_id`, `amount`, `payment_method`, `payment_status`, `admin_note`, `transaction_id`, `razorpay_order_id`, `razorpay_payment_id`, `razorpay_signature`, `razorpay_method`, `razorpay_vpa`, `razorpay_bank`, `razorpay_wallet`, `razorpay_international`, `webhook_received`, `webhook_event`, `webhook_at`, `refund_id`, `gateway_response`, `payment_date`, `refund_amount`, `refund_status`, `refund_at`, `refund_date`, `created_at`) VALUES
(26, 29, 26, 1470.00, 'cod', 'success', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-19 22:53:39'),
(27, 31, 26, 417.50, 'cod', 'success', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-20 04:58:39'),
(28, 32, 26, 945.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-22 20:25:03'),
(29, 33, 26, 609.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-22 20:26:03'),
(30, 34, 26, 344.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-22 20:30:41'),
(31, 35, 25, 1155.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-22 20:35:07'),
(32, 36, 25, 4515.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-22 20:36:02'),
(34, 38, 26, 1312.50, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-23 03:55:35'),
(35, 39, 26, 840.00, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-23 03:57:51'),
(36, 40, 30, 420.00, 'cod', 'success', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-03-23 04:07:36'),
(37, 41, 31, 420.00, 'razorpay', 'success', '[WA 01/04/26 14:14] Your payment has been received and confirmed successfully. ✅\n\nYour order is now being processed an\n[WA 02/04/26 20:18] We noticed your payment is still pending. ⏳\n\nKindly complete the payment to proceed with your orde', 'pay_SUYF5ewYxEFBNv', 'order_SUYEYPAYPmaPvX', 'pay_SUYF5ewYxEFBNv', '729e1c5a267b0822f894c0b1eb36a8cbd0e2070340002be400786a6621242bf5', NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, '2026-03-23 10:57:57', 0.00, NULL, NULL, NULL, '2026-03-23 05:27:57'),
(38, 42, 26, 1680.00, 'cod', 'success', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-04-01 08:29:47'),
(39, 43, 31, 3076.50, 'cod', 'pending', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-04-01 08:46:51'),
(40, 44, 31, 5250.00, 'cod', 'pending', '[WA 02/04/26 20:17] Your payment has been received and confirmed successfully. ✅\n\nYour order is now being processed an', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, 0.00, NULL, NULL, NULL, '2026-04-01 09:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_orders`
--

CREATE TABLE `razorpay_orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `app_order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'orders.id — NULL until order placed',
  `rzp_order_id` varchar(60) NOT NULL COMMENT 'order_XXXXXXXXXXXXXXXX from Razorpay',
  `amount_paise` int(10) UNSIGNED NOT NULL COMMENT 'Amount in paise (multiply INR × 100)',
  `currency` char(3) NOT NULL DEFAULT 'INR',
  `receipt` varchar(60) DEFAULT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'created' COMMENT 'created / attempted / paid / failed',
  `attempts` int(11) NOT NULL DEFAULT 0,
  `rzp_response` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'Full JSON response from Razorpay API' CHECK (json_valid(`rzp_response`)),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `razorpay_webhook_log`
--

CREATE TABLE `razorpay_webhook_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `event` varchar(50) NOT NULL COMMENT 'e.g. payment.captured',
  `payment_id` varchar(60) DEFAULT NULL COMMENT 'pay_XXXXXXXXXXXXXXXX',
  `order_id` varchar(60) DEFAULT NULL COMMENT 'order_XXXXXXXXXXXXXXXX',
  `amount` decimal(10,2) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `raw_payload` mediumtext DEFAULT NULL COMMENT 'Full JSON body from Razorpay',
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `received_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `service_name` varchar(150) NOT NULL,
  `service_code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `unit_type` enum('per_piece','per_kg','per_pair','per_sqft') DEFAULT 'per_piece',
  `service_category` enum('wash_iron','steam_iron','dry_clean','shoe_cleaning','curtain_cleaning','premium','express') NOT NULL,
  `duration_days` int(11) DEFAULT 2,
  `icon_image` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `order_no` int(11) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_code` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `icon_image` varchar(255) DEFAULT NULL,
  `display_order` int(11) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `category_name`, `category_code`, `description`, `icon_image`, `display_order`, `status`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(10, 'wash_Iron', 'wah_008', 'this is a washing service', 'uploads/category/cat_1772447904_ddddf9c9.jpg', 2, 'active', '2026-03-02 10:38:24', '2026-03-03 03:12:13', 1, '2026-03-03 08:42:13'),
(11, 'steam iron', 'steam_008', 'this is the steam iron', 'uploads/category/cat_1773762257_4cf6128f.jpg', 2, 'active', '2026-03-03 03:12:08', '2026-03-20 22:28:18', 0, NULL),
(12, 'Washing', 'wash', 'Washing with premium services', 'uploads/category/cat_1773762236_f11f62cc.png', 0, 'active', '2026-03-17 15:43:56', '2026-03-17 15:43:56', 0, NULL),
(13, 'Dry Cleaning', 'dry_cleaning', 'Dry CLeans with the proper care and no harsh to clothes', 'uploads/category/cat_1773762562_175ef363.jpg', 0, 'active', '2026-03-17 15:49:22', '2026-03-17 15:49:22', 0, NULL),
(14, 'Shoe Cleaning', 'shoe_clean', 'shoes with gentle care without damage', 'uploads/category/cat_1773894409_baad9bc4.jpg', 0, 'active', '2026-03-17 15:52:01', '2026-03-19 04:26:49', 0, NULL),
(15, 'Stain Removal', 'stain_remove', 'removing hard stain completely', 'uploads/category/cat_1773762793_98636b49.png', 0, 'active', '2026-03-17 15:53:13', '2026-03-17 15:53:13', 0, NULL),
(16, 'Premium Laundry', 'premium_laundry', 'High-end fabric care using premium detergents with extra softness finish', 'uploads/category/cat_1773894427_e0769b4d.jpg', 3, 'active', '2026-03-17 15:56:55', '2026-03-19 04:27:07', 0, NULL),
(17, 'Carpet and Curatin Cleaning', 'carpet_curtain', 'Deep cleaning for carpets, rugs, and curtains with dust &amp;amp; allergen removal', 'uploads/category/cat_1773894439_941b136a.jpg', 4, 'active', '2026-03-17 15:56:55', '2026-03-19 04:30:35', 0, NULL),
(18, 'Bag Cleaning', 'bag_clean', 'Gentle cleaning for handbags, backpacks, and travel bags', 'uploads/category/cat_1773894454_6e6158fd.jpg', 5, 'active', '2026-03-17 15:56:55', '2026-03-19 04:27:34', 0, NULL),
(19, 'WASH N IRON', 'wash_iron', 'wash n iron togther', 'uploads/category/cat_1774243205_0134c251.jpg', 0, 'active', '2026-03-23 05:20:05', '2026-03-23 05:20:05', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_items`
--

CREATE TABLE `service_items` (
  `id` int(11) NOT NULL,
  `item_name` varchar(150) NOT NULL,
  `item_code` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `item_image` varchar(255) DEFAULT NULL,
  `item_type` enum('clothing','household','shoes','accessories','other') DEFAULT 'clothing',
  `gender` enum('men','women','kids','unisex','home') DEFAULT 'unisex',
  `default_unit` enum('per_piece','per_kg','per_pair','per_sqft','per_set') DEFAULT 'per_piece',
  `display_order` int(11) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_items`
--

INSERT INTO `service_items` (`id`, `item_name`, `item_code`, `description`, `item_image`, `item_type`, `gender`, `default_unit`, `display_order`, `status`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(26, 'shirt', 'shirt-008', 'this is a shirt', 'uploads/items/item_69a568eb77e0a.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-02 10:39:39', '2026-03-17 16:01:22', 0, NULL),
(27, 'shirt', 'shirt_007', 'this is the shirt', 'uploads/items/item_69a651a6d2b10.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-03 03:12:38', '2026-03-17 16:01:29', 0, NULL),
(28, 'T-Shirt', 'item_tshirt', 'Round neck / V-neck casual t-shirt', NULL, 'clothing', 'men', 'per_piece', 1, 'active', '2026-03-17 15:56:55', '2026-03-17 16:05:57', 0, NULL),
(29, 'Formal Shirt', 'item_fshirt', 'Full sleeve or half sleeve formal shirt', NULL, 'clothing', 'men', 'per_piece', 2, 'active', '2026-03-17 15:56:55', '2026-03-17 16:06:11', 0, NULL),
(30, 'Trousers', 'item_trouser', 'Men formal or casual trousers / pants', NULL, 'clothing', 'men', 'per_piece', 3, 'active', '2026-03-17 15:56:55', '2026-03-17 16:06:00', 0, NULL),
(31, 'Jeans', 'item_jeans', 'Denim jeans, any cut', NULL, 'clothing', 'unisex', 'per_piece', 4, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:42', 0, NULL),
(32, 'Suit (2 Piece)', 'item_suit2pc', 'Blazer + trouser suit set', NULL, 'clothing', 'men', 'per_set', 5, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:37', 0, NULL),
(33, 'Kurta', 'item_kurta', 'Men ethnic kurta — regular or long', NULL, 'clothing', 'men', 'per_piece', 6, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:34', 0, NULL),
(34, 'Saree', 'item_saree', 'Cotton, silk, or synthetic saree with care wash', NULL, 'clothing', 'women', 'per_piece', 7, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:30', 0, NULL),
(35, 'Salwar Suit', 'item_salwar', 'Kurti + salwar / churidar set', NULL, 'clothing', 'women', 'per_set', 8, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:25', 0, NULL),
(36, 'Dupatta', 'item_dupatta', 'Dupatta / stole — light fabric', NULL, 'clothing', 'women', 'per_piece', 9, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:18', 0, NULL),
(37, 'Blouse', 'item_blouse', 'Saree blouse — cotton or silk', NULL, 'clothing', 'women', 'per_piece', 10, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:14', 0, NULL),
(38, 'Lehenga', 'item_lehenga', 'Bridal or festive lehenga set', NULL, 'clothing', 'women', 'per_set', 11, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:06', 0, NULL),
(39, 'Kids Top', 'item_kidstop', 'T-shirt or shirt for kids (up to age 14)', NULL, 'clothing', 'kids', 'per_piece', 12, 'active', '2026-03-17 15:56:55', '2026-03-17 16:11:02', 0, NULL),
(40, 'Kids Bottom', 'item_kidsbottom', 'Shorts, pants or leggings for kids', NULL, 'clothing', 'kids', 'per_piece', 13, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:53', 0, NULL),
(41, 'Bedsheet', 'item_bedsheet', 'Single or double bedsheet', NULL, 'household', 'home', 'per_piece', 14, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:42', 0, NULL),
(42, 'Blanket', 'item_blanket', 'Woolen or fleece blanket', NULL, 'household', 'home', 'per_piece', 15, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:36', 0, NULL),
(43, 'Pillow Cover', 'item_pillowcover', 'Standard pillow cover / pillowcase', NULL, 'household', 'home', 'per_piece', 16, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:32', 0, NULL),
(44, 'Towel', 'item_towel', 'Bath towel or hand towel', NULL, 'household', 'home', 'per_piece', 17, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:28', 0, NULL),
(45, 'Curtain', 'item_curtain', 'Window curtain — per panel', NULL, 'household', 'home', 'per_piece', 18, 'active', '2026-03-17 15:56:55', '2026-03-17 16:10:23', 0, NULL),
(46, 'Sports Shoes', 'item_sports_shoe', 'Running, gym, or casual sports shoes', NULL, 'shoes', 'unisex', 'per_pair', 19, 'active', '2026-03-17 15:56:55', '2026-03-17 16:05:49', 0, NULL),
(47, 'Formal Shoes', 'item_formal_shoe', 'Leather or synthetic formal shoes', NULL, 'shoes', 'men', 'per_pair', 0, 'active', '2026-03-17 15:56:55', '2026-03-17 16:18:47', 0, NULL),
(48, 'Curting', 'clt-112', 'asfseg', 'uploads/items/item_69b97e8968341.png', 'other', 'home', 'per_kg', 0, 'active', '2026-03-17 16:17:13', '2026-03-17 16:17:13', 0, NULL),
(49, 'Handbag Cleaning', 'handbag', 'this the handbag', 'uploads/items/item_69bb7e6cd8260.jpg', 'household', 'women', 'per_piece', 0, 'active', '2026-03-19 04:41:16', '2026-03-20 22:31:20', 0, NULL),
(50, 'Leather Bag Cleaning', 'Leather Bag', 'this the Leather Bag Cleaning', 'uploads/items/item_69bb7ef71db48.jpg', 'accessories', 'unisex', 'per_piece', 0, 'active', '2026-03-19 04:43:35', '2026-03-19 04:43:35', 0, NULL),
(51, 'Luxury Bag Care', 'lux-009', 'this is the Luxury Bag Care', 'uploads/items/item_69bb7f3b1ee7d.jpg', 'accessories', 'women', 'per_piece', 0, 'active', '2026-03-19 04:44:43', '2026-03-19 04:44:43', 0, NULL),
(52, 'School Bag Wash', 'school-006', 'this is the School Bag Wash', 'uploads/items/item_69bb7f994965e.jpg', 'accessories', 'unisex', 'per_piece', 0, 'active', '2026-03-19 04:46:17', '2026-03-19 04:46:17', 0, NULL),
(53, 'Travel Bag Cleaning', 'travel--78', 'this is the Travel Bag Cleaning', 'uploads/items/item_69bb7fe3a4a40.jpg', 'accessories', 'unisex', 'per_piece', 0, 'active', '2026-03-19 04:47:31', '2026-03-19 04:47:31', 0, NULL),
(54, 'Laptop Bag', 'lap-00678', 'this is the Laptop Bag', 'uploads/items/item_69bb81d295336.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 04:55:46', '2026-03-19 04:55:46', 0, NULL),
(55, 'Laptop Bag', 'lap-34', 'this is the Laptop Bag', 'uploads/items/item_69bb8224a7c80.jpg', 'accessories', 'unisex', 'per_piece', 0, 'active', '2026-03-19 04:57:08', '2026-03-19 04:57:08', 0, NULL),
(56, 'Small Carpet Cleaning', 'small', 'this is the Small Carpet Cleaning', 'uploads/items/item_69bb832ae2990.jpg', 'household', 'home', 'per_piece', 0, 'active', '2026-03-19 05:01:30', '2026-03-19 05:01:30', 0, NULL),
(57, 'Sofa Carpet Cleaning', 'small-8', 'this is the Sofa Carpet Cleaning', 'uploads/items/item_69bb837e63157.jpg', 'household', 'unisex', 'per_piece', 0, 'active', '2026-03-19 05:02:54', '2026-03-19 05:02:54', 0, NULL),
(58, 'Sofa Carpet Cleaning', 'sofa', 'this is the Sofa Carpet Cleaning', 'uploads/items/item_69bb841eeef46.jpg', 'accessories', 'home', 'per_piece', 0, 'active', '2026-03-19 05:05:34', '2026-03-19 05:05:34', 0, NULL),
(59, 'Large Carpet Cleaning', 'large', 'this is the Large Carpet Cleaning', 'uploads/items/item_69bb8444cc180.jpg', 'household', 'home', 'per_piece', 0, 'active', '2026-03-19 05:06:12', '2026-03-19 05:06:12', 0, NULL),
(60, 'Curtain', 'Curtain-004', 'this is the Curtain', 'uploads/items/item_69bb84a20587f.jpg', 'household', 'home', 'per_piece', 0, 'active', '2026-03-19 05:07:46', '2026-03-19 05:07:46', 0, NULL),
(61, 'Heavy Curtain Cleaning', 'heavy-998', 'this is the Heavy Curtain Cleaning', 'uploads/items/item_69bb84e9b44a3.jpg', 'household', 'home', 'per_piece', 0, 'active', '2026-03-19 05:08:57', '2026-03-19 05:08:57', 0, NULL),
(62, 'Shoe Whitening', 'shoes-98', 'this is the Shoe Whitening', 'uploads/items/item_69bb85cb851f0.jpg', 'shoes', 'unisex', 'per_piece', 0, 'active', '2026-03-19 05:12:43', '2026-03-19 05:12:43', 0, NULL),
(63, 'Kids Shoes Cleaning', 'kids-12', 'this is the Kids Shoes Cleaning', 'uploads/items/item_69bb860d58c57.jpg', 'clothing', 'kids', 'per_piece', 0, 'active', '2026-03-19 05:13:49', '2026-03-19 05:13:49', 0, NULL),
(64, 'Leather Shoes Cleaning', 'Leather-0', 'this is the Leather Shoes Cleaning', 'uploads/items/item_69bb867c78dc3.jpg', 'shoes', 'women', 'per_piece', 0, 'active', '2026-03-19 05:15:40', '2026-03-19 05:15:40', 0, NULL),
(65, 'Sports Shoes Cleaning', 'sports-89', 'this is the Sports Shoes Cleaning', 'uploads/items/item_69bb86be182a1.jpg', 'shoes', 'unisex', 'per_piece', 0, 'active', '2026-03-19 05:16:46', '2026-03-19 05:16:46', 0, NULL),
(66, 'Oil Stain Removal', 'oil_89', 'this is the Oil Stain Removal', 'uploads/items/item_69bc80e1e902d.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:04:01', '2026-03-19 23:04:01', 0, NULL),
(67, 'Ink Stain Removal', 'ink', 'this is the Ink Stain Removal', 'uploads/items/item_69bc8121df865.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:05:05', '2026-03-19 23:05:05', 0, NULL),
(68, 'Food Stain Removal', 'food', 'this is the Food Stain Removal', 'uploads/items/item_69bc819039d48.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:06:56', '2026-03-19 23:06:56', 0, NULL),
(69, 'Wine Stain Removal', 'wine', 'this is the Wine Stain Removal', 'uploads/items/item_69bc81c6e73d7.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:07:50', '2026-03-19 23:07:50', 0, NULL),
(70, 'Wedding Dress Dry Cleaning', 'wed', 'this is the Wedding Dress Dry Cleaning', 'uploads/items/item_69bc8b1e30f1d.jpg', 'clothing', 'women', 'per_piece', 0, 'active', '2026-03-19 23:47:42', '2026-03-19 23:47:42', 0, NULL),
(71, 'Jacket Dry Clean', 'jacket-87', 'this is the Jacket Dry Clean', 'uploads/items/item_69bc8b6aa544e.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:48:58', '2026-03-19 23:48:58', 0, NULL),
(72, 'Suit Dry Clean', 'suit-89', 'this is the Suit Dry Clean', 'uploads/items/item_69bc8bb0b1862.webp', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:50:08', '2026-03-19 23:50:08', 0, NULL),
(73, 'Saree Dry Clean', 'saree-89', 'this is the Saree Dry Clean', 'uploads/items/item_69bc8be7965ca.jpg', 'clothing', 'women', 'per_piece', 0, 'active', '2026-03-19 23:51:03', '2026-03-19 23:51:03', 0, NULL),
(74, 'Shirt Dry Clean', 'shirt-098', 'this is the Shirt Dry Clean', 'uploads/items/item_69bc8c4669a90.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:52:38', '2026-03-19 23:52:38', 0, NULL),
(75, 'Jeans Dry Clean', 'jeans', 'this is the Jeans', 'uploads/items/item_69bc8c8595f55.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-19 23:53:41', '2026-03-19 23:53:41', 0, NULL),
(76, 'Per Kg Washing', 'per_045', 'this is the Per Kg Washing', 'uploads/items/item_69bdcbc53c8c7.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:35:49', '2026-03-20 22:35:49', 0, NULL),
(77, 'Wash & Fold', 'wash_23', 'this is the Wash & Fold', 'uploads/items/item_69bdcc59202dc.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:38:17', '2026-03-20 22:38:17', 0, NULL),
(78, 'Wash & Iron', 'wash+123', 'this is the Wash & Iron', 'uploads/items/item_69bdcdf24713e.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:38:50', '2026-03-20 22:45:06', 0, NULL),
(79, 'Bulk Washing (5kg+)', 'bulk', 'this is the Bulk Washing (5kg+)', 'uploads/items/item_69bdccd5495ea.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:40:21', '2026-03-20 22:40:21', 0, NULL),
(80, 'Daily Wear Wash', 'daily', 'this is the Daily Wear Wash', '', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:41:05', '2026-03-20 22:41:05', 0, NULL),
(82, 'Daily Wear Wash', 'dail_0987', 'this is the daily wear wash', 'uploads/items/item_69bdcdb67805e.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:44:06', '2026-03-20 22:44:06', 0, NULL),
(83, 'Heavy Clothes Wash', 'heavy_789', 'this is the Heavy Clothes Wash', 'uploads/items/item_69bdce210d6e0.jpg', 'clothing', 'unisex', 'per_kg', 0, 'active', '2026-03-20 22:45:53', '2026-03-20 22:45:53', 0, NULL),
(84, 'Daily_wear_Ironing', 'daily_wear', 'this is the daily_wear_ironning', 'uploads/items/item_69bdd19b1037c.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-20 23:00:43', '2026-03-20 23:00:43', 0, NULL),
(85, 'Curtain_ironing', 'curatinn_51', 'this is the Curtain_ironing', 'uploads/items/item_69bdd1e9b9c2c.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-20 23:02:01', '2026-03-20 23:02:01', 0, NULL),
(86, 'Saree_Ironing', 'saree_67', 'this is the saree', 'uploads/items/item_69bdd22e88c47.jpg', 'clothing', 'women', 'per_piece', 0, 'active', '2026-03-20 23:03:10', '2026-03-20 23:03:10', 0, NULL),
(87, 'Paint_Ironing', 'paint', 'this is the ironing', 'uploads/items/item_69bdd252a66f9.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-20 23:03:46', '2026-03-20 23:03:46', 0, NULL),
(88, 'Shirt_Ironing', 'shirt_342', 'this is the shirt ironing', 'uploads/items/item_69bdd2a2e1851.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-20 23:05:06', '2026-03-20 23:05:06', 0, NULL),
(89, 'shirt', 'shirt_001', 'wash n iron', 'uploads/items/item_69c0cdcabde05.jpg', 'clothing', 'unisex', 'per_piece', 0, 'active', '2026-03-23 05:21:14', '2026-03-23 05:21:27', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_pricing`
--

CREATE TABLE `service_pricing` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `base_price` decimal(10,2) NOT NULL,
  `express_price` decimal(10,2) DEFAULT NULL,
  `unit_type` enum('per_piece','per_kg','per_pair','per_sqft','per_set') DEFAULT 'per_piece',
  `duration_days` int(11) DEFAULT 2,
  `express_duration_days` int(11) DEFAULT 1,
  `discount_percentage` decimal(5,2) DEFAULT 0.00,
  `discounted_price` decimal(10,2) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `display_order` int(11) DEFAULT 0,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_pricing`
--

INSERT INTO `service_pricing` (`id`, `category_id`, `item_id`, `base_price`, `express_price`, `unit_type`, `duration_days`, `express_duration_days`, `discount_percentage`, `discounted_price`, `is_featured`, `display_order`, `status`, `created_at`, `updated_at`, `is_deleted`, `deleted_at`) VALUES
(35, 10, 26, 100.00, 200.00, 'per_piece', 2, 1, 20.00, NULL, 0, 0, 'active', '2026-03-02 10:40:10', '2026-03-03 03:12:49', 1, '2026-03-03 08:42:49'),
(36, 11, 27, 100.00, 2000.00, 'per_piece', 2, 1, 2.00, NULL, 0, 0, 'active', '2026-03-03 03:14:19', '2026-03-19 04:31:13', 1, '2026-03-19 10:01:13'),
(37, 12, 26, 200.00, 350.00, 'per_piece', 2, 1, 20.00, NULL, 0, 0, 'active', '2026-03-17 16:09:41', '2026-03-19 04:31:08', 1, '2026-03-19 10:01:08'),
(38, 14, 47, 200.00, 400.00, 'per_pair', 2, 1, 10.00, NULL, 0, 0, 'active', '2026-03-17 16:12:11', '2026-03-19 04:31:05', 1, '2026-03-19 10:01:05'),
(39, 13, 27, 200.00, 1000.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-17 16:15:51', '2026-03-19 04:31:11', 1, '2026-03-19 10:01:11'),
(40, 17, 48, 2000.00, 2200.00, 'per_kg', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-17 16:17:41', '2026-03-19 04:31:16', 1, '2026-03-19 10:01:16'),
(41, 18, 49, 100.00, 150.00, 'per_piece', 2, 1, 20.00, NULL, 0, 0, 'active', '2026-03-19 04:42:28', '2026-03-19 04:42:28', 0, NULL),
(42, 18, 50, 200.00, 230.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 04:43:58', '2026-03-19 04:43:58', 0, NULL),
(43, 18, 51, 250.00, 300.00, 'per_piece', 2, 1, 5.00, NULL, 0, 0, 'active', '2026-03-19 04:45:08', '2026-03-19 04:45:08', 0, NULL),
(44, 18, 52, 150.00, 200.00, 'per_piece', 2, 1, 30.00, NULL, 0, 0, 'active', '2026-03-19 04:46:37', '2026-03-19 04:46:37', 0, NULL),
(45, 18, 53, 200.00, 250.00, 'per_piece', 2, 1, 50.00, NULL, 0, 0, 'active', '2026-03-19 04:48:13', '2026-03-19 04:48:13', 0, NULL),
(46, 18, 55, 200.00, 300.00, 'per_piece', 2, 1, 60.00, NULL, 0, 0, 'active', '2026-03-19 04:57:30', '2026-03-19 04:57:30', 0, NULL),
(47, 17, 56, 250.00, 300.00, 'per_piece', 2, 1, 50.00, NULL, 0, 0, 'active', '2026-03-19 05:01:52', '2026-03-19 05:01:52', 0, NULL),
(48, 17, 57, 150.00, 200.00, 'per_piece', 2, 1, 10.00, NULL, 0, 0, 'active', '2026-03-19 05:03:12', '2026-03-19 05:03:12', 0, NULL),
(49, 17, 59, 400.00, 450.00, 'per_piece', 2, 1, 80.00, NULL, 0, 0, 'active', '2026-03-19 05:06:38', '2026-03-19 05:06:38', 0, NULL),
(50, 17, 60, 150.00, 190.00, 'per_piece', 2, 1, 25.00, NULL, 0, 0, 'active', '2026-03-19 05:08:06', '2026-03-19 05:08:06', 0, NULL),
(51, 14, 62, 200.00, 250.00, 'per_piece', 2, 1, 5.00, NULL, 0, 0, 'active', '2026-03-19 05:13:06', '2026-03-19 05:13:06', 0, NULL),
(52, 14, 63, 100.00, 120.00, 'per_piece', 2, 1, 40.00, NULL, 0, 0, 'active', '2026-03-19 05:14:40', '2026-03-19 05:14:40', 0, NULL),
(53, 14, 64, 200.00, 250.00, 'per_piece', 2, 1, 50.00, NULL, 0, 0, 'active', '2026-03-19 05:16:00', '2026-03-19 05:16:00', 0, NULL),
(54, 14, 65, 100.00, 150.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 05:17:13', '2026-03-19 05:17:13', 0, NULL),
(55, 15, 66, 100.00, 150.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:04:19', '2026-03-19 23:04:19', 0, NULL),
(56, 15, 67, 130.00, 180.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:05:26', '2026-03-19 23:05:26', 0, NULL),
(57, 15, 68, 150.00, 200.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:07:12', '2026-03-19 23:07:12', 0, NULL),
(58, 15, 69, 150.00, 200.00, 'per_piece', 2, 1, 15.00, NULL, 0, 0, 'active', '2026-03-19 23:08:38', '2026-03-19 23:08:38', 0, NULL),
(59, 13, 70, 400.00, 500.00, 'per_piece', 2, 1, 25.00, NULL, 0, 0, 'active', '2026-03-19 23:48:06', '2026-03-19 23:48:06', 0, NULL),
(60, 13, 71, 250.00, 300.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:49:21', '2026-03-19 23:49:21', 0, NULL),
(61, 13, 72, 250.00, 300.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:50:28', '2026-03-19 23:50:28', 0, NULL),
(62, 13, 73, 150.00, 200.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:51:37', '2026-03-19 23:51:37', 0, NULL),
(63, 13, 74, 150.00, 200.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:52:59', '2026-03-19 23:52:59', 0, NULL),
(64, 13, 75, 150.00, 200.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-19 23:54:19', '2026-03-19 23:54:19', 0, NULL),
(65, 12, 76, 80.00, 100.00, 'per_kg', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 22:36:46', '2026-03-20 22:36:46', 0, NULL),
(66, 12, 80, 50.00, 80.00, 'per_kg', 2, 1, 5.00, NULL, 0, 0, 'active', '2026-03-20 22:46:37', '2026-03-20 22:46:55', 1, '2026-03-21 04:16:55'),
(67, 12, 82, 50.00, 80.00, 'per_kg', 2, 1, 5.00, NULL, 0, 0, 'active', '2026-03-20 22:47:26', '2026-03-20 22:47:26', 0, NULL),
(68, 12, 83, 150.00, 200.00, 'per_kg', 2, 1, 25.00, NULL, 0, 0, 'active', '2026-03-20 22:48:26', '2026-03-20 22:48:26', 0, NULL),
(69, 12, 77, 80.00, 150.00, 'per_kg', 2, 1, 10.00, NULL, 0, 0, 'active', '2026-03-20 22:49:26', '2026-03-20 22:49:26', 0, NULL),
(70, 12, 78, 100.00, 150.00, 'per_kg', 2, 1, 20.00, NULL, 0, 0, 'active', '2026-03-20 22:49:56', '2026-03-20 22:49:56', 0, NULL),
(71, 12, 79, 300.00, 350.00, 'per_kg', 2, 1, 20.00, NULL, 0, 0, 'active', '2026-03-20 22:50:27', '2026-03-20 22:50:27', 0, NULL),
(72, 11, 86, 30.00, 50.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:05:38', '2026-03-20 23:05:38', 0, NULL),
(73, 15, 84, 50.00, 70.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:07:23', '2026-03-20 23:07:23', 0, NULL),
(74, 11, 84, 30.00, 80.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:07:51', '2026-03-20 23:07:51', 0, NULL),
(75, 11, 88, 20.00, 50.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:08:16', '2026-03-20 23:08:16', 0, NULL),
(76, 11, 87, 50.00, 80.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:10:04', '2026-03-20 23:10:04', 0, NULL),
(77, 11, 85, 50.00, 80.00, 'per_piece', 2, 1, 0.00, NULL, 0, 0, 'active', '2026-03-20 23:11:03', '2026-03-20 23:11:03', 0, NULL),
(78, 19, 79, 100.00, 150.00, 'per_piece', 2, 1, 2.00, NULL, 0, 0, 'active', '2026-03-23 05:22:16', '2026-03-23 05:22:16', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_reminders`
--

CREATE TABLE `service_reminders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `reminder_type` enum('pickup','delivery','follow_up','offer','reorder') NOT NULL,
  `reminder_date` date NOT NULL,
  `reminder_time` time DEFAULT '10:00:00',
  `message` text DEFAULT NULL,
  `sent_via` enum('sms','email','push','whatsapp') DEFAULT 'sms',
  `is_sent` tinyint(1) DEFAULT 0,
  `sent_at` datetime DEFAULT NULL,
  `status` enum('scheduled','sent','failed','cancelled') DEFAULT 'scheduled',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(100) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `setting_group` enum('general','payment','delivery','notification','seo','social') DEFAULT 'general',
  `description` varchar(255) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_queries`
--

CREATE TABLE `support_queries` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `ticket_number` varchar(30) DEFAULT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `category` enum('service_issue','payment_issue','delivery_issue','general','complaint','suggestion') DEFAULT 'general',
  `priority` enum('low','medium','high','urgent') DEFAULT 'medium',
  `admin_reply` text DEFAULT NULL,
  `replied_by` int(11) DEFAULT NULL,
  `replied_at` datetime DEFAULT NULL,
  `status` enum('open','in_progress','resolved','closed') DEFAULT 'open',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `support_queries`
--

INSERT INTO `support_queries` (`id`, `user_id`, `order_id`, `ticket_number`, `subject`, `message`, `category`, `priority`, `admin_reply`, `replied_by`, `replied_at`, `status`, `created_at`, `updated_at`) VALUES
(6, 26, 29, 'TKT-20260320-F77F', 'Bulk order', 'how to possible???', 'general', 'medium', NULL, NULL, NULL, 'resolved', '2026-03-19 23:25:39', '2026-03-20 14:28:51');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `mobile` varchar(15) NOT NULL,
  `alternate_mobile` varchar(15) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `role` enum('super_admin','admin','delivery_boy','customer') NOT NULL DEFAULT 'customer',
  `customer_source` enum('online_app','online_website','offline_walk_in','offline_phone','offline_referral','offline_admin_added') DEFAULT 'online_app',
  `registration_type` enum('self_registered','admin_created','guest_converted') DEFAULT 'self_registered',
  `added_by` int(11) DEFAULT NULL,
  `added_from` enum('admin_panel','app','website','pos','phone_call') DEFAULT NULL,
  `walk_in_branch` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) DEFAULT NULL,
  `landmark` varchar(200) DEFAULT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `customer_type` enum('individual','business','corporate','vip') DEFAULT 'individual',
  `business_name` varchar(150) DEFAULT NULL,
  `gst_number` varchar(20) DEFAULT NULL,
  `preferred_pickup_time` varchar(50) DEFAULT NULL,
  `preferred_delivery_time` varchar(50) DEFAULT NULL,
  `preferred_payment_method` enum('online','upi','card','wallet','cod','cash') DEFAULT NULL,
  `preferred_services` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`preferred_services`)),
  `special_requirements` text DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_number` varchar(30) DEFAULT NULL,
  `driving_license` varchar(50) DEFAULT NULL,
  `availability_status` enum('online','offline','on_delivery') DEFAULT 'offline',
  `assigned_area` varchar(150) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `total_orders` int(11) DEFAULT 0,
  `total_spent` decimal(10,2) DEFAULT 0.00,
  `total_deliveries` int(11) DEFAULT 0,
  `total_earnings` decimal(10,2) DEFAULT 0.00,
  `offline_orders` int(11) DEFAULT 0,
  `online_orders` int(11) DEFAULT 0,
  `login_attempts` int(11) DEFAULT 0,
  `last_attempt_time` datetime DEFAULT NULL,
  `otp` varchar(10) DEFAULT NULL,
  `otp_expires_at` datetime DEFAULT NULL,
  `email_verified` tinyint(1) DEFAULT 0,
  `mobile_verified` tinyint(1) DEFAULT 0,
  `status` enum('active','inactive','blocked','suspended') DEFAULT 'active',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `last_order_date` datetime DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT 0,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `mobile`, `alternate_mobile`, `password_hash`, `profile_image`, `role`, `customer_source`, `registration_type`, `added_by`, `added_from`, `walk_in_branch`, `address`, `city`, `state`, `pincode`, `landmark`, `latitude`, `longitude`, `customer_type`, `business_name`, `gst_number`, `preferred_pickup_time`, `preferred_delivery_time`, `preferred_payment_method`, `preferred_services`, `special_requirements`, `vehicle_type`, `vehicle_number`, `driving_license`, `availability_status`, `assigned_area`, `department`, `permissions`, `total_orders`, `total_spent`, `total_deliveries`, `total_earnings`, `offline_orders`, `online_orders`, `login_attempts`, `last_attempt_time`, `otp`, `otp_expires_at`, `email_verified`, `mobile_verified`, `status`, `notes`, `created_at`, `updated_at`, `last_login`, `last_order_date`, `is_deleted`, `deleted_at`) VALUES
(1, 'Super Admin', 'pathanshifa736@gmail.com', '9999900001', NULL, '$2y$10$gMyLE6fPaNTqLYPO6XiU/.d4sdM4sZbT5G9FM1V/Hp8NMG7DBME96', 'profile_1_1773761404.png', 'super_admin', 'online_website', 'admin_created', NULL, NULL, NULL, 'Office 101, Business Park', 'surat', NULL, '400001', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-02-20 23:01:12', '2026-04-02 14:47:15', '2026-04-02 20:17:15', NULL, 0, NULL),
(19, 'Nitu patel', 'nitu@gmail.com', '7894561236', NULL, '$2y$10$xRoyVb.aoCTWw7heARh4Jej6gcn4l5GMVLxEGplezIsLboghaJM1S', 'profile_19_1772509127.jpg', 'admin', 'online_app', 'admin_created', 1, 'admin_panel', NULL, 'udhna', 'udhana', 'gujarat', '394210', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-02 10:33:11', '2026-03-23 05:28:46', '2026-03-23 10:58:46', NULL, 0, NULL),
(20, 'Raj', 'raj@gmail.com', '5698712369', '', '$2y$10$JZP7Fel3yWz14OZwr89/o.ef8D5FNHjwqA5OegTcos/EKFSLtTatq', 'assets/uploads/profiles/profile_1773982067_cf3aa46caad2de7e.jpg', 'delivery_boy', 'online_app', 'admin_created', 1, 'admin_panel', NULL, 'surat', 'surat', 'gujrat', '394210', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'GJ051234', NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 3, 90.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-02 10:34:54', '2026-04-02 14:51:23', '2026-04-02 20:21:23', NULL, 0, NULL),
(21, 'Saurabh', 'saurabh@gmail.com', '9531545847', NULL, '$2y$10$Ekt/.spInRpQBUdkMJHOLeMdqhkInHxGTGZVNKks13vGtSIpvqzu6', 'profile_21_1773315222.png', 'delivery_boy', 'online_app', 'admin_created', 1, 'admin_panel', NULL, 'Surat (M Corp.) (Part) P-265,RAMABAI CHOWK,MITHIKHADI,LIMBAYAT,SURAT', 'Surat (M Corp.) (Part)', 'Surat City,Surat,GJ', '394210', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Scooter', 'GJ05MW9307', NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-12 11:33:42', '2026-03-18 22:53:07', '2026-03-12 17:05:16', NULL, 0, NULL),
(24, 'Nisha', 'nisha@gmail.com', '4489783625', NULL, '$2y$10$auxCpgbP1NnCOGiG24PwsOgkeIuNwoR/EEuhdwNKyz66741QEBIni', NULL, 'customer', 'offline_walk_in', 'admin_created', 1, 'admin_panel', NULL, 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', 'Gujarat', '394210', NULL, 21.17042700, 72.85099000, 'individual', NULL, NULL, '16:00-18:00', NULL, 'card', NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 1, '2026-03-20 10:19:53', NULL, NULL, 0, 0, 'active', 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj kkkkkkkkkkkkkkkkkkkkkkkkk', '2026-03-18 09:48:53', '2026-03-20 04:49:53', NULL, NULL, 0, NULL),
(25, 'Rima patel', 'rima@gmail.com', '1234567890', NULL, '$2y$10$fHt5zI4VVjua8HWUdwA68uw68FFhPiZ9y85YyJYfVlEVjeko7rIuK', 'assets/uploads/profiles/profile_1773827473_e8729312e2866075.png', 'customer', 'offline_walk_in', 'admin_created', 1, 'admin_panel', NULL, 'Udhna Station Road, Udhana 394210', 'Udhna Taluka', 'Gujarat', '394210', NULL, 21.17042700, 72.85099000, 'individual', NULL, NULL, '14:00-16:00', NULL, 'upi', NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 2, 5670.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', 'hi heloooo    jjjjj gggggggggggggggg', '2026-03-18 09:51:13', '2026-03-22 20:36:02', '2026-03-23 02:04:40', '2026-03-23 02:06:02', 0, NULL),
(26, 'Mahi patel', 'mahi@gmail.com', '9979491075', NULL, '$2y$10$O5LIqGHxoVZr9omgMkWYWOybMeWgP6KfDx1JTpCLMQpoQBH4J4goy', 'assets/uploads/profiles/profile_1773829495_d2ec67a1f11ad0ef.png', 'customer', 'online_website', 'self_registered', NULL, NULL, NULL, 'udhna', 'surat', NULL, '394213', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 3, 3567.50, 0, 0.00, 0, 1, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-18 10:24:55', '2026-04-01 08:34:26', '2026-04-01 13:59:12', '2026-04-01 14:04:26', 0, NULL),
(27, 'khushi patel', 'khushi@gmail.com', '9979491045', NULL, '$2y$10$HcRfxPSkYrcHpqeGRnC//.6UHvTGFyGjBJySVZAsUWmkCLlkBtC7K', NULL, 'customer', 'offline_walk_in', 'admin_created', 1, 'admin_panel', NULL, 'Chhaprabhatha 394210', 'Adajan Taluka', 'Gujarat', '394107', NULL, 21.26512000, 72.84991300, 'individual', NULL, NULL, '08:00-10:00', NULL, 'cod', NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'blocked', 'ji hhhhh hhhhhh', '2026-03-19 23:38:16', '2026-03-22 22:19:28', NULL, NULL, 0, NULL),
(29, 'Siya Patel', 'siya@gmail.com', '9954263678', NULL, '$2y$10$grQf5Li1PoGulQJ9u6oO5ur4MFlRBS9lRQ3TUUMfCcBB3Gm1fBKji', 'profile_29_1774017485.png', 'admin', 'online_app', 'admin_created', 1, 'admin_panel', NULL, '123,adajan surat', 'surat', 'gujarat', '394210', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 0, 0.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-20 14:38:04', '2026-03-20 14:38:05', NULL, NULL, 0, NULL),
(30, 'Mahek', 'chauhan.mahekben.d2023@tmtbcasurat.org', '7016131729', NULL, '$2y$10$1j29N1rqItOy3zzFDIS.wOkuSjk1GHszVAp7YKsaQ.G3JdbB7ZAGS', 'assets/uploads/profiles/profile_1774238700_9c51ba98d9652f6c.png', 'customer', 'online_website', 'self_registered', NULL, NULL, NULL, 'hpogujhhhhhhhhhhhhhhhhhhhhh', 'Surat', '', '395005', '', NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 1, 420.00, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-23 04:05:00', '2026-03-23 04:13:20', '2026-03-23 09:36:31', '2026-03-23 09:43:20', 0, NULL),
(31, 'sohil pathan', 'sohil@gmail.com', '9727262224', NULL, '$2y$10$aCZ7dxeuHgB1853KVTyeCO5wbLjVT.ckzo7OlSeEETWF77oQFT4De', 'assets/uploads/profiles/profile_1774242711_6a992ee2ce782118.jpg', 'customer', 'online_website', 'self_registered', NULL, NULL, NULL, 'plot no.15 behind the railawy library udhna surat', 'surat', NULL, '394210', NULL, NULL, NULL, 'individual', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'offline', NULL, NULL, NULL, 3, 8746.50, 0, 0.00, 0, 0, 0, NULL, NULL, NULL, 0, 0, 'active', NULL, '2026-03-23 05:11:51', '2026-04-01 09:08:20', '2026-04-01 14:16:19', '2026-04-01 14:38:20', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_label` enum('home','office','other') DEFAULT 'home',
  `full_name` varchar(100) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text DEFAULT NULL,
  `landmark` varchar(200) DEFAULT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) DEFAULT NULL,
  `pincode` varchar(10) NOT NULL,
  `latitude` decimal(10,8) DEFAULT NULL,
  `longitude` decimal(11,8) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `is_deleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `user_id`, `address_label`, `full_name`, `mobile`, `address_line1`, `address_line2`, `landmark`, `city`, `state`, `pincode`, `latitude`, `longitude`, `is_default`, `created_at`, `updated_at`, `is_deleted`) VALUES
(7, 26, 'home', 'mahi ', '9734567890', 'udhna', 'surat station', 'near udhna', 'surat', 'gujrat', '394213', NULL, NULL, 1, '2026-03-18 10:34:37', '2026-03-18 10:35:01', 0),
(8, 25, 'home', 'Rima patel', '1234567890', 'Udhna Station Road, Udhana 394210', NULL, NULL, 'Udhna Taluka', NULL, '394210', NULL, NULL, 1, '2026-03-22 20:35:03', '2026-03-22 20:35:03', 0),
(9, 30, 'home', 'nhvhg', '7016131729', 'HPO', NULL, NULL, 'Surat', NULL, '395005', NULL, NULL, 1, '2026-03-23 04:07:34', '2026-03-23 04:07:34', 0),
(10, 31, 'home', 'sohil pathan', '9727262224', 'plot no.15 behind the railawy library udhna surat', NULL, NULL, 'surat', NULL, '394210', NULL, NULL, 1, '2026-03-23 05:26:14', '2026-03-23 05:26:14', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_module` (`module`),
  ADD KEY `idx_action` (`action`),
  ADD KEY `idx_date` (`created_at`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `idx_slug` (`slug`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_category` (`category`),
  ADD KEY `idx_author` (`author_id`);

--
-- Indexes for table `business_inquiries`
--
ALTER TABLE `business_inquiries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `handled_by` (`handled_by`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_type` (`business_type`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_pricing` (`pricing_id`);

--
-- Indexes for table `category_items`
--
ALTER TABLE `category_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_cat_item` (`category_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `replied_by` (`replied_by`),
  ADD KEY `idx_read` (`is_read`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_coupon_code` (`coupon_code`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `idx_customer` (`customer_id`);

--
-- Indexes for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_delivery_boy` (`delivery_boy_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_type` (`assignment_type`);

--
-- Indexes for table `delivery_earnings`
--
ALTER TABLE `delivery_earnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `idx_delivery_boy` (`delivery_boy_id`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`id`),
  ADD KEY `delivery_boy_id` (`delivery_boy_id`),
  ADD KEY `replied_by` (`replied_by`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_rating` (`rating`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_number` (`invoice_number`),
  ADD KEY `idx_invoice_number` (`invoice_number`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_user` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_read` (`is_read`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `idx_coupon` (`coupon_code`),
  ADD KEY `idx_dates` (`start_date`,`end_date`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_number` (`order_number`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `offer_id` (`offer_id`),
  ADD KEY `idx_order_number` (`order_number`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_status` (`order_status`),
  ADD KEY `idx_payment` (`payment_status`),
  ADD KEY `idx_delivery_boy` (`delivery_boy_id`),
  ADD KEY `idx_dates` (`pickup_date`,`delivery_date`),
  ADD KEY `idx_source` (`booking_source`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_service` (`service_id`);

--
-- Indexes for table `password_reset_otp`
--
ALTER TABLE `password_reset_otp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_otp` (`otp`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_order` (`order_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_transaction` (`transaction_id`),
  ADD KEY `idx_status` (`payment_status`),
  ADD KEY `idx_razorpay_order_id` (`razorpay_order_id`),
  ADD KEY `idx_razorpay_payment_id` (`razorpay_payment_id`),
  ADD KEY `idx_webhook_received` (`webhook_received`);

--
-- Indexes for table `razorpay_orders`
--
ALTER TABLE `razorpay_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_rzp_order_id` (`rzp_order_id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_app_order_id` (`app_order_id`);

--
-- Indexes for table `razorpay_webhook_log`
--
ALTER TABLE `razorpay_webhook_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_event` (`event`),
  ADD KEY `idx_payment_id` (`payment_id`),
  ADD KEY `idx_order_id` (`order_id`),
  ADD KEY `idx_processed` (`processed`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_code` (`service_code`),
  ADD KEY `idx_category` (`service_category`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_featured` (`is_featured`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_code` (`category_code`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_order` (`display_order`);

--
-- Indexes for table `service_items`
--
ALTER TABLE `service_items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`),
  ADD KEY `idx_type` (`item_type`),
  ADD KEY `idx_gender` (`gender`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_order` (`display_order`);

--
-- Indexes for table `service_pricing`
--
ALTER TABLE `service_pricing`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_category_item` (`category_id`,`item_id`),
  ADD KEY `idx_category` (`category_id`),
  ADD KEY `idx_item` (`item_id`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_featured` (`is_featured`);

--
-- Indexes for table `service_reminders`
--
ALTER TABLE `service_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `idx_customer` (`customer_id`),
  ADD KEY `idx_date` (`reminder_date`),
  ADD KEY `idx_status` (`status`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `idx_key` (`setting_key`),
  ADD KEY `idx_group` (`setting_group`);

--
-- Indexes for table `support_queries`
--
ALTER TABLE `support_queries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_number` (`ticket_number`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `replied_by` (`replied_by`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_ticket` (`ticket_number`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_priority` (`priority`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mobile` (`mobile`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `added_by` (`added_by`),
  ADD KEY `idx_role` (`role`),
  ADD KEY `idx_mobile` (`mobile`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_city` (`city`),
  ADD KEY `idx_source` (`customer_source`),
  ADD KEY `idx_registration` (`registration_type`),
  ADD KEY `idx_customer_type` (`customer_type`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_default` (`is_default`),
  ADD KEY `idx_city` (`city`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `business_inquiries`
--
ALTER TABLE `business_inquiries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `category_items`
--
ALTER TABLE `category_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `delivery_earnings`
--
ALTER TABLE `delivery_earnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=233;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `password_reset_otp`
--
ALTER TABLE `password_reset_otp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `razorpay_orders`
--
ALTER TABLE `razorpay_orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `razorpay_webhook_log`
--
ALTER TABLE `razorpay_webhook_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `service_items`
--
ALTER TABLE `service_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `service_pricing`
--
ALTER TABLE `service_pricing`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `service_reminders`
--
ALTER TABLE `service_reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `support_queries`
--
ALTER TABLE `support_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `business_inquiries`
--
ALTER TABLE `business_inquiries`
  ADD CONSTRAINT `business_inquiries_ibfk_1` FOREIGN KEY (`handled_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_fk_pricing` FOREIGN KEY (`pricing_id`) REFERENCES `service_pricing` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_items`
--
ALTER TABLE `category_items`
  ADD CONSTRAINT `category_items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_items_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `service_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD CONSTRAINT `contact_messages_ibfk_1` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD CONSTRAINT `customer_notes_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `customer_notes_ibfk_2` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_assignments`
--
ALTER TABLE `delivery_assignments`
  ADD CONSTRAINT `delivery_assignments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_assignments_ibfk_2` FOREIGN KEY (`delivery_boy_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `delivery_earnings`
--
ALTER TABLE `delivery_earnings`
  ADD CONSTRAINT `delivery_earnings_ibfk_1` FOREIGN KEY (`delivery_boy_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_earnings_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `delivery_earnings_ibfk_3` FOREIGN KEY (`assignment_id`) REFERENCES `delivery_assignments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `feedback_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `feedback_ibfk_3` FOREIGN KEY (`delivery_boy_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `feedback_ibfk_4` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`offer_id`) REFERENCES `offers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`delivery_boy_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_otp`
--
ALTER TABLE `password_reset_otp`
  ADD CONSTRAINT `password_reset_otp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_pricing`
--
ALTER TABLE `service_pricing`
  ADD CONSTRAINT `fk_pricing_category` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pricing_item` FOREIGN KEY (`item_id`) REFERENCES `service_items` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `service_pricing_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `service_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_pricing_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `service_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `service_reminders`
--
ALTER TABLE `service_reminders`
  ADD CONSTRAINT `service_reminders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `service_reminders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `settings`
--
ALTER TABLE `settings`
  ADD CONSTRAINT `settings_ibfk_1` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `support_queries`
--
ALTER TABLE `support_queries`
  ADD CONSTRAINT `support_queries_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `support_queries_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `support_queries_ibfk_3` FOREIGN KEY (`replied_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `user_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
