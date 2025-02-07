-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 18, 2023 at 02:56 PM
-- Server version: 10.6.11-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u307874657_vega`
--

-- --------------------------------------------------------

--
-- Table structure for table `bank_accounts`
--

CREATE TABLE `bank_accounts` (
  `id` int(11) NOT NULL,
  `bank_name` varchar(225) NOT NULL,
  `bank_sube` varchar(225) NOT NULL,
  `bank_hesap` varchar(225) NOT NULL,
  `bank_iban` text NOT NULL,
  `bank_alici` varchar(225) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` text NOT NULL,
  `category_line` double NOT NULL,
  `category_type` enum('1','2') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '2',
  `category_secret` enum('1','2') NOT NULL DEFAULT '2',
  `category_icon` text NOT NULL,
  `is_refill` enum('true','false') NOT NULL DEFAULT 'false'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_line`, `category_type`, `category_secret`, `category_icon`, `is_refill`) VALUES
(1, 'Youtube', 1, '2', '2', ' ', 'false');

-- --------------------------------------------------------

--
-- Table structure for table `childpanels`
--

CREATE TABLE `childpanels` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `domain` varchar(191) NOT NULL,
  `currency` varchar(191) NOT NULL,
  `child_username` varchar(191) NOT NULL,
  `child_password` varchar(191) NOT NULL,
  `charge` double NOT NULL,
  `status` enum('active','terminated','disabled') NOT NULL,
  `renewal_date` date NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(225) NOT NULL,
  `email` varchar(225) NOT NULL,
  `username` varchar(225) NOT NULL,
  `password` text NOT NULL,
  `telephone` varchar(225) DEFAULT NULL,
  `balance` double NOT NULL DEFAULT 0,
  `balance_type` enum('1','2') NOT NULL DEFAULT '2',
  `debit_limit` double DEFAULT NULL,
  `spent` double NOT NULL DEFAULT 0,
  `register_date` datetime NOT NULL,
  `login_date` datetime DEFAULT NULL,
  `login_ip` varchar(225) DEFAULT NULL,
  `apikey` text NOT NULL,
  `tel_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `email_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `client_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF',
  `access` text DEFAULT NULL,
  `lang` varchar(255) NOT NULL DEFAULT 'tr',
  `timezone` double NOT NULL DEFAULT 0,
  `currency` varchar(255) NOT NULL DEFAULT 'USD',
  `c_symbol` varchar(255) NOT NULL DEFAULT '$'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `username`, `password`, `telephone`, `balance`, `balance_type`, `debit_limit`, `spent`, `register_date`, `login_date`, `login_ip`, `apikey`, `tel_type`, `email_type`, `client_type`, `access`, `lang`, `timezone`, `currency`, `c_symbol`) VALUES
(1, 'Smm PAnel Script Store', 'admin@smmpanelscript.store', 'admin', '0d29057a22290be9b317993377988761', '+91 8233291449', 0, '2', NULL, 0, '2023-02-17 14:32:54', '2023-02-17 14:33:26', '2401:4900:1c1b:91c3:7185:25a2:5d7c:5640', '9f01b3dc7c51330abe6b1ec59286eb96', '1', '1', '2', '{\"admin_access\":\"1\",\"users\":\"1\",\"orders\":\"1\",\"subscriptions\":\"1\",\"dripfeed\":\"1\",\"services\":\"1\",\"payments\":\"1\",\"tickets\":\"1\",\"reports\":\"1\",\"general_settings\":\"1\",\"pages\":\"1\",\"payments_settings\":\"1\",\"bank_accounts\":\"1\",\"payments_bonus\":\"1\",\"alert_settings\":\"1\",\"providers\":\"1\",\"themes\":\"1\",\"admins\":\"1\",\"language\":\"1\",\"meta\":\"1\",\"child-panels\":\"1\",\"proxy\":\"1\",\"currency\":\"1\",\"kuponlar\":\"1\"}', 'en', 0, 'USD', '$');

-- --------------------------------------------------------

--
-- Table structure for table `clients_category`
--

CREATE TABLE `clients_category` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_price`
--

CREATE TABLE `clients_price` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `service_price` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients_service`
--

CREATE TABLE `clients_service` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_report`
--

CREATE TABLE `client_report` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `action` text NOT NULL,
  `report_ip` varchar(225) NOT NULL,
  `report_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `client_report`
--

INSERT INTO `client_report` (`id`, `client_id`, `action`, `report_ip`, `report_date`) VALUES
(1, 229, 'Yönetici girişi yapıldı.', '47.31.183.202', '2022-07-22 13:35:00'),
(2, 229, 'Yönetici girişi yapıldı.', '47.29.174.143', '2022-07-22 13:36:11'),
(3, 229, 'Member logged in.', '47.29.174.143', '2022-07-22 13:38:21'),
(4, 230, 'User registered.', '66.69.41.7', '2022-07-22 20:04:42'),
(5, 230, 'Member logged in.', '66.69.41.7', '2022-07-22 20:04:57'),
(6, 231, 'User registered.', '103.99.198.198', '2022-07-22 21:53:44'),
(7, 231, 'Member logged in.', '103.99.198.198', '2022-07-22 21:54:01'),
(8, 231, 'Yeni destek talebi oluşturuldu #1', '103.99.198.198', '2022-07-22 22:02:35'),
(9, 229, 'API Key changed', '47.29.175.21', '2022-07-22 22:49:45'),
(10, 229, 'API Key changed', '47.29.175.21', '2022-07-22 22:49:53'),
(11, 229, 'Yeni destek talebi oluşturuldu #2', '47.29.175.21', '2022-07-22 22:50:21'),
(12, 232, 'User registered.', '47.29.175.21', '2022-07-22 22:52:06'),
(13, 229, 'Member logged in.', '47.29.175.21', '2022-07-22 22:52:17'),
(14, 230, 'Member logged in.', '172.56.15.54', '2022-07-23 04:54:33'),
(15, 233, 'User registered.', '175.176.5.201', '2022-07-23 07:23:30'),
(16, 233, 'Member logged in.', '175.176.5.201', '2022-07-23 07:24:13'),
(17, 234, 'User registered.', '175.176.61.40', '2022-07-23 09:05:40'),
(18, 234, 'Member logged in.', '175.176.61.40', '2022-07-23 09:05:47'),
(19, 235, 'User registered.', '42.111.224.131', '2022-07-23 10:25:08'),
(20, 231, 'Member logged in.', '84.17.37.72', '2022-07-23 19:44:12'),
(21, 236, 'User registered.', '84.17.37.72', '2022-07-23 20:12:21'),
(22, 236, 'Member logged in.', '84.17.37.72', '2022-07-23 20:12:39'),
(23, 236, 'API Key changed', '84.17.37.72', '2022-07-23 20:13:15'),
(24, 231, 'Member logged in.', '185.225.234.144', '2022-07-23 20:37:51'),
(25, 231, 'Member logged in.', '185.225.234.144', '2022-07-23 20:39:17'),
(26, 231, 'Yeni destek talebi oluşturuldu #3', '103.158.170.41', '2022-07-23 20:52:02'),
(27, 231, 'Destek talebine yanıt verildi #3', '103.158.170.41', '2022-07-23 20:52:11'),
(28, 229, 'Member logged in.', '47.29.172.73', '2022-07-23 21:24:59'),
(29, 229, 'Yönetici girişi yapıldı.', '157.37.215.224', '2022-07-23 21:33:26'),
(30, 229, 'Yönetici girişi yapıldı.', '157.37.215.224', '2022-07-23 22:00:49'),
(31, 237, 'User registered.', '47.9.1.70', '2022-07-23 22:40:23'),
(32, 237, 'Member logged in.', '47.9.1.70', '2022-07-23 22:40:48'),
(33, 231, 'Member logged in.', '103.158.170.41', '2022-07-24 11:09:50'),
(34, 231, 'Member logged in.', '103.158.170.41', '2022-07-24 13:30:19'),
(35, 231, 'Member logged in.', '103.158.170.41', '2022-07-24 20:43:33'),
(36, 238, 'User registered.', '157.38.136.220', '2022-07-25 09:19:41'),
(37, 238, 'Member logged in.', '157.38.136.220', '2022-07-25 09:22:35'),
(38, 231, 'Member logged in.', '103.158.170.41', '2022-07-25 15:39:22'),
(39, 229, 'Member logged in.', '47.29.173.40', '2022-07-25 15:59:24'),
(40, 239, 'User registered.', '49.144.217.91', '2022-07-26 13:38:16'),
(41, 239, 'Member logged in.', '49.144.217.91', '2022-07-26 13:38:28'),
(42, 240, 'User registered.', '106.206.177.188', '2022-07-26 19:20:53'),
(43, 240, 'Member logged in.', '106.206.177.188', '2022-07-26 19:21:07'),
(44, 241, 'User registered.', '175.176.81.151', '2022-07-27 01:31:23'),
(45, 241, 'Member logged in.', '175.176.81.151', '2022-07-27 01:31:31'),
(46, 242, 'User registered.', '117.225.158.68', '2022-07-28 08:49:25'),
(47, 242, 'Member logged in.', '117.225.158.68', '2022-07-28 08:49:38'),
(48, 243, 'User registered.', '105.159.90.224', '2022-07-29 17:11:01'),
(49, 243, 'Member logged in.', '105.159.90.224', '2022-07-29 17:11:26'),
(50, 244, 'User registered.', '157.39.56.233', '2022-07-29 22:05:24'),
(51, 244, 'Member logged in.', '157.39.56.233', '2022-07-29 22:05:32'),
(52, 229, 'Yönetici girişi yapıldı.', '47.29.173.186', '2022-07-30 20:49:10'),
(53, 229, 'Member logged in.', '47.31.191.98', '2022-07-30 22:07:40'),
(54, 229, 'Member logged in.', '47.31.152.230', '2022-07-31 09:05:46'),
(55, 245, 'User registered.', '202.142.121.78', '2022-07-31 15:17:42'),
(56, 245, 'Member logged in.', '202.142.121.78', '2022-07-31 15:18:02'),
(57, 246, 'User registered.', '37.120.7.10', '2022-08-01 07:02:11'),
(58, 246, 'Member logged in.', '37.120.7.10', '2022-08-01 07:02:18'),
(59, 247, 'User registered.', '157.39.251.237', '2022-08-01 09:19:03'),
(60, 248, 'User registered.', '157.39.251.237', '2022-08-01 09:19:54'),
(61, 249, 'User registered.', '157.39.251.237', '2022-08-01 09:20:37'),
(62, 249, 'Member logged in.', '157.39.251.237', '2022-08-01 09:20:48'),
(63, 250, 'User registered.', '132.154.155.6', '2022-08-01 09:54:58'),
(64, 250, 'Member logged in.', '132.154.155.6', '2022-08-01 09:55:10'),
(65, 251, 'User registered.', '39.42.84.231', '2022-08-02 01:45:14'),
(66, 251, 'Member logged in.', '39.42.84.231', '2022-08-02 01:46:01'),
(67, 252, 'User registered.', '197.210.84.130', '2022-08-02 02:29:34'),
(68, 252, 'Member logged in.', '197.210.84.130', '2022-08-02 02:29:49'),
(69, 252, '0 A new order amounting to Your Currency has been placed #.', '197.210.84.130', '2022-08-02 02:29:51'),
(70, 253, 'User registered.', '205.253.60.241', '2022-08-02 14:35:17'),
(71, 253, 'Member logged in.', '205.253.60.241', '2022-08-02 14:35:33'),
(72, 254, 'User registered.', '47.9.178.24', '2022-08-02 14:36:32'),
(73, 254, 'Member logged in.', '47.9.178.24', '2022-08-02 14:37:23'),
(74, 255, 'User registered.', '103.5.18.130', '2022-08-02 16:00:25'),
(75, 255, 'Member logged in.', '103.5.18.130', '2022-08-02 16:01:17'),
(76, 256, 'User registered.', '139.167.215.195', '2022-08-02 16:18:59'),
(77, 256, 'Member logged in.', '139.167.215.195', '2022-08-02 16:20:41'),
(78, 257, 'User registered.', '223.225.246.81', '2022-08-02 18:16:40'),
(79, 257, 'Member logged in.', '223.225.246.81', '2022-08-02 18:16:57'),
(80, 258, 'User registered.', '169.149.193.8', '2022-08-02 21:04:48'),
(81, 258, 'Member logged in.', '169.149.193.8', '2022-08-02 21:05:02'),
(82, 259, 'User registered.', '197.210.70.61', '2022-08-03 10:27:56'),
(83, 259, 'Member logged in.', '197.210.70.61', '2022-08-03 10:29:09'),
(84, 229, 'Member logged in.', '157.37.192.232', '2022-08-03 12:54:37'),
(85, 2, 'Yönetici girişi yapıldı.', '157.37.192.232', '2022-08-03 13:15:29'),
(86, 260, 'User registered.', '132.154.183.114', '2022-08-03 13:31:10'),
(87, 260, 'Member logged in.', '132.154.183.114', '2022-08-03 13:32:08'),
(88, 1, 'User registered.', '2401:4900:1c1b:91c3:7185:25a2:5d7c:5640', '2023-02-17 14:32:54'),
(89, 1, 'Yönetici girişi yapıldı.', '2401:4900:1c1b:91c3:7185:25a2:5d7c:5640', '2023-02-17 14:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `kuponlar`
--

CREATE TABLE `kuponlar` (
  `id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `adet` int(11) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kupon_kullananlar`
--

CREATE TABLE `kupon_kullananlar` (
  `id` int(11) NOT NULL,
  `uye_id` int(11) NOT NULL,
  `kuponadi` varchar(255) NOT NULL,
  `tutar` double NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language_name` varchar(225) NOT NULL,
  `language_code` varchar(225) NOT NULL,
  `language_type` enum('2','1') NOT NULL DEFAULT '2',
  `default_language` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language_name`, `language_code`, `language_type`, `default_language`) VALUES
(1, 'Türkçe', 'tr', '1', '0'),
(2, 'English', 'en', '2', '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `api_orderid` int(11) NOT NULL DEFAULT 0,
  `order_error` text NOT NULL,
  `order_detail` text DEFAULT NULL,
  `order_api` int(11) NOT NULL DEFAULT 0,
  `api_serviceid` int(11) NOT NULL DEFAULT 0,
  `api_charge` double NOT NULL DEFAULT 0,
  `api_currencycharge` double DEFAULT 1,
  `order_profit` double NOT NULL,
  `order_quantity` double NOT NULL,
  `order_extras` text NOT NULL,
  `order_charge` double NOT NULL,
  `dripfeed` enum('1','2','3') DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_id` double NOT NULL DEFAULT 0,
  `subscriptions_id` double NOT NULL DEFAULT 0,
  `subscriptions_type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '2 -> ON, 1 -> OFF',
  `dripfeed_totalcharges` double DEFAULT NULL,
  `dripfeed_runs` double DEFAULT NULL,
  `dripfeed_delivery` double NOT NULL DEFAULT 0,
  `dripfeed_interval` double DEFAULT NULL,
  `dripfeed_totalquantity` double DEFAULT NULL,
  `dripfeed_status` enum('active','completed','canceled') NOT NULL DEFAULT 'active',
  `order_url` text NOT NULL,
  `order_start` double NOT NULL DEFAULT 0,
  `order_finish` double NOT NULL DEFAULT 0,
  `order_remains` double NOT NULL DEFAULT 0,
  `order_create` datetime NOT NULL,
  `order_status` enum('pending','inprogress','completed','partial','processing','canceled') NOT NULL DEFAULT 'pending',
  `subscriptions_status` enum('active','paused','completed','canceled','expired','limit') NOT NULL DEFAULT 'active',
  `subscriptions_username` text DEFAULT NULL,
  `subscriptions_posts` double DEFAULT NULL,
  `subscriptions_delivery` double NOT NULL DEFAULT 0,
  `subscriptions_delay` double DEFAULT NULL,
  `subscriptions_min` double DEFAULT NULL,
  `subscriptions_max` double DEFAULT NULL,
  `subscriptions_expiry` date DEFAULT NULL,
  `is_refill` enum('true','false') NOT NULL DEFAULT 'false',
  `last_check` datetime NOT NULL,
  `order_where` enum('site','api') NOT NULL DEFAULT 'site',
  `show_refill` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `page_id` int(11) NOT NULL,
  `page_name` varchar(225) NOT NULL,
  `page_get` varchar(225) NOT NULL,
  `page_content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`page_id`, `page_name`, `page_get`, `page_content`) VALUES
(2, 'New Order', 'neworder', '<div class=\"new-order__content-title\" style=\"margin-bottom: 10px; color: rgb(12, 49, 92); font-family: Cairo; font-size: 16px; font-weight: 600;\"><div class=\"position-relative\" style=\"position: relative !important;\"><h3 style=\"margin-bottom: 0px; font-weight: 700; line-height: 32px; letter-spacing: 0px; color: rgb(12, 49, 92); font-family: Cairo;\">Need to make your online presence noticeable?</h3></div></div><div class=\"new-order__content-text\" style=\"margin-bottom: 10px; color: rgb(12, 49, 92); font-family: Cairo; font-size: 16px; font-weight: 600;\"><p style=\"margin-bottom: 0px;\">We can help you with that! You can achieve great exposure online using automated SMM services we offer on our panel.</p><p style=\"margin-bottom: 0px;\"><br></p><p style=\"margin-bottom: 0px;\">All you have to do is to place an order, and everything will be done for you. We accept different payment methods to make adding funds to your account super convenient.</p></div>'),
(4, 'Add Funds', 'addfunds', '<h3><b style=\"color: rgb(255, 0, 0);\">If You face any Problem related to Add Funds Please Create Support Ticket <a href=\"https://smmpanelscript.store/\" target=\"_blank\">Here</a></b></h3>'),
(6, 'Terms', 'terms', '<h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><b style=\"\">Terms of Service</b></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><b>General</b>: By placing an order with Our Panel, you automatically accept all the below-listed terms of service weather you read them or not.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">We reserve the right to change these terms of service without notice. You are expected to read all terms of service before placing an order to ensure you are up to date with any changes or any future changes.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">You will only use the Our Panel website in a manner which follows all agreements made with Instagram/Facebook/Twitter/Youtube/Other social media site on their individual Terms of Service page. Our Panel rates are subject to change at any time without notice. The payment/refund policy stays in effect in the case of rate changes. Our Panel does not guarantee a delivery time for any services. We offer our best estimation for when the order will be delivered. This is only an estimation and Our Panel will not refund orders that are processing if you feel they are taking too long. Our Panel tries hard to deliver exactly what is expected from us by our re-sellers. In this case, we reserve the right to change a service type if we deem it necessary to complete an order.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><b>Disclaimer</b>:</font></h3><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">Our Panel will not be responsible for any damages you or your business may suffer.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><b>Liabilities</b>:</font></h3><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">Our Panel is in no way liable for any account suspension or picture deletion done by Instagram or Twitter or Facebook or YouTube or Other Social Media.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><b>Service</b>: Our Panel will only be used to promote your Instagram/Twitter/Facebook or Social account and help boost your \"Appearance\" only.</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">We DO NOT guarantee your new followers will interact with you, we simply guarantee you to get the followers you pay for.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">We DO NOT guarantee 100% of our accounts will have a profile picture, full bio and uploaded pictures, although we strive to make this the reality for all accounts.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">You will not upload anything into the Our Panel site including nudity or any material that is not accepted or suitable for the Instagram/Twitter/Facebook or Social Media community.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Private accounts would not get a refund! Please ensure that your account is public before ordering.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><b>Refund Policy</b>: No refunds will be made to your payment method. After a deposit has been completed, there is no way to reverse it. You must use your balance on orders from Our Panel</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">You agree that once you complete a payment, you will not file a dispute or a chargeback against us for any reason.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">If you file a dispute or charge-back against us after a deposit, we reserve the right to terminate all future orders, ban you from our site. We also reserve the right to take away any followers or likes we delivered to your or your clients Instagram/Facebook/Twitter or other social media account.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Orders placed in Our Panel will not be refunded or cancelled after they are placed. You will receive a refund credit to your Our Panel account if the order is non-deliverable&nbsp;</font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Misplaced or Private account orders will not qualify for a refund. Be sure to confirm each and every order before placing it.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Fraudulent activity such as using unauthorized or stolen credit cards will lead to termination of your account. There are no exceptions.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Please do not use more than one server at the same time for the same page. We cannot give you the correct followers/likes number in that case. We will not refund for these orders</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><b>Privacy Policy</b>: This policy covers how we use your personal information. We take your privacy seriously and will take all measures to protect your personal information.</font></h4><h4 style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\"><br></font><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\">Any personal information received will only be used to fill your order. We will not sell or redistribute your personal information to anyone. All personal information is encrypted and saved in secure servers</font></h4><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\"><br></font></h3><h3 class=\"terms\" style=\"\"><font face=\"Ubuntu, Tahoma, Helvetica Neue, Helvetica, Arial, sans-serif\" style=\"\">&nbsp;</font></h3>'),
(7, 'FAQs', 'faq', '<h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><u style=\"background-color: rgb(255, 255, 255);\">Frequently Asked Questions:</u></h3><h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><span style=\"font-family: inherit; background-color: rgb(255, 255, 255);\">What is the partial status?</span></h3><span style=\"background-color: rgb(255, 255, 255);\"><div style=\"text-align: center;\">Partial Status is when we partially refund the remains of an order. Sometimes for some reason, we are unable to deliver a full order, so we refund you the remaining undelivered amount. Example: You bought an order with quantity 10,000 and charges 10$, let\'s say we delivered 9 000 and the remaining 1 000 we couldn\'t deliver, then we will \"Partial\" the order and refund you the remaining 1 000 (1$ in this example). You can try placing a New Order again.</div></span><h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><span style=\"background-color: rgb(255, 255, 255);\">When Will My Order be Completed?</span></h3><span style=\"background-color: rgb(255, 255, 255);\"><div style=\"text-align: center;\">In Most Cases, The Orders get Completed within 24 Hours. In an Extreme rare case if the Order isn\'t Started You can Always&nbsp;Create a Support Ticket&nbsp;if an Order is not Started Even After Passing 24 Hours.</div></span><p style=\"\"></p><p style=\"\"></p><h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><span style=\"font-family: inherit; background-color: rgb(255, 255, 255);\">What is Refill?</span></h3><span style=\"background-color: rgb(255, 255, 255);\"><div style=\"text-align: center;\">When there is a drop in the Followers or Likes, then&nbsp;<a target=\"_blank\" rel=\"nofollow\" href=\"https://paytosmm.com/\" style=\"\">t</a>he Quantity which is dropped will be given again by the Our Panel without any Extra Charges. Click on the Refill button on the order page to get a refill.</div></span><p style=\"\"></p><h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><span style=\"font-family: inherit; background-color: rgb(255, 255, 255);\">Order Canceled?</span></h3><p style=\"text-align: center;\"><span style=\"background-color: rgb(255, 255, 255);\">If your Order Status is Showing Cancelled, Don\'t Worry<a target=\"_blank\" rel=\"nofollow\" href=\"https://paytosmm.com/\" style=\"\">.</a>&nbsp;It may happen in some extreme cases. Check whether the Account is in Private and the link provided is Working. Sometimes the order will be Cancelled from the server-side if cant able to deliver.&nbsp;</span></p><h3 style=\"text-align: center; font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; line-height: 1.2;\"><span style=\"background-color: rgb(255, 255, 255);\">What is Drip Feed?</span></h3><p style=\"text-align: center;\"><span style=\"background-color: rgb(255, 255, 255);\">Drip Feed is a service that we are offering so you would be able to put the same order multiple times automatically. Example: let\'s say you want to get 1000 likes on your Instagram Post but you want to get 100 likes each 30 minutes, you will put Link: Your Post Link Quantity: 100 Runs: 10 (as you want to run this order 10 times, if you want to get 2000 likes, you will run it 20 times, etc…) Interval: 30 (because you want to get 100 likes on your post every 30 minutes, if you want each hour, you will put 60 because the time is in minutes) P.S: Never order more quantity than the maximum which is written on the service name (Quantity x Runs), Example if the service\'s max is 4000, you don’t put Quantity: 500 and Run: 10, because the total quantity will be 500x10 = 5000 which is bigger than the service max (4000). Also never put the Interval below the actual start time (some services need 60 minutes to start, don’t put Interval less than the service start time or it will cause a fail in your order).<br></span></p><p style=\"text-align: center;\"><b style=\"background-color: rgb(255, 255, 255);\">IMPORTANT:&nbsp;Please do not use more than one Package to the same link Unless the Previous one is Completed/Partial/Cancelled. We cannot give you the correct followers/likes number in that case. We will not refund these orders. Canceled Orders Will be Refunded Automatically to your Panel.</b></p><p style=\"text-align: center;\"><span style=\"background-color: rgb(255, 255, 255);\"><b>NOTE:&nbsp;You should not place two orders for the same Link either in the Panel or any other Resellers Panel. A refund will not be done in this case. SMM panel</b><br></span></p><div style=\"text-align: center; \"><b><br></b></div>');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client_balance` double NOT NULL DEFAULT 0,
  `payment_amount` double NOT NULL,
  `payment_privatecode` double DEFAULT NULL,
  `payment_method` int(11) NOT NULL,
  `payment_status` enum('1','2','3') NOT NULL DEFAULT '1',
  `payment_delivery` enum('1','2') NOT NULL DEFAULT '1',
  `payment_note` text NOT NULL,
  `payment_mode` enum('Manuel','Otomatik') NOT NULL DEFAULT 'Otomatik',
  `payment_create_date` datetime NOT NULL,
  `payment_update_date` datetime NOT NULL,
  `payment_ip` varchar(225) NOT NULL,
  `payment_extra` text NOT NULL,
  `payment_bank` int(11) NOT NULL,
  `t_id` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `client_id`, `client_balance`, `payment_amount`, `payment_privatecode`, `payment_method`, `payment_status`, `payment_delivery`, `payment_note`, `payment_mode`, `payment_create_date`, `payment_update_date`, `payment_ip`, `payment_extra`, `payment_bank`, `t_id`) VALUES
(1, 231, 0, 10, NULL, 13, '1', '1', '', 'Otomatik', '2022-07-22 22:12:38', '0000-00-00 00:00:00', '103.99.198.198', '3fc9610ac8cc2f1243be5c71c15a7dc2', 0, NULL),
(2, 229, 0, 10, NULL, 15, '1', '1', '', 'Otomatik', '2022-07-23 21:54:51', '0000-00-00 00:00:00', '157.37.215.224', '1658593491', 0, NULL),
(3, 229, 0, 100, NULL, 1, '1', '1', '', '', '2022-07-23 22:16:18', '0000-00-00 00:00:00', '157.37.215.224', '78fa06daa2e2398addfd112c430d1667', 0, NULL),
(4, 229, 0, 100, NULL, 15, '1', '1', '', 'Otomatik', '2022-07-31 09:11:41', '0000-00-00 00:00:00', '47.31.152.230', '1659238901', 0, NULL),
(5, 229, 0, 1, NULL, 15, '1', '1', '', 'Otomatik', '2022-07-31 09:15:29', '0000-00-00 00:00:00', '47.31.152.230', '1659239129', 0, NULL),
(6, 249, 0, 0.013333333333333, NULL, 12, '1', '1', '', '', '2022-08-01 09:24:18', '0000-00-00 00:00:00', '157.39.251.237', 'ORDS5233445', 0, NULL),
(7, 256, 0, 0.13333333333333, NULL, 12, '1', '1', '', '', '2022-08-02 16:24:43', '0000-00-00 00:00:00', '139.167.215.195', 'ORDS70123166', 0, NULL),
(8, 256, 0, 0.13333333333333, NULL, 12, '1', '1', '', '', '2022-08-02 16:26:02', '0000-00-00 00:00:00', '139.167.215.195', 'ORDS15187571', 0, NULL),
(9, 256, 0, 10, NULL, 13, '1', '1', '', 'Otomatik', '2022-08-02 16:26:18', '0000-00-00 00:00:00', '139.167.215.195', '5c483d085bd2bf5eebec97310da43d98', 0, NULL),
(10, 256, 0, 0.13333333333333, NULL, 12, '1', '1', '', '', '2022-08-02 16:26:30', '0000-00-00 00:00:00', '139.167.215.195', 'ORDS17931849', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments_bonus`
--

CREATE TABLE `payments_bonus` (
  `bonus_id` int(11) NOT NULL,
  `bonus_method` int(11) NOT NULL,
  `bonus_from` double NOT NULL,
  `bonus_amount` double NOT NULL,
  `bonus_type` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `method_name` varchar(225) NOT NULL,
  `method_get` varchar(225) NOT NULL,
  `method_min` double NOT NULL,
  `method_max` double NOT NULL,
  `method_type` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> ON, 1 -> OFF	',
  `method_extras` text NOT NULL,
  `method_line` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `method_name`, `method_get`, `method_min`, `method_max`, `method_type`, `method_extras`, `method_line`) VALUES
(1, 'Paypal', 'paypal', 10, 0, '2', '{\"method_type\":\"2\",\"name\":\"Paypal ( International Payments )\",\"min\":\"10\",\"max\":\"0\",\"client_id\":\"AR3wtI3dxA0qU2dme-kQdC6csRL4whF8SNWzJ2jilchyZvQsBJ7URF4UqktveDp67guIenYYX-e0zuCz\",\"client_secret\":\"EMFtatHjrBMf9EYcec0WZqKwGwO2aum03w62b9tZZWPB2G__WoFuBMkMu0z97NR8ooRJNXR0FqrtagrD\",\"fee\":\"10\"}', 3),
(2, 'stipe', 'stripe', 10, 10000, '2', ' {\"method_type\":\"2\",\"name\":\"Stripe\",\"min\":\"1\",\"max\":\"100\",\"stripe_publishable_key\":\"\",\"stripe_secret_key\":\"\",\"stripe_webhooks_secret\":\"\",\"fee\":\"\",\"currency\":\"inr\"}', 4),
(12, 'PayTM', 'paytm', 1, 10000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM ( INR )( UPI \\/ NET BANKING \\/ DEBIT \\/ CREDIT CARD)\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"CECWon%!c5iOAkGy\",\"merchant_mid\":\"HYJEZD46937702834501\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 2),
(13, 'RazorPay', 'razorpay', 1, 0, '2', '{\"method_type\":\"2\",\"name\":\"Razorpay\",\"min\":\"1\",\"max\":\"0\",\"public_key\":\"rzp_test_i2FFGuIEvPDig7\",\"key_secret\":\"djBffjsBkWHWjSbCoNRGIg60\",\"merchant_website\":\"https:\\/\\/api.razorpay.com\\/v1\\/orders\",\"fee\":\"0\"}', 1),
(14, 'PayTM QR', 'paytmqr', 1, 10000, '2', '{\"method_type\":\"2\",\"name\":\"PayTM Scan and Pay\",\"min\":\"1\",\"max\":\"10000\",\"merchant_key\":\"Paytm Qr.jpg\",\"merchant_mid\":\"XVXSYH98271468991324\",\"merchant_website\":\"DEFAULT\",\"fee\":\"0\"}', 10),
(15, 'Perfect Money', 'perfectmoney', 1, 100000, '2', '{\"method_type\":\"2\",\"name\":\"Perfect Money \",\"min\":\"1\",\"max\":\"100000\",\"passphrase\":\"Z42Rbx263TFzBDbQWAeFkzvwN\",\"usd\":\"U36155289\",\"merchant_website\":\"fastsmmbrand.com\",\"fee\":\"0\"}', 10),
(99, 'Payumoney', 'payumoney', 1, 10, '2', '{\"method_type\":\"2\",\"name\":\"Payumoney\",\"min\":\"1\",\"max\":\"10\",\"merchant_key\":\"ZfWFWr\",\"salt\":\"Bq4BOBCM67ZyXI6z4CkRqdZ2Z8oW9lXK\",\"fee\":\"10\",\"currency\":\"\"}', 3);

-- --------------------------------------------------------

--
-- Table structure for table `refill_status`
--

CREATE TABLE `refill_status` (
  `id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `order_id` int(99) NOT NULL,
  `order_apiid` int(99) NOT NULL,
  `refill_apiid` int(99) NOT NULL,
  `refill_status` text NOT NULL,
  `creation_date` datetime NOT NULL,
  `order_url` text NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `serviceapi_alert`
--

CREATE TABLE `serviceapi_alert` (
  `id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `serviceapi_alert` text NOT NULL,
  `servicealert_extra` text NOT NULL,
  `servicealert_date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `service_api` int(11) NOT NULL DEFAULT 0,
  `api_service` int(11) NOT NULL DEFAULT 0,
  `api_servicetype` enum('1','2') NOT NULL DEFAULT '2',
  `api_detail` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `service_line` double NOT NULL,
  `service_type` enum('1','2') NOT NULL DEFAULT '2',
  `service_package` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17') NOT NULL,
  `service_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `service_description` text DEFAULT NULL,
  `service_price` varchar(255) NOT NULL DEFAULT '0',
  `service_min` double NOT NULL,
  `service_max` double NOT NULL,
  `service_dripfeed` enum('1','2') NOT NULL DEFAULT '1',
  `service_autotime` double NOT NULL DEFAULT 0,
  `service_autopost` double NOT NULL DEFAULT 0,
  `service_speed` enum('1','2','3','4') NOT NULL,
  `want_username` enum('1','2') NOT NULL DEFAULT '1',
  `service_secret` enum('1','2') NOT NULL DEFAULT '2',
  `price_type` enum('normal','percent','amount') NOT NULL DEFAULT 'normal',
  `price_cal` text DEFAULT NULL,
  `instagram_second` enum('1','2') NOT NULL DEFAULT '2',
  `start_count` enum('none','instagram_follower','instagram_photo','') NOT NULL,
  `instagram_private` enum('1','2') NOT NULL,
  `name_lang` text DEFAULT NULL,
  `description_lang` text DEFAULT NULL,
  `service_refill` enum('0','1') NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_api`
--

CREATE TABLE `service_api` (
  `id` int(11) NOT NULL,
  `api_name` varchar(225) NOT NULL,
  `api_url` text NOT NULL,
  `api_key` varchar(225) NOT NULL,
  `api_type` int(11) NOT NULL,
  `api_limit` double NOT NULL DEFAULT 0,
  `currency` enum('INR','USD') DEFAULT NULL,
  `api_alert` enum('1','2') NOT NULL DEFAULT '2' COMMENT '2 -> Gönder, 1 -> Gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `site_seo` text NOT NULL,
  `site_title` text DEFAULT NULL,
  `site_description` text DEFAULT NULL,
  `site_keywords` text DEFAULT NULL,
  `site_logo` text DEFAULT NULL,
  `site_name` text DEFAULT NULL,
  `site_currency` varchar(2555) NOT NULL DEFAULT 'try',
  `favicon` text DEFAULT NULL,
  `site_language` varchar(225) NOT NULL DEFAULT 'tr',
  `site_theme` text NOT NULL,
  `site_theme_alt` text DEFAULT NULL,
  `recaptcha` enum('1','2') NOT NULL DEFAULT '1',
  `recaptcha_key` text DEFAULT NULL,
  `recaptcha_secret` text DEFAULT NULL,
  `custom_header` text DEFAULT NULL,
  `custom_footer` text DEFAULT NULL,
  `ticket_system` enum('1','2') NOT NULL DEFAULT '2',
  `register_page` enum('1','2') NOT NULL DEFAULT '2',
  `service_speed` enum('1','2') NOT NULL,
  `service_list` enum('1','2') NOT NULL,
  `dolar_charge` double NOT NULL,
  `euro_charge` double NOT NULL,
  `smtp_user` text NOT NULL,
  `smtp_pass` text NOT NULL,
  `smtp_server` text NOT NULL,
  `smtp_port` varchar(225) NOT NULL,
  `smtp_protocol` enum('0','ssl','tls') NOT NULL,
  `alert_type` enum('1','2','3') NOT NULL,
  `alert_newbankpayment` enum('1','2') NOT NULL,
  `alert_newmanuelservice` enum('1','2') NOT NULL,
  `alert_newticket` enum('1','2') NOT NULL,
  `alert_apibalance` enum('1','2') NOT NULL,
  `alert_serviceapialert` enum('1','2') NOT NULL,
  `sms_provider` varchar(225) NOT NULL,
  `sms_title` varchar(225) NOT NULL,
  `sms_user` varchar(225) NOT NULL,
  `sms_pass` varchar(225) NOT NULL,
  `sms_validate` enum('0','1') NOT NULL DEFAULT '0' COMMENT '1 -> OK, 0 -> NO',
  `admin_mail` varchar(225) NOT NULL,
  `admin_telephone` varchar(225) NOT NULL,
  `resetpass_page` enum('1','2') NOT NULL,
  `resetpass_sms` enum('1','2') NOT NULL,
  `resetpass_email` enum('1','2') NOT NULL,
  `site_maintenance` enum('1','2') NOT NULL DEFAULT '2',
  `servis_siralama` varchar(255) NOT NULL,
  `bronz_statu` int(11) NOT NULL,
  `silver_statu` int(11) NOT NULL,
  `gold_statu` int(11) NOT NULL,
  `bayi_statu` int(11) NOT NULL,
  `ns1` varchar(191) DEFAULT NULL,
  `ns2` varchar(191) DEFAULT NULL,
  `childpanel_price` double DEFAULT NULL,
  `snow_effect` enum('1','2') NOT NULL DEFAULT '2',
  `snow_colour` text NOT NULL,
  `conversion` varchar(255) NOT NULL DEFAULT '75'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_seo`, `site_title`, `site_description`, `site_keywords`, `site_logo`, `site_name`, `site_currency`, `favicon`, `site_language`, `site_theme`, `site_theme_alt`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `custom_header`, `custom_footer`, `ticket_system`, `register_page`, `service_speed`, `service_list`, `dolar_charge`, `euro_charge`, `smtp_user`, `smtp_pass`, `smtp_server`, `smtp_port`, `smtp_protocol`, `alert_type`, `alert_newbankpayment`, `alert_newmanuelservice`, `alert_newticket`, `alert_apibalance`, `alert_serviceapialert`, `sms_provider`, `sms_title`, `sms_user`, `sms_pass`, `sms_validate`, `admin_mail`, `admin_telephone`, `resetpass_page`, `resetpass_sms`, `resetpass_email`, `site_maintenance`, `servis_siralama`, `bronz_statu`, `silver_statu`, `gold_statu`, `bayi_statu`, `ns1`, `ns2`, `childpanel_price`, `snow_effect`, `snow_colour`, `conversion`) VALUES
(1, 'Smm Panel Script Store - Best SMM Panel Script', 'Smm Panel Script Store', 'We are the Cheapest SMM Panel Service Provider available with best customer support in the world\r\nBuy Like Followers Subscribers Watch time and much more services - Smm Panel Script Store', 'smm panel, cheapest smm panel, best smm panel, top smm panel, netflix smm panel, carding smm panel, Smm Panel Script Store, smmpanelscript.storeamazon gift card smm panel, smm panels, smm panel reseller,smm panel script,cheapest smm panel,smm panel script free,smm panel cheap,smm panel instagram,smm panel accounts,smm panel youtube,smm panel,smm panel paytm,smm panel main,smm panel source,indian smm panel,smm panel script free template,smm panel instant,smm panel instagram followers,cheap smm panel,smm panel youtube dislikes,smm panel picture,best smm panel,smm panel list,smm panel with paytm,smm panel india,smm panel scripts,smm panel cheap youtube,smm panel reseller cheap rates,smm panel youtube videos,smm panel nulled, smm panel what is it,smm panel script download,boost smm panel,cheap smm panel instant,cheap smm panel paypal,cheapest smm panel list,cheapest smm panel in india,smm panel terbaik,free smm panel script, picture for smm panel,cheap smm panel script,youtube smm panel,cheapest smm panel in world,indian smm panel paytm,indian smm panel reseller,indian smm panel picture,cheapest smm panel india,free smm panel,smm panel script nulled,script smm panel,paytm smm panel,cheapest smm panel scripts,smm panel creator,smm panel blue tick,indian smm panel instant, india smm panel,smm panel forum,best smm panel bhw,smm panel netflix,best smm panel for instagram,smm panel spotify,cheapest smm panel instant,smm panel usa,buy smm panel,reseller smm panel,cheapest smm panel reseller,best indian smm panel,smm panel resellers,cheap smm panel apk,smm panel script free download,instant smm panel,smm panel script php,cheapest smm panel indonesia,smm panel japan,auto smm panel,smm panel instagram verification,smm panel script buy,smm panel blackhatworld,how to create a smm panel,indian smm panel instagram,smm panel meaning,smm panel snapchat,best smm panel india,indian smm panel india,smm panel jap,cheapest smm panel youtube,perfect smm panel,indian smm panel youtube,cheapest indian smm panel,cheapest smm panel paypal,indian smm panel paypal,cheapest smm panel paytm,top smm panel,cheap smm panel reseller,smm panel indonesia,smm panel provider,smm panel murah,cheapest smm panel instagram,cheap smm panel india,smm panel indian instagram followers,world cheap smm panel,smm panel india paytm,indian smm panel script,smm panel free,best smm panel reseller,best smm panel for youtube,smm panel twitter,cheapest smm panel for youtube,smm panel script installation,smm panel paypal $10 minimum,smm panel twitch,cheap smm panel scripts,best smm panel list,best smm panel script,best smm panel paytm,script for smm panel,smm panel script github,cheapest smm panel for instagram,cheapest smm panel picture,rent smm panel,best smm panel instant', 'public/images/daca41214b39c5dc66674d09081940f0.png', 'Vega Smm', 'USD', 'public/images/75988f5ac0575a8d3636291a136cf92664152ed3.png', 'en', 'custom1.0', 'Orange', '1', '', '', '', '', '2', '2', '1', '2', 75, 1, 'admin@smmpanelscript.store', 'smmpanelscript', 'mail.google.com', '465', 'ssl', '2', '1', '2', '1', '2', '1', 'bizimsms', '', '', '', '1', 'admin@smmpanelscript.store', '', '2', '1', '2', '2', 'desc', 1000, 2000, 3000, 0, 'ns1.Smmpanelscript.store', 'ns2.Smmpanelscript.store', 10, '1', '#efc846', '75');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int(11) NOT NULL,
  `theme_name` text NOT NULL,
  `theme_dirname` text NOT NULL,
  `theme_extras` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_dirname`, `theme_extras`) VALUES
(256, 'custom1.0', 'custom1.0', '');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `subject` varchar(225) NOT NULL,
  `time` datetime NOT NULL,
  `lastupdate_time` datetime NOT NULL,
  `client_new` enum('1','2') NOT NULL DEFAULT '2',
  `status` enum('pending','answered','closed') NOT NULL DEFAULT 'pending',
  `support_new` enum('1','2') NOT NULL DEFAULT '1',
  `canmessage` enum('1','2') NOT NULL DEFAULT '2'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply`
--

CREATE TABLE `ticket_reply` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `support` enum('1','2') NOT NULL DEFAULT '1',
  `message` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ticket_reply`
--

INSERT INTO `ticket_reply` (`id`, `ticket_id`, `client_id`, `time`, `support`, `message`) VALUES
(1, 1, 0, '2022-07-22 22:02:35', '1', '123456788768'),
(2, 2, 0, '2022-07-22 22:50:21', '1', 'rerttr trtr ryrrty'),
(3, 3, 0, '2022-07-23 20:52:02', '1', 'Hello checking '),
(4, 3, 0, '2022-07-23 20:52:11', '1', 'Hello hello hello');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `childpanels`
--
ALTER TABLE `childpanels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `clients_category`
--
ALTER TABLE `clients_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_price`
--
ALTER TABLE `clients_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clients_service`
--
ALTER TABLE `clients_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `client_report`
--
ALTER TABLE `client_report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kuponlar`
--
ALTER TABLE `kuponlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`page_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  ADD PRIMARY KEY (`bonus_id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refill_status`
--
ALTER TABLE `refill_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `service_api`
--
ALTER TABLE `service_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bank_accounts`
--
ALTER TABLE `bank_accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `childpanels`
--
ALTER TABLE `childpanels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `clients_category`
--
ALTER TABLE `clients_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_price`
--
ALTER TABLE `clients_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients_service`
--
ALTER TABLE `clients_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_report`
--
ALTER TABLE `client_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `kuponlar`
--
ALTER TABLE `kuponlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kupon_kullananlar`
--
ALTER TABLE `kupon_kullananlar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `page_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `payments_bonus`
--
ALTER TABLE `payments_bonus`
  MODIFY `bonus_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refill_status`
--
ALTER TABLE `refill_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serviceapi_alert`
--
ALTER TABLE `serviceapi_alert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `service_api`
--
ALTER TABLE `service_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=257;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ticket_reply`
--
ALTER TABLE `ticket_reply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
