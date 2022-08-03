-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Nov 13, 2021 at 07:15 AM
-- Server version: 5.7.34
-- PHP Version: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `exams`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, '2021-11-09 20:01:49'),
(2, 0, 10, 'Admin', 'fa-tasks', '', NULL, NULL, '2021-11-09 12:46:19'),
(3, 2, 11, 'Users', 'fa-users', 'auth/users', NULL, NULL, '2021-11-09 12:46:19'),
(4, 2, 12, 'Roles', 'fa-user', 'auth/roles', NULL, NULL, '2021-11-09 12:46:19'),
(5, 2, 13, 'Permission', 'fa-ban', 'auth/permissions', NULL, NULL, '2021-11-09 12:46:19'),
(6, 2, 14, 'Menu', 'fa-bars', 'auth/menu', NULL, NULL, '2021-11-09 12:46:19'),
(7, 2, 15, 'Operation log', 'fa-history', 'auth/logs', NULL, NULL, '2021-11-09 12:46:19'),
(8, 0, 2, 'Terms', 'fa-adjust', 'terms', NULL, '2021-10-31 17:37:00', '2021-11-09 20:01:49'),
(9, 0, 3, 'Classes', 'fa-book', 'my-classes', NULL, '2021-11-01 13:56:10', '2021-11-09 20:01:49'),
(10, 0, 4, 'Students', 'fa-bars', 'students', NULL, '2021-11-01 14:26:27', '2021-11-09 20:01:49'),
(11, 0, 5, 'Teachers', 'fa-eyedropper', 'teachers', NULL, '2021-11-02 13:06:56', '2021-11-09 20:01:49'),
(12, 0, 6, 'Subjects', 'fa-bars', 'subjects', NULL, '2021-11-02 14:04:01', '2021-11-09 20:01:49'),
(13, 0, 8, 'Exams', 'fa-question', 'exams', NULL, '2021-11-02 15:23:13', '2021-11-09 20:01:49'),
(14, 0, 7, 'Exams', 'fa-pencil', 'general-exams', NULL, '2021-11-08 14:17:25', '2021-11-09 20:01:49'),
(15, 0, 9, 'Marks', 'fa-check', 'marks', '*', '2021-11-09 12:46:10', '2021-11-09 20:01:49');

-- --------------------------------------------------------

--
-- Table structure for table `admin_operation_log`
--

CREATE TABLE `admin_operation_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_operation_log`
--

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin/auth/login', 'POST', '::1', '{\"username\":\"admin\",\"password\":\"admin\",\"remember\":\"1\",\"_token\":\"4ybMSdOVPls1lbCcIrTfJzNoDQF3bSuucwjQ8xb3\"}', '2021-10-31 16:28:43', '2021-10-31 16:28:43'),
(2, 1, 'admin', 'GET', '::1', '[]', '2021-10-31 16:28:44', '2021-10-31 16:28:44'),
(3, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:32:59', '2021-10-31 17:32:59'),
(4, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:36:27', '2021-10-31 17:36:27'),
(5, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:36:32', '2021-10-31 17:36:32'),
(6, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Terms\",\"icon\":\"fa-adjust\",\"uri\":\"terms\",\"roles\":[null],\"permission\":null,\"_token\":\"xgH9OsEF2tCO7Qb6r7o8BwPcWW3cqAI7HnDREIEd\"}', '2021-10-31 17:37:00', '2021-10-31 17:37:00'),
(7, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-31 17:37:01', '2021-10-31 17:37:01'),
(8, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-10-31 17:37:08', '2021-10-31 17:37:08'),
(9, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:37:12', '2021-10-31 17:37:12'),
(10, 1, 'admin/terms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:43:13', '2021-10-31 17:43:13'),
(11, 1, 'admin/terms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:45:52', '2021-10-31 17:45:52'),
(12, 1, 'admin/terms', 'POST', '::1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"_token\":\"xgH9OsEF2tCO7Qb6r7o8BwPcWW3cqAI7HnDREIEd\"}', '2021-10-31 17:46:30', '2021-10-31 17:46:30'),
(13, 1, 'admin/terms', 'GET', '::1', '[]', '2021-10-31 17:46:30', '2021-10-31 17:46:30'),
(14, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-10-31 17:46:56', '2021-10-31 17:46:56'),
(15, 1, 'admin', 'GET', '::1', '[]', '2021-11-01 13:23:03', '2021-11-01 13:23:03'),
(16, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 13:23:09', '2021-11-01 13:23:09'),
(17, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 13:55:13', '2021-11-01 13:55:13'),
(18, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 13:55:16', '2021-11-01 13:55:16'),
(19, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Classes\",\"icon\":\"fa-book\",\"uri\":\"my-classes\",\"roles\":[null],\"permission\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\"}', '2021-11-01 13:56:10', '2021-11-01 13:56:10'),
(20, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 13:56:10', '2021-11-01 13:56:10'),
(21, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:06:11', '2021-11-01 14:06:11'),
(22, 1, 'admin/auth/users/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:06:14', '2021-11-01 14:06:14'),
(23, 1, 'admin/auth/users/create', 'GET', '::1', '[]', '2021-11-01 14:12:10', '2021-11-01 14:12:10'),
(24, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:26:15', '2021-11-01 14:26:15'),
(25, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:26:18', '2021-11-01 14:26:18'),
(26, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Students\",\"icon\":\"fa-bars\",\"uri\":\"students\",\"roles\":[null],\"permission\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\"}', '2021-11-01 14:26:27', '2021-11-01 14:26:27'),
(27, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 14:26:27', '2021-11-01 14:26:27'),
(28, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-01 14:26:39', '2021-11-01 14:26:39'),
(29, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:26:47', '2021-11-01 14:26:47'),
(30, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 14:26:56', '2021-11-01 14:26:56'),
(31, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":\"0\",\"my_class_id\":null,\"name\":null,\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-01 15:07:11', '2021-11-01 15:07:11'),
(32, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:07:13', '2021-11-01 15:07:13'),
(33, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:07:17', '2021-11-01 15:07:17'),
(34, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:07:21', '2021-11-01 15:07:21'),
(35, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:07:24', '2021-11-01 15:07:24'),
(36, 1, 'admin/students', 'GET', '::1', '[]', '2021-11-01 15:07:28', '2021-11-01 15:07:28'),
(37, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:07:31', '2021-11-01 15:07:31'),
(38, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:07:48', '2021-11-01 15:07:48'),
(39, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:08:31', '2021-11-01 15:08:31'),
(40, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":null,\"my_class_id\":null,\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-01 15:08:37', '2021-11-01 15:08:37'),
(41, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:08:47', '2021-11-01 15:08:47'),
(42, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:23:20', '2021-11-01 15:23:20'),
(43, 1, 'admin/auth/roles/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:23:23', '2021-11-01 15:23:23'),
(44, 1, 'admin/auth/roles', 'POST', '::1', '{\"slug\":\"student\",\"name\":\"Student\",\"permissions\":[null],\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/roles\"}', '2021-11-01 15:23:41', '2021-11-01 15:23:41'),
(45, 1, 'admin/auth/roles', 'GET', '::1', '[]', '2021-11-01 15:23:42', '2021-11-01 15:23:42'),
(46, 1, 'admin/auth/roles/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:23:45', '2021-11-01 15:23:45'),
(47, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:26:04', '2021-11-01 15:26:04'),
(48, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:26:06', '2021-11-01 15:26:06'),
(49, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":null,\"my_class_id\":null,\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-01 15:26:19', '2021-11-01 15:26:19'),
(50, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:26:27', '2021-11-01 15:26:27'),
(51, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:26:29', '2021-11-01 15:26:29'),
(52, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:28:20', '2021-11-01 15:28:20'),
(53, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":null,\"my_class_id\":null,\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-01 15:28:26', '2021-11-01 15:28:26'),
(54, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:28:27', '2021-11-01 15:28:27'),
(55, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":null,\"my_class_id\":null,\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"after-save\":\"1\"}', '2021-11-01 15:29:16', '2021-11-01 15:29:16'),
(56, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-01 15:29:17', '2021-11-01 15:29:17'),
(57, 1, 'admin/students', 'POST', '::1', '{\"administrator_id\":null,\"my_class_id\":\"1\",\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"after-save\":\"1\"}', '2021-11-01 15:29:46', '2021-11-01 15:29:46'),
(58, 1, 'admin/students/1/edit', 'GET', '::1', '[]', '2021-11-01 15:29:46', '2021-11-01 15:29:46'),
(59, 1, 'admin/students/1', 'PUT', '::1', '{\"administrator_id\":\"5\",\"my_class_id\":\"1\",\"name\":\"romina\",\"gender\":null,\"age\":null,\"details\":null,\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\\/create\"}', '2021-11-01 15:31:26', '2021-11-01 15:31:26'),
(60, 1, 'admin/students/1/edit', 'GET', '::1', '[]', '2021-11-01 15:31:27', '2021-11-01 15:31:27'),
(61, 1, 'admin/students/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:00', '2021-11-01 15:34:00'),
(62, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:14', '2021-11-01 15:34:14'),
(63, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:19', '2021-11-01 15:34:19'),
(64, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:26', '2021-11-01 15:34:26'),
(65, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:29', '2021-11-01 15:34:29'),
(66, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:47', '2021-11-01 15:34:47'),
(67, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:34:50', '2021-11-01 15:34:50'),
(68, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:36:13', '2021-11-01 15:36:13'),
(69, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:38:34', '2021-11-01 15:38:34'),
(70, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:38:43', '2021-11-01 15:38:43'),
(71, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:39:07', '2021-11-01 15:39:07'),
(72, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:42:49', '2021-11-01 15:42:49'),
(73, 1, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-01 15:42:52', '2021-11-01 15:42:52'),
(74, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:42:54', '2021-11-01 15:42:54'),
(75, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:42:57', '2021-11-01 15:42:57'),
(76, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:44:21', '2021-11-01 15:44:21'),
(77, 1, 'admin/my-classes', 'POST', '::1', '{\"name\":\"Senior 1\",\"short_name\":\"S.1\",\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\"}', '2021-11-01 15:45:37', '2021-11-01 15:45:37'),
(78, 1, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-01 15:45:37', '2021-11-01 15:45:37'),
(79, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:45:40', '2021-11-01 15:45:40'),
(80, 1, 'admin/my-classes', 'POST', '::1', '{\"name\":\"Senior 1\",\"short_name\":\"S.2\",\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/my-classes\"}', '2021-11-01 15:45:56', '2021-11-01 15:45:56'),
(81, 1, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-01 15:45:57', '2021-11-01 15:45:57'),
(82, 1, 'admin/my-classes/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:45:59', '2021-11-01 15:45:59'),
(83, 1, 'admin/my-classes', 'POST', '::1', '{\"name\":\"Senior 3\",\"short_name\":\"S.3\",\"_token\":\"l3wDF5W3mYBiPV29dt9Snd9fasxZUovDpKiuBgsL\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/my-classes\"}', '2021-11-01 15:46:12', '2021-11-01 15:46:12'),
(84, 1, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-01 15:46:12', '2021-11-01 15:46:12'),
(85, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:47:24', '2021-11-01 15:47:24'),
(86, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:47:27', '2021-11-01 15:47:27'),
(87, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 15:47:44', '2021-11-01 15:47:44'),
(88, 1, 'admin', 'GET', '::1', '[]', '2021-11-01 19:04:05', '2021-11-01 19:04:05'),
(89, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:04:08', '2021-11-01 19:04:08'),
(90, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:04:09', '2021-11-01 19:04:09'),
(91, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:08:27', '2021-11-01 19:08:27'),
(92, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:09:14', '2021-11-01 19:09:14'),
(93, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:09:24', '2021-11-01 19:09:24'),
(94, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:09:59', '2021-11-01 19:09:59'),
(95, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:12:06', '2021-11-01 19:12:06'),
(96, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:12:32', '2021-11-01 19:12:32'),
(97, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:12:48', '2021-11-01 19:12:48'),
(98, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-01 19:12:52', '2021-11-01 19:12:52'),
(99, 1, 'admin', 'GET', '::1', '[]', '2021-11-02 12:54:23', '2021-11-02 12:54:23'),
(100, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:10', '2021-11-02 12:55:10'),
(101, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:11', '2021-11-02 12:55:11'),
(102, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:14', '2021-11-02 12:55:14'),
(103, 1, 'admin/students', 'POST', '::1', '{\"name\":\"Biirah Sumayya\",\"gender\":\"Female\",\"age\":\"26\",\"my_class_id\":\"1\",\"details\":\"Simple details of sumayya\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-02 12:55:44', '2021-11-02 12:55:44'),
(104, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-02 12:55:45', '2021-11-02 12:55:45'),
(105, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:46', '2021-11-02 12:55:46'),
(106, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:47', '2021-11-02 12:55:47'),
(107, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:49', '2021-11-02 12:55:49'),
(108, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:55:52', '2021-11-02 12:55:52'),
(109, 1, 'admin/students', 'POST', '::1', '{\"name\":\"Muhindo Mubaraka\",\"gender\":\"Male\",\"age\":\"26\",\"my_class_id\":\"1\",\"details\":\"Muhindo Details go here\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-02 12:56:30', '2021-11-02 12:56:30'),
(110, 1, 'admin/students/create', 'GET', '::1', '[]', '2021-11-02 12:56:30', '2021-11-02 12:56:30'),
(111, 1, 'admin/students', 'POST', '::1', '{\"name\":\"Muhindo Mubaraka\",\"gender\":\"Male\",\"age\":\"26\",\"my_class_id\":\"1\",\"details\":\"Muhindo Details go here\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"after-save\":\"1\"}', '2021-11-02 12:57:58', '2021-11-02 12:57:58'),
(112, 1, 'admin/students/2/edit', 'GET', '::1', '[]', '2021-11-02 12:57:58', '2021-11-02 12:57:58'),
(113, 1, 'admin/students/2', 'PUT', '::1', '{\"name\":\"Muhindo Mubaraka\",\"administrator_id\":\"8\",\"gender\":\"Male\",\"age\":\"26\",\"my_class_id\":\"1\",\"details\":\"Muhindo Details go here\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\\/create\"}', '2021-11-02 12:58:07', '2021-11-02 12:58:07'),
(114, 1, 'admin/students/2/edit', 'GET', '::1', '[]', '2021-11-02 12:58:07', '2021-11-02 12:58:07'),
(115, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:58:56', '2021-11-02 12:58:56'),
(116, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:58:57', '2021-11-02 12:58:57'),
(117, 1, 'admin/students', 'POST', '::1', '{\"name\":\"Bwambale Muhidin\",\"administrator_id\":null,\"gender\":\"Male\",\"age\":\"17\",\"my_class_id\":\"1\",\"details\":\"Muhdin details\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/students\"}', '2021-11-02 12:59:20', '2021-11-02 12:59:20'),
(118, 1, 'admin/students', 'GET', '::1', '[]', '2021-11-02 12:59:20', '2021-11-02 12:59:20'),
(119, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:59:34', '2021-11-02 12:59:34'),
(120, 1, 'admin/students/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 12:59:56', '2021-11-02 12:59:56'),
(121, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:01:18', '2021-11-02 13:01:18'),
(122, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:06:28', '2021-11-02 13:06:28'),
(123, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Teachers\",\"icon\":\"fa-eyedropper\",\"uri\":\"teachers\",\"roles\":[null],\"permission\":null,\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 13:06:56', '2021-11-02 13:06:56'),
(124, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 13:06:56', '2021-11-02 13:06:56'),
(125, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 13:07:01', '2021-11-02 13:07:01'),
(126, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:07:04', '2021-11-02 13:07:04'),
(127, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:07:08', '2021-11-02 13:07:08'),
(128, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:09:05', '2021-11-02 13:09:05'),
(129, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:09:16', '2021-11-02 13:09:16'),
(130, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:09:22', '2021-11-02 13:09:22'),
(131, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:09:26', '2021-11-02 13:09:26'),
(132, 1, 'admin/auth/roles/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:09:29', '2021-11-02 13:09:29'),
(133, 1, 'admin/auth/roles', 'POST', '::1', '{\"slug\":\"teacher\",\"name\":\"Teacher\",\"permissions\":[null],\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/roles\"}', '2021-11-02 13:09:42', '2021-11-02 13:09:42'),
(134, 1, 'admin/auth/roles', 'GET', '::1', '[]', '2021-11-02 13:09:42', '2021-11-02 13:09:42'),
(135, 1, 'admin/auth/roles/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:11:14', '2021-11-02 13:11:14'),
(136, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:11:31', '2021-11-02 13:11:31'),
(137, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:11:33', '2021-11-02 13:11:33'),
(138, 1, 'admin/teachers', 'POST', '::1', '{\"administrator_id\":null,\"name\":\"Kule Swaleh\",\"gender\":\"Male\",\"phone_number\":\"+256123456789\",\"salary\":\"150000\",\"details\":\"Simple details for this teacher\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/teachers\"}', '2021-11-02 13:12:38', '2021-11-02 13:12:38'),
(139, 1, 'admin/teachers/create', 'GET', '::1', '[]', '2021-11-02 13:12:39', '2021-11-02 13:12:39'),
(140, 1, 'admin/teachers', 'POST', '::1', '{\"administrator_id\":null,\"name\":\"Kule Swaleh\",\"gender\":\"Male\",\"phone_number\":\"+256123456789\",\"salary\":\"150000\",\"details\":\"Simple details for this teacher\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"after-save\":\"1\"}', '2021-11-02 13:12:53', '2021-11-02 13:12:53'),
(141, 1, 'admin/teachers/1/edit', 'GET', '::1', '[]', '2021-11-02 13:12:53', '2021-11-02 13:12:53'),
(142, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:12:57', '2021-11-02 13:12:57'),
(143, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:13:00', '2021-11-02 13:13:00'),
(144, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:13:28', '2021-11-02 13:13:28'),
(145, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:13:32', '2021-11-02 13:13:32'),
(146, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:13:36', '2021-11-02 13:13:36'),
(147, 1, 'admin/_handle_action_', 'POST', '::1', '{\"_key\":\"10\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}', '2021-11-02 13:13:42', '2021-11-02 13:13:42'),
(148, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:13:42', '2021-11-02 13:13:42'),
(149, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:44:30', '2021-11-02 13:44:30'),
(150, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:44:33', '2021-11-02 13:44:33'),
(151, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:44:38', '2021-11-02 13:44:38'),
(152, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 13:49:50', '2021-11-02 13:49:50'),
(153, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:03:49', '2021-11-02 14:03:49'),
(154, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Subjects\",\"icon\":\"fa-bars\",\"uri\":\"subjects\",\"roles\":[null],\"permission\":null,\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 14:04:01', '2021-11-02 14:04:01'),
(155, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 14:04:01', '2021-11-02 14:04:01'),
(156, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 14:04:05', '2021-11-02 14:04:05'),
(157, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:04:13', '2021-11-02 14:04:13'),
(158, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:04:16', '2021-11-02 14:04:16'),
(159, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:06:21', '2021-11-02 14:06:21'),
(160, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:06:52', '2021-11-02 14:06:52'),
(161, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:09:33', '2021-11-02 14:09:33'),
(162, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:09:46', '2021-11-02 14:09:46'),
(163, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:10:25', '2021-11-02 14:10:25'),
(164, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:11:17', '2021-11-02 14:11:17'),
(165, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:11:28', '2021-11-02 14:11:28'),
(166, 1, 'admin/subjects', 'POST', '::1', '{\"name\":\"Biology\",\"my_class_id\":\"1\",\"administrator_id\":\"1\",\"details\":\"Simple bios details\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 14:12:25', '2021-11-02 14:12:25'),
(167, 1, 'admin/subjects', 'GET', '::1', '[]', '2021-11-02 14:12:25', '2021-11-02 14:12:25'),
(168, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:15:25', '2021-11-02 14:15:25'),
(169, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:15:40', '2021-11-02 14:15:40'),
(170, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:16:55', '2021-11-02 14:16:55'),
(171, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:18:13', '2021-11-02 14:18:13'),
(172, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:18:56', '2021-11-02 14:18:56'),
(173, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:19:10', '2021-11-02 14:19:10'),
(174, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:19:46', '2021-11-02 14:19:46'),
(175, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:20:12', '2021-11-02 14:20:12'),
(176, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"desc\"}}', '2021-11-02 14:20:14', '2021-11-02 14:20:14'),
(177, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2021-11-02 14:20:15', '2021-11-02 14:20:15'),
(178, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"desc\"}}', '2021-11-02 14:20:16', '2021-11-02 14:20:16'),
(179, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}', '2021-11-02 14:20:18', '2021-11-02 14:20:18'),
(180, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"per_page\":\"100\"}', '2021-11-02 14:20:28', '2021-11-02 14:20:28'),
(181, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:21:08', '2021-11-02 14:21:08'),
(182, 1, 'admin/subjects', 'POST', '::1', '{\"name\":\"History\",\"my_class_id\":\"1\",\"administrator_id\":\"1\",\"details\":\"Hist details\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/subjects?&_sort%5Bcolumn%5D=name&_sort%5Btype%5D=asc&per_page=100\"}', '2021-11-02 14:23:03', '2021-11-02 14:23:03'),
(183, 1, 'admin/subjects', 'GET', '::1', '{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"per_page\":\"100\"}', '2021-11-02 14:23:04', '2021-11-02 14:23:04'),
(184, 1, 'admin/subjects', 'GET', '::1', '{\"_sort\":{\"column\":\"my_class_id\",\"type\":\"desc\"},\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:24:01', '2021-11-02 14:24:01'),
(185, 1, 'admin/subjects', 'GET', '::1', '{\"_sort\":{\"column\":\"my_class_id\",\"type\":\"asc\"},\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:24:03', '2021-11-02 14:24:03'),
(186, 1, 'admin/subjects', 'GET', '::1', '{\"_sort\":{\"column\":\"my_class_id\",\"type\":\"asc\"},\"per_page\":\"100\",\"_pjax\":\"#pjax-container\"}', '2021-11-02 14:24:22', '2021-11-02 14:24:22'),
(187, 1, 'admin/subjects/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:08:42', '2021-11-02 15:08:42'),
(188, 1, 'admin/subjects', 'POST', '::1', '{\"name\":\"Physics\",\"my_class_id\":\"2\",\"administrator_id\":\"1\",\"details\":\"simple details..\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"after-save\":\"1\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/subjects?_sort%5Bcolumn%5D=my_class_id&_sort%5Btype%5D=asc&per_page=100\"}', '2021-11-02 15:09:40', '2021-11-02 15:09:40'),
(189, 1, 'admin/subjects/3/edit', 'GET', '::1', '[]', '2021-11-02 15:09:40', '2021-11-02 15:09:40'),
(190, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:09:44', '2021-11-02 15:09:44'),
(191, 1, 'admin/subjects/3/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:09:51', '2021-11-02 15:09:51'),
(192, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:03', '2021-11-02 15:10:03'),
(193, 1, 'admin/my-classes/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:06', '2021-11-02 15:10:06'),
(194, 1, 'admin/my-classes/2', 'PUT', '::1', '{\"name\":\"Senior 2\",\"short_name\":\"S.2\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/my-classes\"}', '2021-11-02 15:10:11', '2021-11-02 15:10:11'),
(195, 1, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-02 15:10:11', '2021-11-02 15:10:11'),
(196, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:14', '2021-11-02 15:10:14'),
(197, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"my_class_id\",\"type\":\"desc\"}}', '2021-11-02 15:10:26', '2021-11-02 15:10:26'),
(198, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:29', '2021-11-02 15:10:29'),
(199, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:33', '2021-11-02 15:10:33'),
(200, 1, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:37', '2021-11-02 15:10:37'),
(201, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:42', '2021-11-02 15:10:42'),
(202, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:10:44', '2021-11-02 15:10:44'),
(203, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"my_class_id\",\"type\":\"desc\"}}', '2021-11-02 15:10:51', '2021-11-02 15:10:51'),
(204, 1, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"my_class_id\",\"type\":\"asc\"}}', '2021-11-02 15:10:56', '2021-11-02 15:10:56'),
(205, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:22:23', '2021-11-02 15:22:23'),
(206, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"exams\",\"icon\":\"fa-question\",\"uri\":\"exams\",\"roles\":[null],\"permission\":null,\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 15:23:12', '2021-11-02 15:23:12'),
(207, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:13', '2021-11-02 15:23:13'),
(208, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:17', '2021-11-02 15:23:17'),
(209, 1, 'admin/auth/menu/13/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:23:25', '2021-11-02 15:23:25'),
(210, 1, 'admin/auth/menu/13', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"exams\",\"icon\":\"fa-question\",\"uri\":\"Exams\",\"roles\":[null],\"permission\":null,\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-02 15:23:31', '2021-11-02 15:23:31'),
(211, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:31', '2021-11-02 15:23:31'),
(212, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:34', '2021-11-02 15:23:34'),
(213, 1, 'admin/auth/menu/13/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:23:40', '2021-11-02 15:23:40'),
(214, 1, 'admin/auth/menu/13', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Exams\",\"icon\":\"fa-question\",\"uri\":\"exams\",\"roles\":[null],\"permission\":null,\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-02 15:23:50', '2021-11-02 15:23:50'),
(215, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:50', '2021-11-02 15:23:50'),
(216, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-02 15:23:53', '2021-11-02 15:23:53'),
(217, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:23:56', '2021-11-02 15:23:56'),
(218, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:24:00', '2021-11-02 15:24:00'),
(219, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:27:39', '2021-11-02 15:27:39'),
(220, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:28:41', '2021-11-02 15:28:41'),
(221, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:30:39', '2021-11-02 15:30:39'),
(222, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 15:31:09', '2021-11-02 15:31:09'),
(223, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:09', '2021-11-02 15:31:09'),
(224, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:09', '2021-11-02 15:31:09'),
(225, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:10', '2021-11-02 15:31:10'),
(226, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:11', '2021-11-02 15:31:11'),
(227, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:12', '2021-11-02 15:31:12'),
(228, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:12', '2021-11-02 15:31:12'),
(229, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:13', '2021-11-02 15:31:13'),
(230, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:13', '2021-11-02 15:31:13'),
(231, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:14', '2021-11-02 15:31:14'),
(232, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:15', '2021-11-02 15:31:15'),
(233, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:31:16', '2021-11-02 15:31:16'),
(234, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:45:45', '2021-11-02 15:45:45'),
(235, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:46:08', '2021-11-02 15:46:08'),
(236, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 15:48:12', '2021-11-02 15:48:12'),
(237, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:08:53', '2021-11-02 16:08:53'),
(238, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:09:45', '2021-11-02 16:09:45'),
(239, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:09:48', '2021-11-02 16:09:48'),
(240, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:10:51', '2021-11-02 16:10:51'),
(241, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:11:18', '2021-11-02 16:11:18'),
(242, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:11:49', '2021-11-02 16:11:49'),
(243, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:12:10', '2021-11-02 16:12:10'),
(244, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:13:09', '2021-11-02 16:13:09'),
(245, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:13:14', '2021-11-02 16:13:14'),
(246, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:13:28', '2021-11-02 16:13:28'),
(247, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:14:50', '2021-11-02 16:14:50'),
(248, 1, 'admin/exams', 'POST', '::1', '{\"subject_id\":\"1\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:14:55', '2021-11-02 16:14:55'),
(249, 1, 'admin/exams/create', 'GET', '::1', '[]', '2021-11-02 16:14:55', '2021-11-02 16:14:55'),
(250, 1, 'admin/exams', 'POST', '::1', '{\"subject_id\":\"1\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:15:03', '2021-11-02 16:15:03'),
(251, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:16:15', '2021-11-02 16:16:15'),
(252, 1, 'admin/exams', 'POST', '::1', '{\"my_class_id\":null,\"administrator_id\":null,\"subject_id\":\"1\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:16:21', '2021-11-02 16:16:21'),
(253, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:17:32', '2021-11-02 16:17:32'),
(254, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:17:34', '2021-11-02 16:17:34'),
(255, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:17:36', '2021-11-02 16:17:36'),
(256, 1, 'admin/exams', 'POST', '::1', '{\"my_class_id\":null,\"administrator_id\":null,\"subject_id\":\"1\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:17:42', '2021-11-02 16:17:42'),
(257, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:18:00', '2021-11-02 16:18:00'),
(258, 1, 'admin/exams', 'POST', '::1', '{\"my_class_id\":null,\"administrator_id\":null,\"subject_id\":\"1\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:18:06', '2021-11-02 16:18:06'),
(259, 1, 'admin/exams', 'GET', '::1', '[]', '2021-11-02 16:18:06', '2021-11-02 16:18:06'),
(260, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:18:19', '2021-11-02 16:18:19'),
(261, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:18:21', '2021-11-02 16:18:21'),
(262, 1, 'admin/exams', 'POST', '::1', '{\"my_class_id\":null,\"administrator_id\":null,\"subject_id\":\"2\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:18:27', '2021-11-02 16:18:27'),
(263, 1, 'admin/exams', 'GET', '::1', '[]', '2021-11-02 16:18:27', '2021-11-02 16:18:27'),
(264, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:18:30', '2021-11-02 16:18:30'),
(265, 1, 'admin/exams', 'POST', '::1', '{\"my_class_id\":null,\"administrator_id\":null,\"subject_id\":\"3\",\"term_id\":\"1\",\"_token\":\"1zstT2mn2QBdIx6qni9qAgkjwjXYupxpVk1PDGmi\"}', '2021-11-02 16:18:37', '2021-11-02 16:18:37'),
(266, 1, 'admin/exams', 'GET', '::1', '[]', '2021-11-02 16:18:37', '2021-11-02 16:18:37'),
(267, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:19:07', '2021-11-02 16:19:07'),
(268, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:21:12', '2021-11-02 16:21:12'),
(269, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:21:39', '2021-11-02 16:21:39'),
(270, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:23:13', '2021-11-02 16:23:13'),
(271, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:23:35', '2021-11-02 16:23:35'),
(272, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:24:07', '2021-11-02 16:24:07'),
(273, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-02 16:24:39', '2021-11-02 16:24:39'),
(274, 1, 'admin/exams', 'GET', '::1', '[]', '2021-11-03 04:04:16', '2021-11-03 04:04:16'),
(275, 1, 'admin', 'GET', '::1', '[]', '2021-11-08 12:17:59', '2021-11-08 12:17:59'),
(276, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 12:19:00', '2021-11-08 12:19:00'),
(277, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 12:41:15', '2021-11-08 12:41:15'),
(278, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 13:37:20', '2021-11-08 13:37:20'),
(279, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 13:37:21', '2021-11-08 13:37:21'),
(280, 1, 'admin/exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 13:39:29', '2021-11-08 13:39:29'),
(281, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 14:11:10', '2021-11-08 14:11:10'),
(282, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"General exams\",\"icon\":\"fa-pencil\",\"uri\":\"general-exams\",\"roles\":[null],\"permission\":null,\"_token\":\"U3DjH5CASYuUY7TPPaVgEuBaNRJq2ouCWiDANjC7\"}', '2021-11-08 14:17:25', '2021-11-08 14:17:25'),
(283, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-08 14:17:26', '2021-11-08 14:17:26'),
(284, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"U3DjH5CASYuUY7TPPaVgEuBaNRJq2ouCWiDANjC7\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":14},{\\\"id\\\":13},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-11-08 14:17:41', '2021-11-08 14:17:41'),
(285, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 14:17:41', '2021-11-08 14:17:41'),
(286, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-08 14:18:00', '2021-11-08 14:18:00'),
(287, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 14:18:06', '2021-11-08 14:18:06'),
(288, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 14:18:32', '2021-11-08 14:18:32'),
(289, 1, 'admin/general-exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 14:18:41', '2021-11-08 14:18:41'),
(290, 1, 'admin/general-exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 15:21:40', '2021-11-08 15:21:40'),
(291, 1, 'admin/general-exams/create', 'GET', '::1', '[]', '2021-11-08 15:23:26', '2021-11-08 15:23:26'),
(292, 1, 'admin/general-exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 15:24:43', '2021-11-08 15:24:43'),
(293, 1, 'admin/general-exams/create', 'GET', '::1', '[]', '2021-11-08 15:25:16', '2021-11-08 15:25:16'),
(294, 1, 'admin/general-exams/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 15:28:46', '2021-11-08 15:28:46'),
(295, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:05:42', '2021-11-08 16:05:42'),
(296, 1, 'admin/terms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:05:44', '2021-11-08 16:05:44'),
(297, 1, 'admin/terms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:06:07', '2021-11-08 16:06:07'),
(298, 1, 'admin/terms/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:06:07', '2021-11-08 16:06:07'),
(299, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:06:19', '2021-11-08 16:06:19'),
(300, 1, 'admin/terms/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:06:23', '2021-11-08 16:06:23'),
(301, 1, 'admin/terms/1/edit', 'GET', '::1', '[]', '2021-11-08 16:09:16', '2021-11-08 16:09:16'),
(302, 1, 'admin/terms/1/edit', 'GET', '::1', '[]', '2021-11-08 16:12:07', '2021-11-08 16:12:07'),
(303, 1, 'admin/terms/1', 'PUT', '::1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"general_exams\":{\"new_1\":{\"name\":\"Mid Term Exams\",\"short_name\":\"MID\",\"max_marks\":\"30\",\"published\":\"0\",\"id\":null,\"_remove_\":\"0\"},\"new_2\":{\"name\":\"Final exams\",\"short_name\":\"Final\",\"max_marks\":\"70\",\"published\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"U3DjH5CASYuUY7TPPaVgEuBaNRJq2ouCWiDANjC7\",\"_method\":\"PUT\"}', '2021-11-08 16:13:40', '2021-11-08 16:13:40'),
(304, 1, 'admin/terms/1/edit', 'GET', '::1', '[]', '2021-11-08 16:13:41', '2021-11-08 16:13:41'),
(305, 1, 'admin/terms/1', 'PUT', '::1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"general_exams\":{\"new___LA_KEY__\":{\"name\":\"Final exams\",\"short_name\":\"Final\",\"max_marks\":\"70\",\"id\":null,\"_remove_\":\"0\",\"published\":\"0\"}},\"_token\":\"U3DjH5CASYuUY7TPPaVgEuBaNRJq2ouCWiDANjC7\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-08 16:15:58', '2021-11-08 16:15:58'),
(306, 1, 'admin/terms/1/edit', 'GET', '::1', '[]', '2021-11-08 16:15:58', '2021-11-08 16:15:58'),
(307, 1, 'admin/terms/1', 'PUT', '::1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"general_exams\":{\"1\":{\"name\":\"Mid term exams\",\"short_name\":\"MID\",\"max_marks\":\"30\",\"published\":\"0\",\"id\":\"1\",\"_remove_\":\"0\"},\"new_1\":{\"name\":\"Final exams\",\"short_name\":\"Final\",\"max_marks\":\"70\",\"published\":\"0\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"U3DjH5CASYuUY7TPPaVgEuBaNRJq2ouCWiDANjC7\",\"_method\":\"PUT\"}', '2021-11-08 16:18:41', '2021-11-08 16:18:41'),
(308, 1, 'admin/terms', 'GET', '::1', '[]', '2021-11-08 16:18:41', '2021-11-08 16:18:41'),
(309, 1, 'admin/terms', 'GET', '::1', '[]', '2021-11-08 16:21:53', '2021-11-08 16:21:53'),
(310, 1, 'admin/terms', 'GET', '::1', '[]', '2021-11-08 16:22:36', '2021-11-08 16:22:36'),
(311, 1, 'admin/terms', 'GET', '::1', '[]', '2021-11-08 16:24:14', '2021-11-08 16:24:14'),
(312, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:24:45', '2021-11-08 16:24:45'),
(313, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:24:45', '2021-11-08 16:24:45'),
(314, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:24:52', '2021-11-08 16:24:52'),
(315, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:25:26', '2021-11-08 16:25:26'),
(316, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:25:43', '2021-11-08 16:25:43'),
(317, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:26:28', '2021-11-08 16:26:28'),
(318, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:26:57', '2021-11-08 16:26:57'),
(319, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:27:56', '2021-11-08 16:27:56'),
(320, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:29:25', '2021-11-08 16:29:25'),
(321, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:29:37', '2021-11-08 16:29:37'),
(322, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:32:41', '2021-11-08 16:32:41'),
(323, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:33:50', '2021-11-08 16:33:50'),
(324, 1, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-08 16:34:07', '2021-11-08 16:34:07'),
(325, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"term\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:34:11', '2021-11-08 16:34:11'),
(326, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"term\",\"type\":\"desc\"}}', '2021-11-08 16:34:27', '2021-11-08 16:34:27'),
(327, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:34:30', '2021-11-08 16:34:30'),
(328, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"desc\"}}', '2021-11-08 16:34:35', '2021-11-08 16:34:35'),
(329, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2021-11-08 16:34:37', '2021-11-08 16:34:37'),
(330, 1, 'admin/general-exams/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:34:58', '2021-11-08 16:34:58'),
(331, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:35:02', '2021-11-08 16:35:02'),
(332, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2021-11-08 16:35:17', '2021-11-08 16:35:17'),
(333, 1, 'admin/general-exams/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:35:21', '2021-11-08 16:35:21'),
(334, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:35:30', '2021-11-08 16:35:30'),
(335, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2021-11-08 16:35:52', '2021-11-08 16:35:52'),
(336, 1, 'admin/general-exams', 'GET', '::1', '{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"}}', '2021-11-08 16:38:27', '2021-11-08 16:38:27'),
(337, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-08 16:38:42', '2021-11-08 16:38:42'),
(338, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 12:28:53', '2021-11-09 12:28:53'),
(339, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:29:04', '2021-11-09 12:29:04'),
(340, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:31:42', '2021-11-09 12:31:42'),
(341, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 12:44:39', '2021-11-09 12:44:39'),
(342, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:44:46', '2021-11-09 12:44:46'),
(343, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:44:51', '2021-11-09 12:44:51'),
(344, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:44:54', '2021-11-09 12:44:54'),
(345, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:45:02', '2021-11-09 12:45:02'),
(346, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:45:07', '2021-11-09 12:45:07');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(347, 1, 'admin/auth/menu/14', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Exams\",\"icon\":\"fa-pencil\",\"uri\":\"general-exams\",\"roles\":[null],\"permission\":null,\"_token\":\"zDDKkPyQ105nSv5kLi3lkGmESipsNZikP0BHZQS5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 12:45:12', '2021-11-09 12:45:12'),
(348, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 12:45:13', '2021-11-09 12:45:13'),
(349, 1, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:45:17', '2021-11-09 12:45:17'),
(350, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:45:19', '2021-11-09 12:45:19'),
(351, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":\"Marks\",\"icon\":\"fa-check\",\"uri\":\"marks\",\"roles\":[null],\"permission\":null,\"_token\":\"zDDKkPyQ105nSv5kLi3lkGmESipsNZikP0BHZQS5\"}', '2021-11-09 12:46:10', '2021-11-09 12:46:10'),
(352, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 12:46:10', '2021-11-09 12:46:10'),
(353, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"zDDKkPyQ105nSv5kLi3lkGmESipsNZikP0BHZQS5\",\"_order\":\"[{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":14},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-11-09 12:46:19', '2021-11-09 12:46:19'),
(354, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:46:20', '2021-11-09 12:46:20'),
(355, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 12:46:55', '2021-11-09 12:46:55'),
(356, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:47:05', '2021-11-09 12:47:05'),
(357, 1, 'admin/teachers/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:47:20', '2021-11-09 12:47:20'),
(358, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:47:41', '2021-11-09 12:47:41'),
(359, 1, 'admin/teachers/1', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:48:00', '2021-11-09 12:48:00'),
(360, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:48:34', '2021-11-09 12:48:34'),
(361, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:48:59', '2021-11-09 12:48:59'),
(362, 11, 'admin', 'GET', '::1', '[]', '2021-11-09 12:49:17', '2021-11-09 12:49:17'),
(363, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:49:25', '2021-11-09 12:49:25'),
(364, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:49:28', '2021-11-09 12:49:28'),
(365, 11, 'admin/subjects', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:49:36', '2021-11-09 12:49:36'),
(366, 11, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:49:39', '2021-11-09 12:49:39'),
(367, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:49:44', '2021-11-09 12:49:44'),
(368, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 12:50:20', '2021-11-09 12:50:20'),
(369, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:50:29', '2021-11-09 12:50:29'),
(370, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:50:38', '2021-11-09 12:50:38'),
(371, 1, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:50:56', '2021-11-09 12:50:56'),
(372, 1, 'admin/auth/menu', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:51:04', '2021-11-09 12:51:04'),
(373, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:51:15', '2021-11-09 12:51:15'),
(374, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Marks\",\"icon\":\"fa-check\",\"uri\":\"marks\",\"roles\":[null],\"permission\":\"*\",\"_token\":\"yglETxchFZbiyWzbYULDWtTkXi8IhZb50w5xIYXW\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 12:51:24', '2021-11-09 12:51:24'),
(375, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '[]', '2021-11-09 12:51:24', '2021-11-09 12:51:24'),
(376, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:51:30', '2021-11-09 12:51:30'),
(377, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 12:51:34', '2021-11-09 12:51:34'),
(378, 1, 'admin/auth/menu/15', 'PUT', '127.0.0.1', '{\"parent_id\":\"0\",\"title\":\"Marks\",\"icon\":\"fa-check\",\"uri\":\"marks\",\"roles\":[\"3\",null],\"permission\":\"*\",\"_token\":\"yglETxchFZbiyWzbYULDWtTkXi8IhZb50w5xIYXW\",\"after-save\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 12:51:51', '2021-11-09 12:51:51'),
(379, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '[]', '2021-11-09 12:51:51', '2021-11-09 12:51:51'),
(380, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 12:51:53', '2021-11-09 12:51:53'),
(381, 11, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:51:57', '2021-11-09 12:51:57'),
(382, 11, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:00', '2021-11-09 12:52:00'),
(383, 11, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:01', '2021-11-09 12:52:01'),
(384, 11, 'admin/exams', 'GET', '::1', '[]', '2021-11-09 12:52:03', '2021-11-09 12:52:03'),
(385, 1, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:13', '2021-11-09 12:52:13'),
(386, 1, 'admin/auth/menu/15/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:16', '2021-11-09 12:52:16'),
(387, 11, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:52', '2021-11-09 12:52:52'),
(388, 11, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:56', '2021-11-09 12:52:56'),
(389, 11, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:52:57', '2021-11-09 12:52:57'),
(390, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 12:53:02', '2021-11-09 12:53:02'),
(391, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 12:53:38', '2021-11-09 12:53:38'),
(392, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:53:47', '2021-11-09 12:53:47'),
(393, 1, 'admin/auth/roles/3/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 12:53:55', '2021-11-09 12:53:55'),
(394, 1, 'admin/auth/roles/3', 'PUT', '127.0.0.1', '{\"slug\":\"teacher\",\"name\":\"Teacher\",\"permissions\":[\"1\",null],\"_token\":\"yglETxchFZbiyWzbYULDWtTkXi8IhZb50w5xIYXW\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/roles\"}', '2021-11-09 12:54:01', '2021-11-09 12:54:01'),
(395, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-11-09 12:54:02', '2021-11-09 12:54:02'),
(396, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 12:54:04', '2021-11-09 12:54:04'),
(397, 11, 'admin/marks/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 13:07:17', '2021-11-09 13:07:17'),
(398, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:22:23', '2021-11-09 13:22:23'),
(399, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:22:37', '2021-11-09 13:22:37'),
(400, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:22:39', '2021-11-09 13:22:39'),
(401, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:22:57', '2021-11-09 13:22:57'),
(402, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:23:11', '2021-11-09 13:23:11'),
(403, 11, 'admin/marks/create', 'GET', '::1', '[]', '2021-11-09 13:23:13', '2021-11-09 13:23:13'),
(404, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 13:23:21', '2021-11-09 13:23:21'),
(405, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:23:31', '2021-11-09 13:23:31'),
(406, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:23:46', '2021-11-09 13:23:46'),
(407, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:35:46', '2021-11-09 13:35:46'),
(408, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:36:00', '2021-11-09 13:36:00'),
(409, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:37:11', '2021-11-09 13:37:11'),
(410, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:42:35', '2021-11-09 13:42:35'),
(411, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:42:55', '2021-11-09 13:42:55'),
(412, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:43:33', '2021-11-09 13:43:33'),
(413, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 13:43:55', '2021-11-09 13:43:55'),
(414, 1, 'admin/auth/roles', 'GET', '127.0.0.1', '[]', '2021-11-09 14:13:30', '2021-11-09 14:13:30'),
(415, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:13:34', '2021-11-09 14:13:34'),
(416, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:13:51', '2021-11-09 14:13:51'),
(417, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:14:18', '2021-11-09 14:14:18'),
(418, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:18:49', '2021-11-09 14:18:49'),
(419, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:19:44', '2021-11-09 14:19:44'),
(420, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:19:47', '2021-11-09 14:19:47'),
(421, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:19:56', '2021-11-09 14:19:56'),
(422, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:21:42', '2021-11-09 14:21:42'),
(423, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:22:02', '2021-11-09 14:22:02'),
(424, 11, 'admin/marks/1', 'PUT', '::1', '{\"name\":\"mark\",\"value\":\"20\",\"pk\":\"1\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 14:22:08', '2021-11-09 14:22:08'),
(425, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:22:12', '2021-11-09 14:22:12'),
(426, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:45:58', '2021-11-09 14:45:58'),
(427, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:55:17', '2021-11-09 14:55:17'),
(428, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:55:43', '2021-11-09 14:55:43'),
(429, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:55:58', '2021-11-09 14:55:58'),
(430, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:56:20', '2021-11-09 14:56:20'),
(431, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:56:23', '2021-11-09 14:56:23'),
(432, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam\",\"type\":\"desc\"}}', '2021-11-09 14:56:58', '2021-11-09 14:56:58'),
(433, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam\",\"type\":\"desc\"}}', '2021-11-09 14:57:01', '2021-11-09 14:57:01'),
(434, 11, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:57:02', '2021-11-09 14:57:02'),
(435, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:57:04', '2021-11-09 14:57:04'),
(436, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:57:38', '2021-11-09 14:57:38'),
(437, 11, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 14:57:51', '2021-11-09 14:57:51'),
(438, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:57:55', '2021-11-09 14:57:55'),
(439, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 14:57:57', '2021-11-09 14:57:57'),
(440, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 14:58:13', '2021-11-09 14:58:13'),
(441, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 14:59:40', '2021-11-09 14:59:40'),
(442, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 14:59:56', '2021-11-09 14:59:56'),
(443, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:00:31', '2021-11-09 15:00:31'),
(444, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:01:04', '2021-11-09 15:01:04'),
(445, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:01:47', '2021-11-09 15:01:47'),
(446, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:02:16', '2021-11-09 15:02:16'),
(447, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:04:27', '2021-11-09 15:04:27'),
(448, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"general_exam_id\",\"type\":\"asc\"}}', '2021-11-09 15:06:37', '2021-11-09 15:06:37'),
(449, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:06:45', '2021-11-09 15:06:45'),
(450, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:06:46', '2021-11-09 15:06:46'),
(451, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:10:32', '2021-11-09 15:10:32'),
(452, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:11:20', '2021-11-09 15:11:20'),
(453, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:11:46', '2021-11-09 15:11:46'),
(454, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:11:46', '2021-11-09 15:11:46'),
(455, 11, 'admin/marks/1', 'PUT', '::1', '{\"name\":\"remarks\",\"value\":\"Good!\",\"pk\":\"1\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:11:59', '2021-11-09 15:11:59'),
(456, 11, 'admin/marks/1', 'PUT', '::1', '{\"name\":\"mark\",\"value\":\"10\",\"pk\":\"1\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:12:05', '2021-11-09 15:12:05'),
(457, 11, 'admin/marks/2', 'PUT', '::1', '{\"name\":\"mark\",\"value\":\"30\",\"pk\":\"2\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:12:13', '2021-11-09 15:12:13'),
(458, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:12:17', '2021-11-09 15:12:17'),
(459, 11, 'admin/marks/2', 'PUT', '::1', '{\"name\":\"remarks\",\"value\":\"Fair\",\"pk\":\"2\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:13:58', '2021-11-09 15:13:58'),
(460, 11, 'admin/marks/create', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:14:07', '2021-11-09 15:14:07'),
(461, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:14:10', '2021-11-09 15:14:10'),
(462, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:20:05', '2021-11-09 15:20:05'),
(463, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"id\":null,\"term_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:20:17', '2021-11-09 15:20:17'),
(464, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"term_id\":\"11\"}', '2021-11-09 15:20:20', '2021-11-09 15:20:20'),
(465, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":null,\"term_id\":\"1\"}', '2021-11-09 15:20:24', '2021-11-09 15:20:24'),
(466, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":\"4\",\"term_id\":\"1\"}', '2021-11-09 15:20:32', '2021-11-09 15:20:32'),
(467, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":\"4\",\"term_id\":\"33\"}', '2021-11-09 15:20:37', '2021-11-09 15:20:37'),
(468, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":\"4\",\"term_id\":\"1\"}', '2021-11-09 15:20:39', '2021-11-09 15:20:39'),
(469, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"id\":\"4\",\"term_id\":\"1\"}', '2021-11-09 15:22:46', '2021-11-09 15:22:46'),
(470, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"id\":\"4\",\"term_id\":\"1\"}', '2021-11-09 15:23:21', '2021-11-09 15:23:21'),
(471, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"id\":\"4\",\"term_id\":\"1\",\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:23:57', '2021-11-09 15:23:57'),
(472, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":\"4\",\"term_id\":\"1\",\"general_exam_id\":\"2\",\"subject_id\":\"1\"}', '2021-11-09 15:26:18', '2021-11-09 15:26:18'),
(473, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\",\"id\":\"4\",\"term_id\":\"1\",\"general_exam_id\":null,\"subject_id\":\"1\"}', '2021-11-09 15:26:25', '2021-11-09 15:26:25'),
(474, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:26:36', '2021-11-09 15:26:36'),
(475, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:32:03', '2021-11-09 15:32:03'),
(476, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:33:41', '2021-11-09 15:33:41'),
(477, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:34:02', '2021-11-09 15:34:02'),
(478, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:40:32', '2021-11-09 15:40:32'),
(479, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:40:49', '2021-11-09 15:40:49'),
(480, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:10', '2021-11-09 15:44:10'),
(481, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:17', '2021-11-09 15:44:17'),
(482, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:19', '2021-11-09 15:44:19'),
(483, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:21', '2021-11-09 15:44:21'),
(484, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:28', '2021-11-09 15:44:28'),
(485, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:39', '2021-11-09 15:44:39'),
(486, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:47', '2021-11-09 15:44:47'),
(487, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:44:49', '2021-11-09 15:44:49'),
(488, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:45:14', '2021-11-09 15:45:14'),
(489, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:45:16', '2021-11-09 15:45:16'),
(490, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:45:36', '2021-11-09 15:45:36'),
(491, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:45:44', '2021-11-09 15:45:44'),
(492, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:06', '2021-11-09 15:46:06'),
(493, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:12', '2021-11-09 15:46:12'),
(494, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:21', '2021-11-09 15:46:21'),
(495, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:28', '2021-11-09 15:46:28'),
(496, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:38', '2021-11-09 15:46:38'),
(497, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:46:55', '2021-11-09 15:46:55'),
(498, 11, 'admin/marks/3', 'PUT', '::1', '{\"name\":\"mark\",\"value\":\"40\",\"pk\":\"3\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:47:06', '2021-11-09 15:47:06'),
(499, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:47:09', '2021-11-09 15:47:09'),
(500, 11, 'admin/marks/3', 'PUT', '::1', '{\"name\":\"mark\",\"value\":\"10\",\"pk\":\"3\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:47:15', '2021-11-09 15:47:15'),
(501, 11, 'admin/marks/3', 'PUT', '::1', '{\"name\":\"remarks\",\"value\":\"Fair\",\"pk\":\"3\",\"_token\":\"cVeVGfdYTD2DcmJ9bpxOYBLQ3gv1xOJyYBVlKE3V\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 15:47:20', '2021-11-09 15:47:20'),
(502, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}', '2021-11-09 15:47:22', '2021-11-09 15:47:22'),
(503, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:49:50', '2021-11-09 15:49:50'),
(504, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:50:18', '2021-11-09 15:50:18'),
(505, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:53:32', '2021-11-09 15:53:32'),
(506, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:53:42', '2021-11-09 15:53:42'),
(507, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:53:45', '2021-11-09 15:53:45'),
(508, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:53:52', '2021-11-09 15:53:52'),
(509, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:54:01', '2021-11-09 15:54:01'),
(510, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:54:40', '2021-11-09 15:54:40'),
(511, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 15:54:55', '2021-11-09 15:54:55'),
(512, 11, 'admin/marks', 'GET', '::1', '{\"_sort\":{\"column\":\"term_id\",\"type\":\"asc\"}}', '2021-11-09 16:05:41', '2021-11-09 16:05:41'),
(513, 11, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:08:36', '2021-11-09 16:08:36'),
(514, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 16:09:03', '2021-11-09 16:09:03'),
(515, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:10:19', '2021-11-09 16:10:19'),
(516, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:10:27', '2021-11-09 16:10:27'),
(517, 1, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:11:01', '2021-11-09 16:11:01'),
(518, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 16:11:09', '2021-11-09 16:11:09'),
(519, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 16:37:55', '2021-11-09 16:37:55'),
(520, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:38:03', '2021-11-09 16:38:03'),
(521, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:38:06', '2021-11-09 16:38:06'),
(522, 1, 'admin/auth/roles/2/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:38:10', '2021-11-09 16:38:10'),
(523, 1, 'admin/auth/roles/2', 'PUT', '::1', '{\"slug\":\"student\",\"name\":\"Student\",\"permissions\":[\"1\",null],\"_token\":\"V1pnxPe4ld8khuhFeUtOUKbJxBc7tWsiCQ6lXQzQ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/roles\"}', '2021-11-09 16:38:17', '2021-11-09 16:38:17'),
(524, 1, 'admin/auth/roles', 'GET', '::1', '[]', '2021-11-09 16:38:18', '2021-11-09 16:38:18'),
(525, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 16:38:21', '2021-11-09 16:38:21'),
(526, 2, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:38:26', '2021-11-09 16:38:26'),
(527, 1, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:38:51', '2021-11-09 16:38:51'),
(528, 2, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 16:38:59', '2021-11-09 16:38:59'),
(529, 2, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 16:40:08', '2021-11-09 16:40:08'),
(530, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 17:35:22', '2021-11-09 17:35:22'),
(531, 1, 'admin/exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:35:26', '2021-11-09 17:35:26'),
(532, 1, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:35:29', '2021-11-09 17:35:29'),
(533, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:35:36', '2021-11-09 17:35:36'),
(534, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 17:36:32', '2021-11-09 17:36:32'),
(535, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:36:40', '2021-11-09 17:36:40'),
(536, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:36:47', '2021-11-09 17:36:47'),
(537, 11, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-09 17:36:56', '2021-11-09 17:36:56'),
(538, 11, 'admin/exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:36:59', '2021-11-09 17:36:59'),
(539, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:37:02', '2021-11-09 17:37:02'),
(540, 11, 'admin/marks/4', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"20\",\"pk\":\"4\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:37:17', '2021-11-09 17:37:17'),
(541, 11, 'admin/marks/4', 'PUT', '127.0.0.1', '{\"name\":\"remarks\",\"value\":\"Fair\",\"pk\":\"4\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:37:21', '2021-11-09 17:37:21'),
(542, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:37:23', '2021-11-09 17:37:23'),
(543, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:37:25', '2021-11-09 17:37:25'),
(544, 2, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 17:39:05', '2021-11-09 17:39:05'),
(545, 11, 'admin/marks/4', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"24\",\"pk\":\"4\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:39:18', '2021-11-09 17:39:18'),
(546, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:39:20', '2021-11-09 17:39:20'),
(547, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:40:10', '2021-11-09 17:40:10'),
(548, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:40:25', '2021-11-09 17:40:25'),
(549, 11, 'admin/marks', 'GET', '127.0.0.1', '[]', '2021-11-09 17:40:39', '2021-11-09 17:40:39'),
(550, 11, 'admin/marks/3', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"11\",\"pk\":\"3\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:41:01', '2021-11-09 17:41:01'),
(551, 11, 'admin/marks/1', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"24\",\"pk\":\"1\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:41:09', '2021-11-09 17:41:09'),
(552, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:41:11', '2021-11-09 17:41:11'),
(553, 2, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:41:18', '2021-11-09 17:41:18'),
(554, 11, 'admin/marks/2', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"31\",\"pk\":\"2\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:41:26', '2021-11-09 17:41:26'),
(555, 2, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:41:29', '2021-11-09 17:41:29'),
(556, 11, 'admin/marks/2', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"18\",\"pk\":\"2\",\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-09 17:41:38', '2021-11-09 17:41:38'),
(557, 2, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:41:41', '2021-11-09 17:41:41'),
(558, 2, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:41:42', '2021-11-09 17:41:42'),
(559, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:45:28', '2021-11-09 17:45:28'),
(560, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:49:55', '2021-11-09 17:49:55'),
(561, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:51:26', '2021-11-09 17:51:26'),
(562, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:51:29', '2021-11-09 17:51:29'),
(563, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:53:14', '2021-11-09 17:53:14'),
(564, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:53:45', '2021-11-09 17:53:45'),
(565, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:54:04', '2021-11-09 17:54:04'),
(566, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:54:19', '2021-11-09 17:54:19'),
(567, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:54:32', '2021-11-09 17:54:32'),
(568, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:54:36', '2021-11-09 17:54:36'),
(569, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 17:55:25', '2021-11-09 17:55:25'),
(570, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:57:11', '2021-11-09 17:57:11'),
(571, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 17:57:11', '2021-11-09 17:57:11'),
(572, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:00:38', '2021-11-09 18:00:38'),
(573, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:01:03', '2021-11-09 18:01:03'),
(574, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:01:47', '2021-11-09 18:01:47'),
(575, 2, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:02:38', '2021-11-09 18:02:38'),
(576, 2, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:02:41', '2021-11-09 18:02:41'),
(577, 2, 'admin/marks', 'GET', '::1', '[]', '2021-11-09 18:02:47', '2021-11-09 18:02:47'),
(578, 11, 'admin/terms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:03:18', '2021-11-09 18:03:18'),
(579, 11, 'admin/terms/1/edit', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:03:21', '2021-11-09 18:03:21'),
(580, 11, 'admin/terms/1', 'PUT', '127.0.0.1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"general_exams\":{\"1\":{\"name\":\"Mid term exams\",\"short_name\":\"MID\",\"max_marks\":\"30\",\"published\":\"1\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"Final exams\",\"short_name\":\"Final\",\"max_marks\":\"70\",\"published\":\"0\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"after-save\":\"1\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/terms\"}', '2021-11-09 18:03:31', '2021-11-09 18:03:31'),
(581, 11, 'admin/terms/1/edit', 'GET', '127.0.0.1', '[]', '2021-11-09 18:03:32', '2021-11-09 18:03:32'),
(582, 2, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:03:37', '2021-11-09 18:03:37'),
(583, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:03:40', '2021-11-09 18:03:40'),
(584, 11, 'admin/terms/1', 'PUT', '127.0.0.1', '{\"name\":\"First term 2021\",\"short_name\":\"Term 1\",\"academic_year\":\"2020\",\"general_exams\":{\"1\":{\"name\":\"Mid term exams\",\"short_name\":\"MID\",\"max_marks\":\"30\",\"published\":\"1\",\"id\":\"1\",\"_remove_\":\"0\"},\"2\":{\"name\":\"Final exams\",\"short_name\":\"Final\",\"max_marks\":\"70\",\"published\":\"1\",\"id\":\"2\",\"_remove_\":\"0\"}},\"_token\":\"OZaEXQpRbOdWNXux09TmwJWeuGJaaIk1TBzbgiSJ\",\"_method\":\"PUT\"}', '2021-11-09 18:03:49', '2021-11-09 18:03:49'),
(585, 11, 'admin/terms', 'GET', '127.0.0.1', '[]', '2021-11-09 18:03:49', '2021-11-09 18:03:49'),
(586, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:03:52', '2021-11-09 18:03:52'),
(587, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:09:42', '2021-11-09 18:09:42'),
(588, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:09:55', '2021-11-09 18:09:55'),
(589, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 18:09:55', '2021-11-09 18:09:55'),
(590, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:09:56', '2021-11-09 18:09:56'),
(591, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:09:57', '2021-11-09 18:09:57'),
(592, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:09:58', '2021-11-09 18:09:58'),
(593, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:09:59', '2021-11-09 18:09:59'),
(594, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:00', '2021-11-09 18:10:00'),
(595, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:00', '2021-11-09 18:10:00'),
(596, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:01', '2021-11-09 18:10:01'),
(597, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:01', '2021-11-09 18:10:01'),
(598, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:01', '2021-11-09 18:10:01'),
(599, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:02', '2021-11-09 18:10:02'),
(600, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:02', '2021-11-09 18:10:02'),
(601, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:02', '2021-11-09 18:10:02'),
(602, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:03', '2021-11-09 18:10:03'),
(603, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:03', '2021-11-09 18:10:03'),
(604, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:04', '2021-11-09 18:10:04'),
(605, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:04', '2021-11-09 18:10:04'),
(606, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:04', '2021-11-09 18:10:04'),
(607, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:05', '2021-11-09 18:10:05'),
(608, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:06', '2021-11-09 18:10:06'),
(609, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:07', '2021-11-09 18:10:07'),
(610, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:08', '2021-11-09 18:10:08'),
(611, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:10:27', '2021-11-09 18:10:27'),
(612, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:11:35', '2021-11-09 18:11:35'),
(613, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 18:21:54', '2021-11-09 18:21:54'),
(614, 11, 'admin/my-classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:40', '2021-11-09 19:08:40'),
(615, 11, 'admin/my-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:43', '2021-11-09 19:08:43'),
(616, 11, 'admin/my-classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:46', '2021-11-09 19:08:46'),
(617, 11, 'admin/my-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:48', '2021-11-09 19:08:48'),
(618, 11, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:52', '2021-11-09 19:08:52'),
(619, 11, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:08:57', '2021-11-09 19:08:57'),
(620, 2, 'admin', 'GET', '::1', '[]', '2021-11-09 19:50:11', '2021-11-09 19:50:11'),
(621, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:50:35', '2021-11-09 19:50:35'),
(622, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:51:38', '2021-11-09 19:51:38'),
(623, 2, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:56:20', '2021-11-09 19:56:20'),
(624, 2, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:56:27', '2021-11-09 19:56:27'),
(625, 1, 'admin', 'GET', '::1', '[]', '2021-11-09 19:57:17', '2021-11-09 19:57:17'),
(626, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:57:38', '2021-11-09 19:57:38'),
(627, 1, 'admin/terms', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:57:54', '2021-11-09 19:57:54'),
(628, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:57:59', '2021-11-09 19:57:59'),
(629, 1, 'admin/auth/menu/8/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:58:03', '2021-11-09 19:58:03'),
(630, 1, 'admin/auth/menu/8', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Terms\",\"icon\":\"fa-adjust\",\"uri\":\"terms\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 19:59:07', '2021-11-09 19:59:07'),
(631, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 19:59:07', '2021-11-09 19:59:07'),
(632, 2, 'admin/general-exams', 'GET', '::1', '[]', '2021-11-09 19:59:09', '2021-11-09 19:59:09'),
(633, 2, 'admin/my-classes', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:59:14', '2021-11-09 19:59:14'),
(634, 1, 'admin/auth/menu/9/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:59:25', '2021-11-09 19:59:25'),
(635, 1, 'admin/auth/menu/9', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Classes\",\"icon\":\"fa-book\",\"uri\":\"my-classes\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 19:59:31', '2021-11-09 19:59:31'),
(636, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 19:59:31', '2021-11-09 19:59:31'),
(637, 2, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-09 19:59:35', '2021-11-09 19:59:35'),
(638, 1, 'admin/auth/menu/12/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 19:59:41', '2021-11-09 19:59:41'),
(639, 1, 'admin/auth/menu/12', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Subjects\",\"icon\":\"fa-bars\",\"uri\":\"subjects\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 19:59:52', '2021-11-09 19:59:52'),
(640, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 19:59:52', '2021-11-09 19:59:52'),
(641, 2, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-09 19:59:57', '2021-11-09 19:59:57'),
(642, 2, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-09 20:00:02', '2021-11-09 20:00:02'),
(643, 1, 'admin/auth/menu/14/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:00:04', '2021-11-09 20:00:04'),
(644, 1, 'admin/auth/menu/14', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Exams\",\"icon\":\"fa-pencil\",\"uri\":\"general-exams\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 20:00:09', '2021-11-09 20:00:09'),
(645, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 20:00:09', '2021-11-09 20:00:09'),
(646, 2, 'admin/my-classes', 'GET', '::1', '[]', '2021-11-09 20:00:12', '2021-11-09 20:00:12'),
(647, 2, 'admin/auth/logout', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:00:19', '2021-11-09 20:00:19'),
(648, 11, 'admin', 'GET', '::1', '[]', '2021-11-09 20:00:28', '2021-11-09 20:00:28'),
(649, 11, 'admin/auth/setting', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:00:36', '2021-11-09 20:00:36'),
(650, 11, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:00:41', '2021-11-09 20:00:41'),
(651, 1, 'admin/auth/menu/10/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:00:50', '2021-11-09 20:00:50'),
(652, 1, 'admin/auth/menu/10', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Students\",\"icon\":\"fa-bars\",\"uri\":\"students\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 20:00:54', '2021-11-09 20:00:54'),
(653, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 20:00:54', '2021-11-09 20:00:54'),
(654, 11, 'admin', 'GET', '::1', '[]', '2021-11-09 20:00:56', '2021-11-09 20:00:56'),
(655, 1, 'admin/auth/menu/11/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:01:10', '2021-11-09 20:01:10'),
(656, 1, 'admin/auth/menu/11', 'PUT', '::1', '{\"parent_id\":\"0\",\"title\":\"Teachers\",\"icon\":\"fa-eyedropper\",\"uri\":\"teachers\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8888\\/exams\\/admin\\/auth\\/menu\"}', '2021-11-09 20:01:20', '2021-11-09 20:01:20'),
(657, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 20:01:21', '2021-11-09 20:01:21'),
(658, 11, 'admin', 'GET', '::1', '[]', '2021-11-09 20:01:24', '2021-11-09 20:01:24'),
(659, 1, 'admin/auth/menu', 'POST', '::1', '{\"parent_id\":\"0\",\"title\":null,\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\"}', '2021-11-09 20:01:42', '2021-11-09 20:01:42'),
(660, 1, 'admin/auth/menu', 'GET', '::1', '[]', '2021-11-09 20:01:43', '2021-11-09 20:01:43'),
(661, 1, 'admin/auth/menu', 'POST', '::1', '{\"_token\":\"yhLy6fyRGG3VbhPLWQ0ivbJAfIfNNlhLTtdDjwn9\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":12},{\\\"id\\\":14},{\\\"id\\\":13},{\\\"id\\\":15},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2021-11-09 20:01:49', '2021-11-09 20:01:49'),
(662, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:01:50', '2021-11-09 20:01:50'),
(663, 11, 'admin', 'GET', '::1', '[]', '2021-11-09 20:01:57', '2021-11-09 20:01:57'),
(664, 11, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:02:01', '2021-11-09 20:02:01'),
(665, 11, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-09 20:02:23', '2021-11-09 20:02:23'),
(666, 11, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:53:09', '2021-11-10 02:53:09'),
(667, 11, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 02:53:59', '2021-11-10 02:53:59'),
(668, 11, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:54:03', '2021-11-10 02:54:03'),
(669, 11, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:54:11', '2021-11-10 02:54:11'),
(670, 1, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 02:55:07', '2021-11-10 02:55:07'),
(671, 1, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:13', '2021-11-10 02:55:13'),
(672, 1, 'admin/terms', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:15', '2021-11-10 02:55:15'),
(673, 1, 'admin/terms/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:20', '2021-11-10 02:55:20'),
(674, 1, 'admin/my-classes', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:42', '2021-11-10 02:55:42'),
(675, 1, 'admin/my-classes/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:49', '2021-11-10 02:55:49'),
(676, 1, 'admin/students', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:53', '2021-11-10 02:55:53'),
(677, 1, 'admin/students/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:55:57', '2021-11-10 02:55:57'),
(678, 1, 'admin/teachers', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:02', '2021-11-10 02:56:02'),
(679, 1, 'admin/teachers/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:06', '2021-11-10 02:56:06'),
(680, 1, 'admin/subjects', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:09', '2021-11-10 02:56:09'),
(681, 1, 'admin/subjects/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:16', '2021-11-10 02:56:16'),
(682, 1, 'admin/general-exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:20', '2021-11-10 02:56:20'),
(683, 1, 'admin/general-exams/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:24', '2021-11-10 02:56:24'),
(684, 1, 'admin/exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:29', '2021-11-10 02:56:29'),
(685, 1, 'admin/exams/create', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:32', '2021-11-10 02:56:32'),
(686, 1, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:36', '2021-11-10 02:56:36'),
(687, 1, 'admin/auth/users', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:50', '2021-11-10 02:56:50'),
(688, 1, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:56:59', '2021-11-10 02:56:59'),
(689, 11, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 02:57:08', '2021-11-10 02:57:08'),
(690, 11, 'admin/exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:57:12', '2021-11-10 02:57:12'),
(691, 11, 'admin/marks', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:57:22', '2021-11-10 02:57:22'),
(692, 11, 'admin/marks/5', 'PUT', '127.0.0.1', '{\"name\":\"mark\",\"value\":\"10\",\"pk\":\"5\",\"_token\":\"VUx1nzcxMn0kSOCZ0zTYvHpRz9SMfwZMUBV8zQsN\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-10 02:57:34', '2021-11-10 02:57:34'),
(693, 11, 'admin/marks/5', 'PUT', '127.0.0.1', '{\"name\":\"remarks\",\"value\":\"Nice\",\"pk\":\"5\",\"_token\":\"VUx1nzcxMn0kSOCZ0zTYvHpRz9SMfwZMUBV8zQsN\",\"_editable\":\"1\",\"_method\":\"PUT\"}', '2021-11-10 02:57:44', '2021-11-10 02:57:44'),
(694, 11, 'admin/auth/logout', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:57:52', '2021-11-10 02:57:52'),
(695, 2, 'admin', 'GET', '127.0.0.1', '[]', '2021-11-10 02:58:24', '2021-11-10 02:58:24'),
(696, 2, 'admin/exams', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:58:28', '2021-11-10 02:58:28'),
(697, 2, 'admin', 'GET', '127.0.0.1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-10 02:58:35', '2021-11-10 02:58:35'),
(698, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:42:35', '2021-11-13 02:42:35'),
(699, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:45:23', '2021-11-13 02:45:23'),
(700, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:46:55', '2021-11-13 02:46:55'),
(701, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:46:58', '2021-11-13 02:46:58'),
(702, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:47:13', '2021-11-13 02:47:13'),
(703, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:47:27', '2021-11-13 02:47:27'),
(704, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:47:40', '2021-11-13 02:47:40'),
(705, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:48:17', '2021-11-13 02:48:17'),
(706, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:48:33', '2021-11-13 02:48:33'),
(707, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:49:21', '2021-11-13 02:49:21'),
(708, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:49:23', '2021-11-13 02:49:23'),
(709, 1, 'admin/teachers', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:49:28', '2021-11-13 02:49:28'),
(710, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:49:30', '2021-11-13 02:49:30'),
(711, 1, 'admin/teachers', 'GET', '::1', '[]', '2021-11-13 02:49:32', '2021-11-13 02:49:32'),
(712, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:50:31', '2021-11-13 02:50:31'),
(713, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 02:50:53', '2021-11-13 02:50:53'),
(714, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:51:35', '2021-11-13 02:51:35');
INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`) VALUES
(715, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:52:14', '2021-11-13 02:52:14'),
(716, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:52:18', '2021-11-13 02:52:18'),
(717, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:52:29', '2021-11-13 02:52:29'),
(718, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 02:52:54', '2021-11-13 02:52:54'),
(719, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:40:12', '2021-11-13 03:40:12'),
(720, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:40:45', '2021-11-13 03:40:45'),
(721, 1, 'admin/students/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:40:50', '2021-11-13 03:40:50'),
(722, 1, 'admin/students', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:40:56', '2021-11-13 03:40:56'),
(723, 1, 'admin/students/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:40:59', '2021-11-13 03:40:59'),
(724, 2, 'admin', 'GET', '::1', '[]', '2021-11-13 03:41:13', '2021-11-13 03:41:13'),
(725, 2, 'admin', 'GET', '::1', '[]', '2021-11-13 03:44:14', '2021-11-13 03:44:14'),
(726, 1, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:44:28', '2021-11-13 03:44:28'),
(727, 2, 'admin', 'GET', '::1', '[]', '2021-11-13 03:44:45', '2021-11-13 03:44:45'),
(728, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:44:51', '2021-11-13 03:44:51'),
(729, 2, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:44:53', '2021-11-13 03:44:53'),
(730, 1, 'admin', 'GET', '::1', '[]', '2021-11-13 03:55:26', '2021-11-13 03:55:26'),
(731, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:55:35', '2021-11-13 03:55:35'),
(732, 1, 'admin/auth/users', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:55:41', '2021-11-13 03:55:41'),
(733, 1, 'admin/auth/users/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:55:50', '2021-11-13 03:55:50'),
(734, 1, 'admin/auth/roles', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:55:56', '2021-11-13 03:55:56'),
(735, 1, 'admin/auth/roles/1/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:56:03', '2021-11-13 03:56:03'),
(736, 2, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:56:58', '2021-11-13 03:56:58'),
(737, 1, 'admin/general-exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:07', '2021-11-13 03:57:07'),
(738, 2, 'admin', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:13', '2021-11-13 03:57:13'),
(739, 2, 'admin/exams', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:15', '2021-11-13 03:57:15'),
(740, 1, 'admin/marks', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:33', '2021-11-13 03:57:33'),
(741, 1, 'admin/auth/menu', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:44', '2021-11-13 03:57:44'),
(742, 1, 'admin/auth/menu/15/edit', 'GET', '::1', '{\"_pjax\":\"#pjax-container\"}', '2021-11-13 03:57:53', '2021-11-13 03:57:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_roles`
--

CREATE TABLE `admin_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_roles`
--

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2021-10-31 16:28:31', '2021-10-31 16:28:31'),
(2, 'Student', 'student', '2021-11-01 15:23:41', '2021-11-01 15:23:41'),
(3, 'Teacher', 'teacher', '2021-11-02 13:09:42', '2021-11-02 13:09:42');

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_menu`
--

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_menu`
--

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL),
(3, 15, NULL, NULL),
(1, 8, NULL, NULL),
(1, 9, NULL, NULL),
(1, 12, NULL, NULL),
(1, 14, NULL, NULL),
(1, 10, NULL, NULL),
(1, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_permissions`
--

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_permissions`
--

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(3, 1, NULL, NULL),
(2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role_users`
--

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_role_users`
--

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL),
(2, 2, NULL, NULL),
(2, 3, NULL, NULL),
(2, 4, NULL, NULL),
(2, 5, NULL, NULL),
(2, 6, NULL, NULL),
(2, 7, NULL, NULL),
(2, 8, NULL, NULL),
(2, 9, NULL, NULL),
(3, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$k7q3jOdmYcX5lS/HJhih2.7vc9MDGaNeZqzIb/a9eirOZWiZp0HPm', 'Administrator', NULL, 'PkINAbK8UpGCwe0Ne5sQdRkJYQLJXEiqbXm3QeKU9Wk81sp1HhMPXkGeHwsk', '2021-10-31 16:28:31', '2021-10-31 16:28:31'),
(2, 'romina', '$2y$10$GXrYx9iK9/k4Vn20VLY3veLXuVFA74DOI1ToYFFm.bKybxYEsYme6', 'romina', NULL, '3lJZh5phFWOwV56lrzN2YdJtbtVRBFyUEuFJWF92EqHjgfDtcGCiCQyzGX1x', '2021-11-01 15:26:19', '2021-11-01 15:26:19'),
(3, 'romina6142', '$2y$10$gJ2M46h29IIilQUDeRKnHeLw2ka76/4bJM7R4WBfUteTZfsqb/JQC', 'romina', NULL, NULL, '2021-11-01 15:28:27', '2021-11-01 15:28:27'),
(4, 'romina2386', '$2y$10$gIrGBL7vkrOgVVuM.705e.7p6tRo8LWBTBJPRnkZZzUK24WqJM136', 'romina', NULL, NULL, '2021-11-01 15:29:17', '2021-11-01 15:29:17'),
(5, 'romina1716', '$2y$10$ETX0Y5amnB7j8qyuiqxiAuYk1G6X9YTmAO49YINFDEBh.2hD5YTJ6', 'romina', NULL, NULL, '2021-11-01 15:29:46', '2021-11-01 15:29:46'),
(6, 'biirah-sumayya', '$2y$10$f0eeg9Kct4kE3LtvKRu6re4ElIA.XkS1tXRJR9DqxDuPmCuOy6xTa', 'Biirah Sumayya', NULL, NULL, '2021-11-02 12:55:45', '2021-11-02 12:55:45'),
(7, 'muhindo-mubaraka', '$2y$10$Blge1yq7eTHIeX55nDp87uNXfc2kXNk7d.yRRZXd.yVNRuZmUuwyi', 'Muhindo Mubaraka', NULL, NULL, '2021-11-02 12:56:30', '2021-11-02 12:56:30'),
(8, 'muhindo-mubaraka6617', '$2y$10$fkREeSunCrxrEaEgxqt9ZOmxyUg.3lJeGq2IebmJ5H8TLFL/NNjWG', 'Muhindo Mubaraka', NULL, NULL, '2021-11-02 12:57:58', '2021-11-02 12:57:58'),
(9, 'bwambale-muhidin', '$2y$10$zDGiqPIU2cFDLyZDrqu3U.vjvY1STk9D65KljapyMt854rLywTArC', 'Bwambale Muhidin', NULL, NULL, '2021-11-02 12:59:20', '2021-11-02 12:59:20'),
(11, 'kule-swaleh6208', '$2y$10$1ybwMYgCsx3wPKuOMARh/Oe11yxB8Z46shE2lm131czvGj/M8VoJu', 'Kule Swaleh', NULL, 'MTC2Bvzb9KvPxFGe4d8a6QuryjGFq3ZmfPsyilmGB2oFrX6uVFa15NFQdX1S', '2021-11-02 13:12:53', '2021-11-02 13:12:53');

-- --------------------------------------------------------

--
-- Table structure for table `admin_user_permissions`
--

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `classes`
--

CREATE TABLE `classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `short_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contracts`
--

CREATE TABLE `contracts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci,
  `fuel_type` text COLLATE utf8mb4_unicode_ci,
  `total_quantity` text COLLATE utf8mb4_unicode_ci,
  `attachment` text COLLATE utf8mb4_unicode_ci,
  `contract_period` text COLLATE utf8mb4_unicode_ci,
  `price` bigint(20) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `engines`
--

CREATE TABLE `engines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `power_station_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `photo` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `exams`
--

CREATE TABLE `exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `my_class_id` bigint(20) UNSIGNED NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `general_exam_id` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `exams`
--

INSERT INTO `exams` (`id`, `created_at`, `updated_at`, `my_class_id`, `subject_id`, `administrator_id`, `term_id`, `general_exam_id`) VALUES
(1, '2021-11-02 16:18:06', '2021-11-02 16:18:06', 1, 1, 1, 1, 1),
(2, '2021-11-02 16:18:27', '2021-11-02 16:18:27', 1, 2, 1, 1, 1),
(3, '2021-11-02 16:18:37', '2021-11-02 16:18:37', 2, 3, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_exams`
--

CREATE TABLE `general_exams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT '1',
  `name` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `max_marks` bigint(20) DEFAULT NULL,
  `published` tinyint(4) DEFAULT NULL,
  `short_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_exams`
--

INSERT INTO `general_exams` (`id`, `created_at`, `updated_at`, `term_id`, `name`, `details`, `max_marks`, `published`, `short_name`) VALUES
(1, '2021-11-08 16:15:58', '2021-11-09 18:03:31', 1, 'Mid term exams', NULL, 30, 1, 'MID'),
(2, '2021-11-08 16:18:41', '2021-11-09 18:03:49', 1, 'Final exams', NULL, 70, 1, 'Final');

-- --------------------------------------------------------

--
-- Table structure for table `marks`
--

CREATE TABLE `marks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `term_id` bigint(20) UNSIGNED DEFAULT NULL,
  `general_exam_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `mark` int(11) DEFAULT '0',
  `remarks` text COLLATE utf8mb4_unicode_ci,
  `student_id` bigint(20) DEFAULT NULL,
  `published` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marks`
--

INSERT INTO `marks` (`id`, `created_at`, `updated_at`, `term_id`, `general_exam_id`, `subject_id`, `administrator_id`, `mark`, `remarks`, `student_id`, `published`) VALUES
(1, '2021-11-09 15:04:27', '2021-11-09 17:41:09', 1, 1, 1, 11, 24, 'Good!', 1, 1),
(2, '2021-11-09 15:04:27', '2021-11-09 17:41:38', 1, 1, 1, 11, 18, 'Fair', 2, 1),
(3, '2021-11-09 15:04:27', '2021-11-09 17:41:01', 1, 1, 1, 11, 11, 'Fair', 3, 1),
(4, '2021-11-09 15:04:27', '2021-11-09 17:39:18', 1, 1, 2, 11, 24, 'Fair', 1, 1),
(5, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 1, 2, 11, 0, '', 2, 0),
(6, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 1, 2, 11, 0, '', 3, 0),
(7, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 1, 3, 1, 0, '', 1, 0),
(8, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 1, 3, 1, 0, '', 2, 0),
(9, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 1, 3, 1, 0, '', 3, 0),
(10, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 1, 11, 0, '', 1, 0),
(11, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 1, 11, 0, '', 2, 0),
(12, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 1, 11, 0, '', 3, 0),
(13, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 2, 11, 0, '', 1, 0),
(14, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 2, 11, 0, '', 2, 0),
(15, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 2, 11, 0, '', 3, 0),
(16, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 3, 1, 0, '', 1, 0),
(17, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 3, 1, 0, '', 2, 0),
(18, '2021-11-09 15:04:27', '2021-11-09 15:04:27', 1, 2, 3, 1, 0, '', 3, 0);

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_10_30_001811_create_power_stations_table', 1),
(7, '2021_10_30_004719_create_tanks_table', 1),
(8, '2021_10_30_014301_create_engines_table', 1),
(9, '2021_10_30_061602_create_contracts_table', 1),
(10, '2021_10_31_192516_create_terms_table', 1),
(11, '2021_10_31_205037_create_classes_table', 2),
(12, '2021_11_01_164517_create_my_classes_table', 3),
(13, '2021_11_01_172108_create_students_table', 3),
(14, '2021_11_02_160241_create_teachers_table', 4),
(15, '2021_11_02_165407_create_subjects_table', 5),
(16, '2021_11_02_172846_create_exams_table', 6),
(17, '2021_11_08_165412_create_general_exams_table', 7),
(18, '2021_11_08_195624_create_marks_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `my_classes`
--

CREATE TABLE `my_classes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `short_name` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `my_classes`
--

INSERT INTO `my_classes` (`id`, `created_at`, `updated_at`, `name`, `short_name`) VALUES
(1, '2021-11-01 15:45:37', '2021-11-01 15:45:37', 'Senior 1', 'S.1'),
(2, '2021-11-01 15:45:56', '2021-11-02 15:10:11', 'Senior 2', 'S.2'),
(3, '2021-11-01 15:46:12', '2021-11-01 15:46:12', 'Senior 3', 'S.3');

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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `power_stations`
--

CREATE TABLE `power_stations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `my_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `gender` text COLLATE utf8mb4_unicode_ci,
  `age` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `created_at`, `updated_at`, `administrator_id`, `my_class_id`, `name`, `gender`, `age`, `details`) VALUES
(1, '2021-11-01 15:29:46', '2021-11-01 15:29:46', 5, 1, 'romina', NULL, NULL, NULL),
(2, '2021-11-02 12:57:58', '2021-11-02 12:57:58', 8, 1, 'Muhindo Mubaraka', 'Male', 26, 'Muhindo Details go here'),
(3, '2021-11-02 12:59:20', '2021-11-02 12:59:20', 9, 1, 'Bwambale Muhidin', 'Male', 17, 'Muhdin details');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `my_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subjects`
--

INSERT INTO `subjects` (`id`, `created_at`, `updated_at`, `administrator_id`, `my_class_id`, `name`, `details`) VALUES
(1, '2021-11-02 14:12:25', '2021-11-02 14:12:25', 11, 1, 'Biology', 'Simple bios details'),
(2, '2021-11-02 14:23:03', '2021-11-02 14:23:03', 11, 1, 'History', 'Hist details'),
(3, '2021-11-02 15:09:40', '2021-11-02 15:09:40', 1, 2, 'Physics', 'simple details..');

-- --------------------------------------------------------

--
-- Table structure for table `tanks`
--

CREATE TABLE `tanks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `power_station_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `fuel_type` text COLLATE utf8mb4_unicode_ci,
  `capacity` int(11) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `administrator_id` bigint(20) UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `gender` text COLLATE utf8mb4_unicode_ci,
  `phone_number` text COLLATE utf8mb4_unicode_ci,
  `salary` text COLLATE utf8mb4_unicode_ci,
  `details` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `created_at`, `updated_at`, `administrator_id`, `name`, `gender`, `phone_number`, `salary`, `details`) VALUES
(1, '2021-11-02 13:12:53', '2021-11-02 13:12:53', 11, 'Kule Swaleh', 'Male', '+256123456789', '150000', 'Simple details for this teacher');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` text COLLATE utf8mb4_unicode_ci,
  `short_name` text COLLATE utf8mb4_unicode_ci,
  `academic_year` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`id`, `created_at`, `updated_at`, `name`, `short_name`, `academic_year`) VALUES
(1, '2021-10-31 17:46:30', '2021-10-31 17:46:30', 'First term 2021', 'Term 1', 2020);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_operation_log_user_id_index` (`user_id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `admin_permissions_slug_unique` (`slug`);

--
-- Indexes for table `admin_roles`
--
ALTER TABLE `admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `admin_roles_slug_unique` (`slug`);

--
-- Indexes for table `admin_role_menu`
--
ALTER TABLE `admin_role_menu`
  ADD KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- Indexes for table `admin_role_permissions`
--
ALTER TABLE `admin_role_permissions`
  ADD KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- Indexes for table `admin_role_users`
--
ALTER TABLE `admin_role_users`
  ADD KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_users_username_unique` (`username`);

--
-- Indexes for table `admin_user_permissions`
--
ALTER TABLE `admin_user_permissions`
  ADD KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- Indexes for table `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contracts`
--
ALTER TABLE `contracts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `engines`
--
ALTER TABLE `engines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `general_exams`
--
ALTER TABLE `general_exams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marks`
--
ALTER TABLE `marks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `my_classes`
--
ALTER TABLE `my_classes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `power_stations`
--
ALTER TABLE `power_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tanks`
--
ALTER TABLE `tanks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `admin_operation_log`
--
ALTER TABLE `admin_operation_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=743;

--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `admin_roles`
--
ALTER TABLE `admin_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `classes`
--
ALTER TABLE `classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `contracts`
--
ALTER TABLE `contracts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `engines`
--
ALTER TABLE `engines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `exams`
--
ALTER TABLE `exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_exams`
--
ALTER TABLE `general_exams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marks`
--
ALTER TABLE `marks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `my_classes`
--
ALTER TABLE `my_classes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `power_stations`
--
ALTER TABLE `power_stations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tanks`
--
ALTER TABLE `tanks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
