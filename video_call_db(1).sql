-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2020 at 11:13 AM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `video_call_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `conf_rooms`
--

CREATE TABLE `conf_rooms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_participant` int(11) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `duration` double(8,2) NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conf_rooms`
--

INSERT INTO `conf_rooms` (`id`, `sid`, `room_name`, `type`, `max_participant`, `start_time`, `end_time`, `duration`, `url`, `active_status`, `created_at`, `updated_at`) VALUES
(1, 'RMcdf02771dcea33a6f58aa0b8a6a6acfa', 'apione', 'group', 3, '2020-05-16 12:48:02', NULL, 0.00, 'https://video.twilio.com/v1/Rooms/RMcdf02771dcea33a6f58aa0b8a6a6acfa', 'in-progress', NULL, NULL),
(2, 'RMc156e0d81ab03ca85bd60e1ecfd0f22a', 'apitwo', 'group', 3, '2020-05-16 13:05:14', NULL, 0.00, 'https://video.twilio.com/v1/Rooms/RMc156e0d81ab03ca85bd60e1ecfd0f22a', 'in-progress', NULL, NULL),
(3, 'RM734502b83b74092003ca1d6a8660c9fd', 'apithree', 'group', 3, '2020-05-16 13:07:17', '2020-05-16 13:07:47', 30.00, 'https://video.twilio.com/v1/Rooms/RM734502b83b74092003ca1d6a8660c9fd', 'completed', NULL, NULL),
(4, 'RMc748aaac11c9ae5340b52db7ca813e11', 'apifour', 'group', 3, '2020-05-16 14:02:32', NULL, 0.00, 'https://video.twilio.com/v1/Rooms/RMc748aaac11c9ae5340b52db7ca813e11', 'in-progress', NULL, NULL),
(5, 'RM11f648fec89782adc0927fca8240570d', 'apifive', 'group', 3, '2020-05-16 14:04:01', NULL, 0.00, 'https://video.twilio.com/v1/Rooms/RM11f648fec89782adc0927fca8240570d', 'in-progress', NULL, NULL),
(6, 'RM0de270411c1e9d3a135dc03ae8578c45', 'apisix', 'group', 3, '2020-05-16 14:06:50', '2020-05-16 14:08:51', 120.00, 'https://video.twilio.com/v1/Rooms/RM0de270411c1e9d3a135dc03ae8578c45', 'completed', NULL, NULL),
(7, 'RM8554c36f969fe58349ab16fe1afcffb7', 'apiseven', 'group', 3, '2020-05-16 14:12:18', '2020-05-16 14:13:55', 97.00, 'https://video.twilio.com/v1/Rooms/RM8554c36f969fe58349ab16fe1afcffb7', 'completed', NULL, NULL),
(8, 'RM5810a96bad0faebeea9534f2a49b501a', 'apieight', 'group', 3, '2020-05-16 14:24:44', '2020-05-16 14:29:04', 260.00, 'https://video.twilio.com/v1/Rooms/RM5810a96bad0faebeea9534f2a49b501a', 'completed', NULL, NULL),
(9, 'RMdabdf357a8a47ad110fc01b9ebb9b48e', 'apinine', 'group', 3, '2020-05-16 14:31:16', '2020-05-16 14:33:46', 150.00, 'https://video.twilio.com/v1/Rooms/RMdabdf357a8a47ad110fc01b9ebb9b48e', 'completed', NULL, NULL),
(10, 'RMe9b9f5a6e40ab6f622273125bab5ac5b', 'ercc', 'group', 3, '2020-05-16 15:08:11', NULL, 0.00, 'https://video.twilio.com/v1/Rooms/RMe9b9f5a6e40ab6f622273125bab5ac5b', 'in-progress', NULL, NULL),
(11, 'RM515e4ecde8b8332d1a7018db051280f6', 'mkio', 'group', 3, '2020-05-16 15:11:43', '2020-05-16 15:13:09', 85.00, 'https://video.twilio.com/v1/Rooms/RM515e4ecde8b8332d1a7018db051280f6', 'completed', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `conf_room_participants`
--

CREATE TABLE `conf_room_participants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_identity` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `room_sid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `join_time` datetime DEFAULT NULL,
  `disconnect_time` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `conf_room_participants`
--

INSERT INTO `conf_room_participants` (`id`, `user_identity`, `user_type`, `room_sid`, `join_time`, `disconnect_time`, `status`, `created_at`, `updated_at`) VALUES
(1, 'msd', 'doctor', 'RMcdf02771dcea33a6f58aa0b8a6a6acfa', '2020-05-16 12:48:03', NULL, 1, NULL, NULL),
(2, 'msd', 'doctor', 'RMc156e0d81ab03ca85bd60e1ecfd0f22a', '2020-05-16 13:05:14', NULL, 1, NULL, NULL),
(3, 'msd', 'doctor', 'RM734502b83b74092003ca1d6a8660c9fd', '2020-05-16 13:07:17', NULL, 1, NULL, NULL),
(4, 'jamal', 'doctor', 'apisix', '2020-05-16 14:06:50', '2020-05-16 14:08:51', 0, NULL, NULL),
(5, 'kalu', 'patient', 'apisix', '2020-05-16 14:08:10', '2020-05-16 14:08:51', 0, NULL, NULL),
(6, 'mio', 'doctor', 'apiseven', '2020-05-16 14:12:18', '2020-05-16 14:13:55', 0, NULL, NULL),
(7, 'samiul', 'doctor', 'apieight', '2020-05-16 14:24:44', '2020-05-16 14:29:04', 0, NULL, NULL),
(8, 'toriqul', 'patient', 'apieight', '2020-05-16 14:26:48', '2020-05-16 14:29:04', 0, NULL, NULL),
(9, 'samiul', 'doctor', 'apinine', '2020-05-16 14:31:16', '2020-05-16 14:33:46', 0, NULL, NULL),
(10, 'toriqul', 'patient', 'apinine', '2020-05-16 14:32:27', '2020-05-16 14:33:46', 0, NULL, NULL),
(11, '1', 'doctor', 'mkio', '2020-05-16 15:11:44', '2020-05-16 15:13:09', 0, NULL, NULL),
(12, '2', 'doctor', 'mkio', '2020-05-16 15:11:59', '2020-05-16 15:13:09', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(30, '2014_10_12_100000_create_password_resets_table', 1),
(31, '2019_08_19_000000_create_failed_jobs_table', 1),
(32, '2020_05_09_093422_create_user_table', 1),
(33, '2020_05_09_100303_create_room_table', 1),
(34, '2020_05_09_100836_create_room_participant_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tahsin Abrar', '', 1, NULL, NULL),
(2, 'Shamvil', '', 1, NULL, NULL),
(3, 'Toriqul', '', 1, NULL, NULL),
(4, 'Samiul Islam', '', 1, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `conf_rooms`
--
ALTER TABLE `conf_rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `conf_room_participants`
--
ALTER TABLE `conf_room_participants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `conf_rooms`
--
ALTER TABLE `conf_rooms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `conf_room_participants`
--
ALTER TABLE `conf_room_participants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
