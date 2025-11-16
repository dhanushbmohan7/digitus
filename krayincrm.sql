-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 16, 2025 at 03:18 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `krayincrm`
--

-- --------------------------------------------------------

--
-- Table structure for table `kyactivities`
--

CREATE TABLE `kyactivities` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `comment` text DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `schedule_from` datetime DEFAULT NULL,
  `schedule_to` datetime DEFAULT NULL,
  `is_done` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyactivities`
--

INSERT INTO `kyactivities` (`id`, `title`, `type`, `comment`, `additional`, `schedule_from`, `schedule_to`, `is_done`, `user_id`, `created_at`, `updated_at`, `location`) VALUES
(1, 'Created', 'system', NULL, NULL, NULL, NULL, 1, 1, '2025-11-16 12:15:15', '2025-11-16 12:15:15', NULL),
(2, 'Updated Name', 'system', NULL, '{\"attribute\":\"Name\",\"new\":{\"value\":\"arjun\",\"label\":\"arjun\"},\"old\":{\"value\":null,\"label\":null}}', NULL, NULL, 1, 1, '2025-11-16 12:15:15', '2025-11-16 12:15:15', NULL),
(3, 'Updated Emails', 'system', NULL, '{\"attribute\":\"Emails\",\"new\":{\"value\":[{\"label\":\"work\",\"value\":\"arjun@gmail.com\"}],\"label\":\"arjun@gmail.com (work)\"},\"old\":{\"value\":null,\"label\":null}}', NULL, NULL, 1, 1, '2025-11-16 12:15:15', '2025-11-16 12:15:15', NULL),
(4, 'Updated Contact Numbers', 'system', NULL, '{\"attribute\":\"Contact Numbers\",\"new\":{\"value\":[{\"label\":\"work\",\"value\":\"\"}],\"label\":\" (work)\"},\"old\":{\"value\":null,\"label\":null}}', NULL, NULL, 1, 1, '2025-11-16 12:15:15', '2025-11-16 12:15:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kyactivity_files`
--

CREATE TABLE `kyactivity_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyactivity_participants`
--

CREATE TABLE `kyactivity_participants` (
  `id` int(10) UNSIGNED NOT NULL,
  `activity_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `person_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyattributes`
--

CREATE TABLE `kyattributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `lookup_type` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `quick_add` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyattributes`
--

INSERT INTO `kyattributes` (`id`, `code`, `name`, `type`, `lookup_type`, `entity_type`, `sort_order`, `validation`, `is_required`, `is_unique`, `quick_add`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(397, 'title', 'Title', 'text', NULL, 'leads', 1, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(398, 'description', 'Description', 'textarea', NULL, 'leads', 2, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(399, 'lead_value', 'Lead Value', 'price', NULL, 'leads', 3, 'decimal', 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(400, 'lead_source_id', 'Source', 'select', 'lead_sources', 'leads', 4, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(401, 'lead_type_id', 'Type', 'select', 'lead_types', 'leads', 5, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(402, 'user_id', 'Sales Owner', 'select', 'users', 'leads', 7, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(403, 'expected_close_date', 'Expected Close Date', 'date', NULL, 'leads', 8, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(404, 'lead_pipeline_id', 'Pipeline', 'lookup', 'lead_pipelines', 'leads', 9, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(405, 'lead_pipeline_stage_id', 'Stage', 'lookup', 'lead_pipeline_stages', 'leads', 10, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(406, 'name', 'Name', 'text', NULL, 'persons', 1, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(407, 'emails', 'Emails', 'email', NULL, 'persons', 2, NULL, 1, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(408, 'contact_numbers', 'Contact Numbers', 'phone', NULL, 'persons', 3, 'numeric', 0, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(409, 'job_title', 'Job Title', 'text', NULL, 'persons', 4, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(410, 'user_id', 'Sales Owner', 'lookup', 'users', 'persons', 5, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(411, 'organization_id', 'Organization', 'lookup', 'organizations', 'persons', 6, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(412, 'name', 'Name', 'text', NULL, 'organizations', 1, NULL, 1, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(413, 'address', 'Address', 'address', NULL, 'organizations', 2, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(414, 'user_id', 'Sales Owner', 'lookup', 'users', 'organizations', 3, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(415, 'name', 'Name', 'text', NULL, 'products', 1, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(416, 'description', 'Description', 'textarea', NULL, 'products', 2, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(417, 'sku', 'SKU', 'text', NULL, 'products', 3, NULL, 1, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(418, 'quantity', 'Quantity', 'text', NULL, 'products', 4, 'numeric', 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(419, 'price', 'Price', 'price', NULL, 'products', 5, 'decimal', 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(420, 'user_id', 'Sales Owner', 'select', 'users', 'quotes', 1, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(421, 'subject', 'Subject', 'text', NULL, 'quotes', 2, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(422, 'description', 'Description', 'textarea', NULL, 'quotes', 3, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(423, 'billing_address', 'Billing Address', 'address', NULL, 'quotes', 4, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(424, 'shipping_address', 'Shipping Address', 'address', NULL, 'quotes', 5, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(425, 'discount_percent', 'Discount Percent', 'text', NULL, 'quotes', 6, 'decimal', 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(426, 'discount_amount', 'Discount Amount', 'price', NULL, 'quotes', 7, 'decimal', 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(427, 'tax_amount', 'Tax Amount', 'price', NULL, 'quotes', 8, 'decimal', 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(428, 'adjustment_amount', 'Adjustment Amount', 'price', NULL, 'quotes', 9, 'decimal', 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(429, 'sub_total', 'Sub Total', 'price', NULL, 'quotes', 10, 'decimal', 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(430, 'grand_total', 'Grand Total', 'price', NULL, 'quotes', 11, 'decimal', 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(431, 'expired_at', 'Expired At', 'date', NULL, 'quotes', 12, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(432, 'person_id', 'Person', 'lookup', 'persons', 'quotes', 13, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(433, 'name', 'Name', 'text', NULL, 'warehouses', 1, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(434, 'description', 'Description', 'textarea', NULL, 'warehouses', 2, NULL, 0, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(435, 'contact_name', 'Contact Name', 'text', NULL, 'warehouses', 3, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(436, 'contact_emails', 'Contact Emails', 'email', NULL, 'warehouses', 4, NULL, 1, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(437, 'contact_numbers', 'Contact Numbers', 'phone', NULL, 'warehouses', 5, 'numeric', 0, 1, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(438, 'contact_address', 'Contact Address', 'address', NULL, 'warehouses', 6, NULL, 1, 0, 1, 0, '2025-11-16 12:07:51', '2025-11-16 12:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `kyattribute_options`
--

CREATE TABLE `kyattribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyattribute_values`
--

CREATE TABLE `kyattribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(255) NOT NULL DEFAULT 'leads',
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` double DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `entity_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyattribute_values`
--

INSERT INTO `kyattribute_values` (`id`, `entity_type`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `entity_id`, `attribute_id`, `unique_id`) VALUES
(1, 'persons', 'arjun', NULL, NULL, NULL, NULL, NULL, NULL, 3, 406, NULL),
(2, 'persons', NULL, NULL, NULL, NULL, NULL, NULL, '[{\"value\":\"arjun@gmail.com\",\"label\":\"work\"}]', 3, 407, NULL),
(3, 'persons', NULL, NULL, NULL, NULL, NULL, NULL, '[{\"value\":\"\",\"label\":\"work\"}]', 3, 408, NULL),
(4, 'persons', '', NULL, NULL, NULL, NULL, NULL, NULL, 3, 409, NULL),
(5, 'persons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 410, NULL),
(6, 'persons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 411, NULL),
(7, 'quotes', NULL, NULL, 1, NULL, NULL, NULL, NULL, 1, 420, NULL),
(8, 'quotes', 'Demo Subject', NULL, NULL, NULL, NULL, NULL, NULL, 1, 421, NULL),
(9, 'quotes', '', NULL, NULL, NULL, NULL, NULL, NULL, 1, 422, NULL),
(10, 'quotes', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Kannur\",\"country\":\"IN\",\"state\":\"KL\",\"city\":\"Kannur\",\"postcode\":\"670001\"}', 1, 423, NULL),
(11, 'quotes', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"Kannur\",\"country\":\"IN\",\"state\":\"KL\",\"city\":\"kannur\",\"postcode\":\"670001\"}', 1, 424, NULL),
(12, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 426, NULL),
(13, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 427, NULL),
(14, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 1, 428, NULL),
(15, 'quotes', NULL, NULL, NULL, 50000, NULL, NULL, NULL, 1, 429, NULL),
(16, 'quotes', NULL, NULL, NULL, 50000, NULL, NULL, NULL, 1, 430, NULL),
(17, 'quotes', NULL, NULL, NULL, NULL, NULL, '2025-11-27', NULL, 1, 431, NULL),
(18, 'quotes', NULL, NULL, 3, NULL, NULL, NULL, NULL, 1, 432, NULL),
(19, 'quotes', NULL, NULL, 1, NULL, NULL, NULL, NULL, 2, 420, NULL),
(20, 'quotes', 'office sofa', NULL, NULL, NULL, NULL, NULL, NULL, 2, 421, NULL),
(21, 'quotes', '', NULL, NULL, NULL, NULL, NULL, NULL, 2, 422, NULL),
(22, 'quotes', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"thalasseru\",\"country\":\"AX\",\"state\":\"sss\",\"city\":\"2222\",\"postcode\":\"123\"}', 2, 423, NULL),
(23, 'quotes', NULL, NULL, NULL, NULL, NULL, NULL, '{\"address\":\"\",\"country\":\"\",\"state\":\"\",\"city\":\"\",\"postcode\":\"\"}', 2, 424, NULL),
(24, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, 426, NULL),
(25, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, 427, NULL),
(26, 'quotes', NULL, NULL, NULL, 0, NULL, NULL, NULL, 2, 428, NULL),
(27, 'quotes', NULL, NULL, NULL, 25000, NULL, NULL, NULL, 2, 429, NULL),
(28, 'quotes', NULL, NULL, NULL, 25000, NULL, NULL, NULL, 2, 430, NULL),
(29, 'quotes', NULL, NULL, NULL, NULL, NULL, '2025-11-21', NULL, 2, 431, NULL),
(30, 'quotes', NULL, NULL, 3, NULL, NULL, NULL, NULL, 2, 432, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kycore_config`
--

CREATE TABLE `kycore_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycore_config`
--

INSERT INTO `kycore_config` (`id`, `code`, `value`, `created_at`, `updated_at`) VALUES
(1, 'general.general.locale_settings.locale', 'en', '2025-11-16 12:18:55', '2025-11-16 12:18:55'),
(2, 'general.general.admin_logo.logo_image', 'configuration/ca9HJpmGjn2Wq47tiUFrC1maCC7Ex878PUcS8iAT.jpg', '2025-11-16 12:18:55', '2025-11-16 12:18:55');

-- --------------------------------------------------------

--
-- Table structure for table `kycountries`
--

CREATE TABLE `kycountries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycountries`
--

INSERT INTO `kycountries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(243, 'UN', 'United Nations'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `kycountry_states`
--

CREATE TABLE `kycountry_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_code` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kycountry_states`
--

INSERT INTO `kycountry_states` (`id`, `country_code`, `code`, `name`, `country_id`) VALUES
(1, 'US', 'AL', 'Alabama', 244),
(2, 'US', 'AK', 'Alaska', 244),
(3, 'US', 'AS', 'American Samoa', 244),
(4, 'US', 'AZ', 'Arizona', 244),
(5, 'US', 'AR', 'Arkansas', 244),
(6, 'US', 'AE', 'Armed Forces Africa', 244),
(7, 'US', 'AA', 'Armed Forces Americas', 244),
(8, 'US', 'AE', 'Armed Forces Canada', 244),
(9, 'US', 'AE', 'Armed Forces Europe', 244),
(10, 'US', 'AE', 'Armed Forces Middle East', 244),
(11, 'US', 'AP', 'Armed Forces Pacific', 244),
(12, 'US', 'CA', 'California', 244),
(13, 'US', 'CO', 'Colorado', 244),
(14, 'US', 'CT', 'Connecticut', 244),
(15, 'US', 'DE', 'Delaware', 244),
(16, 'US', 'DC', 'District of Columbia', 244),
(17, 'US', 'FM', 'Federated States Of Micronesia', 244),
(18, 'US', 'FL', 'Florida', 244),
(19, 'US', 'GA', 'Georgia', 244),
(20, 'US', 'GU', 'Guam', 244),
(21, 'US', 'HI', 'Hawaii', 244),
(22, 'US', 'ID', 'Idaho', 244),
(23, 'US', 'IL', 'Illinois', 244),
(24, 'US', 'IN', 'Indiana', 244),
(25, 'US', 'IA', 'Iowa', 244),
(26, 'US', 'KS', 'Kansas', 244),
(27, 'US', 'KY', 'Kentucky', 244),
(28, 'US', 'LA', 'Louisiana', 244),
(29, 'US', 'ME', 'Maine', 244),
(30, 'US', 'MH', 'Marshall Islands', 244),
(31, 'US', 'MD', 'Maryland', 244),
(32, 'US', 'MA', 'Massachusetts', 244),
(33, 'US', 'MI', 'Michigan', 244),
(34, 'US', 'MN', 'Minnesota', 244),
(35, 'US', 'MS', 'Mississippi', 244),
(36, 'US', 'MO', 'Missouri', 244),
(37, 'US', 'MT', 'Montana', 244),
(38, 'US', 'NE', 'Nebraska', 244),
(39, 'US', 'NV', 'Nevada', 244),
(40, 'US', 'NH', 'New Hampshire', 244),
(41, 'US', 'NJ', 'New Jersey', 244),
(42, 'US', 'NM', 'New Mexico', 244),
(43, 'US', 'NY', 'New York', 244),
(44, 'US', 'NC', 'North Carolina', 244),
(45, 'US', 'ND', 'North Dakota', 244),
(46, 'US', 'MP', 'Northern Mariana Islands', 244),
(47, 'US', 'OH', 'Ohio', 244),
(48, 'US', 'OK', 'Oklahoma', 244),
(49, 'US', 'OR', 'Oregon', 244),
(50, 'US', 'PW', 'Palau', 244),
(51, 'US', 'PA', 'Pennsylvania', 244),
(52, 'US', 'PR', 'Puerto Rico', 244),
(53, 'US', 'RI', 'Rhode Island', 244),
(54, 'US', 'SC', 'South Carolina', 244),
(55, 'US', 'SD', 'South Dakota', 244),
(56, 'US', 'TN', 'Tennessee', 244),
(57, 'US', 'TX', 'Texas', 244),
(58, 'US', 'UT', 'Utah', 244),
(59, 'US', 'VT', 'Vermont', 244),
(60, 'US', 'VI', 'Virgin Islands', 244),
(61, 'US', 'VA', 'Virginia', 244),
(62, 'US', 'WA', 'Washington', 244),
(63, 'US', 'WV', 'West Virginia', 244),
(64, 'US', 'WI', 'Wisconsin', 244),
(65, 'US', 'WY', 'Wyoming', 244),
(66, 'CA', 'AB', 'Alberta', 40),
(67, 'CA', 'BC', 'British Columbia', 40),
(68, 'CA', 'MB', 'Manitoba', 40),
(69, 'CA', 'NL', 'Newfoundland and Labrador', 40),
(70, 'CA', 'NB', 'New Brunswick', 40),
(71, 'CA', 'NS', 'Nova Scotia', 40),
(72, 'CA', 'NT', 'Northwest Territories', 40),
(73, 'CA', 'NU', 'Nunavut', 40),
(74, 'CA', 'ON', 'Ontario', 40),
(75, 'CA', 'PE', 'Prince Edward Island', 40),
(76, 'CA', 'QC', 'Quebec', 40),
(77, 'CA', 'SK', 'Saskatchewan', 40),
(78, 'CA', 'YT', 'Yukon Territory', 40),
(79, 'DE', 'NDS', 'Niedersachsen', 88),
(80, 'DE', 'BAW', 'Baden-Württemberg', 88),
(81, 'DE', 'BAY', 'Bayern', 88),
(82, 'DE', 'BER', 'Berlin', 88),
(83, 'DE', 'BRG', 'Brandenburg', 88),
(84, 'DE', 'BRE', 'Bremen', 88),
(85, 'DE', 'HAM', 'Hamburg', 88),
(86, 'DE', 'HES', 'Hessen', 88),
(87, 'DE', 'MEC', 'Mecklenburg-Vorpommern', 88),
(88, 'DE', 'NRW', 'Nordrhein-Westfalen', 88),
(89, 'DE', 'RHE', 'Rheinland-Pfalz', 88),
(90, 'DE', 'SAR', 'Saarland', 88),
(91, 'DE', 'SAS', 'Sachsen', 88),
(92, 'DE', 'SAC', 'Sachsen-Anhalt', 88),
(93, 'DE', 'SCN', 'Schleswig-Holstein', 88),
(94, 'DE', 'THE', 'Thüringen', 88),
(95, 'AT', 'WI', 'Wien', 16),
(96, 'AT', 'NO', 'Niederösterreich', 16),
(97, 'AT', 'OO', 'Oberösterreich', 16),
(98, 'AT', 'SB', 'Salzburg', 16),
(99, 'AT', 'KN', 'Kärnten', 16),
(100, 'AT', 'ST', 'Steiermark', 16),
(101, 'AT', 'TI', 'Tirol', 16),
(102, 'AT', 'BL', 'Burgenland', 16),
(103, 'AT', 'VB', 'Vorarlberg', 16),
(104, 'CH', 'AG', 'Aargau', 220),
(105, 'CH', 'AI', 'Appenzell Innerrhoden', 220),
(106, 'CH', 'AR', 'Appenzell Ausserrhoden', 220),
(107, 'CH', 'BE', 'Bern', 220),
(108, 'CH', 'BL', 'Basel-Landschaft', 220),
(109, 'CH', 'BS', 'Basel-Stadt', 220),
(110, 'CH', 'FR', 'Freiburg', 220),
(111, 'CH', 'GE', 'Genf', 220),
(112, 'CH', 'GL', 'Glarus', 220),
(113, 'CH', 'GR', 'Graubünden', 220),
(114, 'CH', 'JU', 'Jura', 220),
(115, 'CH', 'LU', 'Luzern', 220),
(116, 'CH', 'NE', 'Neuenburg', 220),
(117, 'CH', 'NW', 'Nidwalden', 220),
(118, 'CH', 'OW', 'Obwalden', 220),
(119, 'CH', 'SG', 'St. Gallen', 220),
(120, 'CH', 'SH', 'Schaffhausen', 220),
(121, 'CH', 'SO', 'Solothurn', 220),
(122, 'CH', 'SZ', 'Schwyz', 220),
(123, 'CH', 'TG', 'Thurgau', 220),
(124, 'CH', 'TI', 'Tessin', 220),
(125, 'CH', 'UR', 'Uri', 220),
(126, 'CH', 'VD', 'Waadt', 220),
(127, 'CH', 'VS', 'Wallis', 220),
(128, 'CH', 'ZG', 'Zug', 220),
(129, 'CH', 'ZH', 'Zürich', 220),
(130, 'ES', 'A Coruсa', 'A Coruña', 206),
(131, 'ES', 'Alava', 'Alava', 206),
(132, 'ES', 'Albacete', 'Albacete', 206),
(133, 'ES', 'Alicante', 'Alicante', 206),
(134, 'ES', 'Almeria', 'Almeria', 206),
(135, 'ES', 'Asturias', 'Asturias', 206),
(136, 'ES', 'Avila', 'Avila', 206),
(137, 'ES', 'Badajoz', 'Badajoz', 206),
(138, 'ES', 'Baleares', 'Baleares', 206),
(139, 'ES', 'Barcelona', 'Barcelona', 206),
(140, 'ES', 'Burgos', 'Burgos', 206),
(141, 'ES', 'Caceres', 'Caceres', 206),
(142, 'ES', 'Cadiz', 'Cadiz', 206),
(143, 'ES', 'Cantabria', 'Cantabria', 206),
(144, 'ES', 'Castellon', 'Castellon', 206),
(145, 'ES', 'Ceuta', 'Ceuta', 206),
(146, 'ES', 'Ciudad Real', 'Ciudad Real', 206),
(147, 'ES', 'Cordoba', 'Cordoba', 206),
(148, 'ES', 'Cuenca', 'Cuenca', 206),
(149, 'ES', 'Girona', 'Girona', 206),
(150, 'ES', 'Granada', 'Granada', 206),
(151, 'ES', 'Guadalajara', 'Guadalajara', 206),
(152, 'ES', 'Guipuzcoa', 'Guipuzcoa', 206),
(153, 'ES', 'Huelva', 'Huelva', 206),
(154, 'ES', 'Huesca', 'Huesca', 206),
(155, 'ES', 'Jaen', 'Jaen', 206),
(156, 'ES', 'La Rioja', 'La Rioja', 206),
(157, 'ES', 'Las Palmas', 'Las Palmas', 206),
(158, 'ES', 'Leon', 'Leon', 206),
(159, 'ES', 'Lleida', 'Lleida', 206),
(160, 'ES', 'Lugo', 'Lugo', 206),
(161, 'ES', 'Madrid', 'Madrid', 206),
(162, 'ES', 'Malaga', 'Malaga', 206),
(163, 'ES', 'Melilla', 'Melilla', 206),
(164, 'ES', 'Murcia', 'Murcia', 206),
(165, 'ES', 'Navarra', 'Navarra', 206),
(166, 'ES', 'Ourense', 'Ourense', 206),
(167, 'ES', 'Palencia', 'Palencia', 206),
(168, 'ES', 'Pontevedra', 'Pontevedra', 206),
(169, 'ES', 'Salamanca', 'Salamanca', 206),
(170, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife', 206),
(171, 'ES', 'Segovia', 'Segovia', 206),
(172, 'ES', 'Sevilla', 'Sevilla', 206),
(173, 'ES', 'Soria', 'Soria', 206),
(174, 'ES', 'Tarragona', 'Tarragona', 206),
(175, 'ES', 'Teruel', 'Teruel', 206),
(176, 'ES', 'Toledo', 'Toledo', 206),
(177, 'ES', 'Valencia', 'Valencia', 206),
(178, 'ES', 'Valladolid', 'Valladolid', 206),
(179, 'ES', 'Vizcaya', 'Vizcaya', 206),
(180, 'ES', 'Zamora', 'Zamora', 206),
(181, 'ES', 'Zaragoza', 'Zaragoza', 206),
(182, 'FR', '1', 'Ain', 81),
(183, 'FR', '2', 'Aisne', 81),
(184, 'FR', '3', 'Allier', 81),
(185, 'FR', '4', 'Alpes-de-Haute-Provence', 81),
(186, 'FR', '5', 'Hautes-Alpes', 81),
(187, 'FR', '6', 'Alpes-Maritimes', 81),
(188, 'FR', '7', 'Ardèche', 81),
(189, 'FR', '8', 'Ardennes', 81),
(190, 'FR', '9', 'Ariège', 81),
(191, 'FR', '10', 'Aube', 81),
(192, 'FR', '11', 'Aude', 81),
(193, 'FR', '12', 'Aveyron', 81),
(194, 'FR', '13', 'Bouches-du-Rhône', 81),
(195, 'FR', '14', 'Calvados', 81),
(196, 'FR', '15', 'Cantal', 81),
(197, 'FR', '16', 'Charente', 81),
(198, 'FR', '17', 'Charente-Maritime', 81),
(199, 'FR', '18', 'Cher', 81),
(200, 'FR', '19', 'Corrèze', 81),
(201, 'FR', '2A', 'Corse-du-Sud', 81),
(202, 'FR', '2B', 'Haute-Corse', 81),
(203, 'FR', '21', 'Côte-d\'Or', 81),
(204, 'FR', '22', 'Côtes-d\'Armor', 81),
(205, 'FR', '23', 'Creuse', 81),
(206, 'FR', '24', 'Dordogne', 81),
(207, 'FR', '25', 'Doubs', 81),
(208, 'FR', '26', 'Drôme', 81),
(209, 'FR', '27', 'Eure', 81),
(210, 'FR', '28', 'Eure-et-Loir', 81),
(211, 'FR', '29', 'Finistère', 81),
(212, 'FR', '30', 'Gard', 81),
(213, 'FR', '31', 'Haute-Garonne', 81),
(214, 'FR', '32', 'Gers', 81),
(215, 'FR', '33', 'Gironde', 81),
(216, 'FR', '34', 'Hérault', 81),
(217, 'FR', '35', 'Ille-et-Vilaine', 81),
(218, 'FR', '36', 'Indre', 81),
(219, 'FR', '37', 'Indre-et-Loire', 81),
(220, 'FR', '38', 'Isère', 81),
(221, 'FR', '39', 'Jura', 81),
(222, 'FR', '40', 'Landes', 81),
(223, 'FR', '41', 'Loir-et-Cher', 81),
(224, 'FR', '42', 'Loire', 81),
(225, 'FR', '43', 'Haute-Loire', 81),
(226, 'FR', '44', 'Loire-Atlantique', 81),
(227, 'FR', '45', 'Loiret', 81),
(228, 'FR', '46', 'Lot', 81),
(229, 'FR', '47', 'Lot-et-Garonne', 81),
(230, 'FR', '48', 'Lozère', 81),
(231, 'FR', '49', 'Maine-et-Loire', 81),
(232, 'FR', '50', 'Manche', 81),
(233, 'FR', '51', 'Marne', 81),
(234, 'FR', '52', 'Haute-Marne', 81),
(235, 'FR', '53', 'Mayenne', 81),
(236, 'FR', '54', 'Meurthe-et-Moselle', 81),
(237, 'FR', '55', 'Meuse', 81),
(238, 'FR', '56', 'Morbihan', 81),
(239, 'FR', '57', 'Moselle', 81),
(240, 'FR', '58', 'Nièvre', 81),
(241, 'FR', '59', 'Nord', 81),
(242, 'FR', '60', 'Oise', 81),
(243, 'FR', '61', 'Orne', 81),
(244, 'FR', '62', 'Pas-de-Calais', 81),
(245, 'FR', '63', 'Puy-de-Dôme', 81),
(246, 'FR', '64', 'Pyrénées-Atlantiques', 81),
(247, 'FR', '65', 'Hautes-Pyrénées', 81),
(248, 'FR', '66', 'Pyrénées-Orientales', 81),
(249, 'FR', '67', 'Bas-Rhin', 81),
(250, 'FR', '68', 'Haut-Rhin', 81),
(251, 'FR', '69', 'Rhône', 81),
(252, 'FR', '70', 'Haute-Saône', 81),
(253, 'FR', '71', 'Saône-et-Loire', 81),
(254, 'FR', '72', 'Sarthe', 81),
(255, 'FR', '73', 'Savoie', 81),
(256, 'FR', '74', 'Haute-Savoie', 81),
(257, 'FR', '75', 'Paris', 81),
(258, 'FR', '76', 'Seine-Maritime', 81),
(259, 'FR', '77', 'Seine-et-Marne', 81),
(260, 'FR', '78', 'Yvelines', 81),
(261, 'FR', '79', 'Deux-Sèvres', 81),
(262, 'FR', '80', 'Somme', 81),
(263, 'FR', '81', 'Tarn', 81),
(264, 'FR', '82', 'Tarn-et-Garonne', 81),
(265, 'FR', '83', 'Var', 81),
(266, 'FR', '84', 'Vaucluse', 81),
(267, 'FR', '85', 'Vendée', 81),
(268, 'FR', '86', 'Vienne', 81),
(269, 'FR', '87', 'Haute-Vienne', 81),
(270, 'FR', '88', 'Vosges', 81),
(271, 'FR', '89', 'Yonne', 81),
(272, 'FR', '90', 'Territoire-de-Belfort', 81),
(273, 'FR', '91', 'Essonne', 81),
(274, 'FR', '92', 'Hauts-de-Seine', 81),
(275, 'FR', '93', 'Seine-Saint-Denis', 81),
(276, 'FR', '94', 'Val-de-Marne', 81),
(277, 'FR', '95', 'Val-d\'Oise', 81),
(278, 'RO', 'AB', 'Alba', 185),
(279, 'RO', 'AR', 'Arad', 185),
(280, 'RO', 'AG', 'Argeş', 185),
(281, 'RO', 'BC', 'Bacău', 185),
(282, 'RO', 'BH', 'Bihor', 185),
(283, 'RO', 'BN', 'Bistriţa-Năsăud', 185),
(284, 'RO', 'BT', 'Botoşani', 185),
(285, 'RO', 'BV', 'Braşov', 185),
(286, 'RO', 'BR', 'Brăila', 185),
(287, 'RO', 'B', 'Bucureşti', 185),
(288, 'RO', 'BZ', 'Buzău', 185),
(289, 'RO', 'CS', 'Caraş-Severin', 185),
(290, 'RO', 'CL', 'Călăraşi', 185),
(291, 'RO', 'CJ', 'Cluj', 185),
(292, 'RO', 'CT', 'Constanţa', 185),
(293, 'RO', 'CV', 'Covasna', 185),
(294, 'RO', 'DB', 'Dâmboviţa', 185),
(295, 'RO', 'DJ', 'Dolj', 185),
(296, 'RO', 'GL', 'Galaţi', 185),
(297, 'RO', 'GR', 'Giurgiu', 185),
(298, 'RO', 'GJ', 'Gorj', 185),
(299, 'RO', 'HR', 'Harghita', 185),
(300, 'RO', 'HD', 'Hunedoara', 185),
(301, 'RO', 'IL', 'Ialomiţa', 185),
(302, 'RO', 'IS', 'Iaşi', 185),
(303, 'RO', 'IF', 'Ilfov', 185),
(304, 'RO', 'MM', 'Maramureş', 185),
(305, 'RO', 'MH', 'Mehedinţi', 185),
(306, 'RO', 'MS', 'Mureş', 185),
(307, 'RO', 'NT', 'Neamţ', 185),
(308, 'RO', 'OT', 'Olt', 185),
(309, 'RO', 'PH', 'Prahova', 185),
(310, 'RO', 'SM', 'Satu-Mare', 185),
(311, 'RO', 'SJ', 'Sălaj', 185),
(312, 'RO', 'SB', 'Sibiu', 185),
(313, 'RO', 'SV', 'Suceava', 185),
(314, 'RO', 'TR', 'Teleorman', 185),
(315, 'RO', 'TM', 'Timiş', 185),
(316, 'RO', 'TL', 'Tulcea', 185),
(317, 'RO', 'VS', 'Vaslui', 185),
(318, 'RO', 'VL', 'Vâlcea', 185),
(319, 'RO', 'VN', 'Vrancea', 185),
(320, 'FI', 'Lappi', 'Lappi', 80),
(321, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa', 80),
(322, 'FI', 'Kainuu', 'Kainuu', 80),
(323, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala', 80),
(324, 'FI', 'Pohjois-Savo', 'Pohjois-Savo', 80),
(325, 'FI', 'Etelä-Savo', 'Etelä-Savo', 80),
(326, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa', 80),
(327, 'FI', 'Pohjanmaa', 'Pohjanmaa', 80),
(328, 'FI', 'Pirkanmaa', 'Pirkanmaa', 80),
(329, 'FI', 'Satakunta', 'Satakunta', 80),
(330, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa', 80),
(331, 'FI', 'Keski-Suomi', 'Keski-Suomi', 80),
(332, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi', 80),
(333, 'FI', 'Etelä-Karjala', 'Etelä-Karjala', 80),
(334, 'FI', 'Päijät-Häme', 'Päijät-Häme', 80),
(335, 'FI', 'Kanta-Häme', 'Kanta-Häme', 80),
(336, 'FI', 'Uusimaa', 'Uusimaa', 80),
(337, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa', 80),
(338, 'FI', 'Kymenlaakso', 'Kymenlaakso', 80),
(339, 'FI', 'Ahvenanmaa', 'Ahvenanmaa', 80),
(340, 'EE', 'EE-37', 'Harjumaa', 74),
(341, 'EE', 'EE-39', 'Hiiumaa', 74),
(342, 'EE', 'EE-44', 'Ida-Virumaa', 74),
(343, 'EE', 'EE-49', 'Jõgevamaa', 74),
(344, 'EE', 'EE-51', 'Järvamaa', 74),
(345, 'EE', 'EE-57', 'Läänemaa', 74),
(346, 'EE', 'EE-59', 'Lääne-Virumaa', 74),
(347, 'EE', 'EE-65', 'Põlvamaa', 74),
(348, 'EE', 'EE-67', 'Pärnumaa', 74),
(349, 'EE', 'EE-70', 'Raplamaa', 74),
(350, 'EE', 'EE-74', 'Saaremaa', 74),
(351, 'EE', 'EE-78', 'Tartumaa', 74),
(352, 'EE', 'EE-82', 'Valgamaa', 74),
(353, 'EE', 'EE-84', 'Viljandimaa', 74),
(354, 'EE', 'EE-86', 'Võrumaa', 74),
(355, 'LV', 'LV-DGV', 'Daugavpils', 125),
(356, 'LV', 'LV-JEL', 'Jelgava', 125),
(357, 'LV', 'Jēkabpils', 'Jēkabpils', 125),
(358, 'LV', 'LV-JUR', 'Jūrmala', 125),
(359, 'LV', 'LV-LPX', 'Liepāja', 125),
(360, 'LV', 'LV-LE', 'Liepājas novads', 125),
(361, 'LV', 'LV-REZ', 'Rēzekne', 125),
(362, 'LV', 'LV-RIX', 'Rīga', 125),
(363, 'LV', 'LV-RI', 'Rīgas novads', 125),
(364, 'LV', 'Valmiera', 'Valmiera', 125),
(365, 'LV', 'LV-VEN', 'Ventspils', 125),
(366, 'LV', 'Aglonas novads', 'Aglonas novads', 125),
(367, 'LV', 'LV-AI', 'Aizkraukles novads', 125),
(368, 'LV', 'Aizputes novads', 'Aizputes novads', 125),
(369, 'LV', 'Aknīstes novads', 'Aknīstes novads', 125),
(370, 'LV', 'Alojas novads', 'Alojas novads', 125),
(371, 'LV', 'Alsungas novads', 'Alsungas novads', 125),
(372, 'LV', 'LV-AL', 'Alūksnes novads', 125),
(373, 'LV', 'Amatas novads', 'Amatas novads', 125),
(374, 'LV', 'Apes novads', 'Apes novads', 125),
(375, 'LV', 'Auces novads', 'Auces novads', 125),
(376, 'LV', 'Babītes novads', 'Babītes novads', 125),
(377, 'LV', 'Baldones novads', 'Baldones novads', 125),
(378, 'LV', 'Baltinavas novads', 'Baltinavas novads', 125),
(379, 'LV', 'LV-BL', 'Balvu novads', 125),
(380, 'LV', 'LV-BU', 'Bauskas novads', 125),
(381, 'LV', 'Beverīnas novads', 'Beverīnas novads', 125),
(382, 'LV', 'Brocēnu novads', 'Brocēnu novads', 125),
(383, 'LV', 'Burtnieku novads', 'Burtnieku novads', 125),
(384, 'LV', 'Carnikavas novads', 'Carnikavas novads', 125),
(385, 'LV', 'Cesvaines novads', 'Cesvaines novads', 125),
(386, 'LV', 'Ciblas novads', 'Ciblas novads', 125),
(387, 'LV', 'LV-CE', 'Cēsu novads', 125),
(388, 'LV', 'Dagdas novads', 'Dagdas novads', 125),
(389, 'LV', 'LV-DA', 'Daugavpils novads', 125),
(390, 'LV', 'LV-DO', 'Dobeles novads', 125),
(391, 'LV', 'Dundagas novads', 'Dundagas novads', 125),
(392, 'LV', 'Durbes novads', 'Durbes novads', 125),
(393, 'LV', 'Engures novads', 'Engures novads', 125),
(394, 'LV', 'Garkalnes novads', 'Garkalnes novads', 125),
(395, 'LV', 'Grobiņas novads', 'Grobiņas novads', 125),
(396, 'LV', 'LV-GU', 'Gulbenes novads', 125),
(397, 'LV', 'Iecavas novads', 'Iecavas novads', 125),
(398, 'LV', 'Ikšķiles novads', 'Ikšķiles novads', 125),
(399, 'LV', 'Ilūkstes novads', 'Ilūkstes novads', 125),
(400, 'LV', 'Inčukalna novads', 'Inčukalna novads', 125),
(401, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads', 125),
(402, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads', 125),
(403, 'LV', 'Jaunpils novads', 'Jaunpils novads', 125),
(404, 'LV', 'LV-JL', 'Jelgavas novads', 125),
(405, 'LV', 'LV-JK', 'Jēkabpils novads', 125),
(406, 'LV', 'Kandavas novads', 'Kandavas novads', 125),
(407, 'LV', 'Kokneses novads', 'Kokneses novads', 125),
(408, 'LV', 'Krimuldas novads', 'Krimuldas novads', 125),
(409, 'LV', 'Krustpils novads', 'Krustpils novads', 125),
(410, 'LV', 'LV-KR', 'Krāslavas novads', 125),
(411, 'LV', 'LV-KU', 'Kuldīgas novads', 125),
(412, 'LV', 'Kārsavas novads', 'Kārsavas novads', 125),
(413, 'LV', 'Lielvārdes novads', 'Lielvārdes novads', 125),
(414, 'LV', 'LV-LM', 'Limbažu novads', 125),
(415, 'LV', 'Lubānas novads', 'Lubānas novads', 125),
(416, 'LV', 'LV-LU', 'Ludzas novads', 125),
(417, 'LV', 'Līgatnes novads', 'Līgatnes novads', 125),
(418, 'LV', 'Līvānu novads', 'Līvānu novads', 125),
(419, 'LV', 'LV-MA', 'Madonas novads', 125),
(420, 'LV', 'Mazsalacas novads', 'Mazsalacas novads', 125),
(421, 'LV', 'Mālpils novads', 'Mālpils novads', 125),
(422, 'LV', 'Mārupes novads', 'Mārupes novads', 125),
(423, 'LV', 'Naukšēnu novads', 'Naukšēnu novads', 125),
(424, 'LV', 'Neretas novads', 'Neretas novads', 125),
(425, 'LV', 'Nīcas novads', 'Nīcas novads', 125),
(426, 'LV', 'LV-OG', 'Ogres novads', 125),
(427, 'LV', 'Olaines novads', 'Olaines novads', 125),
(428, 'LV', 'Ozolnieku novads', 'Ozolnieku novads', 125),
(429, 'LV', 'LV-PR', 'Preiļu novads', 125),
(430, 'LV', 'Priekules novads', 'Priekules novads', 125),
(431, 'LV', 'Priekuļu novads', 'Priekuļu novads', 125),
(432, 'LV', 'Pārgaujas novads', 'Pārgaujas novads', 125),
(433, 'LV', 'Pāvilostas novads', 'Pāvilostas novads', 125),
(434, 'LV', 'Pļaviņu novads', 'Pļaviņu novads', 125),
(435, 'LV', 'Raunas novads', 'Raunas novads', 125),
(436, 'LV', 'Riebiņu novads', 'Riebiņu novads', 125),
(437, 'LV', 'Rojas novads', 'Rojas novads', 125),
(438, 'LV', 'Ropažu novads', 'Ropažu novads', 125),
(439, 'LV', 'Rucavas novads', 'Rucavas novads', 125),
(440, 'LV', 'Rugāju novads', 'Rugāju novads', 125),
(441, 'LV', 'Rundāles novads', 'Rundāles novads', 125),
(442, 'LV', 'LV-RE', 'Rēzeknes novads', 125),
(443, 'LV', 'Rūjienas novads', 'Rūjienas novads', 125),
(444, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads', 125),
(445, 'LV', 'Salas novads', 'Salas novads', 125),
(446, 'LV', 'Salaspils novads', 'Salaspils novads', 125),
(447, 'LV', 'LV-SA', 'Saldus novads', 125),
(448, 'LV', 'Saulkrastu novads', 'Saulkrastu novads', 125),
(449, 'LV', 'Siguldas novads', 'Siguldas novads', 125),
(450, 'LV', 'Skrundas novads', 'Skrundas novads', 125),
(451, 'LV', 'Skrīveru novads', 'Skrīveru novads', 125),
(452, 'LV', 'Smiltenes novads', 'Smiltenes novads', 125),
(453, 'LV', 'Stopiņu novads', 'Stopiņu novads', 125),
(454, 'LV', 'Strenču novads', 'Strenču novads', 125),
(455, 'LV', 'Sējas novads', 'Sējas novads', 125),
(456, 'LV', 'LV-TA', 'Talsu novads', 125),
(457, 'LV', 'LV-TU', 'Tukuma novads', 125),
(458, 'LV', 'Tērvetes novads', 'Tērvetes novads', 125),
(459, 'LV', 'Vaiņodes novads', 'Vaiņodes novads', 125),
(460, 'LV', 'LV-VK', 'Valkas novads', 125),
(461, 'LV', 'LV-VM', 'Valmieras novads', 125),
(462, 'LV', 'Varakļānu novads', 'Varakļānu novads', 125),
(463, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads', 125),
(464, 'LV', 'Vecumnieku novads', 'Vecumnieku novads', 125),
(465, 'LV', 'LV-VE', 'Ventspils novads', 125),
(466, 'LV', 'Viesītes novads', 'Viesītes novads', 125),
(467, 'LV', 'Viļakas novads', 'Viļakas novads', 125),
(468, 'LV', 'Viļānu novads', 'Viļānu novads', 125),
(469, 'LV', 'Vārkavas novads', 'Vārkavas novads', 125),
(470, 'LV', 'Zilupes novads', 'Zilupes novads', 125),
(471, 'LV', 'Ādažu novads', 'Ādažu novads', 125),
(472, 'LV', 'Ērgļu novads', 'Ērgļu novads', 125),
(473, 'LV', 'Ķeguma novads', 'Ķeguma novads', 125),
(474, 'LV', 'Ķekavas novads', 'Ķekavas novads', 125),
(475, 'LT', 'LT-AL', 'Alytaus Apskritis', 131),
(476, 'LT', 'LT-KU', 'Kauno Apskritis', 131),
(477, 'LT', 'LT-KL', 'Klaipėdos Apskritis', 131),
(478, 'LT', 'LT-MR', 'Marijampolės Apskritis', 131),
(479, 'LT', 'LT-PN', 'Panevėžio Apskritis', 131),
(480, 'LT', 'LT-SA', 'Šiaulių Apskritis', 131),
(481, 'LT', 'LT-TA', 'Tauragės Apskritis', 131),
(482, 'LT', 'LT-TE', 'Telšių Apskritis', 131),
(483, 'LT', 'LT-UT', 'Utenos Apskritis', 131),
(484, 'LT', 'LT-VL', 'Vilniaus Apskritis', 131),
(485, 'BR', 'AC', 'Acre', 31),
(486, 'BR', 'AL', 'Alagoas', 31),
(487, 'BR', 'AP', 'Amapá', 31),
(488, 'BR', 'AM', 'Amazonas', 31),
(489, 'BR', 'BA', 'Bahia', 31),
(490, 'BR', 'CE', 'Ceará', 31),
(491, 'BR', 'ES', 'Espírito Santo', 31),
(492, 'BR', 'GO', 'Goiás', 31),
(493, 'BR', 'MA', 'Maranhão', 31),
(494, 'BR', 'MT', 'Mato Grosso', 31),
(495, 'BR', 'MS', 'Mato Grosso do Sul', 31),
(496, 'BR', 'MG', 'Minas Gerais', 31),
(497, 'BR', 'PA', 'Pará', 31),
(498, 'BR', 'PB', 'Paraíba', 31),
(499, 'BR', 'PR', 'Paraná', 31),
(500, 'BR', 'PE', 'Pernambuco', 31),
(501, 'BR', 'PI', 'Piauí', 31),
(502, 'BR', 'RJ', 'Rio de Janeiro', 31),
(503, 'BR', 'RN', 'Rio Grande do Norte', 31),
(504, 'BR', 'RS', 'Rio Grande do Sul', 31),
(505, 'BR', 'RO', 'Rondônia', 31),
(506, 'BR', 'RR', 'Roraima', 31),
(507, 'BR', 'SC', 'Santa Catarina', 31),
(508, 'BR', 'SP', 'São Paulo', 31),
(509, 'BR', 'SE', 'Sergipe', 31),
(510, 'BR', 'TO', 'Tocantins', 31),
(511, 'BR', 'DF', 'Distrito Federal', 31),
(512, 'HR', 'HR-01', 'Zagrebačka županija', 59),
(513, 'HR', 'HR-02', 'Krapinsko-zagorska županija', 59),
(514, 'HR', 'HR-03', 'Sisačko-moslavačka županija', 59),
(515, 'HR', 'HR-04', 'Karlovačka županija', 59),
(516, 'HR', 'HR-05', 'Varaždinska županija', 59),
(517, 'HR', 'HR-06', 'Koprivničko-križevačka županija', 59),
(518, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija', 59),
(519, 'HR', 'HR-08', 'Primorsko-goranska županija', 59),
(520, 'HR', 'HR-09', 'Ličko-senjska županija', 59),
(521, 'HR', 'HR-10', 'Virovitičko-podravska županija', 59),
(522, 'HR', 'HR-11', 'Požeško-slavonska županija', 59),
(523, 'HR', 'HR-12', 'Brodsko-posavska županija', 59),
(524, 'HR', 'HR-13', 'Zadarska županija', 59),
(525, 'HR', 'HR-14', 'Osječko-baranjska županija', 59),
(526, 'HR', 'HR-15', 'Šibensko-kninska županija', 59),
(527, 'HR', 'HR-16', 'Vukovarsko-srijemska županija', 59),
(528, 'HR', 'HR-17', 'Splitsko-dalmatinska županija', 59),
(529, 'HR', 'HR-18', 'Istarska županija', 59),
(530, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija', 59),
(531, 'HR', 'HR-20', 'Međimurska županija', 59),
(532, 'HR', 'HR-21', 'Grad Zagreb', 59),
(533, 'IN', 'AN', 'Andaman and Nicobar Islands', 106),
(534, 'IN', 'AP', 'Andhra Pradesh', 106),
(535, 'IN', 'AR', 'Arunachal Pradesh', 106),
(536, 'IN', 'AS', 'Assam', 106),
(537, 'IN', 'BR', 'Bihar', 106),
(538, 'IN', 'CH', 'Chandigarh', 106),
(539, 'IN', 'CT', 'Chhattisgarh', 106),
(540, 'IN', 'DN', 'Dadra and Nagar Haveli', 106),
(541, 'IN', 'DD', 'Daman and Diu', 106),
(542, 'IN', 'DL', 'Delhi', 106),
(543, 'IN', 'GA', 'Goa', 106),
(544, 'IN', 'GJ', 'Gujarat', 106),
(545, 'IN', 'HR', 'Haryana', 106),
(546, 'IN', 'HP', 'Himachal Pradesh', 106),
(547, 'IN', 'JK', 'Jammu and Kashmir', 106),
(548, 'IN', 'JH', 'Jharkhand', 106),
(549, 'IN', 'KA', 'Karnataka', 106),
(550, 'IN', 'KL', 'Kerala', 106),
(551, 'IN', 'LD', 'Lakshadweep', 106),
(552, 'IN', 'MP', 'Madhya Pradesh', 106),
(553, 'IN', 'MH', 'Maharashtra', 106),
(554, 'IN', 'MN', 'Manipur', 106),
(555, 'IN', 'ML', 'Meghalaya', 106),
(556, 'IN', 'MZ', 'Mizoram', 106),
(557, 'IN', 'NL', 'Nagaland', 106),
(558, 'IN', 'OR', 'Odisha', 106),
(559, 'IN', 'PY', 'Puducherry', 106),
(560, 'IN', 'PB', 'Punjab', 106),
(561, 'IN', 'RJ', 'Rajasthan', 106),
(562, 'IN', 'SK', 'Sikkim', 106),
(563, 'IN', 'TN', 'Tamil Nadu', 106),
(564, 'IN', 'TG', 'Telangana', 106),
(565, 'IN', 'TR', 'Tripura', 106),
(566, 'IN', 'UP', 'Uttar Pradesh', 106),
(567, 'IN', 'UT', 'Uttarakhand', 106),
(568, 'IN', 'WB', 'West Bengal', 106);

-- --------------------------------------------------------

--
-- Table structure for table `kydatagrid_saved_filters`
--

CREATE TABLE `kydatagrid_saved_filters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`applied`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyemails`
--

CREATE TABLE `kyemails` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `source` varchar(255) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `reply` text DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `folders` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`folders`)),
  `from` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`from`)),
  `sender` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`sender`)),
  `reply_to` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reply_to`)),
  `cc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cc`)),
  `bcc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`bcc`)),
  `unique_id` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) NOT NULL,
  `reference_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`reference_ids`)),
  `person_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyemail_attachments`
--

CREATE TABLE `kyemail_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `size` int(11) DEFAULT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `content_id` varchar(255) DEFAULT NULL,
  `email_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyemail_tags`
--

CREATE TABLE `kyemail_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `email_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyemail_templates`
--

CREATE TABLE `kyemail_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyemail_templates`
--

INSERT INTO `kyemail_templates` (`id`, `name`, `subject`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Activity created', 'Activity created: {%activities.title%}', '<p style=\"font-size: 16px; color: #5e5e5e;\">You have a new activity, please find the details bellow:</p>\n                                <p><strong style=\"font-size: 16px;\">Details</strong></p>\n                                <table style=\"height: 97px; width: 952px;\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Title</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.title%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Type</td>\n                                                <td style=\"width: 770.047px; font-size: 16px;\">{%activities.type%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Date</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;\">Participants</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.participants%}</td>\n                                        </tr>\n                                    </tbody>\n                                </table>', '2025-11-16 12:07:51', '2025-11-16 12:07:51'),
(2, 'Activity modified', 'Activity modified: {%activities.title%}', '<p style=\"font-size: 16px; color: #5e5e5e;\">You have a new activity modified, please find the details bellow:</p>\n                                <p><strong style=\"font-size: 16px;\">Details</strong></p>\n                                <table style=\"height: 97px; width: 952px;\">\n                                    <tbody>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Title</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.title%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Type</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.type%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px;\">Date</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.schedule_from%} to&nbsp;{%activities.schedule_to%}</td>\n                                        </tr>\n                                        <tr>\n                                            <td style=\"width: 116.953px; color: #546e7a; font-size: 16px; vertical-align: text-top;\">Participants</td>\n                                            <td style=\"width: 770.047px; font-size: 16px;\">{%activities.participants%}</td>\n                                        </tr>\n                                    </tbody>\n                                </table>', '2025-11-16 12:07:51', '2025-11-16 12:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `kyfailed_jobs`
--

CREATE TABLE `kyfailed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kygroups`
--

CREATE TABLE `kygroups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyimports`
--

CREATE TABLE `kyimports` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `validation_strategy` varchar(255) NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT 0,
  `processed_rows_count` int(11) NOT NULL DEFAULT 0,
  `invalid_rows_count` int(11) NOT NULL DEFAULT 0,
  `errors_count` int(11) NOT NULL DEFAULT 0,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`errors`)),
  `field_separator` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `error_file_path` varchar(255) DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyimport_batches`
--

CREATE TABLE `kyimport_batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `import_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyjobs`
--

CREATE TABLE `kyjobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyjob_batches`
--

CREATE TABLE `kyjob_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyleads`
--

CREATE TABLE `kyleads` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `lead_value` decimal(12,4) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `lost_reason` text DEFAULT NULL,
  `closed_at` datetime DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `person_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_source_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_type_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_pipeline_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_pipeline_stage_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expected_close_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyleads`
--

INSERT INTO `kyleads` (`id`, `title`, `description`, `lead_value`, `status`, `lost_reason`, `closed_at`, `user_id`, `person_id`, `lead_source_id`, `lead_type_id`, `lead_pipeline_id`, `lead_pipeline_stage_id`, `created_at`, `updated_at`, `expected_close_date`) VALUES
(3, 'Need Sofa', 'Client interested Sofa', '35000.0000', NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, NULL, '2025-11-16 12:03:15', '2025-11-16 12:03:15', NULL),
(4, 'Plastic chair need', 'Wants plastic chair', '12000.0000', NULL, NULL, NULL, NULL, 2, NULL, 2, NULL, NULL, '2025-11-16 12:03:15', '2025-11-16 12:03:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kylead_activities`
--

CREATE TABLE `kylead_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kylead_pipelines`
--

CREATE TABLE `kylead_pipelines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `rotten_days` int(11) NOT NULL DEFAULT 30,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kylead_pipelines`
--

INSERT INTO `kylead_pipelines` (`id`, `name`, `is_default`, `rotten_days`, `created_at`, `updated_at`) VALUES
(1, 'Default Pipeline', 1, 30, '2025-11-16 12:07:51', '2025-11-16 12:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `kylead_pipeline_stages`
--

CREATE TABLE `kylead_pipeline_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `probability` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0,
  `lead_pipeline_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kylead_pipeline_stages`
--

INSERT INTO `kylead_pipeline_stages` (`id`, `code`, `name`, `probability`, `sort_order`, `lead_pipeline_id`) VALUES
(1, 'new', 'New', 100, 1, 1),
(2, 'follow-up', 'Follow Up', 100, 2, 1),
(3, 'prospect', 'Prospect', 100, 3, 1),
(4, 'negotiation', 'Negotiation', 100, 4, 1),
(5, 'won', 'Won', 100, 5, 1),
(6, 'lost', 'Lost', 0, 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kylead_products`
--

CREATE TABLE `kylead_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(12,4) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kylead_quotes`
--

CREATE TABLE `kylead_quotes` (
  `quote_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kylead_sources`
--

CREATE TABLE `kylead_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kylead_sources`
--

INSERT INTO `kylead_sources` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Email', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(2, 'Web', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(3, 'Web Form', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(4, 'Phone', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(5, 'Direct', '2025-11-16 12:03:15', '2025-11-16 12:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `kylead_stages`
--

CREATE TABLE `kylead_stages` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kylead_tags`
--

CREATE TABLE `kylead_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kylead_types`
--

CREATE TABLE `kylead_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kylead_types`
--

INSERT INTO `kylead_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'New Business', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(2, 'Existing Business', '2025-11-16 12:03:15', '2025-11-16 12:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `kymarketing_campaigns`
--

CREATE TABLE `kymarketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `mail_to` varchar(255) NOT NULL,
  `spooling` varchar(255) DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kymarketing_events`
--

CREATE TABLE `kymarketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kymigrations`
--

CREATE TABLE `kymigrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kymigrations`
--

INSERT INTO `kymigrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_08_19_000000_create_failed_jobs_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2021_03_12_060658_create_core_config_table', 1),
(4, '2021_03_12_074578_create_groups_table', 1),
(5, '2021_03_12_074597_create_roles_table', 1),
(6, '2021_03_12_074857_create_users_table', 1),
(7, '2021_03_12_074867_create_user_groups_table', 1),
(8, '2021_03_12_074957_create_user_password_resets_table', 1),
(9, '2021_04_02_080709_create_attributes_table', 1),
(10, '2021_04_02_080837_create_attribute_options_table', 1),
(11, '2021_04_06_122751_create_attribute_values_table', 1),
(12, '2021_04_09_051326_create_organizations_table', 1),
(13, '2021_04_09_065617_create_persons_table', 1),
(14, '2021_04_09_065617_create_products_table', 1),
(15, '2021_04_12_173232_create_countries_table', 1),
(16, '2021_04_12_173344_create_country_states_table', 1),
(17, '2021_04_21_172825_create_lead_sources_table', 1),
(18, '2021_04_21_172847_create_lead_types_table', 1),
(19, '2021_04_22_153258_create_lead_stages_table', 1),
(20, '2021_04_22_155706_create_lead_pipelines_table', 1),
(21, '2021_04_22_155838_create_lead_pipeline_stages_table', 1),
(22, '2021_04_22_164215_create_leads_table', 1),
(23, '2021_04_22_171805_create_lead_products_table', 1),
(24, '2021_05_12_150329_create_activities_table', 1),
(25, '2021_05_12_150329_create_lead_activities_table', 1),
(26, '2021_05_15_151855_create_activity_files_table', 1),
(27, '2021_05_20_141230_create_tags_table', 1),
(28, '2021_05_20_141240_create_lead_tags_table', 1),
(29, '2021_05_24_075618_create_emails_table', 1),
(30, '2021_05_25_072700_create_email_attachments_table', 1),
(31, '2021_06_07_162808_add_lead_view_permission_column_in_users_table', 1),
(32, '2021_07_01_230345_create_quotes_table', 1),
(33, '2021_07_01_231317_create_quote_items_table', 1),
(34, '2021_07_02_201822_create_lead_quotes_table', 1),
(35, '2021_07_28_142453_create_activity_participants_table', 1),
(36, '2021_08_26_133538_create_workflows_table', 1),
(37, '2021_09_03_172713_create_email_templates_table', 1),
(38, '2021_09_22_194103_add_unique_index_to_name_in_organizations_table', 1),
(39, '2021_09_22_194622_add_unique_index_to_name_in_groups_table', 1),
(40, '2021_09_23_221138_add_column_expected_close_date_in_leads_table', 1),
(41, '2021_09_30_135857_add_column_rotten_days_in_lead_pipelines_table', 1),
(42, '2021_09_30_154222_alter_lead_pipeline_stages_table', 1),
(43, '2021_09_30_161722_alter_leads_table', 1),
(44, '2021_09_30_183825_change_user_id_to_nullable_in_leads_table', 1),
(45, '2021_10_02_170105_insert_expected_closed_date_column_in_attributes_table', 1),
(46, '2021_11_11_180804_change_lead_pipeline_stage_id_constraint_in_leads_table', 1),
(47, '2021_11_12_171510_add_image_column_in_users_table', 1),
(48, '2021_11_17_190943_add_location_column_in_activities_table', 1),
(49, '2021_12_14_213049_create_web_forms_table', 1),
(50, '2021_12_14_214923_create_web_form_attributes_table', 1),
(51, '2024_01_11_154640_create_imports_table', 1),
(52, '2024_01_11_154741_create_import_batches_table', 1),
(53, '2024_05_10_152848_create_saved_filters_table', 1),
(54, '2024_06_21_160707_create_warehouses_table', 1),
(55, '2024_06_21_160735_create_warehouse_locations_table', 1),
(56, '2024_06_24_174241_insert_warehouse_attributes_in_attributes_table', 1),
(57, '2024_06_28_154009_create_product_inventories_table', 1),
(58, '2024_07_24_150821_create_webhooks_table', 1),
(59, '2024_07_31_092951_add_job_title_in_persons_table', 1),
(60, '2024_07_31_093603_add_organization_sales_owner_attribute_in_attributes_table', 1),
(61, '2024_07_31_093605_add_person_job_title_attribute_in_attributes_table', 1),
(62, '2024_07_31_093605_add_person_sales_owner_attribute_in_attributes_table', 1),
(63, '2024_08_06_145943_create_person_tags_table', 1),
(64, '2024_08_06_161212_create_person_activities_table', 1),
(65, '2024_08_10_100329_create_warehouse_activities_table', 1),
(66, '2024_08_10_100340_create_warehouse_tags_table', 1),
(67, '2024_08_10_150329_create_product_activities_table', 1),
(68, '2024_08_10_150340_create_product_tags_table', 1),
(69, '2024_08_14_102116_add_user_id_column_in_persons_table', 1),
(70, '2024_08_14_102136_add_user_id_column_in_organizations_table', 1),
(71, '2024_08_21_153011_add_leads_stage_and_pipeline_attributes', 1),
(72, '2024_08_27_091619_create_email_tags_table', 1),
(73, '2024_09_06_065808_alter_product_inventories_table', 1),
(74, '2024_09_09_094040_create_job_batches_table', 1),
(75, '2024_09_09_094042_create_jobs_table', 1),
(76, '2024_09_09_112201_add_unique_id_to_person_table', 1),
(77, '2024_10_29_044744_create_marketing_events_table', 1),
(78, '2024_11_04_122500_create_marketing_campaigns_table', 1),
(79, '2024_11_29_120302_modify_foreign_keys_in_leads_table', 1),
(80, '2025_01_17_151632_alter_activities_table', 1),
(81, '2025_01_29_133500_update_text_column_type_in_core_config_table', 1),
(82, '2025_03_19_132236_update_organization_id_column_in_persons_table', 1),
(83, '2025_07_01_133612_alter_lead_pipelines_table', 1),
(84, '2025_07_02_191710_alter_attribute_values_table', 1),
(85, '2025_07_09_133553_alter_email_templates_table', 1),
(86, '2025_11_16_190933_add_offer_price_to_products', 2),
(87, '2025_11_16_191409_add_offer_price_to_products1', 3);

-- --------------------------------------------------------

--
-- Table structure for table `kyorganizations`
--

CREATE TABLE `kyorganizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`address`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kypersonal_access_tokens`
--

CREATE TABLE `kypersonal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kypersons`
--

CREATE TABLE `kypersons` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`emails`)),
  `contact_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`contact_numbers`)),
  `organization_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kypersons`
--

INSERT INTO `kypersons` (`id`, `name`, `emails`, `contact_numbers`, `organization_id`, `created_at`, `updated_at`, `job_title`, `user_id`, `unique_id`) VALUES
(1, 'Dhanush', '[\"dhanush@gmail.com\"]', '9544533972', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'Arun', '[\"arun@gmail.com\"]', '9567843210', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'arjun', '[{\"value\":\"arjun@gmail.com\",\"label\":\"work\"}]', '[{\"value\":\"\",\"label\":\"work\"}]', NULL, '2025-11-16 12:15:15', '2025-11-16 12:15:15', '', NULL, 'arjun@gmail.com|');

-- --------------------------------------------------------

--
-- Table structure for table `kyperson_activities`
--

CREATE TABLE `kyperson_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyperson_activities`
--

INSERT INTO `kyperson_activities` (`activity_id`, `person_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `kyperson_tags`
--

CREATE TABLE `kyperson_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `person_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyproducts`
--

CREATE TABLE `kyproducts` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `price` decimal(12,4) DEFAULT NULL,
  `offer_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyproducts`
--

INSERT INTO `kyproducts` (`id`, `sku`, `name`, `description`, `quantity`, `price`, `offer_price`, `created_at`, `updated_at`) VALUES
(1, 'PROD001', 'Wodden Chair', NULL, 0, '50000.0000', '0.0000', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(2, 'PROD002', 'Offcie Sofa', NULL, 0, '35000.0000', '25000.0000', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(3, 'PROD003', 'Plastic Chair', NULL, 0, '15000.0000', '0.0000', '2025-11-16 12:03:15', '2025-11-16 12:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `kyproduct_activities`
--

CREATE TABLE `kyproduct_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyproduct_inventories`
--

CREATE TABLE `kyproduct_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `in_stock` int(11) NOT NULL DEFAULT 0,
  `allocated` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `warehouse_location_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyproduct_inventories`
--

INSERT INTO `kyproduct_inventories` (`id`, `in_stock`, `allocated`, `product_id`, `warehouse_id`, `warehouse_location_id`, `created_at`, `updated_at`) VALUES
(1, 50, 0, 1, NULL, NULL, '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(2, 120, 0, 2, NULL, NULL, '2025-11-16 12:03:15', '2025-11-16 12:03:15');

-- --------------------------------------------------------

--
-- Table structure for table `kyproduct_tags`
--

CREATE TABLE `kyproduct_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyquotes`
--

CREATE TABLE `kyquotes` (
  `id` int(10) UNSIGNED NOT NULL,
  `subject` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `billing_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`billing_address`)),
  `shipping_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`shipping_address`)),
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT NULL,
  `tax_amount` decimal(12,4) DEFAULT NULL,
  `adjustment_amount` decimal(12,4) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `person_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyquotes`
--

INSERT INTO `kyquotes` (`id`, `subject`, `description`, `billing_address`, `shipping_address`, `discount_percent`, `discount_amount`, `tax_amount`, `adjustment_amount`, `sub_total`, `grand_total`, `expired_at`, `person_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Demo Subject', '', '{\"address\":\"Kannur\",\"country\":\"IN\",\"state\":\"KL\",\"city\":\"Kannur\",\"postcode\":\"670001\"}', '{\"address\":\"Kannur\",\"country\":\"IN\",\"state\":\"KL\",\"city\":\"kannur\",\"postcode\":\"670001\"}', '0.0000', '0.0000', '0.0000', '0.0000', '50000.0000', '50000.0000', '2025-11-27 00:00:00', 3, 1, '2025-11-16 12:15:33', '2025-11-16 12:15:33'),
(2, 'office sofa', '', '{\"address\":\"thalasseru\",\"country\":\"AX\",\"state\":\"sss\",\"city\":\"2222\",\"postcode\":\"123\"}', '{\"address\":\"\",\"country\":\"\",\"state\":\"\",\"city\":\"\",\"postcode\":\"\"}', '0.0000', '0.0000', '0.0000', '0.0000', '25000.0000', '25000.0000', '2025-11-21 00:00:00', 3, 1, '2025-11-16 14:14:06', '2025-11-16 14:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `kyquote_items`
--

CREATE TABLE `kyquote_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `coupon_code` varchar(255) DEFAULT NULL,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quote_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyquote_items`
--

INSERT INTO `kyquote_items` (`id`, `sku`, `name`, `quantity`, `price`, `coupon_code`, `discount_percent`, `discount_amount`, `tax_percent`, `tax_amount`, `total`, `product_id`, `quote_id`, `created_at`, `updated_at`) VALUES
(1, 'PROD001', 'Wodden Chair', 1, '50000.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '50000.0000', 1, 1, '2025-11-16 12:15:34', '2025-11-16 12:15:34'),
(2, 'PROD002', 'Offcie Sofa', 1, '25000.0000', NULL, '0.0000', '0.0000', '0.0000', '0.0000', '25000.0000', 2, 2, '2025-11-16 14:14:06', '2025-11-16 14:14:06');

-- --------------------------------------------------------

--
-- Table structure for table `kyroles`
--

CREATE TABLE `kyroles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_type` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyroles`
--

INSERT INTO `kyroles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Administrator Role', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kytags`
--

CREATE TABLE `kytags` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `color` varchar(255) DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyusers`
--

CREATE TABLE `kyusers` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `view_permission` varchar(255) DEFAULT 'global',
  `role_id` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyusers`
--

INSERT INTO `kyusers` (`id`, `name`, `email`, `password`, `status`, `view_permission`, `role_id`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Example Admin', 'admin@example.com', '$2y$10$C8/R1wKKBQKxsVeltgsHtOFWEGz2P3TLcIV1veZ1sD7uxydqjsyzW', 1, 'global', 1, NULL, '2025-11-16 12:03:15', '2025-11-16 12:03:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `kyuser_groups`
--

CREATE TABLE `kyuser_groups` (
  `group_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyuser_password_resets`
--

CREATE TABLE `kyuser_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kywarehouses`
--

CREATE TABLE `kywarehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_emails` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_emails`)),
  `contact_numbers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_numbers`)),
  `contact_address` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`contact_address`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kywarehouse_activities`
--

CREATE TABLE `kywarehouse_activities` (
  `activity_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kywarehouse_locations`
--

CREATE TABLE `kywarehouse_locations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kywarehouse_tags`
--

CREATE TABLE `kywarehouse_tags` (
  `tag_id` int(10) UNSIGNED NOT NULL,
  `warehouse_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kywebhooks`
--

CREATE TABLE `kywebhooks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `end_point` varchar(255) NOT NULL,
  `query_params` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`query_params`)),
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`headers`)),
  `payload_type` varchar(255) NOT NULL,
  `raw_payload_type` varchar(255) NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`payload`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyweb_forms`
--

CREATE TABLE `kyweb_forms` (
  `id` int(10) UNSIGNED NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `submit_button_label` text NOT NULL,
  `submit_success_action` varchar(255) NOT NULL,
  `submit_success_content` varchar(255) NOT NULL,
  `create_lead` tinyint(1) NOT NULL DEFAULT 0,
  `background_color` varchar(255) DEFAULT NULL,
  `form_background_color` varchar(255) DEFAULT NULL,
  `form_title_color` varchar(255) DEFAULT NULL,
  `form_submit_button_color` varchar(255) DEFAULT NULL,
  `attribute_label_color` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyweb_form_attributes`
--

CREATE TABLE `kyweb_form_attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `placeholder` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `web_form_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kyworkflows`
--

CREATE TABLE `kyworkflows` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) NOT NULL,
  `event` varchar(255) NOT NULL,
  `condition_type` varchar(255) NOT NULL DEFAULT 'and',
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `actions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`actions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyworkflows`
--

INSERT INTO `kyworkflows` (`id`, `name`, `description`, `entity_type`, `event`, `condition_type`, `conditions`, `actions`, `created_at`, `updated_at`) VALUES
(1, 'Emails to participants after activity creation', 'Emails to participants after activity creation', 'activities', 'activity.create.after', 'and', '[{\"value\": [\"call\", \"meeting\", \"lunch\"], \"operator\": \"{}\", \"attribute\": \"type\", \"attribute_type\": \"multiselect\"}]', '[{\"id\": \"send_email_to_participants\", \"value\": \"1\"}]', '2025-11-16 12:03:15', '2025-11-16 12:03:15'),
(2, 'Emails to participants after activity updation', 'Emails to participants after activity updation', 'activities', 'activity.update.after', 'and', '[{\"value\": [\"call\", \"meeting\", \"lunch\"], \"operator\": \"{}\", \"attribute\": \"type\", \"attribute_type\": \"multiselect\"}]', '[{\"id\": \"send_email_to_participants\", \"value\": \"2\"}]', '2025-11-16 12:03:15', '2025-11-16 12:03:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kyactivities`
--
ALTER TABLE `kyactivities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyactivities_user_id_foreign` (`user_id`);

--
-- Indexes for table `kyactivity_files`
--
ALTER TABLE `kyactivity_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyactivity_files_activity_id_foreign` (`activity_id`);

--
-- Indexes for table `kyactivity_participants`
--
ALTER TABLE `kyactivity_participants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyactivity_participants_activity_id_foreign` (`activity_id`),
  ADD KEY `kyactivity_participants_user_id_foreign` (`user_id`),
  ADD KEY `kyactivity_participants_person_id_foreign` (`person_id`);

--
-- Indexes for table `kyattributes`
--
ALTER TABLE `kyattributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyattributes_code_entity_type_unique` (`code`,`entity_type`);

--
-- Indexes for table `kyattribute_options`
--
ALTER TABLE `kyattribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyattribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `kyattribute_values`
--
ALTER TABLE `kyattribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `entity_type_attribute_value_index_unique` (`entity_type`,`entity_id`,`attribute_id`),
  ADD UNIQUE KEY `kyattribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `kyattribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `kycore_config`
--
ALTER TABLE `kycore_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycountries`
--
ALTER TABLE `kycountries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kycountry_states`
--
ALTER TABLE `kycountry_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kycountry_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `kydatagrid_saved_filters`
--
ALTER TABLE `kydatagrid_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kydatagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`);

--
-- Indexes for table `kyemails`
--
ALTER TABLE `kyemails`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyemails_message_id_unique` (`message_id`),
  ADD UNIQUE KEY `kyemails_unique_id_unique` (`unique_id`),
  ADD KEY `kyemails_person_id_foreign` (`person_id`),
  ADD KEY `kyemails_lead_id_foreign` (`lead_id`),
  ADD KEY `kyemails_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `kyemail_attachments`
--
ALTER TABLE `kyemail_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyemail_attachments_email_id_foreign` (`email_id`);

--
-- Indexes for table `kyemail_tags`
--
ALTER TABLE `kyemail_tags`
  ADD KEY `kyemail_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `kyemail_tags_email_id_foreign` (`email_id`);

--
-- Indexes for table `kyemail_templates`
--
ALTER TABLE `kyemail_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyemail_templates_name_unique` (`name`);

--
-- Indexes for table `kyfailed_jobs`
--
ALTER TABLE `kyfailed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyfailed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kygroups`
--
ALTER TABLE `kygroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kygroups_name_unique` (`name`);

--
-- Indexes for table `kyimports`
--
ALTER TABLE `kyimports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyimport_batches`
--
ALTER TABLE `kyimport_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyimport_batches_import_id_foreign` (`import_id`);

--
-- Indexes for table `kyjobs`
--
ALTER TABLE `kyjobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyjobs_queue_index` (`queue`);

--
-- Indexes for table `kyjob_batches`
--
ALTER TABLE `kyjob_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyleads`
--
ALTER TABLE `kyleads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyleads_lead_pipeline_id_foreign` (`lead_pipeline_id`),
  ADD KEY `kyleads_lead_pipeline_stage_id_foreign` (`lead_pipeline_stage_id`),
  ADD KEY `kyleads_user_id_foreign` (`user_id`),
  ADD KEY `kyleads_person_id_foreign` (`person_id`),
  ADD KEY `kyleads_lead_source_id_foreign` (`lead_source_id`),
  ADD KEY `kyleads_lead_type_id_foreign` (`lead_type_id`);

--
-- Indexes for table `kylead_activities`
--
ALTER TABLE `kylead_activities`
  ADD KEY `kylead_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `kylead_activities_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `kylead_pipelines`
--
ALTER TABLE `kylead_pipelines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kylead_pipelines_name_unique` (`name`);

--
-- Indexes for table `kylead_pipeline_stages`
--
ALTER TABLE `kylead_pipeline_stages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kylead_pipeline_stages_code_lead_pipeline_id_unique` (`code`,`lead_pipeline_id`),
  ADD UNIQUE KEY `kylead_pipeline_stages_name_lead_pipeline_id_unique` (`name`,`lead_pipeline_id`),
  ADD KEY `kylead_pipeline_stages_lead_pipeline_id_foreign` (`lead_pipeline_id`);

--
-- Indexes for table `kylead_products`
--
ALTER TABLE `kylead_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kylead_products_lead_id_foreign` (`lead_id`),
  ADD KEY `kylead_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `kylead_quotes`
--
ALTER TABLE `kylead_quotes`
  ADD KEY `kylead_quotes_quote_id_foreign` (`quote_id`),
  ADD KEY `kylead_quotes_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `kylead_sources`
--
ALTER TABLE `kylead_sources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kylead_stages`
--
ALTER TABLE `kylead_stages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kylead_tags`
--
ALTER TABLE `kylead_tags`
  ADD KEY `kylead_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `kylead_tags_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `kylead_types`
--
ALTER TABLE `kylead_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kymarketing_campaigns`
--
ALTER TABLE `kymarketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kymarketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `kymarketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `kymarketing_events`
--
ALTER TABLE `kymarketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kymigrations`
--
ALTER TABLE `kymigrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyorganizations`
--
ALTER TABLE `kyorganizations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyorganizations_name_unique` (`name`),
  ADD KEY `kyorganizations_user_id_foreign` (`user_id`);

--
-- Indexes for table `kypersonal_access_tokens`
--
ALTER TABLE `kypersonal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kypersonal_access_tokens_token_unique` (`token`),
  ADD KEY `kypersonal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `kypersons`
--
ALTER TABLE `kypersons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kypersons_unique_id_unique` (`unique_id`),
  ADD KEY `kypersons_user_id_foreign` (`user_id`),
  ADD KEY `kypersons_organization_id_foreign` (`organization_id`);

--
-- Indexes for table `kyperson_activities`
--
ALTER TABLE `kyperson_activities`
  ADD KEY `kyperson_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `kyperson_activities_person_id_foreign` (`person_id`);

--
-- Indexes for table `kyperson_tags`
--
ALTER TABLE `kyperson_tags`
  ADD KEY `kyperson_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `kyperson_tags_person_id_foreign` (`person_id`);

--
-- Indexes for table `kyproducts`
--
ALTER TABLE `kyproducts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyproducts_sku_unique` (`sku`);

--
-- Indexes for table `kyproduct_activities`
--
ALTER TABLE `kyproduct_activities`
  ADD KEY `kyproduct_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `kyproduct_activities_product_id_foreign` (`product_id`);

--
-- Indexes for table `kyproduct_inventories`
--
ALTER TABLE `kyproduct_inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyproduct_inventories_product_id_foreign` (`product_id`),
  ADD KEY `kyproduct_inventories_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `kyproduct_inventories_warehouse_location_id_foreign` (`warehouse_location_id`);

--
-- Indexes for table `kyproduct_tags`
--
ALTER TABLE `kyproduct_tags`
  ADD KEY `kyproduct_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `kyproduct_tags_product_id_foreign` (`product_id`);

--
-- Indexes for table `kyquotes`
--
ALTER TABLE `kyquotes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyquotes_person_id_foreign` (`person_id`),
  ADD KEY `kyquotes_user_id_foreign` (`user_id`);

--
-- Indexes for table `kyquote_items`
--
ALTER TABLE `kyquote_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyquote_items_quote_id_foreign` (`quote_id`);

--
-- Indexes for table `kyroles`
--
ALTER TABLE `kyroles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kytags`
--
ALTER TABLE `kytags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kytags_user_id_foreign` (`user_id`);

--
-- Indexes for table `kyusers`
--
ALTER TABLE `kyusers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyusers_email_unique` (`email`),
  ADD KEY `kyusers_role_id_foreign` (`role_id`);

--
-- Indexes for table `kyuser_groups`
--
ALTER TABLE `kyuser_groups`
  ADD KEY `kyuser_groups_group_id_foreign` (`group_id`),
  ADD KEY `kyuser_groups_user_id_foreign` (`user_id`);

--
-- Indexes for table `kyuser_password_resets`
--
ALTER TABLE `kyuser_password_resets`
  ADD KEY `kyuser_password_resets_email_index` (`email`);

--
-- Indexes for table `kywarehouses`
--
ALTER TABLE `kywarehouses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kywarehouse_activities`
--
ALTER TABLE `kywarehouse_activities`
  ADD KEY `kywarehouse_activities_activity_id_foreign` (`activity_id`),
  ADD KEY `kywarehouse_activities_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `kywarehouse_locations`
--
ALTER TABLE `kywarehouse_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kywarehouse_locations_warehouse_id_name_unique` (`warehouse_id`,`name`);

--
-- Indexes for table `kywarehouse_tags`
--
ALTER TABLE `kywarehouse_tags`
  ADD KEY `kywarehouse_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `kywarehouse_tags_warehouse_id_foreign` (`warehouse_id`);

--
-- Indexes for table `kywebhooks`
--
ALTER TABLE `kywebhooks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyweb_forms`
--
ALTER TABLE `kyweb_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kyweb_forms_form_id_unique` (`form_id`);

--
-- Indexes for table `kyweb_form_attributes`
--
ALTER TABLE `kyweb_form_attributes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kyweb_form_attributes_attribute_id_foreign` (`attribute_id`),
  ADD KEY `kyweb_form_attributes_web_form_id_foreign` (`web_form_id`);

--
-- Indexes for table `kyworkflows`
--
ALTER TABLE `kyworkflows`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kyactivities`
--
ALTER TABLE `kyactivities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kyactivity_files`
--
ALTER TABLE `kyactivity_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyactivity_participants`
--
ALTER TABLE `kyactivity_participants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyattributes`
--
ALTER TABLE `kyattributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=439;

--
-- AUTO_INCREMENT for table `kyattribute_options`
--
ALTER TABLE `kyattribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyattribute_values`
--
ALTER TABLE `kyattribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `kycore_config`
--
ALTER TABLE `kycore_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kycountries`
--
ALTER TABLE `kycountries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `kycountry_states`
--
ALTER TABLE `kycountry_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;

--
-- AUTO_INCREMENT for table `kydatagrid_saved_filters`
--
ALTER TABLE `kydatagrid_saved_filters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyemails`
--
ALTER TABLE `kyemails`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyemail_attachments`
--
ALTER TABLE `kyemail_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyemail_templates`
--
ALTER TABLE `kyemail_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kyfailed_jobs`
--
ALTER TABLE `kyfailed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kygroups`
--
ALTER TABLE `kygroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyimports`
--
ALTER TABLE `kyimports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyimport_batches`
--
ALTER TABLE `kyimport_batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyjobs`
--
ALTER TABLE `kyjobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyleads`
--
ALTER TABLE `kyleads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kylead_pipelines`
--
ALTER TABLE `kylead_pipelines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kylead_pipeline_stages`
--
ALTER TABLE `kylead_pipeline_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kylead_products`
--
ALTER TABLE `kylead_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kylead_sources`
--
ALTER TABLE `kylead_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kylead_stages`
--
ALTER TABLE `kylead_stages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kylead_types`
--
ALTER TABLE `kylead_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kymarketing_campaigns`
--
ALTER TABLE `kymarketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kymarketing_events`
--
ALTER TABLE `kymarketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kymigrations`
--
ALTER TABLE `kymigrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `kyorganizations`
--
ALTER TABLE `kyorganizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kypersonal_access_tokens`
--
ALTER TABLE `kypersonal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kypersons`
--
ALTER TABLE `kypersons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kyproducts`
--
ALTER TABLE `kyproducts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kyproduct_inventories`
--
ALTER TABLE `kyproduct_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kyquotes`
--
ALTER TABLE `kyquotes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kyquote_items`
--
ALTER TABLE `kyquote_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `kyroles`
--
ALTER TABLE `kyroles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kytags`
--
ALTER TABLE `kytags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyusers`
--
ALTER TABLE `kyusers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kywarehouses`
--
ALTER TABLE `kywarehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kywarehouse_locations`
--
ALTER TABLE `kywarehouse_locations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kywebhooks`
--
ALTER TABLE `kywebhooks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyweb_forms`
--
ALTER TABLE `kyweb_forms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyweb_form_attributes`
--
ALTER TABLE `kyweb_form_attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kyworkflows`
--
ALTER TABLE `kyworkflows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kyactivities`
--
ALTER TABLE `kyactivities`
  ADD CONSTRAINT `kyactivities_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyactivity_files`
--
ALTER TABLE `kyactivity_files`
  ADD CONSTRAINT `kyactivity_files_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyactivity_participants`
--
ALTER TABLE `kyactivity_participants`
  ADD CONSTRAINT `kyactivity_participants_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyactivity_participants_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyactivity_participants_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyattribute_options`
--
ALTER TABLE `kyattribute_options`
  ADD CONSTRAINT `kyattribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `kyattributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyattribute_values`
--
ALTER TABLE `kyattribute_values`
  ADD CONSTRAINT `kyattribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `kyattributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kycountry_states`
--
ALTER TABLE `kycountry_states`
  ADD CONSTRAINT `kycountry_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `kycountries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyemails`
--
ALTER TABLE `kyemails`
  ADD CONSTRAINT `kyemails_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `kyleads` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kyemails_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `kyemails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyemails_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kyemail_attachments`
--
ALTER TABLE `kyemail_attachments`
  ADD CONSTRAINT `kyemail_attachments_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `kyemails` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyemail_tags`
--
ALTER TABLE `kyemail_tags`
  ADD CONSTRAINT `kyemail_tags_email_id_foreign` FOREIGN KEY (`email_id`) REFERENCES `kyemails` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyemail_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `kytags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyimport_batches`
--
ALTER TABLE `kyimport_batches`
  ADD CONSTRAINT `kyimport_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `kyimports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyleads`
--
ALTER TABLE `kyleads`
  ADD CONSTRAINT `kyleads_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `kylead_pipelines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyleads_lead_pipeline_stage_id_foreign` FOREIGN KEY (`lead_pipeline_stage_id`) REFERENCES `kylead_pipeline_stages` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kyleads_lead_source_id_foreign` FOREIGN KEY (`lead_source_id`) REFERENCES `kylead_sources` (`id`),
  ADD CONSTRAINT `kyleads_lead_type_id_foreign` FOREIGN KEY (`lead_type_id`) REFERENCES `kylead_types` (`id`),
  ADD CONSTRAINT `kyleads_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`),
  ADD CONSTRAINT `kyleads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kylead_activities`
--
ALTER TABLE `kylead_activities`
  ADD CONSTRAINT `kylead_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kylead_activities_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `kyleads` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kylead_pipeline_stages`
--
ALTER TABLE `kylead_pipeline_stages`
  ADD CONSTRAINT `kylead_pipeline_stages_lead_pipeline_id_foreign` FOREIGN KEY (`lead_pipeline_id`) REFERENCES `kylead_pipelines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kylead_products`
--
ALTER TABLE `kylead_products`
  ADD CONSTRAINT `kylead_products_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `kyleads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kylead_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `kyproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kylead_quotes`
--
ALTER TABLE `kylead_quotes`
  ADD CONSTRAINT `kylead_quotes_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `kyleads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kylead_quotes_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `kyquotes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kylead_tags`
--
ALTER TABLE `kylead_tags`
  ADD CONSTRAINT `kylead_tags_lead_id_foreign` FOREIGN KEY (`lead_id`) REFERENCES `kyleads` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kylead_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `kytags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kymarketing_campaigns`
--
ALTER TABLE `kymarketing_campaigns`
  ADD CONSTRAINT `kymarketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `kymarketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kymarketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `kyemail_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kyorganizations`
--
ALTER TABLE `kyorganizations`
  ADD CONSTRAINT `kyorganizations_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kypersons`
--
ALTER TABLE `kypersons`
  ADD CONSTRAINT `kypersons_organization_id_foreign` FOREIGN KEY (`organization_id`) REFERENCES `kyorganizations` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `kypersons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `kyperson_activities`
--
ALTER TABLE `kyperson_activities`
  ADD CONSTRAINT `kyperson_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyperson_activities_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyperson_tags`
--
ALTER TABLE `kyperson_tags`
  ADD CONSTRAINT `kyperson_tags_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyperson_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `kytags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyproduct_activities`
--
ALTER TABLE `kyproduct_activities`
  ADD CONSTRAINT `kyproduct_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyproduct_activities_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `kyproducts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyproduct_inventories`
--
ALTER TABLE `kyproduct_inventories`
  ADD CONSTRAINT `kyproduct_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `kyproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyproduct_inventories_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `kywarehouses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyproduct_inventories_warehouse_location_id_foreign` FOREIGN KEY (`warehouse_location_id`) REFERENCES `kywarehouse_locations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyproduct_tags`
--
ALTER TABLE `kyproduct_tags`
  ADD CONSTRAINT `kyproduct_tags_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `kyproducts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyproduct_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `kytags` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyquotes`
--
ALTER TABLE `kyquotes`
  ADD CONSTRAINT `kyquotes_person_id_foreign` FOREIGN KEY (`person_id`) REFERENCES `kypersons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyquotes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyquote_items`
--
ALTER TABLE `kyquote_items`
  ADD CONSTRAINT `kyquote_items_quote_id_foreign` FOREIGN KEY (`quote_id`) REFERENCES `kyquotes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kytags`
--
ALTER TABLE `kytags`
  ADD CONSTRAINT `kytags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyusers`
--
ALTER TABLE `kyusers`
  ADD CONSTRAINT `kyusers_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `kyroles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyuser_groups`
--
ALTER TABLE `kyuser_groups`
  ADD CONSTRAINT `kyuser_groups_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `kygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyuser_groups_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `kyusers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kywarehouse_activities`
--
ALTER TABLE `kywarehouse_activities`
  ADD CONSTRAINT `kywarehouse_activities_activity_id_foreign` FOREIGN KEY (`activity_id`) REFERENCES `kyactivities` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kywarehouse_activities_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `kywarehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kywarehouse_locations`
--
ALTER TABLE `kywarehouse_locations`
  ADD CONSTRAINT `kywarehouse_locations_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `kywarehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kywarehouse_tags`
--
ALTER TABLE `kywarehouse_tags`
  ADD CONSTRAINT `kywarehouse_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `kytags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kywarehouse_tags_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `kywarehouses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kyweb_form_attributes`
--
ALTER TABLE `kyweb_form_attributes`
  ADD CONSTRAINT `kyweb_form_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `kyattributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kyweb_form_attributes_web_form_id_foreign` FOREIGN KEY (`web_form_id`) REFERENCES `kyweb_forms` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
