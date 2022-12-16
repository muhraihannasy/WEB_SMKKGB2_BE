-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Des 2022 pada 07.12
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smkkgb2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
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
-- Struktur dari tabel `registrations`
--

CREATE TABLE `registrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_registration` enum('Siswa Baru','Pindahan','Kembali Bersekolah') DEFAULT NULL,
  `from_school` varchar(255) DEFAULT NULL,
  `no_examinee` varchar(35) DEFAULT NULL,
  `no_serial_diploma` varchar(20) DEFAULT NULL,
  `no_serial_skhus` varchar(20) DEFAULT NULL,
  `class_pick` text DEFAULT NULL,
  `extracurricular` text DEFAULT NULL,
  `uniform` text DEFAULT NULL,
  `code_registration` varchar(100) DEFAULT NULL,
  `is_paid` tinyint(1) DEFAULT 0,
  `status` varchar(50) DEFAULT 'Belum Melakukan Pembayaran',
  `active` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `registrations`
--

INSERT INTO `registrations` (`id`, `student_id`, `payment_id`, `type_registration`, `from_school`, `no_examinee`, `no_serial_diploma`, `no_serial_skhus`, `class_pick`, `extracurricular`, `uniform`, `code_registration`, `is_paid`, `status`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 'Siswa Baru', 'SMP 32 Kota Bekasi', '123021', '918232', '0981232', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga', 'OSIS|Pramuka', 'XL|M|XXL|L', '', 1, 'Sudah Terveritifikasi', 1, '2022-11-20 15:01:12', '2022-12-15 03:27:01'),
(23, 25, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'uPLnH0ZCAg', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 02:19:11', '2022-12-15 02:55:42'),
(24, 26, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'ha9UT6Z45h', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 03:17:56', '2022-12-15 03:18:28'),
(25, 27, NULL, 'Siswa Baru', 'SMP 43 Bekasi', '2', '2', '21', 'Otomasi dan Tata Kelola Perkantoran|Akutansi dan Keuangan Lembaga|Teknik Komputer dan Jaringan|', 'Paskibra|Angklung', 'S|M|L|M', 'i5l7Hvow7Z', 1, 'Belum Terveritifikasi', 1, '2022-12-15 03:31:06', '2022-12-15 03:31:46'),
(26, 28, NULL, 'Pindahan', NULL, '2', '2', '2', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Basket Ball|English Club', 'L|M|L|M', 'PbPKO643Wv', 1, 'Belum Terveritifikasi', 1, '2022-12-15 05:32:54', '2022-12-15 05:35:44');

-- --------------------------------------------------------

--
-- Struktur dari tabel `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `student_father_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_mother_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_guardian_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_achievement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `student_scholarship_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nisn` varchar(10) DEFAULT NULL,
  `nik` varchar(20) DEFAULT NULL,
  `no_certificate_registration` varchar(35) DEFAULT NULL,
  `no_kks` varchar(50) DEFAULT NULL,
  `kps` text DEFAULT NULL,
  `kip` text DEFAULT NULL,
  `address` text DEFAULT NULL,
  `residence` enum('bersama orang tua','wali','kos','asrama','panti asuhan') DEFAULT NULL,
  `residence_distance` varchar(30) DEFAULT NULL,
  `transport` enum('Jalan Kaki','Kendaraan Pribadi','Kendaraan Umum/Angkot/Pete-pete','Jemputan Sekolah','Kereta api','Ojek','Andong/Bendi/Sado/Dokar/Delma/Beca','Perahu Penyebrangan/Rakit/Getek','Lainya') DEFAULT NULL,
  `time_to_school` varchar(30) DEFAULT NULL,
  `religion` enum('Islam','kristen/protestan','Katholik','Hindu','Budha','khonghucu','lainnya') DEFAULT NULL,
  `birth` varchar(50) DEFAULT NULL,
  `height` varchar(10) DEFAULT NULL,
  `weight` varchar(10) DEFAULT NULL,
  `amount_siblings` varchar(10) DEFAULT NULL,
  `gender` enum('laki-laki','perempuan') DEFAULT NULL,
  `special_needs` varchar(50) DEFAULT NULL,
  `order_family` varchar(3) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_father_id`, `student_mother_id`, `student_guardian_id`, `student_achievement_id`, `student_scholarship_id`, `nisn`, `nik`, `no_certificate_registration`, `no_kks`, `kps`, `kip`, `address`, `residence`, `residence_distance`, `transport`, `time_to_school`, `religion`, `birth`, `height`, `weight`, `amount_siblings`, `gender`, `special_needs`, `order_family`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 2, '012039123', '317218302', '1208301823', '1203123', 'ya|120390123', 'ya|sumbangan|92138213', 'Bekasi|Tambun Utara|Karang Satria|Perumahan Taman Alamanda|02|022|17023', 'bersama orang tua', '2km', 'Kendaraan Pribadi', '1jam|10menit', 'Islam', '2022-11-27|Jakarta', '170', '53.5', '3', 'laki-laki', 'Tidak Ada', '1', '1', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(25, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 02:19:11', '2022-12-15 02:19:11'),
(26, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 03:17:56', '2022-12-15 03:17:56'),
(27, 29, 10, 10, 10, 4, 5, '123', '2', '2', '2', 'Iya|2', 'Iya|2|2|2', '2|2|2|2|2|22|2|2|2', 'bersama orang tua', 'Kurang dari 1 KM', 'Jemputan Sekolah', '2|2', 'Islam', '2022-12-01|2', '2', '2', '2', 'laki-laki', 'Down Sindrome', '2', '1', '2022-12-15 03:31:06', '2022-12-15 03:31:06'),
(28, 30, 12, 12, 12, 5, 7, '2', '2', '2', '2', 'Iya|2', 'Iya|2|2|2', '2|2|2|2|2|2|2|2|2', 'bersama orang tua', 'Kurang dari 1 KM', 'Kendaraan Pribadi', '2|2', 'kristen/protestan', '2022-12-21|2', '2', '2', '2', 'laki-laki', 'Narkoba', '2', '1', '2022-12-15 05:32:54', '2022-12-15 05:32:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_achievements`
--

CREATE TABLE `student_achievements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `achievement_name` varchar(50) DEFAULT NULL,
  `type` enum('Sains','Seni','Olahraga','Lain-lain') DEFAULT NULL,
  `level` enum('Sekolah','Kabupaten','Nasional','Internasional','Kecamatan','Provinsi') DEFAULT NULL,
  `year` varchar(4) DEFAULT NULL,
  `organizer_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `student_achievements`
--

INSERT INTO `student_achievements` (`id`, `user_id`, `achievement_name`, `type`, `level`, `year`, `organizer_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Anak Paling Pintar', 'Sains', 'Internasional', '2022', 'PT Agung Kejaksaan', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(2, 1, 'Jago Coding', 'Sains', 'Internasional', '2022', 'PT Hamba Allah', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(4, 29, '2', 'Seni', 'Kabupaten', '2009', '2', '2022-12-15 05:01:09', '2022-12-15 05:01:09'),
(5, 30, '2', 'Sains', 'Nasional', '2015', '2', '2022-12-15 05:41:09', '2022-12-15 05:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_fathers`
--

CREATE TABLE `student_fathers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `birth` varchar(50) NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') NOT NULL,
  `job` varchar(50) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `special_needs` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `student_fathers`
--

INSERT INTO `student_fathers` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Syafarul', '31920123012', '1985-03-22', 'S3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(10, 29, '2', '2', '2|2022-12-19', 'Putus SD', 'Wiraswata', 'Rp. 1,000,000 - Rp. 1,999,999', 'Narkoba', '2022-12-15 05:01:09', '2022-12-15 05:01:09'),
(12, 30, '2', '2', '2|2022-12-17', 'D4/S1', 'Wiraswata', 'Rp. 2,000,000 - Rp. 4,999,999', 'Kesulitan Belajar', '2022-12-15 05:41:09', '2022-12-15 05:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_guardians`
--

CREATE TABLE `student_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `birth` varchar(50) NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') NOT NULL,
  `job` varchar(50) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `special_needs` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `student_guardians`
--

INSERT INTO `student_guardians` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sefriani', '31920123012', '1985-03-22', 'D3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(10, 29, '2', '2', '2|2022-12-31', 'SD Sederajat', 'Wiraswata', 'Rp. 1,000,000 - Rp. 1,999,999', 'Cerdas Istimewa', '2022-12-15 05:01:09', '2022-12-15 05:01:09'),
(12, 30, '2', '2', '2|2022-12-22', 'D1', 'Wirausaha', 'Rp. 2,000,000 - Rp. 4,999,999', 'Kesulitan Belajar', '2022-12-15 05:41:09', '2022-12-15 05:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_mothers`
--

CREATE TABLE `student_mothers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(30) NOT NULL,
  `birth` varchar(50) NOT NULL,
  `education` enum('Tidak Sekolah','Putus SD','SD Sederajat','SMP Sederajat','SMA Sederajat','D1','D2','D3','D4/S1','S2','S3') NOT NULL,
  `job` varchar(50) NOT NULL,
  `salary` varchar(50) NOT NULL,
  `special_needs` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `student_mothers`
--

INSERT INTO `student_mothers` (`id`, `user_id`, `name`, `nik`, `birth`, `education`, `job`, `salary`, `special_needs`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sefriani', '31920123012', '1985-03-22', 'D3', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(10, 29, '2', '2', '2|2022-12-09', 'SD Sederajat', 'Buruh', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 05:01:09', '2022-12-15 05:01:09'),
(12, 30, '2', '2', '2|2022-12-17', 'D4/S1', 'Pensiunan', 'Rp. 1,000,000 - Rp. 1,999,999', 'Hiper Aktif', '2022-12-15 05:41:09', '2022-12-15 05:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_priodics`
--

CREATE TABLE `student_priodics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `height` varchar(10) NOT NULL,
  `weight` varchar(10) NOT NULL,
  `residence_distance` varchar(30) NOT NULL,
  `time_to_school` varchar(30) NOT NULL,
  `amount_siblings` varchar(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_scholarships`
--

CREATE TABLE `student_scholarships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('Anak Berprestasi','Anak Miskin','Pendidikan','Unggulan','Lain-lain') DEFAULT NULL,
  `descriptions` text DEFAULT NULL,
  `year_start_at` varchar(4) DEFAULT NULL,
  `year_finish_at` varchar(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `student_scholarships`
--

INSERT INTO `student_scholarships` (`id`, `user_id`, `type`, `descriptions`, `year_start_at`, `year_finish_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Pendidikan', 'Anaknya Pinter Banget aminn', '2019', '2050', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(2, 1, 'Unggulan', 'paling the best deh pooknya ma', '2019', '2050', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(5, 29, NULL, NULL, NULL, NULL, '2022-12-15 05:01:09', '2022-12-15 05:01:09'),
(6, 30, 'Anak Miskin', '2', '2013', '2013', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(7, 30, 'Pendidikan', '2', '2015', '2015', '2022-12-15 05:41:09', '2022-12-15 05:41:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `user_type_id`, `fullname`, `phone`, `email`, `email_verified_at`, `password`, `photo`, `active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Muhammad Raihan Nasywaan', '08102380812', 'muhraihannasy@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', 'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80', 1, NULL, NULL),
(2, 2, 'Muhammad Joko', '081203802', 'joko@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', NULL, 1, '2022-11-20 15:40:53', '2022-11-20 15:40:53'),
(3, 1, 'Ridwan Masmil', '0801823', 'ridwanmil@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', 'https://images.unsplash.com/photo-1670272499188-79fe22656f64?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60', 1, NULL, NULL),
(27, 1, 'mustaqim', '088086', 'qim@gmail.com', NULL, '$2y$10$JW.fI0wy6KzazU0cxgqnL.6c2u8h3S15zNvZGb/q8NoLX.lNawcXW', NULL, 1, '2022-12-15 02:19:11', '2022-12-15 02:19:11'),
(28, 1, 'human', '081203', 'muh@gmail.com', NULL, '$2y$10$vVrQAlPDUh08g9WKBbrgROIX/xqkcVCbM5hzuVOYkMz4C0ODJoM4O', NULL, 1, '2022-12-15 03:17:56', '2022-12-15 03:17:56'),
(29, 1, 'chocopie', '08102813', 'han@gmail.com', NULL, '$2y$10$cBdN9REuRvtTDOhfI1pw0e53hUcvBKhBGIPfQ4cc23GZlU6X5VB6W', NULL, 1, '2022-12-15 03:31:06', '2022-12-15 03:31:06'),
(30, 1, 'Muhammad Joko Tengkir', '0810283', 'jokoteng@gmail.com', NULL, '$2y$10$uhXanbw24EsZ92kZ/LA0UO9hBGwL6r/AjLvcbpvlyNuaVBveSwD8i', NULL, 1, '2022-12-15 05:32:54', '2022-12-15 05:32:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_types`
--

CREATE TABLE `user_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `user_types`
--

INSERT INTO `user_types` (`id`, `type`, `created_at`, `updated_at`) VALUES
(1, 'student', NULL, NULL),
(2, 'admin', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_achievements`
--
ALTER TABLE `student_achievements`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_fathers`
--
ALTER TABLE `student_fathers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_guardians`
--
ALTER TABLE `student_guardians`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_mothers`
--
ALTER TABLE `student_mothers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_priodics`
--
ALTER TABLE `student_priodics`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `student_scholarships`
--
ALTER TABLE `student_scholarships`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indeks untuk tabel `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `registrations`
--
ALTER TABLE `registrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `student_achievements`
--
ALTER TABLE `student_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `student_fathers`
--
ALTER TABLE `student_fathers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `student_mothers`
--
ALTER TABLE `student_mothers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `student_priodics`
--
ALTER TABLE `student_priodics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `student_scholarships`
--
ALTER TABLE `student_scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
