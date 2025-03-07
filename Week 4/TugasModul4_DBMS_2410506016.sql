-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2025 at 04:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tugasmodul4_dbms_2410506016`
--

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `mahasiswa_id` int(11) NOT NULL,
  `mahasiswa` varchar(100) DEFAULT NULL,
  `jurusan` varchar(50) DEFAULT NULL,
  `mata_kuliah` varchar(50) DEFAULT NULL,
  `nilai` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`mahasiswa_id`, `mahasiswa`, `jurusan`, `mata_kuliah`, `nilai`) VALUES
(1, 'Ahmad Syah', 'Teknik Informatika', 'Algoritma', 85.50),
(2, 'Budi Santoso', 'Sistem Informasi', 'Algoritma', 78.00),
(3, 'Cahyo Prasetyo', 'Teknik Informatika', 'Pemrograman Web', 90.75),
(4, 'Dimas Putra', 'Manajemen Informatika', 'Pemrograman Web', 88.00),
(5, 'Eko Wijaya', 'Sistem Informasi', 'Jaringan Komputer', 76.50),
(6, 'Fajar Nugroho', 'Teknik Informatika', 'Jaringan Komputer', 92.00),
(7, 'Gilang Ramadhan', 'Sistem Informasi', 'Struktur Data', 81.25),
(8, 'Hadi Prasetyo', 'Teknik Informatika', 'Struktur Data', 87.50),
(9, 'Irfan Maulana', 'Manajemen Informatika', 'Kecerdasan Buatan', 79.00),
(10, 'Joko Susilo', 'Teknik Informatika', 'Kecerdasan Buatan', 95.00),
(11, 'Kurniawan Saputra', 'Teknik Informatika', 'Algoritma', 82.00),
(12, 'Lutfi Hakim', 'Sistem Informasi', 'Algoritma', 80.50),
(13, 'Mahendra Putra', 'Teknik Informatika', 'Pemrograman Web', 91.00),
(14, 'Naufal Rizki', 'Sistem Informasi', 'Jaringan Komputer', 85.00),
(15, 'Oka Saputra', 'Manajemen Informatika', 'Struktur Data', 78.75);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`mahasiswa_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `mahasiswa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
