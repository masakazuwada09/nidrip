-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 02, 2026 at 05:37 AM
-- Server version: 11.4.10-MariaDB-cll-lve-log
-- PHP Version: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dotitnaw_admin_nidrip`
--

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_about`
--

CREATE TABLE `aalierp_about` (
  `about_id` int(11) NOT NULL,
  `about_title` varchar(150) NOT NULL,
  `about_name` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `update_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_banner`
--

CREATE TABLE `aalierp_banner` (
  `banner_id` int(11) NOT NULL,
  `banner_size` varchar(150) NOT NULL,
  `banner_image` text NOT NULL,
  `banner_status` varchar(50) NOT NULL DEFAULT 'Active',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_banner`
--

INSERT INTO `aalierp_banner` (`banner_id`, `banner_size`, `banner_image`, `banner_status`, `created_on`, `updated_on`, `created_by`) VALUES
(1, 'Small', '../../uploads/banners/274097banner-s.png', 'Active', '2024-02-03 10:30:01', '0000-00-00 00:00:00', 'Admin'),
(2, 'Small', '../../uploads/banners/6034602.png', 'Active', '2024-02-03 10:32:54', '0000-00-00 00:00:00', 'Admin'),
(3, 'Large', '../../uploads/banners/199020banner-l.png', 'Active', '2024-02-03 10:32:54', '0000-00-00 00:00:00', 'Admin'),
(4, 'Large', '../../uploads/banners/591311banner-l2.png', 'Active', '2024-02-03 10:32:54', '0000-00-00 00:00:00', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_brand`
--

CREATE TABLE `aalierp_brand` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(150) NOT NULL,
  `brand_image` text NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_cart`
--

CREATE TABLE `aalierp_cart` (
  `id` int(10) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL,
  `ship` float NOT NULL,
  `coupon` varchar(20) NOT NULL,
  `cdiscount` double NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_category`
--

CREATE TABLE `aalierp_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(150) NOT NULL,
  `category_image` varchar(150) NOT NULL,
  `category_status` varchar(50) NOT NULL DEFAULT 'Active',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_category`
--

INSERT INTO `aalierp_category` (`category_id`, `category_name`, `category_image`, `category_status`, `created_on`, `updated_on`, `created_by`) VALUES
(1, 'Washing Machine', 'washing-machine.png', 'Active', '2026-02-23 22:14:26', '2026-02-23 22:24:43', 'Super'),
(2, 'Refrigerator', 'refrigerator.png', 'Active', '2026-02-23 22:14:26', '2026-02-23 22:24:43', 'Super'),
(3, 'Ovens', 'oven.png', 'Active', '2026-02-23 22:14:26', '2026-02-23 22:24:43', 'Super'),
(4, 'Dish Washer', 'dish-washer.png', 'Active', '2026-02-23 22:14:26', '2026-02-23 22:24:43', 'Super'),
(5, 'Oven', '', 'Active', '2026-02-28 23:36:28', '0000-00-00 00:00:00', 'Super');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_contents`
--

CREATE TABLE `aalierp_contents` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_logo` varchar(255) NOT NULL,
  `company_salogan` varchar(255) NOT NULL,
  `company_phone` varchar(100) NOT NULL,
  `company_mobile` varchar(100) NOT NULL,
  `company_email` varchar(100) NOT NULL,
  `company_web` varchar(150) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `company_city` varchar(150) NOT NULL,
  `company_country` varchar(80) NOT NULL,
  `company_pob` varchar(50) NOT NULL,
  `company_currency` varchar(10) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_contents`
--

INSERT INTO `aalierp_contents` (`company_id`, `company_name`, `company_logo`, `company_salogan`, `company_phone`, `company_mobile`, `company_email`, `company_web`, `company_address`, `company_city`, `company_country`, `company_pob`, `company_currency`, `created_on`, `updated_on`, `created_by`) VALUES
(1, 'NI DRIP', 'logo.png', 'Electronic Appliances', '+44', '+44', 'sales@nidrip.com', 'https://nidrip.com', 'Inductrial Area', 'DownTown', 'Ireland', '652140', '£', '2026-02-23 00:00:00', '0000-00-00 00:00:00', 'Super Admin');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_coupon`
--

CREATE TABLE `aalierp_coupon` (
  `id` int(11) NOT NULL,
  `coupon_cid` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_discount` double NOT NULL,
  `coupon_valid_from` date NOT NULL,
  `coupon_valid_to` date NOT NULL,
  `coupon_minimum` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Active',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_deposit`
--

CREATE TABLE `aalierp_deposit` (
  `dep_id` int(11) NOT NULL,
  `dep_date` date NOT NULL,
  `slip_id` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `dep_deduct` double NOT NULL,
  `dep_amount` double NOT NULL,
  `dep_way` varchar(50) NOT NULL,
  `dep_slip` varchar(100) NOT NULL,
  `dep_reason` varchar(250) NOT NULL,
  `dep_status` varchar(50) NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_designation`
--

CREATE TABLE `aalierp_designation` (
  `desig_id` int(11) NOT NULL,
  `desig_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_expenses`
--

CREATE TABLE `aalierp_expenses` (
  `exp_id` int(11) NOT NULL,
  `exp_date` datetime NOT NULL,
  `exp_detail` varchar(150) NOT NULL,
  `exp_amount` double NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_gallery`
--

CREATE TABLE `aalierp_gallery` (
  `gallery_id` int(11) NOT NULL,
  `gallery_name` varchar(100) NOT NULL,
  `gallery_detail` varchar(255) NOT NULL,
  `gallery_image` varchar(150) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_gateway`
--

CREATE TABLE `aalierp_gateway` (
  `gate_id` int(11) NOT NULL,
  `gate_title` varchar(200) NOT NULL,
  `gate_name` varchar(200) NOT NULL,
  `gate_url` varchar(200) NOT NULL,
  `gate_acc` varchar(150) NOT NULL,
  `gate_iban` varchar(50) NOT NULL,
  `gate_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_header`
--

CREATE TABLE `aalierp_header` (
  `header_id` int(11) NOT NULL,
  `pixel_logo` varchar(255) NOT NULL,
  `lajthiza_logo` varchar(255) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_image`
--

CREATE TABLE `aalierp_image` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_image` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_login_detail`
--

CREATE TABLE `aalierp_login_detail` (
  `id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `login_name` varchar(100) NOT NULL,
  `login_email` varchar(100) NOT NULL,
  `login_date` varchar(100) NOT NULL,
  `logout_date` datetime NOT NULL,
  `login_ip` varchar(100) NOT NULL,
  `login_country` varchar(100) NOT NULL,
  `login_city` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_login_detail`
--

INSERT INTO `aalierp_login_detail` (`id`, `login_id`, `login_name`, `login_email`, `login_date`, `logout_date`, `login_ip`, `login_country`, `login_city`) VALUES
(1, 1, 'Admin', 'admin@etewish.com', '2024-01-30 22:30:07', '0000-00-00 00:00:00', '154.80.66.2', 'Pakistan', 'Faisalabad'),
(2, 1, 'Admin', 'admin@etewish.com', '2024-02-03 09:36:47', '0000-00-00 00:00:00', '154.80.92.167', 'Pakistan', 'Faisalabad'),
(3, 1, 'Admin', 'admin@etewish.com', '2024-02-03 10:19:45', '0000-00-00 00:00:00', '154.80.92.167', 'Pakistan', 'Faisalabad'),
(4, 1, 'Admin', 'admin@etewish.com', '2024-02-03 10:25:55', '0000-00-00 00:00:00', '154.80.72.189', 'Pakistan', 'Faisalabad'),
(5, 1, 'Admin', 'admin@etewish.com', '2024-02-03 12:02:35', '0000-00-00 00:00:00', '182.186.48.88', 'Pakistan', 'Multan'),
(6, 1, 'Admin', 'admin@etewish.com', '2024-02-12 12:02:09', '0000-00-00 00:00:00', '39.37.90.56', 'Pakistan', 'Islamabad'),
(7, 1, 'Admin', 'admin@etewish.com', '2024-02-12 13:14:32', '0000-00-00 00:00:00', '39.37.90.56', 'Pakistan', 'Islamabad'),
(8, 1, 'Admin', 'admin@etewish.com', '2024-02-12 13:36:18', '0000-00-00 00:00:00', '39.37.90.56', 'Pakistan', 'Islamabad'),
(9, 1, 'Admin', 'admin@etewish.com', '2024-02-12 14:03:42', '0000-00-00 00:00:00', '39.37.90.56', 'Pakistan', 'Islamabad'),
(10, 1, 'Admin', 'admin@etewish.com', '2024-02-12 14:09:23', '0000-00-00 00:00:00', '39.37.90.56', 'Pakistan', 'Islamabad');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_newletter`
--

CREATE TABLE `aalierp_newletter` (
  `newletter_id` int(11) NOT NULL,
  `newletter_email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_payment_method`
--

CREATE TABLE `aalierp_payment_method` (
  `method_id` int(11) NOT NULL,
  `method_name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_product`
--

CREATE TABLE `aalierp_product` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `product_image` varchar(200) NOT NULL,
  `product_video` varchar(250) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `product_price` double NOT NULL,
  `product_old_price` double NOT NULL,
  `product_discount` double NOT NULL,
  `product_keywords` varchar(200) NOT NULL,
  `product_desc` longtext NOT NULL,
  `product_status` varchar(50) NOT NULL DEFAULT 'Active',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aalierp_product`
--

INSERT INTO `aalierp_product` (`product_id`, `category_id`, `subcategory_id`, `unit_id`, `product_image`, `product_video`, `product_name`, `product_price`, `product_old_price`, `product_discount`, `product_keywords`, `product_desc`, `product_status`, `created_on`, `updated_on`, `created_by`) VALUES
(1, 1, 2, 6, '1771873321832-Ad Website uae.png', '', 'Washing Machine', 34, 35, 0, 'terte', 'dfsfsdf', 'Active', '2026-02-24 00:02:01', '0000-00-00 00:00:00', 'Unknown'),
(2, 2, 2, 6, '1772305267828-ecommerce website USA.png', '', 'Refrigerator Black', 500, 550, 2, 'terte', 'sdfsdf', 'Active', '2026-02-28 14:01:07', '0000-00-00 00:00:00', 'Unknown'),
(3, 3, 2, 6, '1772339838556-Ramadhan Kareem.png', '', 'Oven Grey', 430, 500, 0, 'terte', 'dfgfgd', 'Active', '2026-02-28 23:37:18', '0000-00-00 00:00:00', 'Unknown'),
(4, 4, 2, 6, '1772339896237-accountant.png', '', 'Dish Washer', 325, 350, 0, '', '', 'Active', '2026-02-28 23:38:16', '0000-00-00 00:00:00', 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_purchases`
--

CREATE TABLE `aalierp_purchases` (
  `purchase_id` int(11) NOT NULL,
  `purchase_order_date` datetime NOT NULL,
  `purchase_sup_id` int(11) NOT NULL,
  `purchase_sub_total` double NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_purchases_detail`
--

CREATE TABLE `aalierp_purchases_detail` (
  `pur_detail_id` int(11) NOT NULL,
  `pur_detail_no` int(11) NOT NULL,
  `pur_detail_pro` int(11) NOT NULL,
  `pur_detail_qty` double NOT NULL,
  `pur_detail_unit` varchar(50) NOT NULL,
  `pur_detail_price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_reviews`
--

CREATE TABLE `aalierp_reviews` (
  `review_id` int(11) NOT NULL,
  `review_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `review_message` text NOT NULL,
  `review_status` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_sales`
--

CREATE TABLE `aalierp_sales` (
  `sales_id` int(11) NOT NULL,
  `sales_cust_id` int(11) NOT NULL,
  `sales_pro_id` int(11) NOT NULL,
  `sales_pro_tqty` double NOT NULL,
  `sales_qty` double NOT NULL,
  `sales_unit` varchar(50) NOT NULL,
  `sales_price` double NOT NULL,
  `sales_total_price` double NOT NULL,
  `sales_status` varchar(20) DEFAULT 'Paid',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_shipment`
--

CREATE TABLE `aalierp_shipment` (
  `ship_id` int(11) NOT NULL,
  `ship_type` varchar(50) NOT NULL,
  `country_id` varchar(100) NOT NULL,
  `ship_price` float NOT NULL,
  `ship_factor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_slide`
--

CREATE TABLE `aalierp_slide` (
  `slide_id` int(11) NOT NULL,
  `slide_title` varchar(200) NOT NULL,
  `slide_detail` varchar(255) NOT NULL,
  `slide_image` varchar(255) NOT NULL,
  `slide_status` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_staff`
--

CREATE TABLE `aalierp_staff` (
  `staff_id` int(11) NOT NULL,
  `staff_name` varchar(150) NOT NULL,
  `staff_designation` int(11) NOT NULL,
  `staff_mobile` varchar(15) NOT NULL,
  `staff_image` varchar(200) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_staff_availability`
--

CREATE TABLE `aalierp_staff_availability` (
  `avail_id` int(11) NOT NULL,
  `avail_date` varchar(150) NOT NULL,
  `avail_time` time NOT NULL,
  `avail_location` varchar(255) NOT NULL,
  `avail_staff` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_stock`
--

CREATE TABLE `aalierp_stock` (
  `stock_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `stock_qty` double NOT NULL,
  `stock_sold` double NOT NULL,
  `stock_expired` double NOT NULL,
  `stock_damaged` double NOT NULL,
  `stock_available` double NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_subcategory`
--

CREATE TABLE `aalierp_subcategory` (
  `subcategory_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `subcategory_name` varchar(150) NOT NULL,
  `subcategory_status` varchar(30) NOT NULL DEFAULT 'Active',
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_subcategory`
--

INSERT INTO `aalierp_subcategory` (`subcategory_id`, `category_id`, `subcategory_name`, `subcategory_status`, `created_on`, `updated_on`, `created_by`) VALUES
(2, 1, 'Washing Machines', 'Active', '2026-02-23 22:53:14', '2026-02-23 22:57:39', 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_suppliers`
--

CREATE TABLE `aalierp_suppliers` (
  `sup_id` int(11) NOT NULL,
  `sup_name` varchar(100) NOT NULL,
  `sup_trn` varchar(20) NOT NULL,
  `sup_phone` varchar(15) NOT NULL,
  `sup_mobile` varchar(15) NOT NULL,
  `sup_email` varchar(50) NOT NULL,
  `sup_web` varchar(50) NOT NULL,
  `sup_address` varchar(100) NOT NULL,
  `sup_city` varchar(50) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_tickets`
--

CREATE TABLE `aalierp_tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ticket_date` datetime NOT NULL,
  `ticket_subject` varchar(150) NOT NULL,
  `ticket_message` text NOT NULL,
  `ticket_status` varchar(50) NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_unit`
--

CREATE TABLE `aalierp_unit` (
  `unit_id` int(11) NOT NULL,
  `unit_name` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `created_by` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `aalierp_unit`
--

INSERT INTO `aalierp_unit` (`unit_id`, `unit_name`, `created_on`, `updated_on`, `created_by`) VALUES
(6, 'NOS', '2026-02-23 20:56:13', '2026-02-23 22:03:23', 'Unknown');

-- --------------------------------------------------------

--
-- Table structure for table `aalierp_user`
--

CREATE TABLE `aalierp_user` (
  `user_id` int(50) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'user.png',
  `user_name` varchar(200) NOT NULL,
  `user_username` varchar(150) NOT NULL,
  `user_mobile` varchar(20) NOT NULL,
  `user_mobile_otp` varchar(10) NOT NULL,
  `user_mobile_status` varchar(20) NOT NULL,
  `user_email` varchar(150) NOT NULL,
  `user_email_otp` varchar(10) NOT NULL,
  `user_email_status` varchar(20) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_passcode` varchar(100) NOT NULL,
  `user_pin` varchar(5) NOT NULL,
  `user_type` varchar(50) NOT NULL,
  `user_role` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_city` varchar(100) NOT NULL,
  `user_country` varchar(100) NOT NULL,
  `user_cc` varchar(10) NOT NULL,
  `user_cur` varchar(5) NOT NULL,
  `user_captcha` varchar(20) NOT NULL,
  `user_cash_wallet` double NOT NULL,
  `user_package_wallet` double NOT NULL,
  `user_withdraw` double NOT NULL,
  `user_invest` double NOT NULL,
  `user_referral_bonus` double NOT NULL,
  `user_roi` double NOT NULL,
  `user_profit_share` double NOT NULL,
  `user_send` double NOT NULL,
  `user_recieve` double NOT NULL,
  `user_pv` double NOT NULL,
  `user_reward` varchar(150) NOT NULL DEFAULT 'No Reward Yet',
  `user_reward_title` varchar(100) NOT NULL DEFAULT 'VIP 0',
  `user_referred_by` bigint(20) NOT NULL DEFAULT 1,
  `user_referral` varchar(20) NOT NULL,
  `user_status` varchar(100) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` date NOT NULL,
  `created_by` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `aalierp_user`
--

INSERT INTO `aalierp_user` (`user_id`, `user_image`, `user_name`, `user_username`, `user_mobile`, `user_mobile_otp`, `user_mobile_status`, `user_email`, `user_email_otp`, `user_email_status`, `user_password`, `user_passcode`, `user_pin`, `user_type`, `user_role`, `user_address`, `user_ip`, `user_city`, `user_country`, `user_cc`, `user_cur`, `user_captcha`, `user_cash_wallet`, `user_package_wallet`, `user_withdraw`, `user_invest`, `user_referral_bonus`, `user_roi`, `user_profit_share`, `user_send`, `user_recieve`, `user_pv`, `user_reward`, `user_reward_title`, `user_referred_by`, `user_referral`, `user_status`, `created_on`, `updated_on`, `created_by`) VALUES
(1, 'user.png', 'Super', 'super', '', '937987', '', 'super@nidrip.com', '', '', '$2y$08$3b3Ur/NMAeCtGb.Nb7CGwOec604AimhHhQ5Tsx9jZsQ/re0nFCWna', 'Super@786#', '', 'Super', 'Super', '', '::1', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', '', 0, '0', 'Approved', '2019-05-09 00:00:00', '0000-00-00', 'Super'),
(2, 'user.png', 'Developer', 'developer', '', '937987', '', 'developer@nidrip.com', '', '', '$2y$08$STKN.ORJZpQQLB5xsg.aB.LdnyOvle24kvwE2/24t8vB0aVrkfiQ.', 'Developer@786#', '', 'Developer', 'Developer', '', '::1', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', '', 0, '0', 'Approved', '0000-00-00 00:00:00', '0000-00-00', 'Super'),
(3, 'user.png', 'Admin', 'admin', '', '937987', '', 'admin@nidrip.com', '', '', '$2y$08$Ah3Ty92MlJlHzJjinYNKVOK3s/XEUok5.YqP.bLebA8Lxgllmhkh2', 'Admin@786#', '', 'Admin', 'Admin', '', '::1', '', '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', '', 0, '0', 'Approved', '2019-05-09 00:00:00', '0000-00-00', 'Super'),
(12, 'user.png', '', '72095882', '', '', '', 'mraalionline@gmail.com', '984494', '', 'a01610228fe998f515a72dd730294d87', '1212', '1850', 'User', '', '', '154.80.127.125', 'Unknown', 'Unknown', 'XX', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', 'VIP 0', 0, '96519196', 'Approved', '2026-02-24 14:13:56', '0000-00-00', ''),
(13, 'user.png', '', '18165470', '', '', '', 'shawn.ben.atkinson@mail.com', '539557', '', '75c7445d901c8a6d06a075d8ed5e74d5', 'Shawny123!', '9263', 'User', '', '', '89.184.63.128', 'Unknown', 'Unknown', 'XX', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', 'VIP 0', 0, '47359266', 'Approved', '2026-02-24 16:54:59', '0000-00-00', ''),
(14, 'user.png', '', '98255004', '', '', '', 'miyanfaseehaali@gmail.com', '653238', '', '4297f44b13955235245b2497399d7a93', '123123', '9509', 'User', '', '', '154.80.127.125', 'Faisalabad', 'Pakistan', 'PK', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', 'VIP 0', 0, '81189150', 'Approved', '2026-02-24 16:55:34', '0000-00-00', ''),
(15, 'user.png', '', '19108026', '', '', '', 'miyanabidamunawar@gmail.com', '209191', '', 'a01610228fe998f515a72dd730294d87', '1212', '2222', 'User', '', '', '154.80.127.125', 'Faisalabad', 'Pakistan', 'PK', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'No Reward Yet', 'VIP 0', 0, '64622742', 'Approved', '2026-02-25 03:27:47', '0000-00-00', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aalierp_about`
--
ALTER TABLE `aalierp_about`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `aalierp_banner`
--
ALTER TABLE `aalierp_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Indexes for table `aalierp_brand`
--
ALTER TABLE `aalierp_brand`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indexes for table `aalierp_cart`
--
ALTER TABLE `aalierp_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aalierp_category`
--
ALTER TABLE `aalierp_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `aalierp_contents`
--
ALTER TABLE `aalierp_contents`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `aalierp_coupon`
--
ALTER TABLE `aalierp_coupon`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cid` (`coupon_cid`);

--
-- Indexes for table `aalierp_deposit`
--
ALTER TABLE `aalierp_deposit`
  ADD PRIMARY KEY (`dep_id`);

--
-- Indexes for table `aalierp_designation`
--
ALTER TABLE `aalierp_designation`
  ADD PRIMARY KEY (`desig_id`);

--
-- Indexes for table `aalierp_expenses`
--
ALTER TABLE `aalierp_expenses`
  ADD PRIMARY KEY (`exp_id`);

--
-- Indexes for table `aalierp_gallery`
--
ALTER TABLE `aalierp_gallery`
  ADD PRIMARY KEY (`gallery_id`);

--
-- Indexes for table `aalierp_gateway`
--
ALTER TABLE `aalierp_gateway`
  ADD PRIMARY KEY (`gate_id`);

--
-- Indexes for table `aalierp_header`
--
ALTER TABLE `aalierp_header`
  ADD PRIMARY KEY (`header_id`);

--
-- Indexes for table `aalierp_image`
--
ALTER TABLE `aalierp_image`
  ADD PRIMARY KEY (`image_id`);

--
-- Indexes for table `aalierp_login_detail`
--
ALTER TABLE `aalierp_login_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aalierp_newletter`
--
ALTER TABLE `aalierp_newletter`
  ADD PRIMARY KEY (`newletter_id`);

--
-- Indexes for table `aalierp_payment_method`
--
ALTER TABLE `aalierp_payment_method`
  ADD PRIMARY KEY (`method_id`);

--
-- Indexes for table `aalierp_product`
--
ALTER TABLE `aalierp_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `aalierp_purchases`
--
ALTER TABLE `aalierp_purchases`
  ADD PRIMARY KEY (`purchase_id`);

--
-- Indexes for table `aalierp_purchases_detail`
--
ALTER TABLE `aalierp_purchases_detail`
  ADD PRIMARY KEY (`pur_detail_id`);

--
-- Indexes for table `aalierp_reviews`
--
ALTER TABLE `aalierp_reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `aalierp_sales`
--
ALTER TABLE `aalierp_sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `aalierp_shipment`
--
ALTER TABLE `aalierp_shipment`
  ADD PRIMARY KEY (`ship_id`);

--
-- Indexes for table `aalierp_slide`
--
ALTER TABLE `aalierp_slide`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `aalierp_staff`
--
ALTER TABLE `aalierp_staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `aalierp_staff_availability`
--
ALTER TABLE `aalierp_staff_availability`
  ADD PRIMARY KEY (`avail_id`);

--
-- Indexes for table `aalierp_stock`
--
ALTER TABLE `aalierp_stock`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `aalierp_subcategory`
--
ALTER TABLE `aalierp_subcategory`
  ADD PRIMARY KEY (`subcategory_id`);

--
-- Indexes for table `aalierp_suppliers`
--
ALTER TABLE `aalierp_suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `aalierp_tickets`
--
ALTER TABLE `aalierp_tickets`
  ADD PRIMARY KEY (`ticket_id`);

--
-- Indexes for table `aalierp_unit`
--
ALTER TABLE `aalierp_unit`
  ADD PRIMARY KEY (`unit_id`);

--
-- Indexes for table `aalierp_user`
--
ALTER TABLE `aalierp_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aalierp_about`
--
ALTER TABLE `aalierp_about`
  MODIFY `about_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_banner`
--
ALTER TABLE `aalierp_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `aalierp_brand`
--
ALTER TABLE `aalierp_brand`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_cart`
--
ALTER TABLE `aalierp_cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `aalierp_category`
--
ALTER TABLE `aalierp_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `aalierp_contents`
--
ALTER TABLE `aalierp_contents`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `aalierp_coupon`
--
ALTER TABLE `aalierp_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_deposit`
--
ALTER TABLE `aalierp_deposit`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_designation`
--
ALTER TABLE `aalierp_designation`
  MODIFY `desig_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_expenses`
--
ALTER TABLE `aalierp_expenses`
  MODIFY `exp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_gallery`
--
ALTER TABLE `aalierp_gallery`
  MODIFY `gallery_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_gateway`
--
ALTER TABLE `aalierp_gateway`
  MODIFY `gate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_header`
--
ALTER TABLE `aalierp_header`
  MODIFY `header_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_image`
--
ALTER TABLE `aalierp_image`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_login_detail`
--
ALTER TABLE `aalierp_login_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `aalierp_newletter`
--
ALTER TABLE `aalierp_newletter`
  MODIFY `newletter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_payment_method`
--
ALTER TABLE `aalierp_payment_method`
  MODIFY `method_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_product`
--
ALTER TABLE `aalierp_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `aalierp_purchases`
--
ALTER TABLE `aalierp_purchases`
  MODIFY `purchase_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_purchases_detail`
--
ALTER TABLE `aalierp_purchases_detail`
  MODIFY `pur_detail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_reviews`
--
ALTER TABLE `aalierp_reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_sales`
--
ALTER TABLE `aalierp_sales`
  MODIFY `sales_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_shipment`
--
ALTER TABLE `aalierp_shipment`
  MODIFY `ship_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_slide`
--
ALTER TABLE `aalierp_slide`
  MODIFY `slide_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_staff`
--
ALTER TABLE `aalierp_staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_staff_availability`
--
ALTER TABLE `aalierp_staff_availability`
  MODIFY `avail_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_stock`
--
ALTER TABLE `aalierp_stock`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_subcategory`
--
ALTER TABLE `aalierp_subcategory`
  MODIFY `subcategory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aalierp_suppliers`
--
ALTER TABLE `aalierp_suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_tickets`
--
ALTER TABLE `aalierp_tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `aalierp_unit`
--
ALTER TABLE `aalierp_unit`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `aalierp_user`
--
ALTER TABLE `aalierp_user`
  MODIFY `user_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
