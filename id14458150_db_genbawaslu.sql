-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 27, 2020 at 03:13 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `id14458150_db_genbawaslu`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_code`
--

CREATE TABLE `tb_code` (
  `id_code` int(11) NOT NULL,
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_code`
--

INSERT INTO `tb_code` (`id_code`, `code`, `desc`) VALUES
(1, 'HK', 'HUKUM'),
(2, 'PP', 'PELANGGARAN PEMILU'),
(3, 'HM', ' HUBUNGAN MASYARAKAT'),
(4, 'PM', 'PENGAWASAN PEMILU'),
(5, 'KP', 'KEPEGAWAIAN'),
(6, 'KU', 'KEUANGAN'),
(7, 'TU', 'KETATAUSAHAAN'),
(8, 'OT', 'ORGANISASI DAN TATA LAKSANA'),
(9, 'PL', 'PERLENGKAPAN'),
(10, 'PR', 'PERENCANAAN'),
(11, 'RT', 'KERUMAHTANGGAAN'),
(12, 'PW', 'PENGAWASAN'),
(13, 'TI', 'TEKNOLOGI INFORMASI');

-- --------------------------------------------------------

--
-- Table structure for table `tb_number`
--

CREATE TABLE `tb_number` (
  `id_number` int(11) NOT NULL,
  `id_code` int(11) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_number`
--

INSERT INTO `tb_number` (`id_number`, `id_code`, `number`) VALUES
(30, 3, 8),
(31, 1, 54),
(32, 5, 4),
(34, 4, 18),
(35, 2, 3),
(36, 6, 45),
(37, 7, 122),
(38, 9, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tb_request`
--

CREATE TABLE `tb_request` (
  `id_request` int(11) NOT NULL,
  `id_number` int(11) NOT NULL,
  `datetime` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tb_request`
--

INSERT INTO `tb_request` (`id_request`, `id_number`, `datetime`, `name`, `desc`) VALUES
(33, 30, '2020-07-25 07:01:17', 'Khusnul Danny Rahayu', '-'),
(34, 31, '2020-07-25 07:01:11', 'Khusnul Danny Rahayu', '-'),
(35, 32, '2020-07-25 06:57:35', 'Khusnul Danny Rahayu', '-'),
(37, 34, '2020-07-25 07:10:51', 'Khusnul Danny Rahayu', '-'),
(38, 35, '2020-07-25 07:12:08', 'Khusnul Danny Rahayu', '-'),
(39, 36, '2020-07-25 07:13:20', 'Khusnul Danny Rahayu', '-'),
(40, 37, '2020-07-25 07:14:16', 'Khusnul Danny Rahayu', '-'),
(41, 38, '2020-07-25 07:14:31', 'Khusnul Danny Rahayu', '-');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_code`
--
ALTER TABLE `tb_code`
  ADD PRIMARY KEY (`id_code`);

--
-- Indexes for table `tb_number`
--
ALTER TABLE `tb_number`
  ADD PRIMARY KEY (`id_number`);

--
-- Indexes for table `tb_request`
--
ALTER TABLE `tb_request`
  ADD PRIMARY KEY (`id_request`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_code`
--
ALTER TABLE `tb_code`
  MODIFY `id_code` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_number`
--
ALTER TABLE `tb_number`
  MODIFY `id_number` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `tb_request`
--
ALTER TABLE `tb_request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
