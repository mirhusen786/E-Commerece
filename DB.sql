-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2022 at 03:30 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `email`, `password`, `created_at`, `updated_at`) VALUES
(1, 'samirhusen18@gmail.com', '$2y$10$k0NrTTku/Rx/Tq3ueVl5tuDtMsWa5242TcfV54LAkzWGhGHwb9uxC', '2021-12-31 07:37:07', '2021-12-31 01:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `image`, `is_home`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Afsana', '1642319016.png', 1, 1, '2022-01-12 05:23:15', '2022-01-21 23:04:12'),
(3, 'mm', '1642319035.png', 1, 1, '2022-01-13 12:12:22', '2022-01-16 01:58:55'),
(4, 'mirhusen', '1642319055.png', 1, 1, '2022-01-13 12:17:53', '2022-01-16 01:59:15'),
(5, 'Dell', '1642319095.png', 1, 1, '2022-01-16 01:59:55', '2022-01-16 01:59:55'),
(6, 'Samsung', '1642319110.png', 1, 1, '2022-01-16 02:00:10', '2022-01-16 02:00:10'),
(7, 'Lenovo', '1642319185.png', 1, 1, '2022-01-16 02:01:25', '2022-01-16 02:01:25'),
(8, 'Apple', '1642319215.png', 1, 1, '2022-01-16 02:01:55', '2022-01-16 02:01:55');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_type` enum('Reg','Not-Reg') NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_attr_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `user_type`, `qty`, `product_id`, `product_attr_id`, `added_on`) VALUES
(133, 203, 'Reg', 1, 48, 82, '2022-02-13 01:01:52'),
(134, 203, 'Reg', 1, 49, 83, '2022-02-13 01:30:59');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_category_id` int(11) DEFAULT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_home` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `parent_category_id`, `category_image`, `is_home`, `created_at`, `status`, `updated_at`) VALUES
(54, 'Man', 'man', 0, NULL, 1, '2022-01-27 06:04:10', 1, '2022-01-27 06:04:10'),
(55, 'Woman', 'woman', 0, NULL, 1, '2022-01-27 06:04:22', 1, '2022-01-27 06:04:22');

-- --------------------------------------------------------

--
-- Table structure for table `colors`
--

CREATE TABLE `colors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `colors`
--

INSERT INTO `colors` (`id`, `color`, `status`, `created_at`, `updated_at`) VALUES
(3, 'black', 1, '2022-01-05 01:04:31', '2022-01-17 03:16:59'),
(4, 'Red', 1, '2022-01-17 03:18:03', '2022-01-17 03:28:23'),
(5, 'pink', 1, '2022-01-17 05:09:36', '2022-01-17 05:09:36'),
(6, 'yellow', 1, '2022-01-17 05:09:44', '2022-01-17 05:09:44');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('Value','Per') COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_order_amt` int(11) NOT NULL,
  `is_one_time` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `status` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `code`, `value`, `type`, `min_order_amt`, `is_one_time`, `created_at`, `status`, `updated_at`) VALUES
(15, '7', '7', '7', 'Per', 700, 0, '2022-01-13 01:09:45', 1, '2022-01-13 01:09:45');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `is_verify` int(11) NOT NULL,
  `rand_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_forgot_password` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `gender`, `email`, `mobile`, `password`, `address`, `city`, `state`, `country`, `zip`, `company`, `status`, `is_verify`, `rand_id`, `is_forgot_password`, `created_at`, `updated_at`) VALUES
(203, 'Mir Husen', NULL, 'samirhusen18@gmail.com', '9999999999', 'eyJpdiI6IldXUEVsZ2Z1YWN1NDBLRUp5SEdneWc9PSIsInZhbHVlIjoiSVJLTWtOQWZGV2Q3eHltMng3QzVOZz09IiwibWFjIjoiYjY3YjA4MWRmZjZhYWMwYWU2ZDRjYWRmYTgzMmY0MTcxZjY3MDA3MThhMDEwMGZmN2E1MWRmNGI5NmMwNjA4NiIsInRhZyI6IiJ9', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '', 0, '2022-01-27 05:50:07', '2022-01-27 05:50:07');

-- --------------------------------------------------------

--
-- Table structure for table `home_banners`
--

CREATE TABLE `home_banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_txt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btn_link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `msg` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `home_banners`
--

INSERT INTO `home_banners` (`id`, `image`, `btn_txt`, `btn_link`, `slug`, `msg`, `status`, `created_at`, `updated_at`) VALUES
(3, '1643560419.jpg', 'Show now', 'https://twitter.com', 'Men Collection', 'We nepal top man collection dress.', 1, '2022-01-16 04:21:21', '2022-01-30 10:48:39'),
(4, '1643560436.jpg', 'Show Now', 'facebook', 'Baby collection', 'we have baby is collection', 1, '2022-01-16 04:57:28', '2022-01-30 10:48:56');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2021_12_27_113235_create_admins_table', 1),
(3, '2021_12_29_085353_create_categories_table', 2),
(4, '2022_01_02_151800_create_coupons_table', 3),
(5, '2022_01_02_211208_create_sizes_table', 4),
(6, '2022_01_02_214342_create_colors_table', 5),
(7, '2022_01_03_055916_create_products_table', 6),
(8, '2022_01_12_101815_create_brands_table', 7),
(9, '2022_01_13_090717_create_taxes_table', 8),
(10, '2022_01_13_122321_create_customers_table', 9),
(11, '2022_01_16_084932_create_home_banners_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customers_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `address` varchar(300) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `pincode` varchar(50) NOT NULL,
  `coupon_code` varchar(30) DEFAULT NULL,
  `coupon_value` int(11) DEFAULT NULL,
  `order_status` int(11) NOT NULL,
  `payment_type` enum('COD','Gateway') NOT NULL,
  `payment_status` varchar(50) NOT NULL,
  `payment_id` varchar(80) DEFAULT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `total_amt` int(50) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customers_id`, `name`, `email`, `mobile`, `address`, `city`, `state`, `pincode`, `coupon_code`, `coupon_value`, `order_status`, `payment_type`, `payment_status`, `payment_id`, `txn_id`, `total_amt`, `added_on`) VALUES
(48, 203, 'Mir Husen', 'samirhusen18@gmail.com', '9999999999', '9', '9', '9', '9', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 6, '2022-02-13 01:02:14'),
(49, 203, 'Mir Husen', 'samirhusen18@gmail.com', '9999999999', 'kalaiya-18(Bara), Nepal', 'Kalaiya', '02', '4444', NULL, 0, 1, 'COD', 'Pending', NULL, NULL, 6, '2022-02-13 01:07:26');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE `orders_details` (
  `id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `products_attr_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`id`, `orders_id`, `product_id`, `products_attr_id`, `price`, `qty`) VALUES
(16, 20, 48, 82, 2900, 1),
(17, 21, 48, 82, 2900, 1),
(18, 22, 48, 82, 2900, 1),
(19, 23, 48, 82, 2900, 1),
(20, 24, 48, 82, 2900, 1),
(21, 25, 48, 82, 2900, 1),
(22, 26, 48, 82, 2900, 1),
(23, 27, 48, 82, 6, 1),
(24, 28, 48, 82, 6, 1),
(25, 29, 48, 82, 6, 1),
(26, 30, 48, 82, 6, 1),
(27, 31, 48, 82, 6, 1),
(28, 32, 48, 82, 6, 1),
(29, 33, 48, 82, 6, 1),
(30, 34, 48, 82, 6, 1),
(31, 35, 48, 82, 6, 1),
(32, 36, 48, 82, 6, 1),
(33, 37, 48, 82, 6, 1),
(34, 38, 48, 82, 6, 1),
(35, 38, 48, 82, 6, 1),
(36, 39, 48, 82, 6, 1),
(37, 39, 48, 82, 6, 1),
(38, 40, 48, 82, 6, 1),
(39, 40, 48, 82, 6, 1),
(40, 41, 48, 82, 6, 1),
(41, 41, 48, 82, 6, 1),
(42, 42, 48, 82, 6, 1),
(43, 42, 48, 82, 6, 1),
(44, 43, 48, 82, 6, 1),
(45, 43, 48, 82, 6, 1),
(46, 44, 48, 82, 6, 1),
(47, 44, 48, 82, 6, 1),
(48, 45, 48, 82, 6, 1),
(49, 45, 48, 82, 6, 1),
(50, 46, 48, 82, 6, 1),
(51, 46, 48, 82, 6, 1),
(52, 46, 48, 82, 6, 1),
(53, 47, 48, 82, 6, 1),
(54, 47, 48, 82, 6, 1),
(55, 47, 48, 82, 6, 1),
(56, 48, 48, 82, 6, 1),
(57, 49, 48, 82, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_status`
--

CREATE TABLE `orders_status` (
  `id` int(11) NOT NULL,
  `orders_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders_status`
--

INSERT INTO `orders_status` (`id`, `orders_status`) VALUES
(1, 'Placed'),
(2, 'On the way'),
(3, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `keywords` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `technical_specification` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `uses` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `warranty` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `lead_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_id` int(11) NOT NULL,
  `tax_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_promo` int(11) NOT NULL,
  `is_featured` int(11) NOT NULL,
  `is_discounted` int(11) NOT NULL,
  `is_tranding` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `image`, `slug`, `brand`, `model`, `short_desc`, `desc`, `keywords`, `technical_specification`, `uses`, `warranty`, `lead_time`, `tax_id`, `tax_type`, `is_promo`, `is_featured`, `is_discounted`, `is_tranding`, `status`, `created_at`, `updated_at`) VALUES
(48, 54, 'vest', '1642778838.png', 'vest', '8', 'vest', '<p>We provide best products all over the nepal..We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.</p>', '<p>We provide best products all over the nepal.</p>\r\n\r\n<p>We provide best products all over the nepal.</p>\r\n\r\n<p>We provide best products all over the nepal.</p>\r\n\r\n<p>We provide best products all over the nepal.</p>\r\n\r\n<p>We provide best products all over the nepal.</p>', 'We provide best products all over the nepal.', '<p>We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.vvvWe provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.</p>', '<p>We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.We provide best products all over the nepal.</p>', '6 months', 'delivery time 3 time', 4, '20', 1, 1, 1, 1, 1, '2022-01-21 09:42:18', '2022-01-27 06:04:35'),
(49, 55, 'Half shirt', '1642930800.jpg', 'half', '8', 'kurti', '<p>This is product is best for all over nepal</p>', '<p>This is product is best for all over nepal</p>', 'This is product is best for all over nepal', '<p>This is product is best for all over nepal</p>', '<p>This is product is best for all over nepal</p>', '6 months', '3 days of delivary', 4, '30', 1, 1, 1, 1, 1, '2022-01-21 10:08:38', '2022-01-27 06:05:01'),
(50, 49, 't-shirt', '1642933511.jpg', 'tshirt', '7', '888', '<p>888</p>', '<p>8</p>', '8', '<p>8</p>', '<p>8</p>', '7 mont', '3 days', 4, '200', 1, 0, 1, 1, 1, '2022-01-23 04:40:11', '2022-01-23 04:40:11');

-- --------------------------------------------------------

--
-- Table structure for table `products_attr`
--

CREATE TABLE `products_attr` (
  `id` int(11) NOT NULL,
  `sku` varchar(11) NOT NULL,
  `attr_image` varchar(255) NOT NULL,
  `mrp` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `color_id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_attr`
--

INSERT INTO `products_attr` (`id`, `sku`, `attr_image`, `mrp`, `price`, `qty`, `size_id`, `color_id`, `products_id`) VALUES
(62, '2', '581007501.jpg', '2', 2, 2, 5, 3, 33),
(64, '1', '137313489.jpg', '1', 1, 90, 0, 0, 34),
(65, '0', '314286761.jpg', '0', 0, 0, 0, 0, 36),
(66, '10', '856660843.jpg', '0', 0, 20, 5, 3, 37),
(67, '0', '528594124.jpg', '0', 0, 0, 5, 3, 38),
(68, '1121', '688194219.jpg', '11', 1, 1, 5, 3, 39),
(69, '10202002', '538733421.jpg', '1', 1, 1, 5, 3, 40),
(71, '666', '675749210.jpg', '6', 6, 6, 5, 3, 41),
(73, '4', '893207300.jpg', '4', 4, 4, 5, 3, 42),
(74, '777', '876348278.jpg', '7', 7, 7, 5, 3, 42),
(75, '6988', '583722499.jpg', '750', 700, 7, 5, 4, 43),
(78, '5050', '842000713.jpg', '4500', 400, 300, 5, 3, 44),
(79, '13030', '596308905.jpg', '1000', 900, 20, 5, 6, 45),
(80, '203030', '370092901.jpg', '1200', 1000, 10, 6, 5, 45),
(81, '330303', '716772620.jpg', '2000', 1950, 200, 6, 5, 45),
(82, '99', '481624696.png', '3000', 6, 200, 5, 4, 48),
(83, '200', '167694038.jpg', '400', 300, 20, 5, 5, 49),
(85, '20202', '394108213.jpg', '2000', 1900, 20, 6, 5, 50);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `products_id` int(11) NOT NULL,
  `images` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `products_id`, `images`) VALUES
(21, 33, '661510269.jpg'),
(23, 34, '779434327.jpg'),
(24, 34, '631344946.jpg'),
(25, 36, '274055635.jpg'),
(26, 37, '387471940.jpg'),
(27, 37, '816497353.jpg'),
(28, 38, '184323928.jpg'),
(29, 39, '506719641.jpg'),
(30, 40, '325607926.jpg'),
(32, 41, '188472674.jpg'),
(35, 42, '685737202.jpg'),
(36, 43, '979604259.jpg'),
(39, 44, '721167383.jpg'),
(40, 45, '432282023.jpg'),
(41, 45, '990365796.jpg'),
(42, 45, '496811431.jpg'),
(43, 48, '405758207.png'),
(44, 49, '760818681.jpg'),
(45, 49, '963743115.jpg'),
(46, 49, '114086336.jpg'),
(47, 50, '419425444.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `size`, `status`, `created_at`, `updated_at`) VALUES
(5, 'XXL', 1, '2022-01-05 04:39:10', '2022-01-13 07:31:49'),
(6, 'XL', 1, '2022-01-17 05:10:01', '2022-01-17 05:10:01'),
(7, 'X', 1, '2022-01-17 05:10:25', '2022-01-17 05:10:25');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tax_desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `tax_desc`, `tax_value`, `status`, `created_at`, `updated_at`) VALUES
(4, 'Gst 20%', '200', 1, '2022-01-13 04:09:11', '2022-01-13 04:09:11');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_banners`
--
ALTER TABLE `home_banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_status`
--
ALTER TABLE `orders_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attr`
--
ALTER TABLE `products_attr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `colors`
--
ALTER TABLE `colors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=204;

--
-- AUTO_INCREMENT for table `home_banners`
--
ALTER TABLE `home_banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `orders_details`
--
ALTER TABLE `orders_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `orders_status`
--
ALTER TABLE `orders_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `products_attr`
--
ALTER TABLE `products_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
