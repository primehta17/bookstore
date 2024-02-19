-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 19, 2024 at 03:18 PM
-- Server version: 8.0.36-0ubuntu0.20.04.1
-- PHP Version: 7.4.3-4ubuntu2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `book_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Literarys', 'literarys', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(2, 'Diets', 'diets', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(3, 'Politics', 'politics', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(4, 'Thrillers', 'thrillers', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(5, 'Travels', 'travels', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(6, 'Comics', 'comics', '2024-02-19 06:05:40', '2024-02-19 06:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `country_visits`
--

CREATE TABLE `country_visits` (
  `id` bigint UNSIGNED NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `visits` bigint UNSIGNED NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_visits`
--

INSERT INTO `country_visits` (`id`, `country`, `visits`, `created_at`, `updated_at`) VALUES
(1, 'United States', 1, '2024-02-19 06:07:05', '2024-02-19 06:07:05');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int DEFAULT NULL,
  `percent_off` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `percent_off`, `created_at`, `updated_at`) VALUES
(1, 'ABC123', 'fixed', 20, NULL, '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(2, 'DEF456', 'percent', NULL, 40, '2024-02-19 06:05:40', '2024-02-19 06:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int UNSIGNED NOT NULL,
  `data_type_id` int UNSIGNED NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `browse` tinyint(1) NOT NULL DEFAULT '1',
  `read` tinyint(1) NOT NULL DEFAULT '1',
  `edit` tinyint(1) NOT NULL DEFAULT '1',
  `add` tinyint(1) NOT NULL DEFAULT '1',
  `delete` tinyint(1) NOT NULL DEFAULT '1',
  `details` text COLLATE utf8mb4_unicode_ci,
  `order` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 1, 'provider_id', 'text', 'Provider', 0, 1, 1, 0, 0, 0, NULL, 13),
(23, 4, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(24, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(25, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required|unique:products,slug\"}}', 3),
(26, 4, 'details', 'text', 'Details', 0, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 4),
(27, 4, 'price', 'number', 'Price', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 5),
(28, 4, 'image', 'image', 'Image', 1, 1, 1, 1, 1, 1, NULL, 6),
(29, 4, 'images', 'multiple_images', 'Images', 0, 1, 1, 1, 1, 1, NULL, 7),
(30, 4, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, '{\"on\":\"Yes\",\"off\":\"No\",\"checked\":\"true\"}', 8),
(31, 4, 'category_id', 'number', 'Category Id', 1, 1, 1, 1, 1, 1, '{\"validation\":{\"rule\":\"required\"}}', 9),
(32, 4, 'description', 'rich_text_box', 'Description', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 10),
(33, 4, 'quantity', 'number', 'Quantity', 1, 1, 1, 1, 1, 0, '{\"validation\":{\"rule\":\"required\"}}', 11),
(34, 4, 'product_belongsto_category_relationship', 'relationship', 'Category', 1, 1, 1, 1, 1, 0, '{\"model\":\"App\\\\Category\",\"table\":\"category\",\"type\":\"belongsTo\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category\",\"pivot\":0}', 12),
(35, 4, 'product_belongstomany_tag_relationship', 'relationship', 'Tags', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Tag\",\"table\":\"tags\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"on\"}', 13),
(36, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 14),
(37, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, NULL, 15),
(38, 5, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(39, 5, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(40, 5, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, NULL, 3),
(41, 5, 'category_hasmany_product_relationship', 'relationship', 'Products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"hasMany\",\"column\":\"category_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"category\",\"pivot\":\"0\",\"taggable\":\"0\"}', 4),
(42, 5, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 5),
(43, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(44, 6, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'code', 'text', 'Code', 1, 1, 1, 1, 1, 1, NULL, 2),
(46, 6, 'type', 'select_dropdown', 'Type', 1, 1, 1, 1, 1, 1, '{\"default\":\"fixed\",\"options\":{\"fixed\":\"Fixed value\",\"percent_off\":\"Percent Off\"}}', 3),
(47, 6, 'value', 'number', 'Value', 0, 1, 1, 1, 1, 1, NULL, 4),
(48, 6, 'percent_off', 'number', 'Percent Off', 0, 1, 1, 1, 1, 1, NULL, 5),
(49, 6, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 6),
(50, 6, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(51, 7, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(52, 7, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, '{\"rules\":\"unique:tags,name\"}', 2),
(53, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"rules\":\"unique:tags,slug\"}', 3),
(54, 7, 'tag_belongstomany_product_relationship', 'relationship', 'Products', 0, 1, 1, 1, 1, 1, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"product_tag\",\"pivot\":\"1\",\"taggable\":\"0\"}', 4),
(55, 7, 'create_at', 'timestamp', 'voyager::seeders.data_rows.create_at', 0, 0, 0, 0, 0, 0, NULL, 5),
(56, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 6),
(57, 9, 'id', 'hidden', 'Id', 1, 0, 0, 0, 0, 0, NULL, 1),
(58, 9, 'user_id', 'number', 'User Id', 0, 0, 1, 0, 0, 0, NULL, 2),
(59, 9, 'billing_email', 'text', 'Email', 1, 1, 1, 1, 1, 0, NULL, 3),
(60, 9, 'billing_name', 'text', 'Name', 1, 1, 1, 1, 1, 0, NULL, 4),
(61, 9, 'billing_city', 'text', 'City', 1, 1, 1, 1, 1, 0, NULL, 5),
(62, 9, 'billing_province', 'text', 'Province', 1, 0, 1, 1, 0, 0, NULL, 6),
(63, 9, 'billing_postalcode', 'text', 'Postal Code', 1, 0, 1, 1, 0, 0, NULL, 7),
(64, 9, 'billing_phone', 'number', 'Phone', 1, 0, 1, 0, 0, 0, NULL, 8),
(65, 9, 'billing_name_on_card', 'text', 'Name on card', 1, 0, 1, 0, 0, 0, NULL, 9),
(66, 9, 'billing_discount', 'number', 'Discount', 1, 0, 1, 0, 0, 0, NULL, 10),
(67, 9, 'billing_discount_code', 'text', 'Discount code', 0, 0, 1, 0, 0, 0, NULL, 11),
(68, 9, 'billing_subtotal', 'number', 'Subtotal', 1, 0, 1, 0, 0, 0, NULL, 15),
(69, 9, 'billing_tax', 'number', 'Tax', 1, 0, 1, 0, 0, 0, NULL, 13),
(70, 9, 'billing_total', 'number', 'Total', 1, 1, 1, 0, 0, 0, NULL, 14),
(71, 9, 'payment_gateway', 'text', 'Gateway', 1, 0, 1, 0, 0, 0, '{\"null\":\"\"}', 15),
(72, 9, 'shipped', 'checkbox', 'Shipped', 1, 1, 1, 0, 0, 0, '{\"checked\":\"false\",\"on\":\"Yes\",\"off\":\"No\"}', 16),
(73, 9, 'error', 'text', 'Error', 1, 1, 1, 0, 0, 0, '{\"null\":\"\"}', 17),
(74, 9, 'order_belongstomany_product_relationship', 'relationship', 'Order Products', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\Product\",\"table\":\"products\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"order_product\",\"pivot\":1}', 18),
(75, 9, 'order_belongsto_user_relationship', 'relationship', 'User', 0, 1, 1, 0, 0, 0, '{\"model\":\"App\\\\User\",\"table\":\"users\",\"type\":\"belongsTo\",\"column\":\"user_id\",\"key\":\"id\",\"label\":\"name\",\"pivot_table\":\"orders\",\"pivot\":0}', 19),
(76, 9, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 13),
(77, 9, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, NULL, 14);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT '0',
  `server_side` tinyint NOT NULL DEFAULT '0',
  `details` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(4, 'products', 'products', 'Product', 'Products', 'voyager-bag', 'App\\Product', '', '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(5, 'category', 'category', 'Category', 'Categories', 'voyager-categories', 'App\\Category', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(6, 'coupons', 'coupons', 'Coupon', 'Coupons', 'voyager-buy', 'App\\Coupon', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(7, 'tags', 'tags', 'Tag', 'Tags', 'voyager-tag', 'App\\Tag', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(8, 'product_tag', 'product_tag', 'Product Tag', 'Products Tags', '', 'App\\ProductTag', NULL, '', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(9, 'orders', 'orders', 'Order', 'Orders', 'voyager-documentation', 'App\\Order', '', 'App\\Http\\Controllers\\Voyager\\OrdersController', '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(10, 'visits', 'country_visits', 'Country Visit', 'Country Visits', 'voyager-documentation', 'App\\CountryVisit', '', NULL, '', 1, 0, NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(2, 'main', '2024-02-19 06:05:44', '2024-02-19 06:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int UNSIGNED NOT NULL,
  `menu_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'Dashboard', '', '_self', 'voyager-boat', NULL, NULL, 1, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.dashboard', NULL),
(2, 1, 'Media', '', '_self', 'voyager-images', NULL, NULL, 5, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.media.index', NULL),
(3, 1, 'Users', '', '_self', 'voyager-person', NULL, NULL, 3, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.users.index', NULL),
(4, 1, 'Roles', '', '_self', 'voyager-lock', NULL, NULL, 2, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.roles.index', NULL),
(5, 1, 'Tools', '', '_self', 'voyager-tools', NULL, NULL, 9, '2024-02-19 06:05:43', '2024-02-19 06:05:43', NULL, NULL),
(6, 1, 'Menu Builder', '', '_self', 'voyager-list', NULL, 5, 10, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.menus.index', NULL),
(7, 1, 'Database', '', '_self', 'voyager-data', NULL, 5, 11, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.database.index', NULL),
(8, 1, 'Compass', '', '_self', 'voyager-compass', NULL, 5, 12, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.compass.index', NULL),
(9, 1, 'BREAD', '', '_self', 'voyager-bread', NULL, 5, 13, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.bread.index', NULL),
(10, 1, 'Settings', '', '_self', 'voyager-settings', NULL, NULL, 14, '2024-02-19 06:05:43', '2024-02-19 06:05:43', 'voyager.settings.index', NULL),
(11, 2, 'Shop', '', '_self', NULL, NULL, NULL, 1, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'shop.index', NULL),
(12, 2, 'About', '#', '_self', NULL, NULL, NULL, 2, '2024-02-19 06:05:44', '2024-02-19 06:05:44', NULL, NULL),
(13, 2, 'Blog', '#', '_self', NULL, NULL, NULL, 3, '2024-02-19 06:05:44', '2024-02-19 06:05:44', NULL, NULL),
(14, 2, 'Cart', '', '_self', NULL, NULL, NULL, 4, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'cart.index', NULL),
(15, 1, 'Products', '', '_self', 'voyager-bag', NULL, NULL, 15, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.products.index', NULL),
(16, 1, 'Categories', '', '_self', 'voyager-categories', NULL, NULL, 16, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.category.index', NULL),
(17, 1, 'Coupons', '', '_self', 'voyager-wand', NULL, NULL, 17, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.coupons.index', NULL),
(18, 1, 'Tags', '', '_self', 'voyager-tag', NULL, NULL, 18, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.tags.index', NULL),
(19, 1, 'Orders', '', '_self', 'voyager-documentation', NULL, NULL, 19, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.orders.index', NULL),
(20, 1, 'Country Visits', '', '_self', 'voyager-pie-chart', NULL, NULL, 20, '2024-02-19 06:05:44', '2024-02-19 06:05:44', 'voyager.visits', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_10_16_185424_create_products_table', 1),
(25, '2019_10_17_195112_create_categories_table', 1),
(26, '2019_10_17_195227_add_category_id_to_products_table', 1),
(27, '2019_10_18_002421_create_coupons_table', 1),
(28, '2019_10_19_145706_add_images_column_to_products', 1),
(29, '2019_10_20_114921_create_tags_table', 1),
(30, '2019_10_20_115306_create_products_tags_table', 1),
(31, '2019_10_22_185425_create_orders_table', 1),
(32, '2019_10_22_190613_create_order_product_table', 1),
(33, '2019_11_09_002942_add_quantity_to_products_table', 1),
(34, '2020_06_27_012504_create_visits_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `billing_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_postalcode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_name_on_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `billing_discount` int NOT NULL DEFAULT '0',
  `billing_discount_code` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_subtotal` int NOT NULL,
  `billing_tax` int NOT NULL,
  `billing_total` int NOT NULL,
  `payment_gateway` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'stripe',
  `shipped` tinyint(1) NOT NULL DEFAULT '0',
  `error` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `billing_email`, `billing_name`, `billing_address`, `billing_city`, `billing_province`, `billing_postalcode`, `billing_phone`, `billing_name_on_card`, `billing_discount`, `billing_discount_code`, `billing_subtotal`, `billing_tax`, `billing_total`, `payment_gateway`, `shipped`, `error`, `created_at`, `updated_at`) VALUES
(1, NULL, 'isabel.bahringer@watsica.org', 'vivienne.runolfsson', 'Suite 841', 'Weimannborough', 'Lake Hughside', '04438-5108', '353.688.1729 x5191', 'qlangosh', 0, NULL, 1000, 200, 1200, 'stripe', 0, 'Error', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(2, NULL, 'amelia.lesch@hotmail.com', 'bode.clint', 'Suite 999', 'Kassandraborough', 'Wilfridhaven', '52101-3139', '1-656-356-4464 x274', 'mfritsch', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(3, NULL, 'kunde.shana@hirthe.net', 'rachel.collins', 'Suite 491', 'Cormiertown', 'Hoytview', '17421-1332', '(820) 876-9434 x5852', 'nwest', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(4, 1, 'lschulist@ondricka.info', 'tyra06', 'Apt. 729', 'West Cyrus', 'New Yadira', '93998-2666', '393-679-4230 x677', 'lang.christop', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(5, NULL, 'destinee.hill@okeefe.info', 'kschumm', 'Suite 813', 'Weissnatburgh', 'New Maribel', '78423', '604-924-3232 x3452', 'daniella25', 0, NULL, 1000, 200, 1200, 'stripe', 0, 'Error', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(6, 1, 'ryan.rempel@white.biz', 'tadams', 'Suite 552', 'Aleenfurt', 'East Fredrick', '66168-5451', '1-661-664-0522 x789', 'boehm.bobbie', 0, NULL, 1000, 200, 1200, 'stripe', 1, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(7, 1, 'althea.smitham@klocko.biz', 'ohowell', 'Suite 338', 'East Abigayle', 'Lawsonland', '36808-5742', '819.505.9487', 'prowe', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(8, 1, 'vstracke@yahoo.com', 'treva00', 'Suite 856', 'Orvaltown', 'Yundtton', '70321', '367.202.8996', 'ofelia.miller', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(9, 1, 'earl29@gmail.com', 'trantow.brendon', 'Apt. 782', 'West Carriefort', 'South Kianview', '21636-6424', '(352) 383-6988 x58841', 'kelly.greenfelder', 0, NULL, 1000, 200, 1200, 'stripe', 1, 'Error', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(10, 1, 'pfannerstill.charles@gmail.com', 'predovic.amari', 'Apt. 208', 'New Sharon', 'Schmittshire', '88248-3583', '1-527-753-4051', 'elvera.weber', 0, NULL, 1000, 200, 1200, 'stripe', 0, NULL, '2024-02-19 06:05:44', '2024-02-19 06:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED DEFAULT NULL,
  `order_id` bigint UNSIGNED DEFAULT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_product`
--

INSERT INTO `order_product` (`id`, `product_id`, `order_id`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 45, 10, 2, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(2, 15, 9, 2, '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(3, 75, 2, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(4, 65, 7, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(5, 32, 7, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(6, 11, 6, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(7, 118, 7, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(8, 100, 3, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(9, 62, 10, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(10, 30, 5, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(11, 104, 3, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(12, 85, 3, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(13, 84, 2, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(14, 112, 1, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(15, 54, 3, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(16, 70, 6, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(17, 81, 10, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(18, 98, 1, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(19, 9, 2, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(20, 88, 10, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(21, 73, 6, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(22, 105, 5, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(23, 101, 3, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(24, 28, 7, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(25, 74, 8, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(26, 109, 4, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(27, 3, 5, 3, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(28, 75, 4, 2, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(29, 61, 1, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45'),
(30, 90, 10, 1, '2024-02-19 06:05:45', '2024-02-19 06:05:45');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(2, 'browse_bread', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(3, 'browse_database', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(4, 'browse_media', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(5, 'browse_compass', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(6, 'browse_menus', 'menus', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(7, 'read_menus', 'menus', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(8, 'edit_menus', 'menus', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(9, 'add_menus', 'menus', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(10, 'delete_menus', 'menus', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(11, 'browse_roles', 'roles', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(12, 'read_roles', 'roles', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(13, 'edit_roles', 'roles', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(14, 'add_roles', 'roles', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(15, 'delete_roles', 'roles', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(16, 'browse_users', 'users', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(17, 'read_users', 'users', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(18, 'edit_users', 'users', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(19, 'add_users', 'users', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(20, 'delete_users', 'users', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(21, 'browse_settings', 'settings', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(22, 'read_settings', 'settings', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(23, 'edit_settings', 'settings', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(24, 'add_settings', 'settings', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(25, 'delete_settings', 'settings', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(26, 'browse_products', 'products', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(27, 'read_products', 'products', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(28, 'edit_products', 'products', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(29, 'add_products', 'products', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(30, 'delete_products', 'products', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(31, 'browse_category', 'category', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(32, 'read_category', 'category', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(33, 'edit_category', 'category', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(34, 'add_category', 'category', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(35, 'delete_category', 'category', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(36, 'browse_coupons', 'coupons', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(37, 'read_coupons', 'coupons', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(38, 'edit_coupons', 'coupons', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(39, 'add_coupons', 'coupons', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(40, 'delete_coupons', 'coupons', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(41, 'browse_tags', 'tags', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(42, 'read_tags', 'tags', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(43, 'edit_tags', 'tags', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(44, 'add_tags', 'tags', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(45, 'delete_tags', 'tags', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(46, 'browse_product_tag', 'product_tag', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(47, 'read_product_tag', 'product_tag', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(48, 'edit_product_tag', 'product_tag', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(49, 'add_product_tag', 'product_tag', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(50, 'delete_product_tag', 'product_tag', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(51, 'browse_orders', 'orders', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(52, 'read_orders', 'orders', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(53, 'edit_orders', 'orders', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(54, 'add_orders', 'orders', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(55, 'delete_orders', 'orders', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(56, 'browse_country_visits', 'country_visits', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(57, 'read_country_visits', 'country_visits', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(58, 'edit_country_visits', 'country_visits', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(59, 'add_country_visits', 'country_visits', '2024-02-19 06:05:44', '2024-02-19 06:05:44'),
(60, 'delete_country_visits', 'country_visits', '2024-02-19 06:05:44', '2024-02-19 06:05:44');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `quantity` int UNSIGNED NOT NULL DEFAULT '10',
  `category_id` bigint UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 'literary0', 'literary-0', 'The resilience of the human spirit', 4510, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(2, 'literary1', 'literary-1', 'The resilience of the human spirit', 2616, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(3, 'literary2', 'literary-2', 'The resilience of the human spirit', 7950, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:41'),
(4, 'literary3', 'literary-3', 'The resilience of the human spirit', 7193, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(5, 'literary4', 'literary-4', 'The resilience of the human spirit', 9484, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(6, 'literary5', 'literary-5', 'The resilience of the human spirit', 8322, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:41'),
(7, 'literary6', 'literary-6', 'The resilience of the human spirit', 9761, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(8, 'literary7', 'literary-7', 'The resilience of the human spirit', 6305, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(9, 'literary8', 'literary-8', 'The resilience of the human spirit', 5725, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:41'),
(10, 'literary9', 'literary-9', 'The resilience of the human spirit', 6123, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(11, 'literary10', 'literary-10', 'The resilience of the human spirit', 1830, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(12, 'literary11', 'literary-11', 'The resilience of the human spirit', 4715, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:41'),
(13, 'literary12', 'literary-12', 'The resilience of the human spirit', 3759, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(14, 'literary13', 'literary-13', 'The resilience of the human spirit', 5306, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(15, 'literary14', 'literary-14', 'The resilience of the human spirit', 6931, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(16, 'literary15', 'literary-15', 'The resilience of the human spirit', 7109, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(17, 'literary16', 'literary-16', 'The resilience of the human spirit', 5114, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(18, 'literary17', 'literary-17', 'The resilience of the human spirit', 2153, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 1, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(19, 'literary18', 'literary-18', 'The resilience of the human spirit', 8852, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(20, 'literary19', 'literary-19', 'The resilience of the human spirit', 5844, 'products/dummy/image0.jpg', '[\"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\", \"products/dummy/image0.jpg\"]', 0, 10, 1, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(21, 'Diet0', 'diet-0', 'The resilience of the human spirit', 7785, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(22, 'Diet1', 'diet-1', 'The resilience of the human spirit', 3933, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(23, 'Diet2', 'diet-2', 'The resilience of the human spirit', 5473, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(24, 'Diet3', 'diet-3', 'The resilience of the human spirit', 4737, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(25, 'Diet4', 'diet-4', 'The resilience of the human spirit', 9425, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(26, 'Diet5', 'diet-5', 'The resilience of the human spirit', 7641, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(27, 'Diet6', 'diet-6', 'The resilience of the human spirit', 9030, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(28, 'Diet7', 'diet-7', 'The resilience of the human spirit', 9118, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(29, 'Diet8', 'diet-8', 'The resilience of the human spirit', 5853, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(30, 'Diet9', 'diet-9', 'The resilience of the human spirit', 3356, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(31, 'Diet10', 'diet-10', 'The resilience of the human spirit', 1135, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(32, 'Diet11', 'diet-11', 'The resilience of the human spirit', 3772, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(33, 'Diet12', 'diet-12', 'The resilience of the human spirit', 4332, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(34, 'Diet13', 'diet-13', 'The resilience of the human spirit', 4402, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(35, 'Diet14', 'diet-14', 'The resilience of the human spirit', 4490, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(36, 'Diet15', 'diet-15', 'The resilience of the human spirit', 5610, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(37, 'Diet16', 'diet-16', 'The resilience of the human spirit', 3563, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(38, 'Diet17', 'diet-17', 'The resilience of the human spirit', 7114, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(39, 'Diet18', 'diet-18', 'The resilience of the human spirit', 4594, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 1, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(40, 'Diet19', 'diet-19', 'The resilience of the human spirit', 7812, 'products/dummy/image1.jpg', '[\"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\", \"products/dummy/image1.jpg\"]', 0, 10, 2, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(41, 'Politic0', 'politic-0', 'The resilience of the human spirit', 7013, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(42, 'Politic1', 'politic-1', 'The resilience of the human spirit', 9952, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(43, 'Politic2', 'politic-2', 'The resilience of the human spirit', 4948, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(44, 'Politic3', 'politic-3', 'The resilience of the human spirit', 6005, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(45, 'Politic4', 'politic-4', 'The resilience of the human spirit', 6024, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(46, 'Politic5', 'politic-5', 'The resilience of the human spirit', 9389, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(47, 'Politic6', 'politic-6', 'The resilience of the human spirit', 2459, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(48, 'Politic7', 'politic-7', 'The resilience of the human spirit', 2567, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(49, 'Politic8', 'politic-8', 'The resilience of the human spirit', 5809, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(50, 'Politic9', 'politic-9', 'The resilience of the human spirit', 9119, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(51, 'Politic10', 'politic-10', 'The resilience of the human spirit', 2581, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(52, 'Politic11', 'politic-11', 'The resilience of the human spirit', 6463, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(53, 'Politic12', 'politic-12', 'The resilience of the human spirit', 2445, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(54, 'Politic13', 'politic-13', 'The resilience of the human spirit', 9137, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(55, 'Politic14', 'politic-14', 'The resilience of the human spirit', 3292, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(56, 'Politic15', 'politic-15', 'The resilience of the human spirit', 2155, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(57, 'Politic16', 'politic-16', 'The resilience of the human spirit', 4627, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(58, 'Politic17', 'politic-17', 'The resilience of the human spirit', 9749, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(59, 'Politic18', 'politic-18', 'The resilience of the human spirit', 6024, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 0, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(60, 'Politic19', 'politic-19', 'The resilience of the human spirit', 6979, 'products/dummy/image2.jpg', '[\"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\", \"products/dummy/image2.jpg\"]', 1, 10, 3, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(61, 'Thriller0', 'thriller-0', 'The resilience of the human spirit', 1024, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(62, 'Thriller1', 'thriller-1', 'The resilience of the human spirit', 3913, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(63, 'Thriller2', 'thriller-2', 'The resilience of the human spirit', 5513, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(64, 'Thriller3', 'thriller-3', 'The resilience of the human spirit', 7855, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(65, 'Thriller4', 'thriller-4', 'The resilience of the human spirit', 7343, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(66, 'Thriller5', 'thriller-5', 'The resilience of the human spirit', 7819, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(67, 'Thriller6', 'thriller-6', 'The resilience of the human spirit', 8234, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(68, 'Thriller7', 'thriller-7', 'The resilience of the human spirit', 8034, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(69, 'Thriller8', 'thriller-8', 'The resilience of the human spirit', 5883, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(70, 'Thriller9', 'thriller-9', 'The resilience of the human spirit', 2937, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(71, 'Thriller10', 'thriller-10', 'The resilience of the human spirit', 2647, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(72, 'Thriller11', 'thriller-11', 'The resilience of the human spirit', 1728, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(73, 'Thriller12', 'thriller-12', 'The resilience of the human spirit', 7787, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(74, 'Thriller13', 'thriller-13', 'The resilience of the human spirit', 7261, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(75, 'Thriller14', 'thriller-14', 'The resilience of the human spirit', 4008, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(76, 'Thriller15', 'thriller-15', 'The resilience of the human spirit', 1153, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(77, 'Thriller16', 'thriller-16', 'The resilience of the human spirit', 4559, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(78, 'Thriller17', 'thriller-17', 'The resilience of the human spirit', 7934, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 1, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(79, 'Thriller18', 'thriller-18', 'The resilience of the human spirit', 9557, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(80, 'Thriller19', 'thriller-19', 'The resilience of the human spirit', 9894, 'products/dummy/image3.jpg', '[\"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\", \"products/dummy/image3.jpg\"]', 0, 10, 4, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(81, 'Travel0', 'travel-0', 'The resilience of the human spirit', 3240, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(82, 'Travel1', 'travel-1', 'The resilience of the human spirit', 4460, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(83, 'Travel2', 'travel-2', 'The resilience of the human spirit', 6623, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(84, 'Travel3', 'travel-3', 'The resilience of the human spirit', 1718, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(85, 'Travel4', 'travel-4', 'The resilience of the human spirit', 5468, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(86, 'Travel5', 'travel-5', 'The resilience of the human spirit', 2911, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(87, 'Travel6', 'travel-6', 'The resilience of the human spirit', 4719, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(88, 'Travel7', 'travel-7', 'The resilience of the human spirit', 1493, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(89, 'Travel8', 'travel-8', 'The resilience of the human spirit', 2943, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(90, 'Travel9', 'travel-9', 'The resilience of the human spirit', 9089, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(91, 'Travel10', 'travel-10', 'The resilience of the human spirit', 5040, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(92, 'Travel11', 'travel-11', 'The resilience of the human spirit', 8806, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(93, 'Travel12', 'travel-12', 'The resilience of the human spirit', 2052, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(94, 'Travel13', 'travel-13', 'The resilience of the human spirit', 5088, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(95, 'Travel14', 'travel-14', 'The resilience of the human spirit', 7173, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(96, 'Travel15', 'travel-15', 'The resilience of the human spirit', 2770, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(97, 'Travel16', 'travel-16', 'The resilience of the human spirit', 1134, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(98, 'Travel17', 'travel-17', 'The resilience of the human spirit', 1669, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(99, 'Travel18', 'travel-18', 'The resilience of the human spirit', 1123, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 1, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42');
INSERT INTO `products` (`id`, `name`, `slug`, `details`, `price`, `image`, `images`, `featured`, `quantity`, `category_id`, `description`, `created_at`, `updated_at`) VALUES
(100, 'Travel19', 'travel-19', 'The resilience of the human spirit', 2274, 'products/dummy/image4.jpg', '[\"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\", \"products/dummy/image4.jpg\"]', 0, 10, 5, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(101, 'Comic0', 'comic-0', 'The resilience of the human spirit', 1857, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(102, 'Comic1', 'comic-1', 'The resilience of the human spirit', 8718, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(103, 'Comic2', 'comic-2', 'The resilience of the human spirit', 6986, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(104, 'Comic3', 'comic-3', 'The resilience of the human spirit', 6399, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(105, 'Comic4', 'comic-4', 'The resilience of the human spirit', 4244, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(106, 'Comic5', 'comic-5', 'The resilience of the human spirit', 4386, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(107, 'Comic6', 'comic-6', 'The resilience of the human spirit', 7913, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(108, 'Comic7', 'comic-7', 'The resilience of the human spirit', 4148, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(109, 'Comic8', 'comic-8', 'The resilience of the human spirit', 1988, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(110, 'Comic9', 'comic-9', 'The resilience of the human spirit', 5845, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(111, 'Comic10', 'comic-10', 'The resilience of the human spirit', 3376, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(112, 'Comic11', 'comic-11', 'The resilience of the human spirit', 2469, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(113, 'Comic12', 'comic-12', 'The resilience of the human spirit', 4007, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(114, 'Comic13', 'comic-13', 'The resilience of the human spirit', 3981, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(115, 'Comic14', 'comic-14', 'The resilience of the human spirit', 5673, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(116, 'Comic15', 'comic-15', 'The resilience of the human spirit', 4993, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(117, 'Comic16', 'comic-16', 'The resilience of the human spirit', 8983, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42'),
(118, 'Comic17', 'comic-17', 'The resilience of the human spirit', 7897, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(119, 'Comic18', 'comic-18', 'The resilience of the human spirit', 9417, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 0, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:41'),
(120, 'Comic19', 'comic-19', 'The resilience of the human spirit', 3877, 'products/dummy/image5.jpg', '[\"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\", \"products/dummy/image5.jpg\"]', 1, 10, 6, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Tempora, nisi. Exercitationem, explicabo obcaecati dicta libero inventore soluta ducimus, necessitatibus quaerat magnam sapiente mollitia eum beatae quidem et perferendis quis similique.', '2024-02-19 06:05:41', '2024-02-19 06:05:42');

-- --------------------------------------------------------

--
-- Table structure for table `product_tag`
--

CREATE TABLE `product_tag` (
  `id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `tag_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_tag`
--

INSERT INTO `product_tag` (`id`, `product_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 8, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(2, 47, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(3, 28, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(4, 6, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(5, 97, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(6, 32, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(7, 45, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(8, 28, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(9, 36, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(10, 57, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(11, 85, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(12, 73, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(13, 76, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(14, 53, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(15, 26, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(16, 83, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(17, 18, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(18, 48, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(19, 35, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(20, 47, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(21, 43, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(22, 4, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(23, 103, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(24, 64, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(25, 51, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(26, 38, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(27, 23, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(28, 84, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(29, 104, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(30, 29, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(31, 19, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(32, 86, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(33, 28, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(34, 50, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(35, 111, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(36, 16, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(37, 109, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(38, 89, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(39, 102, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(40, 34, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(41, 115, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(42, 62, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(43, 18, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(44, 6, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(45, 2, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(46, 28, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(47, 28, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(48, 16, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(49, 114, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(50, 41, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(51, 88, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(52, 90, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(53, 26, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(54, 34, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(55, 35, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(56, 106, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(57, 89, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(58, 98, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(59, 68, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(60, 7, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(61, 72, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(62, 102, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(63, 78, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(64, 57, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(65, 59, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(66, 75, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(67, 79, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(68, 22, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(69, 98, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(70, 33, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(71, 81, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(72, 55, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(73, 103, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(74, 71, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(75, 32, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(76, 118, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(77, 101, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(78, 65, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(79, 28, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(80, 53, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(81, 17, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(82, 89, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(83, 2, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(84, 48, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(85, 52, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(86, 109, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(87, 109, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(88, 82, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(89, 22, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(90, 20, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(91, 83, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(92, 72, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(93, 14, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(94, 13, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(95, 58, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(96, 57, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(97, 76, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(98, 41, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(99, 34, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(100, 119, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(101, 30, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(102, 86, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(103, 32, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(104, 115, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(105, 39, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(106, 104, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(107, 84, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(108, 108, 3, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(109, 39, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(110, 2, 2, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(111, 103, 1, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(112, 70, 4, '2024-02-19 06:05:42', '2024-02-19 06:05:42'),
(113, 85, 4, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(114, 69, 1, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(115, 91, 4, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(116, 55, 1, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(117, 90, 2, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(118, 17, 4, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(119, 100, 2, '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(120, 83, 1, '2024-02-19 06:05:43', '2024-02-19 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-02-19 06:05:43', '2024-02-19 06:05:43'),
(2, 'user', 'Normal User', '2024-02-19 06:05:43', '2024-02-19 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int UNSIGNED NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '1',
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'Site Title', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'Site Description', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', '', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', '', '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'Voyager', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', '', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', '', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', '', '', 'text', 1, 'Admin'),
(11, 'site.stock_threshold', 'Stock Threshold', '5', '', 'number', 6, 'Site');

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Tag 0', 'tag-0', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(2, 'Tag 1', 'tag-1', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(3, 'Tag 2', 'tag-2', '2024-02-19 06:05:40', '2024-02-19 06:05:40'),
(4, 'Tag 3', 'tag-3', '2024-02-19 06:05:40', '2024-02-19 06:05:40');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int UNSIGNED NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int UNSIGNED NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `github_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `github_id`, `facebook_id`, `google_id`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users/default.png', NULL, NULL, NULL, NULL, '$2y$10$W4.7y70Hrl9tsn7HbTPb0OwYwqu5eII09bAncdh4dB22LE6CGjT2C', 'a1DbopYM2PvurCK6743oOOT8jSzkFRg9Xrzb10x6OO3abihQkwh6iwXLEPbE', NULL, '2024-02-19 06:05:43', '2024-02-19 06:05:43');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_name_unique` (`name`),
  ADD UNIQUE KEY `category_slug_unique` (`slug`);

--
-- Indexes for table `country_visits`
--
ALTER TABLE `country_visits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_product_product_id_foreign` (`product_id`),
  ADD KEY `order_product_order_id_foreign` (`order_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_tag_product_id_foreign` (`product_id`),
  ADD KEY `product_tag_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_name_unique` (`name`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `country_visits`
--
ALTER TABLE `country_visits`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `product_tag`
--
ALTER TABLE `product_tag`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `order_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_tag`
--
ALTER TABLE `product_tag`
  ADD CONSTRAINT `product_tag_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_tag_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
