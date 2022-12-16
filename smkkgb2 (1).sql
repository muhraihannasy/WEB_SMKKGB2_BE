-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 16 Des 2022 pada 11.28
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
  `no_examinee` varchar(50) DEFAULT NULL,
  `no_serial_diploma` varchar(50) DEFAULT NULL,
  `no_serial_skhus` varchar(50) DEFAULT NULL,
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
(26, 28, NULL, 'Pindahan', NULL, '2', '2', '2', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Basket Ball|English Club', 'L|M|L|M', 'PbPKO643Wv', 1, 'Belum Terveritifikasi', 1, '2022-12-15 05:32:54', '2022-12-15 05:35:44'),
(31, 33, NULL, 'Siswa Baru', NULL, '5', '7', 'Y', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Rohis|Rohis', 'L|L|L|M', 'FHRLmeBk0N', 1, 'Belum Terveritifikasi', 1, '2022-12-15 06:44:47', '2022-12-15 06:57:50'),
(32, 34, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Teknik Komputer dan Jaringan|Teknik Komputer dan Jaringan|', NULL, NULL, 'iQMvpOvXI3', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 06:45:39', '2022-12-15 07:00:21'),
(33, 35, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|||', NULL, NULL, 'ZZgsgrkIsc', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 07:19:32', '2022-12-15 07:20:46'),
(34, 36, NULL, 'Siswa Baru', NULL, '2', 'T', 'T', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Rohis|Taekwondo', 'S|S|XL|XXL', '2q4cfXtP1z', 1, 'Sudah Terveritifikasi', 1, '2022-12-15 07:19:59', '2022-12-15 07:30:31'),
(35, 37, NULL, 'Siswa Baru', NULL, '3343332', '23423432', '24324234', 'Teknik Komputer dan Jaringan|Teknik Komputer dan Jaringan|Teknik Komputer dan Jaringan|', 'OSIS|PMR', 'L|M|S|XXL', 'UPcWuvEQ3P', 1, 'Belum Terveritifikasi', 1, '2022-12-15 07:35:55', '2022-12-15 07:37:14'),
(36, 38, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'J7Of39kKzA', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 07:48:56', '2022-12-15 07:49:55'),
(37, 39, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, '4LDcpMrCgV', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 08:38:40', '2022-12-15 08:40:56'),
(38, 40, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'AnSyoaojOT', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 09:01:28', '2022-12-15 13:24:03'),
(39, 41, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'ZomavaqnL9', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 14:09:00', '2022-12-15 14:10:47'),
(40, 42, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'ftqBPb327R', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 14:12:44', '2022-12-15 14:13:31'),
(41, 43, NULL, 'Pindahan', NULL, '2', '727373728', 'Jehsusjb72737', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Futsal|Rohis', 'XXL|L|XXL|XXL', 'n1JcFyTwxD', 1, 'Belum Terveritifikasi', 1, '2022-12-15 14:14:15', '2022-12-15 14:15:12'),
(42, 44, NULL, NULL, 'Smp joko hambon', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'fDljMaxieX', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 14:24:42', '2022-12-15 14:33:48'),
(43, 45, NULL, 'Siswa Baru', 'SMP Sejahtera ', '1253468', '0893hp309b9333', '0793773837366388', 'Teknik Komputer dan Jaringan|Otomasi dan Tata Kelola Perkantoran|Akutansi dan Keuangan Lembaga|', 'Pramuka|Seni Tari', 'XL|XL|XL|XL', 'GFim8gLvug', 1, 'Belum Terveritifikasi', 1, '2022-12-15 14:43:04', '2022-12-15 14:51:26'),
(44, 46, NULL, NULL, 'Smpn1', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'DKtJ6FFbAv', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-15 14:43:14', '2022-12-15 14:43:14'),
(45, 47, NULL, NULL, 'Smp', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, '6UHsj2dSco', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-15 14:47:04', '2022-12-15 14:47:04'),
(46, 48, NULL, 'Siswa Baru', 'Smk apa ajah', '6488555', 'ahbshssbhshe', 'hshshsheheb', 'Otomasi dan Tata Kelola Perkantoran|Akutansi dan Keuangan Lembaga|Teknik Komputer dan Jaringan|', 'Rohis|Rohis', 'L|XL|XXL|XXL', 'UsWvJmoR2W', 1, 'Belum Terveritifikasi', 1, '2022-12-15 14:52:41', '2022-12-15 14:55:46'),
(47, 49, NULL, NULL, 'Smpn 1 tampon utara', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga||', NULL, NULL, 'Lqh867khAv', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 14:57:51', '2022-12-15 15:00:47'),
(48, 50, NULL, 'Siswa Baru', 'Rs', '2', '3', 'Jehsusjb72737', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Futsal|Karate', 'XL|XL|XXL|XXL', 'XdwMFIhO2v', 1, 'Sudah Terveritifikasi', 1, '2022-12-15 15:21:01', '2022-12-15 15:33:48'),
(49, 51, NULL, NULL, 'coba', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'YSNEiu6YJv', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 15:39:01', '2022-12-15 17:42:08'),
(50, 52, NULL, NULL, 'Smp', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'VWr6kzpBHr', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 23:52:40', '2022-12-15 23:56:47'),
(51, 53, NULL, NULL, 'Smp', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'z55VzeWP9t', 1, 'Belum Mengisi Formulir', 1, '2022-12-15 23:57:51', '2022-12-15 23:58:26'),
(52, 54, NULL, 'Kembali Bersekolah', 'Smp', '123123', '123123123sd', '123123', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Pramuka|Marching Band', 'M|XL|XL|L', '7Rk1kZgCdG', 1, 'Sudah Terveritifikasi', 1, '2022-12-16 00:00:09', '2022-12-16 01:12:37'),
(53, 55, NULL, NULL, 'smp zokor', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, '34vYwEYurg', 1, 'Belum Mengisi Formulir', 1, '2022-12-16 01:13:36', '2022-12-16 01:14:07'),
(54, 56, NULL, NULL, 'Smp', NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'MKZorqYSy2', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 05:19:03', '2022-12-16 05:19:03'),
(55, 57, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, '2OYXQ5iggL', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 09:22:48', '2022-12-16 09:22:48'),
(56, 58, NULL, NULL, NULL, NULL, NULL, NULL, 'Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|Teknik Komputer dan Jaringan|', NULL, NULL, 'UPRmE7f45D', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 09:25:12', '2022-12-16 09:25:12'),
(57, 59, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'g5P1wP8jmj', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 09:53:06', '2022-12-16 09:53:06'),
(58, 60, NULL, NULL, NULL, NULL, NULL, NULL, 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'BDtRtHzrIT', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 09:53:35', '2022-12-16 09:53:35'),
(59, 61, NULL, NULL, NULL, NULL, NULL, NULL, 'Otomasi dan Tata Kelola Perkantoran|Otomasi dan Tata Kelola Perkantoran|Akutansi dan Keuangan Lembaga|', NULL, NULL, 'rSXloGUoE9', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 10:03:25', '2022-12-16 10:03:25'),
(60, 62, NULL, NULL, NULL, NULL, NULL, NULL, 'Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|Akutansi dan Keuangan Lembaga|', NULL, NULL, 'VfogEfm9yz', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 10:04:03', '2022-12-16 10:04:03'),
(61, 63, NULL, NULL, NULL, NULL, NULL, NULL, 'Akutansi dan Keuangan Lembaga|Teknik Komputer dan Jaringan|Otomasi dan Tata Kelola Perkantoran|', NULL, NULL, 'pi8cXO9YgH', 0, 'Belum Melakukan Pembayaran', 1, '2022-12-16 10:05:23', '2022-12-16 10:05:23'),
(62, 64, NULL, 'Pindahan', NULL, '12', '12', '12', 'Teknik Komputer dan Jaringan|Akutansi dan Keuangan Lembaga|Otomasi dan Tata Kelola Perkantoran|', 'Futsal|Marching Band', 'L|M|L|L', 'mlz2Hu9H01', 1, 'Belum Terveritifikasi', 1, '2022-12-16 10:07:07', '2022-12-16 10:08:42');

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
  `nisn` varchar(50) DEFAULT NULL,
  `nisn_image` varchar(255) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `nik_image` varchar(255) DEFAULT NULL,
  `kartu_keluarga_image` varchar(255) NOT NULL,
  `no_certificate_registration` varchar(50) DEFAULT NULL,
  `kks` text DEFAULT NULL,
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
  `order_family` varchar(10) DEFAULT NULL,
  `status` varchar(100) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `students`
--

INSERT INTO `students` (`id`, `user_id`, `student_father_id`, `student_mother_id`, `student_guardian_id`, `student_achievement_id`, `student_scholarship_id`, `nisn`, `nisn_image`, `nik`, `nik_image`, `kartu_keluarga_image`, `no_certificate_registration`, `kks`, `kps`, `kip`, `address`, `residence`, `residence_distance`, `transport`, `time_to_school`, `religion`, `birth`, `height`, `weight`, `amount_siblings`, `gender`, `special_needs`, `order_family`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 2, 2, '012039123', NULL, '317218302', NULL, '', '1208301823', '1203123', 'ya|120390123', 'ya|sumbangan|92138213', 'Bekasi|Tambun Utara|Karang Satria|Perumahan Taman Alamanda|02|022|17023', 'bersama orang tua', '2km', 'Kendaraan Pribadi', '1jam|10menit', 'Islam', '2022-11-27|Jakarta', '170', '53.5', '3', 'laki-laki', 'Tidak Ada', '1', '1', '2022-11-20 15:01:12', '2022-11-20 15:01:12'),
(25, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 02:19:11', '2022-12-15 02:19:11'),
(26, 28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 03:17:56', '2022-12-15 03:17:56'),
(27, 29, 10, 10, 10, 4, 5, '123', NULL, '2', NULL, '', '2', '2', 'Iya|2', 'Iya|2|2|2', '2|2|2|2|2|22|2|2|2', 'bersama orang tua', 'Kurang dari 1 KM', 'Jemputan Sekolah', '2|2', 'Islam', '2022-12-01|2', '2', '2', '2', 'laki-laki', 'Down Sindrome', '2', '1', '2022-12-15 03:31:06', '2022-12-15 03:31:06'),
(28, 30, 12, 12, 12, 5, 7, '2', NULL, '2', NULL, '', '2', '2', 'Iya|2', 'Iya|2|2|2', '2|2|2|2|2|2|2|2|2', 'bersama orang tua', 'Kurang dari 1 KM', 'Kendaraan Pribadi', '2|2', 'kristen/protestan', '2022-12-21|2', '2', '2', '2', 'laki-laki', 'Narkoba', '2', '1', '2022-12-15 05:32:54', '2022-12-15 05:32:54'),
(33, 35, 45, 45, 45, 38, 10, '2', NULL, '2', NULL, '', '2', '2', 'Iya|2', 'Iya|2|2|Y', '2|2|2|2|2|W|1|2|2', 'kos', 'Kurang dari 1 KM', 'Ojek', '5|5', 'Islam', '2022-12-16|2', '2', '2', '2', 'laki-laki', 'Laras', '2', '1', '2022-12-15 06:44:47', '2022-12-15 06:44:47'),
(34, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 06:45:39', '2022-12-15 06:45:39'),
(35, 37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 07:19:32', '2022-12-15 07:19:32'),
(36, 38, 47, 47, 47, 40, 12, '2', NULL, '2', NULL, '', '2', '2', 'Iya|2', 'Iya|2|2|T', '2|2|2|2|2|W|2|2|2', 'kos', 'Kurang dari 1 KM', 'Jemputan Sekolah', '2|2', 'Katholik', '2022-12-08|Y', '2', '2', '2', 'laki-laki', 'Laras', '2', '1', '2022-12-15 07:19:59', '2022-12-15 07:19:59'),
(37, 39, 50, 50, 50, 43, 15, '23920000', NULL, '7472478283', NULL, '', '90394039991', '-133', 'Tidak|34342432', 'Iya|32432423|23432432|orang-orangan', 'vgh5|15|24|satria|huirawa|tamban|11222|122 barat 123 timur|233432 barat', 'panti asuhan', 'Lebih dari 1 KM', 'Jalan Kaki', '12|24', 'Islam', '2322-12-02|garut', '182', '42', '71', 'laki-laki', 'Rungu', '1', '1', '2022-12-15 07:35:55', '2022-12-15 07:35:55'),
(38, 40, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 07:48:56', '2022-12-15 07:48:56'),
(39, 41, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 08:38:40', '2022-12-15 08:38:40'),
(40, 42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 09:01:28', '2022-12-15 09:01:28'),
(41, 43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:09:00', '2022-12-15 14:09:00'),
(42, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:12:44', '2022-12-15 14:12:44'),
(43, 45, 51, 51, 51, 44, 16, '82736298264', NULL, '615188464840', NULL, '', '72726367282', '-', '-|-', '-|-|-|-', '2|2|2|2|2|W|0812|Gagauehehe+372|Hshsgaha', 'kos', 'Kurang dari 1 KM', 'Jemputan Sekolah', '2|5', 'Islam', '2022-12-15|Jakarta', '10', '10', '2', 'laki-laki', 'Tidak Ada', '2', '1', '2022-12-15 14:14:15', '2022-12-15 14:14:15'),
(44, 46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:24:42', '2022-12-15 14:24:42'),
(45, 47, 73, 73, 73, 47, 38, '0899989765676809', NULL, '0885586654444666', NULL, '', '08966788657887', '0878948846840', 'Iya|0625655899966668', 'Iya|Daus|855468089000095888|Ya gitu', 'Kp cerewed |02|07|Bekasi |Duren jaya|Bekasi timur |17111|Utara |Timur ', 'bersama orang tua', 'Kurang dari 1 KM', 'Jalan Kaki', '22|09', 'Islam', '2005-12-18|Bekasi', '172', '60', '2', 'laki-laki', 'Tidak Ada', '3', '1', '2022-12-15 14:43:04', '2022-12-15 14:43:04'),
(46, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:43:14', '2022-12-15 14:43:14'),
(47, 49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:47:04', '2022-12-15 14:47:04'),
(48, 50, 52, 53, 53, 46, 18, '72553877', NULL, '858464816', NULL, '', '12999909', '645464545', 'Iya|6484488', 'Iya|Gegege|4346434|YNTKTS', 'Jalan isekai no 00|66|66|Ndak tau|Isekai|Yeager|17885|Gatau|Gatau', 'asrama', 'Kurang dari 1 KM', 'Jemputan Sekolah', '20|00', 'Budha', '2022-12-15|Bekasi', '290', '12', '2', 'laki-laki', 'Narkoba', '3', '1', '2022-12-15 14:52:41', '2022-12-15 14:52:41'),
(49, 51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 14:57:51', '2022-12-15 14:57:51'),
(50, 52, 181, 181, 181, 120, 216, '827358172562828', NULL, '875648464818', NULL, '', '72726367282', '-', '-|-', '-|-|-|-', '2|2|2|2|2|W|81515|Gagauehehe+372|Hshsgaha', 'kos', 'Kurang dari 1 KM', 'Kereta api', '2|2', 'Islam', '2022-12-15|Jakarta', '180', '85', '2', 'laki-laki', 'Dasksa Ringan', '2', '1', '2022-12-15 15:21:01', '2022-12-15 15:21:01'),
(51, 53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 15:39:01', '2022-12-15 15:39:01'),
(52, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 23:52:40', '2022-12-15 23:52:40'),
(53, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-15 23:57:51', '2022-12-15 23:57:51'),
(54, 56, 184, 184, 184, 123, 219, '239200000223232', NULL, '11231231231231232', NULL, '', '123123123123', '-', '-|-', '-|-|-|-', 'vgh5|15|24|satria|huirawa|tamban|123123|122 barat 123 timur|233432 barat', 'bersama orang tua', 'Kurang dari 1 KM', 'Kendaraan Pribadi', '12|12', 'Islam', '2022-12-07|garut', '123', '123', '12', 'perempuan', 'Hiper Aktif', '2', '1', '2022-12-16 00:00:09', '2022-12-16 00:00:09'),
(55, 57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 01:13:36', '2022-12-16 01:13:36'),
(56, 58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 05:19:03', '2022-12-16 05:19:03'),
(57, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 09:22:48', '2022-12-16 09:22:48'),
(58, 60, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 09:25:12', '2022-12-16 09:25:12'),
(59, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 09:53:06', '2022-12-16 09:53:06'),
(60, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 09:53:35', '2022-12-16 09:53:35'),
(61, 63, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 10:03:25', '2022-12-16 10:03:25'),
(62, 64, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 10:04:03', '2022-12-16 10:04:03'),
(63, 65, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2022-12-16 10:05:23', '2022-12-16 10:05:23'),
(64, 66, 187, 187, 187, 129, 225, '239200000223232', 'http://127.0.0.1:8000/images/1671185909.jpg', '12312', NULL, 'http://127.0.0.1:8000/images/1671185913.jpg', '312312', '-|http://127.0.0.1:8000/images/1671185931.jpg', '-|-|http://127.0.0.1:8000/images/1671185925.jpg', '-|-|-|-|http://127.0.0.1:8000/images/1671185919.jpg', '123|123|123|123|123|123|123|123|1213', 'bersama orang tua', 'Kurang dari 1 KM', 'Jemputan Sekolah', '12|12', 'Islam', '2022-12-07|garut', '123123', '123123', '123', 'perempuan', 'Hiper Aktif', '123', '1', '2022-12-16 10:07:07', '2022-12-16 10:07:07');

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
(5, 30, '2', 'Sains', 'Nasional', '2015', '2', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(40, 38, 'G', 'Sains', 'Provinsi', '2004', 'Y', '2022-12-15 07:29:47', '2022-12-15 07:29:47'),
(41, 39, NULL, NULL, NULL, NULL, NULL, '2022-12-15 07:44:31', '2022-12-15 07:44:31'),
(42, 39, NULL, NULL, NULL, NULL, NULL, '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(43, 39, NULL, NULL, NULL, NULL, NULL, '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(44, 45, NULL, NULL, NULL, NULL, NULL, '2022-12-15 14:18:15', '2022-12-15 14:18:15'),
(45, 50, 'sjsbheb', 'Sains', 'Kecamatan', '2006', 'hshshsb', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(46, 50, 'sjsbheb', 'Sains', 'Kecamatan', '2006', 'hshshsb', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(47, 47, 'Unggul ', 'Sains', 'Kabupaten', '2019', 'Walkot', '2022-12-15 15:13:26', '2022-12-15 15:13:26'),
(48, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:24', '2022-12-15 15:16:24'),
(49, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:26', '2022-12-15 15:16:26'),
(50, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(51, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(52, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(53, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(54, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(55, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(56, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(57, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(58, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:16:59', '2022-12-15 15:16:59'),
(59, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(60, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(61, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(62, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(63, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(64, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(65, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(66, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(67, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(68, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(69, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(70, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:22', '2022-12-15 15:17:22'),
(71, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:26', '2022-12-15 15:17:26'),
(72, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(73, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(74, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(75, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(76, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(77, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(78, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(79, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(80, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(81, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(82, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(83, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(84, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(85, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(86, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(87, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:49', '2022-12-15 15:17:49'),
(88, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:51', '2022-12-15 15:17:51'),
(89, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:17:53', '2022-12-15 15:17:53'),
(90, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:22:41', '2022-12-15 15:22:41'),
(91, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:22:46', '2022-12-15 15:22:46'),
(92, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(93, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(94, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:10', '2022-12-15 15:30:10'),
(95, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:11', '2022-12-15 15:30:11'),
(96, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(97, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(98, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(99, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(100, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(101, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(102, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:15', '2022-12-15 15:30:15'),
(103, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:39', '2022-12-15 15:30:39'),
(104, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(105, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(106, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:47', '2022-12-15 15:30:47'),
(107, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(108, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(109, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(110, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(111, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(112, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(113, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(114, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:12', '2022-12-15 15:31:12'),
(115, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(116, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(117, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(118, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(119, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(120, 52, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:37', '2022-12-15 15:31:37'),
(121, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:46', '2022-12-15 15:31:46'),
(122, 51, NULL, NULL, NULL, NULL, NULL, '2022-12-15 15:31:48', '2022-12-15 15:31:48'),
(123, 56, NULL, NULL, NULL, NULL, NULL, '2022-12-16 01:12:15', '2022-12-16 01:12:15'),
(124, 66, '123', 'Olahraga', 'Nasional', '2013', '123123', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(125, 66, '123123', 'Olahraga', 'Internasional', '2013', '123123', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(126, 66, '123', 'Olahraga', 'Nasional', '2013', '123123', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(127, 66, '123123', 'Olahraga', 'Internasional', '2013', '123123', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(128, 66, '123', 'Olahraga', 'Nasional', '2013', '123123', '2022-12-16 10:24:05', '2022-12-16 10:24:05'),
(129, 66, '123123', 'Olahraga', 'Internasional', '2013', '123123', '2022-12-16 10:24:05', '2022-12-16 10:24:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_fathers`
--

CREATE TABLE `student_fathers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
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
(12, 30, '2', '2', '2|2022-12-17', 'D4/S1', 'Wiraswata', 'Rp. 2,000,000 - Rp. 4,999,999', 'Kesulitan Belajar', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(35, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:53', '2022-12-15 07:04:53'),
(36, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:53', '2022-12-15 07:04:53'),
(37, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:53', '2022-12-15 07:04:53'),
(38, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:54', '2022-12-15 07:04:54'),
(39, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:54', '2022-12-15 07:04:54'),
(40, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:54', '2022-12-15 07:04:54'),
(41, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:54', '2022-12-15 07:04:54'),
(42, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:04:54', '2022-12-15 07:04:54'),
(43, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:05:13', '2022-12-15 07:05:13'),
(44, 36, 'Hwhwhqh', '31666464', 'Hw gw h|2022-12-15', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Wicara', '2022-12-15 07:06:14', '2022-12-15 07:06:14'),
(45, 35, 'T', '2', 'Y|2022-12-23', 'SMA Sederajat', 'Pedagang Kecil', 'Rp. 2,000,000 - Rp. 4,999,999', 'Daksa Sedang', '2022-12-15 07:06:30', '2022-12-15 07:06:30'),
(46, 36, 'Sjjs', '51515', 'Hw gw h|2022-12-15', 'SD Sederajat', 'PNS/TNI/Porli', 'Rp. 1,000,000 - Rp. 1,999,999', 'Dasksa Ringan', '2022-12-15 07:13:31', '2022-12-15 07:13:31'),
(47, 38, 'T', '2', 'Y|2022-12-01', 'SMA Sederajat', 'PNS/TNI/Porli', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-15 07:29:47', '2022-12-15 07:29:47'),
(48, 39, 'yayat anwar', '343434038830', 'garut|31212-03-31', 'Putus SD', 'Nelayan', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-15 07:44:31', '2022-12-15 07:44:31'),
(49, 39, 'yayat anwar', '343434038830', 'garut|31212-03-31', 'Putus SD', 'Nelayan', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(50, 39, 'yayat anwar', '343434038830', 'garut|31212-03-31', 'Putus SD', 'Nelayan', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(51, 45, 'T', '2', 'Y|2022-12-15', 'SD Sederajat', 'Pedagang Kecil', 'Rp. 5,000,000 - Rp. 20,000,000', 'Daksa Sedang', '2022-12-15 14:18:15', '2022-12-15 14:18:15'),
(52, 50, 'Handa', '55846448', 'Isekai|2022-12-15', 'S3', 'PNS/TNI/Porli', 'Rp. 5,000,000 - Rp. 20,000,000', 'Narkoba', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(53, 50, 'Handa', '55846448', 'Isekai|2022-12-15', 'S3', 'PNS/TNI/Porli', 'Rp. 5,000,000 - Rp. 20,000,000', 'Narkoba', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(54, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:24', '2022-12-15 15:11:24'),
(55, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:26', '2022-12-15 15:11:26'),
(56, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:31', '2022-12-15 15:11:31'),
(57, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(58, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(59, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(60, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(61, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(62, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(63, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(64, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(65, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(66, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(67, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(68, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(69, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(70, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(71, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(72, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(73, 47, 'Auadah', '08545464854848946', 'Bekasi |1965-08-12', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:13:26', '2022-12-15 15:13:26'),
(74, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:24', '2022-12-15 15:16:24'),
(75, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:26', '2022-12-15 15:16:26'),
(76, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(77, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(78, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(79, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(80, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(81, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(82, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(83, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(84, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:59', '2022-12-15 15:16:59'),
(85, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(86, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(87, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(88, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(89, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(90, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(91, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(92, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(93, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(94, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(95, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(96, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:22', '2022-12-15 15:17:22'),
(97, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:26', '2022-12-15 15:17:26'),
(98, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(99, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(100, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(101, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(102, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(103, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(104, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(105, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(106, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(107, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(108, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(109, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(110, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(111, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(112, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(113, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:49', '2022-12-15 15:17:49'),
(114, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:51', '2022-12-15 15:17:51'),
(115, 51, 'Bapak', '34643464', 'Bekasi|2022-12-15', 'S3', 'Pensiunan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:53', '2022-12-15 15:17:53'),
(116, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:22:41', '2022-12-15 15:22:41'),
(117, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:22:46', '2022-12-15 15:22:46'),
(118, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(119, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(120, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(121, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(122, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(123, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(124, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:23:43', '2022-12-15 15:23:43'),
(125, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(126, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(127, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(128, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(129, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(130, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(131, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(132, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(133, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(134, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(135, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(136, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(137, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(138, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(139, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(140, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(141, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(142, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(143, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(144, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(145, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(146, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(147, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(148, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(149, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(150, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(151, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(152, 51, 'Fulan', '054634546348466', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak Ada', '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(153, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(154, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(155, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:10', '2022-12-15 15:30:10'),
(156, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:11', '2022-12-15 15:30:11'),
(157, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(158, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(159, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(160, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(161, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(162, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(163, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:15', '2022-12-15 15:30:15'),
(164, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:39', '2022-12-15 15:30:39'),
(165, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(166, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(167, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:47', '2022-12-15 15:30:47'),
(168, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(169, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(170, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(171, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(172, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(173, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(174, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(175, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:12', '2022-12-15 15:31:12'),
(176, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(177, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(178, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(179, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(180, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(181, 52, 'T', '224584', 'Y|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Grahita Sedang', '2022-12-15 15:31:37', '2022-12-15 15:31:37'),
(182, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:46', '2022-12-15 15:31:46'),
(183, 51, 'Fulan', '5434846466', 'Bkwjjw|2022-12-15', 'S3', 'Wiraswata', 'Tidak Berpenghasilan', 'Tidak Ada', '2022-12-15 15:31:48', '2022-12-15 15:31:48'),
(184, 56, 'yayat anwar', '2312323', 'garut|2022-12-24', 'D1', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Narkoba', '2022-12-16 01:12:15', '2022-12-16 01:12:15'),
(185, 66, '123', '123', '123|2022-12-16', 'SD Sederajat', 'Petani', 'Rp. 2,000,000 - Rp. 4,999,999', 'Cerdas Istimewa', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(186, 66, '123', '123', '123|2022-12-16', 'SD Sederajat', 'Petani', 'Rp. 2,000,000 - Rp. 4,999,999', 'Cerdas Istimewa', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(187, 66, '123', '123', '123|2022-12-16', 'SD Sederajat', 'Petani', 'Rp. 2,000,000 - Rp. 4,999,999', 'Cerdas Istimewa', '2022-12-16 10:24:05', '2022-12-16 10:24:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_guardians`
--

CREATE TABLE `student_guardians` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
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
(12, 30, '2', '2', '2|2022-12-22', 'D1', 'Wirausaha', 'Rp. 2,000,000 - Rp. 4,999,999', 'Kesulitan Belajar', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(47, 38, 'Y', '2', 'H|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Daksa Sedang', '2022-12-15 07:29:47', '2022-12-15 07:29:47'),
(48, 39, 'ir.reyhan naswan', '34543523', 'konoha|2232-03-23', 'S3', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Grahita Ringan', '2022-12-15 07:44:31', '2022-12-15 07:44:31'),
(49, 39, 'ir.reyhan naswan', '34543523', 'konoha|2232-03-23', 'S3', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Grahita Ringan', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(50, 39, 'ir.reyhan naswan', '34543523', 'konoha|2232-03-23', 'S3', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Grahita Ringan', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(51, 45, 'Y', '9', 'Bekasi|2022-12-23', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-15 14:18:15', '2022-12-15 14:18:15'),
(52, 50, 'Anjime', '569565', 'shsbbs|2022-12-15', 'SMA Sederajat', 'PNS/TNI/Porli', 'Rp. 5,000,000 - Rp. 20,000,000', 'Daksa Sedang', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(53, 50, 'Anjime', '569565', 'shsbbs|2022-12-15', 'SMA Sederajat', 'PNS/TNI/Porli', 'Rp. 5,000,000 - Rp. 20,000,000', 'Daksa Sedang', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(54, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:24', '2022-12-15 15:11:24'),
(55, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:26', '2022-12-15 15:11:26'),
(56, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:31', '2022-12-15 15:11:31'),
(57, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(58, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(59, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(60, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(61, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(62, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(63, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(64, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(65, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(66, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(67, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(68, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(69, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(70, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(71, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(72, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(73, 47, 'Gifgujn', '866258966388999', 'Jakarta |1959-11-26', 'D2', 'Peternak', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:13:26', '2022-12-15 15:13:26'),
(74, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:24', '2022-12-15 15:16:24'),
(75, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:26', '2022-12-15 15:16:26'),
(76, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(77, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(78, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(79, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(80, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(81, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(82, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(83, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(84, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:16:59', '2022-12-15 15:16:59'),
(85, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(86, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(87, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(88, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(89, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(90, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(91, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(92, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(93, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(94, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(95, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(96, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:22', '2022-12-15 15:17:22'),
(97, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:26', '2022-12-15 15:17:26'),
(98, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(99, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(100, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(101, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(102, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(103, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(104, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(105, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(106, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(107, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(108, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(109, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(110, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(111, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(112, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(113, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:49', '2022-12-15 15:17:49'),
(114, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:51', '2022-12-15 15:17:51'),
(115, 51, 'Uauau', '6466464', 'Bekasi|2022-12-15', 'D2', 'Karyawan Swasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak Ada', '2022-12-15 15:17:53', '2022-12-15 15:17:53'),
(116, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:22:41', '2022-12-15 15:22:41'),
(117, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:22:46', '2022-12-15 15:22:46'),
(118, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(119, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(120, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(121, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(122, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(123, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(124, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:43', '2022-12-15 15:23:43'),
(125, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(126, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(127, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(128, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(129, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(130, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(131, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(132, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(133, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(134, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(135, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(136, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(137, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(138, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(139, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(140, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(141, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(142, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(143, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(144, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(145, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(146, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(147, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(148, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(149, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(150, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(151, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(152, 51, 'Orang', '64846484664646', 'Bekasi|2022-12-15', 'SD Sederajat', 'Peternak', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(153, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(154, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(155, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:10', '2022-12-15 15:30:10'),
(156, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:11', '2022-12-15 15:30:11'),
(157, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(158, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(159, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(160, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(161, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(162, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(163, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:15', '2022-12-15 15:30:15'),
(164, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:39', '2022-12-15 15:30:39'),
(165, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(166, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(167, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:47', '2022-12-15 15:30:47'),
(168, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(169, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(170, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(171, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(172, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(173, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(174, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(175, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:12', '2022-12-15 15:31:12'),
(176, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(177, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(178, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(179, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(180, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(181, 52, 'Y', '221', 'Bekasi|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Daksa Sedang', '2022-12-15 15:31:37', '2022-12-15 15:31:37'),
(182, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:46', '2022-12-15 15:31:46'),
(183, 51, 'Kepo', '6464646', 'Hwuwu|2022-12-15', 'D1', 'Karyawan Swasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Kesulitan Belajar', '2022-12-15 15:31:48', '2022-12-15 15:31:48'),
(184, 56, 'ir.reyhan naswan', '123123', 'konoha|2022-12-20', 'D4/S1', 'Wiraswata', 'Rp. 1,000,000 - Rp. 1,999,999', 'Hiper Aktif', '2022-12-16 01:12:15', '2022-12-16 01:12:15'),
(185, 66, '123', '123', '123|2022-12-04', 'SD Sederajat', 'Petani', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(186, 66, '123', '123', '123|2022-12-04', 'SD Sederajat', 'Petani', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(187, 66, '123', '123', '123|2022-12-04', 'SD Sederajat', 'Petani', 'Rp. 1,000,000 - Rp. 1,999,999', 'Laras', '2022-12-16 10:24:05', '2022-12-16 10:24:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `student_mothers`
--

CREATE TABLE `student_mothers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `nik` varchar(50) NOT NULL,
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
(12, 30, '2', '2', '2|2022-12-17', 'D4/S1', 'Pensiunan', 'Rp. 1,000,000 - Rp. 1,999,999', 'Hiper Aktif', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(47, 38, 'T', '2', 'Y|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 500,000 - Rp. 999,999', 'Tuna Ganda', '2022-12-15 07:29:47', '2022-12-15 07:29:47'),
(48, 39, 'witri ', '33432423', 'huiid|32324-04-23', 'Tidak Sekolah', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Rungu', '2022-12-15 07:44:31', '2022-12-15 07:44:31'),
(49, 39, 'witri ', '33432423', 'huiid|32324-04-23', 'Tidak Sekolah', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Rungu', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(50, 39, 'witri ', '33432423', 'huiid|32324-04-23', 'Tidak Sekolah', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Rungu', '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(51, 45, 'T', '546646184', 'Jakarta|2022-12-09', 'SMP Sederajat', 'Pedagang Kecil', 'Rp. 2,000,000 - Rp. 4,999,999', 'Laras', '2022-12-15 14:18:15', '2022-12-15 14:18:15'),
(52, 50, 'Nakano', '64946494', 'Isekai|2022-12-15', 'S3', 'Nelayan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Daksa Sedang', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(53, 50, 'Nakano', '64946494', 'Isekai|2022-12-15', 'S3', 'Nelayan', 'Rp. 5,000,000 - Rp. 20,000,000', 'Daksa Sedang', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(54, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:24', '2022-12-15 15:11:24'),
(55, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:26', '2022-12-15 15:11:26'),
(56, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:31', '2022-12-15 15:11:31'),
(57, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(58, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(59, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(60, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(61, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(62, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(63, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(64, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(65, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(66, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(67, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(68, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(69, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(70, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(71, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(72, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(73, 47, 'Maaaa', '048458464648464558', 'Bekasi |1978-12-10', 'SMA Sederajat', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:13:26', '2022-12-15 15:13:26'),
(74, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:24', '2022-12-15 15:16:24'),
(75, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:26', '2022-12-15 15:16:26'),
(76, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(77, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(78, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(79, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(80, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(81, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(82, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(83, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(84, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:16:59', '2022-12-15 15:16:59'),
(85, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(86, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(87, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(88, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(89, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(90, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(91, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(92, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(93, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(94, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(95, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(96, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:22', '2022-12-15 15:17:22'),
(97, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:26', '2022-12-15 15:17:26'),
(98, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(99, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(100, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(101, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(102, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(103, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(104, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(105, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(106, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(107, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(108, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(109, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(110, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(111, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(112, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(113, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:49', '2022-12-15 15:17:49'),
(114, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:51', '2022-12-15 15:17:51'),
(115, 51, 'Ibu', '34846499', 'Bekasi|2022-12-15', 'S2', 'Tidak Bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak Ada', '2022-12-15 15:17:53', '2022-12-15 15:17:53'),
(116, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:22:41', '2022-12-15 15:22:41'),
(117, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:22:46', '2022-12-15 15:22:46'),
(118, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(119, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(120, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(121, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(122, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(123, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(124, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:23:43', '2022-12-15 15:23:43'),
(125, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(126, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(127, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(128, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(129, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(130, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(131, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(132, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(133, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(134, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(135, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(136, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(137, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(138, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(139, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(140, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(141, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(142, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(143, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(144, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(145, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(146, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(147, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(148, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(149, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(150, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(151, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(152, 51, 'Ibu', '34543484645468', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Kurang dari Rp. 500,000', 'Tidak Ada', '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(153, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(154, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(155, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:10', '2022-12-15 15:30:10'),
(156, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:11', '2022-12-15 15:30:11'),
(157, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(158, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(159, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(160, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(161, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(162, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(163, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:15', '2022-12-15 15:30:15'),
(164, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:39', '2022-12-15 15:30:39'),
(165, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(166, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(167, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:47', '2022-12-15 15:30:47'),
(168, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(169, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(170, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(171, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(172, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(173, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(174, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(175, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:12', '2022-12-15 15:31:12'),
(176, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(177, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(178, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(179, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(180, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(181, 52, 'Ye', '884548', 'Jakarta|2022-12-15', 'SMA Sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Daksa Sedang', '2022-12-15 15:31:37', '2022-12-15 15:31:37'),
(182, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:46', '2022-12-15 15:31:46'),
(183, 51, 'Hquququ', '6434846466', 'Bekasi|2022-12-15', 'D4/S1', 'Tidak Bekerja', 'Rp. 500,000 - Rp. 999,999', 'Tidak Ada', '2022-12-15 15:31:48', '2022-12-15 15:31:48'),
(184, 56, 'witri ', '123123', 'Bekasi|2022-12-08', 'D2', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Indigo', '2022-12-16 01:12:15', '2022-12-16 01:12:15'),
(185, 66, '123123', '123', '123123|2022-12-08', 'SD Sederajat', 'PNS/TNI/Porli', 'Rp. 500,000 - Rp. 999,999', 'Indigo', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(186, 66, '123123', '123', '123123|2022-12-08', 'SD Sederajat', 'PNS/TNI/Porli', 'Rp. 500,000 - Rp. 999,999', 'Indigo', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(187, 66, '123123', '123', '123123|2022-12-08', 'SD Sederajat', 'PNS/TNI/Porli', 'Rp. 500,000 - Rp. 999,999', 'Indigo', '2022-12-16 10:24:05', '2022-12-16 10:24:05');

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
(7, 30, 'Pendidikan', '2', '2015', '2015', '2022-12-15 05:41:09', '2022-12-15 05:41:09'),
(12, 38, 'Anak Miskin', 'Y', '2004', '2004', '2022-12-15 07:29:47', '2022-12-15 07:29:47'),
(13, 39, NULL, NULL, NULL, NULL, '2022-12-15 07:44:31', '2022-12-15 07:44:31'),
(14, 39, NULL, NULL, NULL, NULL, '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(15, 39, NULL, NULL, NULL, NULL, '2022-12-15 07:45:21', '2022-12-15 07:45:21'),
(16, 45, NULL, NULL, NULL, NULL, '2022-12-15 14:18:15', '2022-12-15 14:18:15'),
(17, 50, 'Anak Miskin', 'ushsjshs', '2004', '2004', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(18, 50, 'Anak Miskin', 'ushsjshs', '2004', '2004', '2022-12-15 15:04:58', '2022-12-15 15:04:58'),
(19, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:24', '2022-12-15 15:11:24'),
(20, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:26', '2022-12-15 15:11:26'),
(21, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:31', '2022-12-15 15:11:31'),
(22, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(23, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(24, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(25, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(26, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:32', '2022-12-15 15:11:32'),
(27, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(28, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(29, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(30, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:33', '2022-12-15 15:11:33'),
(31, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(32, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(33, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:35', '2022-12-15 15:11:35'),
(34, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(35, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(36, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(37, 47, NULL, NULL, NULL, NULL, '2022-12-15 15:11:36', '2022-12-15 15:11:36'),
(38, 47, 'Anak Miskin', 'Gatau dapet aja', '2021', '2022', '2022-12-15 15:13:26', '2022-12-15 15:13:26'),
(39, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:24', '2022-12-15 15:16:24'),
(40, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:26', '2022-12-15 15:16:26'),
(41, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(42, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(43, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(44, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(45, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:27', '2022-12-15 15:16:27'),
(46, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(47, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(48, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:28', '2022-12-15 15:16:28'),
(49, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:16:59', '2022-12-15 15:16:59'),
(50, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(51, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:14', '2022-12-15 15:17:14'),
(52, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(53, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:15', '2022-12-15 15:17:15'),
(54, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(55, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(56, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:20', '2022-12-15 15:17:20'),
(57, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(58, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(59, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(60, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:21', '2022-12-15 15:17:21'),
(61, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:22', '2022-12-15 15:17:22'),
(62, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:26', '2022-12-15 15:17:26'),
(63, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(64, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(65, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:29', '2022-12-15 15:17:29'),
(66, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(67, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(68, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(69, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(70, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(71, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:30', '2022-12-15 15:17:30'),
(72, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(73, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(74, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(75, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(76, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(77, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:31', '2022-12-15 15:17:31'),
(78, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:49', '2022-12-15 15:17:49'),
(79, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:51', '2022-12-15 15:17:51'),
(80, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:17:53', '2022-12-15 15:17:53'),
(81, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:22:41', '2022-12-15 15:22:41'),
(82, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:22:46', '2022-12-15 15:22:46'),
(83, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(84, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(85, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(86, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(87, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(88, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:36', '2022-12-15 15:23:36'),
(89, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(90, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(91, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:40', '2022-12-15 15:23:40'),
(92, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(93, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(94, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(95, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(96, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(97, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(98, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(99, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(100, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:41', '2022-12-15 15:23:41'),
(101, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:23:44', '2022-12-15 15:23:44'),
(102, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:23:44', '2022-12-15 15:23:44'),
(103, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:23:44', '2022-12-15 15:23:44'),
(104, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(105, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(106, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:02', '2022-12-15 15:24:02'),
(107, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(108, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(109, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:03', '2022-12-15 15:24:03'),
(110, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(111, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(112, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:13', '2022-12-15 15:24:13'),
(113, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(114, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(115, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(116, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(117, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(118, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(119, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(120, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(121, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(122, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(123, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(124, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:15', '2022-12-15 15:24:15'),
(125, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(126, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(127, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(128, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(129, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(130, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(131, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(132, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(133, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:16', '2022-12-15 15:24:16'),
(134, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(135, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(136, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:28', '2022-12-15 15:24:28'),
(137, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(138, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(139, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(140, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(141, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(142, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(143, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(144, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(145, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(146, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(147, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(148, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:30', '2022-12-15 15:24:30'),
(149, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(150, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(151, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:55', '2022-12-15 15:24:55'),
(152, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(153, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(154, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:24:59', '2022-12-15 15:24:59'),
(155, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(156, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(157, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:00', '2022-12-15 15:25:00'),
(158, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(159, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(160, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:03', '2022-12-15 15:25:03'),
(161, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(162, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(163, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:37', '2022-12-15 15:25:37'),
(164, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(165, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(166, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:38', '2022-12-15 15:25:38'),
(167, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(168, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(169, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(170, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(171, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(172, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(173, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(174, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(175, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:39', '2022-12-15 15:25:39'),
(176, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(177, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(178, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(179, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(180, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(181, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(182, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(183, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(184, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:25:40', '2022-12-15 15:25:40'),
(185, 51, 'Pendidikan', 'Bagus', '2005', '2004', '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(186, 51, 'Unggulan', NULL, '2006', '2006', '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(187, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:26:02', '2022-12-15 15:26:02'),
(188, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(189, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:07', '2022-12-15 15:30:07'),
(190, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:10', '2022-12-15 15:30:10'),
(191, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:11', '2022-12-15 15:30:11'),
(192, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(193, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(194, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(195, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:12', '2022-12-15 15:30:12'),
(196, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(197, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:13', '2022-12-15 15:30:13'),
(198, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:15', '2022-12-15 15:30:15'),
(199, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:39', '2022-12-15 15:30:39'),
(200, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(201, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:46', '2022-12-15 15:30:46'),
(202, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:47', '2022-12-15 15:30:47'),
(203, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(204, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(205, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(206, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:49', '2022-12-15 15:30:49'),
(207, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(208, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(209, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:30:50', '2022-12-15 15:30:50'),
(210, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:12', '2022-12-15 15:31:12'),
(211, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(212, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:14', '2022-12-15 15:31:14'),
(213, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(214, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(215, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:15', '2022-12-15 15:31:15'),
(216, 52, NULL, NULL, NULL, NULL, '2022-12-15 15:31:37', '2022-12-15 15:31:37'),
(217, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:46', '2022-12-15 15:31:46'),
(218, 51, NULL, NULL, NULL, NULL, '2022-12-15 15:31:48', '2022-12-15 15:31:48'),
(219, 56, NULL, NULL, NULL, NULL, '2022-12-16 01:12:15', '2022-12-16 01:12:15'),
(220, 66, 'Anak Berprestasi', '123123', '2000', '2013', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(221, 66, 'Pendidikan', '123123', '2013', '2012', '2022-12-16 10:19:40', '2022-12-16 10:19:40'),
(222, 66, 'Anak Berprestasi', '123123', '2000', '2013', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(223, 66, 'Pendidikan', '123123', '2013', '2012', '2022-12-16 10:20:07', '2022-12-16 10:20:07'),
(224, 66, 'Anak Berprestasi', '123123', '2000', '2013', '2022-12-16 10:24:05', '2022-12-16 10:24:05'),
(225, 66, 'Pendidikan', '123123', '2013', '2012', '2022-12-16 10:24:05', '2022-12-16 10:24:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type_id` bigint(20) UNSIGNED NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
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
(30, 1, 'Muhammad Joko Tengkir', '0810283', 'jokoteng@gmail.com', NULL, '$2y$10$uhXanbw24EsZ92kZ/LA0UO9hBGwL6r/AjLvcbpvlyNuaVBveSwD8i', NULL, 1, '2022-12-15 05:32:54', '2022-12-15 05:32:54'),
(35, 1, 'Hantu', '8484884', 'hanje@gmail.com', NULL, '$2y$10$3LIhM3V0UEd/8Yq53d1s8.Khpshtp2CoL1PnCZByzBdM5Fj466iDK', NULL, 1, '2022-12-15 06:44:47', '2022-12-15 06:44:47'),
(36, 1, '123', '123', '123@gmail.com', NULL, '$2y$10$XFCYOVlOt6sW5NeHzYcUB.aD1Z6NIMx7qgTZ3J/jDw92Med6oHTD6', NULL, 1, '2022-12-15 06:45:39', '2022-12-15 06:45:39'),
(37, 1, 'hambaaalha', '000999', 'hamba@gmail.com', NULL, '$2y$10$lYkDGlM2D0zOjRQfa2HGg.8OXfO.FTP88grqTND7vz1X1v72bqyga', NULL, 1, '2022-12-15 07:19:32', '2022-12-15 07:19:32'),
(38, 1, 'Ys', '0851551', 'mrcuy@gmail.com', NULL, '$2y$10$lYkDGlM2D0zOjRQfa2HGg.8OXfO.FTP88grqTND7vz1X1v72bqyga', NULL, 1, '2022-12-15 07:19:59', '2022-12-15 07:19:59'),
(39, 1, 'tester', '089533711002', 'test@gmail.com', NULL, '$2y$10$CPNn78wSwEhzseiq/7W9JeT47dyb.ZT.JTNKKQO5zEcRK/38QgdpK', NULL, 1, '2022-12-15 07:35:55', '2022-12-15 07:35:55'),
(40, 1, 'Febrian', '848484', 'febrian@gmail.com', NULL, '$2y$10$SKW8B/dUPpE.TvbMg3cJEeTg2Xm5GOJn0qEv5vfBxoc3Q/BKJUBTy', NULL, 1, '2022-12-15 07:48:56', '2022-12-15 07:48:56'),
(41, 1, 'Aqua', '8757846', 'aqua@gmail.com', NULL, '$2y$10$hsCT8AuGJF69ru1gCGrrAeLQXE1zUiB3iXokRlXSarBygk7Pt3Cfi', NULL, 1, '2022-12-15 08:38:40', '2022-12-15 08:38:40'),
(42, 1, 'Gesit', '6464616', 'hua@gmail.com', NULL, '$2y$10$eFVFRfBrtFeOZRlDCNQQqOwkcm8g7dgJ6LYbbN3Xne8HMeevB4r/S', NULL, 1, '2022-12-15 09:01:28', '2022-12-15 09:01:28'),
(43, 1, 'raihan ajah', '08121678', 'la@gmail.com', NULL, '$2y$10$9rH6RCgbHYeB7P3XloPumurszIAtbuEzcHeiNMrndhXPKGaCZY0HS', NULL, 1, '2022-12-15 14:09:00', '2022-12-15 14:09:00'),
(44, 1, 'Jokobon', '081239764', 'Jokobon@gmail.com', NULL, '$2y$10$Nh4iNulRdNST9mi1YSA3i.mbjpYMxwfiXm2LnOns4i1sr7dLiw.8u', NULL, 1, '2022-12-15 14:12:44', '2022-12-15 14:12:44'),
(45, 1, 'Kita isa', '081273843485', 'Examp@gmail.com', NULL, '$2y$10$XJdhzz/usUUNJ7ppww.4B.2z0ZJdp0x8jPHR07iKXfgEjlxHfWvwy', NULL, 1, '2022-12-15 14:14:15', '2022-12-15 14:14:15'),
(46, 1, 'Jokohambon', '0484984', 'Jokohambon@gmail.com', NULL, '$2y$10$QkG2HfGCRch6HysMWovk8eLqbmIoJHiFBkAhlmjaB/l/tkmoqNOAW', NULL, 1, '2022-12-15 14:24:42', '2022-12-15 14:24:42'),
(47, 1, 'Mochammad Firdaus ', '085771056239', 'mochammadfirdaus989@gmail.com', NULL, '$2y$10$KTgqYEvgEumUtayTd5ybBOJWZNvftiPDahCOEl515zrHB4DkhEudy', NULL, 1, '2022-12-15 14:43:04', '2022-12-15 14:43:04'),
(48, 1, 'Zaky', '08151234567', 'Ahsydhj@gmail.com', NULL, '$2y$10$gr9M.QQL.bVp71nSXVN.v.o7uXNyo6oRzUEbvrZ1qee87IcnANxwi', NULL, 1, '2022-12-15 14:43:14', '2022-12-15 14:43:14'),
(49, 1, 'Udin', '0852134625', 'Ahsgtyi@yaho.com', NULL, '$2y$10$Y93kIa5PBCCHvB/WtZGQbu4gpyE3ER4y2SYEtziVv4uZpfajatR9S', NULL, 1, '2022-12-15 14:47:04', '2022-12-15 14:47:04'),
(50, 1, 'Febrian', '082546357882', 'bryan@gmail.com', NULL, '$2y$10$ayrcfcTj8eYRVQh.VxdPxOI9UBh.6YLh/n4IADuLS290.Xmu9cCNG', NULL, 1, '2022-12-15 14:52:41', '2022-12-15 14:52:41'),
(51, 1, 'Irpan maulana', '0895365468469', 'Irpan5962@gmail.com', NULL, '$2y$10$CZ3PppfpqkoJjbKfYnrm4OI8a.LbjT0e1XyRwBRCIqIMx4HwDZuNm', NULL, 1, '2022-12-15 14:57:51', '2022-12-15 14:57:51'),
(52, 1, 'Rs', '08956582', 'Rs@gmail.com', NULL, '$2y$10$vtZB6IlS/VGhWtITZXDsPezWgJqFxL2QpZKH16SEEHnXtvsU6RgtS', NULL, 1, '2022-12-15 15:21:01', '2022-12-15 15:21:01'),
(53, 1, 'coba', '081203821', 'mch@gmail.com', NULL, '$2y$10$OC6xBW08qI3VpZEgS02ZF.2O274HXAyfClgPFa3EolkxrdwDL22ZW', NULL, 1, '2022-12-15 15:39:01', '2022-12-15 15:39:01'),
(54, 1, 'Logitech', '08154889', 'Logitech@gmail.com', NULL, '$2y$10$83z2d6gzpfBoEq/w3nPv3.80ZISYGlhlGsy9kWpAzr3vFcy9SDKU.', NULL, 1, '2022-12-15 23:52:40', '2022-12-15 23:52:40'),
(55, 1, 'Okezona', '05188468', 'Okezone@gmail.com', NULL, '$2y$10$lqHTdVejQ48FnZqEnrNY6.ME7Tzr9NnNcJe2NELCMhaRzjz2M9.gq', NULL, 1, '2022-12-15 23:57:51', '2022-12-15 23:57:51'),
(56, 1, 'Okezona', '084548485', 'Okezona@gmail.com', NULL, '$2y$10$YNjhFTZmo8wM65JUFXq4CuqjDL0Z1S8Ld2NKKZjiS5YdfXzUSkj5m', NULL, 1, '2022-12-16 00:00:09', '2022-12-16 00:00:09'),
(57, 1, 'zakir', '081023808123', 'zakir@gmail.com', NULL, '$2y$10$GyuT4w2IRaKFJYiOROmNS.kgQrXQbgaa/MrxxTck9ltw8S5EPFHA6', NULL, 1, '2022-12-16 01:13:36', '2022-12-16 01:13:36'),
(58, 1, 'Pak karsono', '087510158', 'pakkarsono@gmail.con', NULL, '$2y$10$qhsvWDFtH8zUexxThWaWSO1fszaoL6LBXCiDrAZsClHf7PYWd3Tfq', NULL, 1, '2022-12-16 05:19:03', '2022-12-16 05:19:03'),
(59, 1, '12', '12', '12@gm', NULL, '$2y$10$ByfRuFXagQHhPCnQX9DBVuLTTR0ynSUi4cu27rIZoXf8Y0gsAkvC2', NULL, 1, '2022-12-16 09:22:48', '2022-12-16 09:22:48'),
(60, 1, '123', '123', 'asds@gmail.com123', NULL, '$2y$10$CQGXKZSDtUd/LgNb.so2Cui//pazji/.0KM28z64ARfB7A4L/ZYNy', NULL, 1, '2022-12-16 09:25:12', '2022-12-16 09:25:12'),
(61, 1, '123', '123123', '12s@gmasd', NULL, '$2y$10$b3k80X0OMgi/MSnlpGVZO.7Hdrqwc77wc3bV/hkiehbfHMBX95BC2', NULL, 1, '2022-12-16 09:53:06', '2022-12-16 09:53:06'),
(62, 1, '12s@gmasd', '0812038123', '12ss@gmasd', NULL, '$2y$10$lJ/E56gHHQmwf7y9RkOQ3ucvqFEKdJ7cAW9.I03sKK5i12Wqo5sva', NULL, 1, '2022-12-16 09:53:35', '2022-12-16 09:53:35'),
(63, 1, '123123', '0182308123', '10283012@gmail.com', NULL, '$2y$10$qWRmloJ7Q8ha6YlRQ42.9uYE/keRSd6Z5S3EuzpX5Mn1bgXT6J2Yi', NULL, 1, '2022-12-16 10:03:25', '2022-12-16 10:03:25'),
(64, 1, '10283012@gmail.com', '21123123', '210283012@gmail.com', NULL, '$2y$10$pWIAQvInsm8SSahMIiMgsuawcv80t4PWdgPhR/OI3qLxKR6kjGCJi', NULL, 1, '2022-12-16 10:04:03', '2022-12-16 10:04:03'),
(65, 1, '123123', '0182308123', '210283012@gmail.com210283012@gmail.com', NULL, '$2y$10$OH1YiWltkVsGjIHzDnwGmuF2zel/iMKLGkt698TtaoP8jtCZGCl2C', NULL, 1, '2022-12-16 10:05:23', '2022-12-16 10:05:23'),
(66, 1, 'hanre', '12308122', 'hanre@gmail.com', NULL, '$2y$10$rTYBnU7dDOX6/fSik5xRu.oiYs9muNUEc6jM6ZfYLLO.bmVVcp3Le', NULL, 1, '2022-12-16 10:07:07', '2022-12-16 10:07:07');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT untuk tabel `students`
--
ALTER TABLE `students`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT untuk tabel `student_achievements`
--
ALTER TABLE `student_achievements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT untuk tabel `student_fathers`
--
ALTER TABLE `student_fathers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT untuk tabel `student_guardians`
--
ALTER TABLE `student_guardians`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT untuk tabel `student_mothers`
--
ALTER TABLE `student_mothers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=188;

--
-- AUTO_INCREMENT untuk tabel `student_scholarships`
--
ALTER TABLE `student_scholarships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
