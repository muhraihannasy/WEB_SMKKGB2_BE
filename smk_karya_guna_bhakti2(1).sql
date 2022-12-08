-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2022 at 12:26 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smk_karya_guna_bhakti2`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2022_11_15_125455_create_student_achievements_table', 1),
(2, '2022_11_15_125509_create_student_fathers_table', 1),
(3, '2022_11_15_125519_create_student_mothers_table', 1),
(4, '2022_11_15_125535_create_student_guardians_table', 1),
(5, '2022_11_15_125548_create_student_priodics_table', 1),
(6, '2022_11_15_125601_create_student_scholarships_table', 1),
(7, '2022_11_15_125650_create_registrations_table', 1),
(8, '2022_11_15_131310_create_users_table', 1),
(9, '2022_11_19_072945_create_students_table', 1),
(10, '2022_11_19_073147_create_user_types_table', 1),
(11, '2022_11_19_073202_create_admins_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `class` enum('Teknik Komputer dan Jaringan','Akutansi dan Keuangan Lembaga','Otomasi dan Tata Kelola Perkantoran') COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_registration` enum('Siswa Baru','Pindahan','Kembali Bersekolah') COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_examinee` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_serial_diploma` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_serial_skhus` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_pick` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extracurricular` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `uniform` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registrations`
--

INSERT INTO `registrations` (`id`, `student_id`, `payment_id`, `class`, `type_registration`, `from_school`, `no_examinee`, `no_serial_diploma`, `no_serial_skhus`, `class_pick`, `extracurricular`, `uniform`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Teknik Komputer dan Jaringan', 'Siswa Baru', 'SMP 32 Kota Bekasi', '123021', '918232', '0981232', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga', 'OSIS|Pramuka|Futsal', 'XL|M|XXL|L', 1, 1, '2022-11-20 15:01:12', '2022-12-08 16:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_father_id` bigint(20) UNSIGNED NOT NULL,
  `student_mother_id` bigint(20) UNSIGNED NOT NULL,
  `student_guardian_id` bigint(20) UNSIGNED NOT NULL,
  `student_achievement_id` bigint(20) UNSIGNED NOT NULL,
  `student_scholarship_id` bigint(20) UNSIGNED NOT NULL,
  `nisn` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_certificate_registration` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `no_kks` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kps` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence` enum('bersama orang tua','wali','kos','asrama','panti asuhan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence_distance` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transport` enum('Jalan Kaki','Kendaraan Pribadi','Kendaraan Umum/Angkot/Pete-pete','Jemputan Sekolah','Kereta api','Ojek','Andong/Bendi/Sado/Dokar/Delma/Beca','Perahu Penyebrangan/Rakit/Getek','Lainya') COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_to_school` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `religion` enum('Islam','kristen/protestan','Katholik','Hindu','Budha','khonghucu','lainnya') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `height` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_siblings` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('laki-laki','perempuan') COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_needs` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_family` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_father_id`, `student_mother_id`, `student_guardian_id`, `student_achievement_id`, `student_scholarship_id`, `nisn`, `nik`, `no_certificate_registration`, `no_kks`, `kps`, `kip`, `address`, `residence`, `residence_distance`, `transport`, `time_to_school`, `religion`, `birth`, `height`, `weight`, `amount_siblings`, `gender`, `special_needs`, `order_family`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 2, '012039123', '317218302', '1208301823', '1203123', 'ya|120390123', 'ya|sumbangan|92138213', 'Bekasi|Tambun Utara|Karang Satria|Perumahan Taman Alamanda|02|022|17023', 'bersama orang tua', '2km', 'Kendaraan Pribadi', '1jam|10menit', 'Islam', '2022-11-27', '170', '53.5', '3', 'laki-laki', 'Tidak Ada', '1', '1', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_achievements`
--

CREATE TABLE `student_achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `achievement_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` enum('Sains','Seni','Olahraga','Lain-lain') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` enum('Sekolah','Kabupaten','Nasional','Internasional','Kecamatan','Provinsi') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `organizer_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_achievements`
--

INSERT INTO `student_achievements` (`id`, `user_id`, `achievement_name`, `type`, `level`, `year`, `organizer_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anak Paling Pintar', 'Sains', 'Internasional', '2022', 'PT Agung Kejaksaan', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(2, 1, 'Jago Coding', 'Sains', 'Internasional', '2022', 'PT Hamba Allah', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_fathers`
--

CREATE TABLE `student_fathers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_needs` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_fathers`
--

INSERT INTO `student_fathers` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Syafarul', '31920123012', '1985-03-22', 'S3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_guardians`
--

CREATE TABLE `student_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_needs` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_guardians`
--

INSERT INTO `student_guardians` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sefriani', '31920123012', '1985-03-22', 'D3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_mothers`
--

CREATE TABLE `student_mothers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `special_needs` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_mothers`
--

INSERT INTO `student_mothers` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sefriani', '31920123012', '1985-03-22', 'D3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `student_priodics`
--

CREATE TABLE `student_priodics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `height` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `weight` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `residence_distance` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_to_school` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount_siblings` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_scholarships`
--

CREATE TABLE `student_scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Anak Berprestasi','Anak Miskin','Pendidikan','Unggulan','Lain-lain') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descriptions` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_start_at` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `year_finish_at` varchar(4) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_scholarships`
--

INSERT INTO `student_scholarships` (`id`, `user_id`, `type`, `descriptions`, `year_start_at`, `year_finish_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pendidikan', 'Anaknya Pinter Banget aminn', '2019', '2050', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(2, 1, 'Unggulan', 'paling the best deh pooknya ma', '2019', '2050', '2022-11-20 15:01:12', '2022-11-20 15:01:12');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `fullname`, `username`, `phone`, `email`, `email_verified_at`, `password`, `photo`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Muhammad Raihan Nasywaan', 'muhrey28', '08102380812', 'muhraihannasy@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80', 1, NULL, NULL),
(2, 2, 'Muhammad Joko', 'jokotengkir', '081203802', 'joko@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', NULL, 1, '2022-11-20 15:40:53', '2022-11-20 15:40:53'),
(3, 1, 'Ridwan Masmil', 'ridwanmil', '0801823', 'ridwanmil@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', 'https://images.unsplash.com/photo-1670272499188-79fe22656f64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'student', NULL, NULL),
(2, 'admin', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_fathers`
--
ALTER TABLE `student_fathers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_mothers`
--
ALTER TABLE `student_mothers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_priodics`
--
ALTER TABLE `student_priodics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_scholarships`
--
ALTER TABLE `student_scholarships`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_achievements`
--
ALTER TABLE `student_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `student_fathers`
--
ALTER TABLE `student_fathers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_mothers`
--
ALTER TABLE `student_mothers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_priodics`
--
ALTER TABLE `student_priodics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `student_scholarships`
--
ALTER TABLE `student_scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
