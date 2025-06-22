-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 22, 2025 at 05:52 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `universitas`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `view_mhs_simple` ()   BEGIN
    SELECT NPM, nama, no_hp
    FROM mahasiswa;
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `hitung_diskon` (`total_belanja` DECIMAL(10,2)) RETURNS DECIMAL(5,2) DETERMINISTIC BEGIN
    DECLARE diskon DECIMAL(5,2);

    IF total_belanja < 1000000 THEN
        SET diskon = 0.00;
    ELSEIF total_belanja < 5000000 THEN
        SET diskon = 0.05;
    ELSE
        SET diskon = 0.10;
    END IF;

    RETURN diskon;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `tambah` (`angka1` INT, `angka2` INT) RETURNS INT(11)  BEGIN
  RETURN angka1 + angka2;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` varchar(10) NOT NULL,
  `nama_brg` varchar(100) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_brg`, `nama_brg`, `stok`) VALUES
('A10', 'Mouse', 10),
('A11', 'Keyboard', 15),
('A12', 'DVD R-W', 10),
('A13', 'Modem', 6);

--
-- Triggers `barang`
--
DELIMITER $$
CREATE TRIGGER `inkremenStok2` BEFORE INSERT ON `barang` FOR EACH ROW SET NEW.stok = NEW.stok + 1
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `buku`
--

CREATE TABLE `buku` (
  `id_buku` int(11) NOT NULL,
  `judul` varchar(100) DEFAULT NULL,
  `penulis` varchar(100) DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `npm` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `id_kelurahan` int(11) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `kode_prodi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`npm`, `nama`, `alamat`, `id_kelurahan`, `jenis_kelamin`, `no_hp`, `kode_prodi`) VALUES
(12345, 'Imam Adi Nata', 'Kajen', 1, 'L', '081215529989', 1),
(12346, 'Budi Sugandhi', 'Bekasi', 109, 'L', '085643433321', 2),
(12347, 'Toha Sitohang', 'Medan', 103, 'L', '08989787876', 2),
(12348, 'Megawati', 'Condong Catur', 107, 'P', '0839303058', 1),
(12349, 'PRABOWO SUBIYANTO', 'JKT', 107, 'L', '0813208911', 1),
(12780, 'Anis Baswedan', 'Jakarta', 234, 'L', '09898877663', NULL),
(12786, 'GANJAR PRANOWO', 'JAWA TENGAH', 123, 'L', '087656356622', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `total_belanja` decimal(10,2) DEFAULT 0.00,
  `status_member` enum('REGULER','GOLD','PLATINUM') DEFAULT 'REGULER'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pem` int(11) NOT NULL,
  `id_brg` varchar(10) DEFAULT NULL,
  `jml_beli` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_pelanggan` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `total_harga` decimal(10,2) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `transaksi`
--
DELIMITER $$
CREATE TRIGGER `update_status_member` AFTER INSERT ON `transaksi` FOR EACH ROW BEGIN
    DECLARE total DECIMAL(10,2);
    DECLARE new_status ENUM('REGULER', 'GOLD', 'PLATINUM');

    
    SELECT total_belanja INTO total
    FROM pelanggan
    WHERE id_pelanggan = NEW.id_pelanggan;

    
    IF total >= 5000000 THEN
        SET new_status = 'PLATINUM';
    ELSEIF total >= 1000000 THEN
        SET new_status = 'GOLD';
    ELSE
        SET new_status = 'REGULER';
    END IF;

    
    UPDATE pelanggan
    SET status_member = new_status
    WHERE id_pelanggan = NEW.id_pelanggan;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `buku`
--
ALTER TABLE `buku`
  ADD PRIMARY KEY (`id_buku`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`npm`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pem`),
  ADD KEY `id_brg` (`id_brg`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_buku` (`id_buku`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `buku`
--
ALTER TABLE `buku`
  MODIFY `id_buku` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
