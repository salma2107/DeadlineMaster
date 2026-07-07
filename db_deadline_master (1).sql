-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2026 at 06:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_deadline_master`
--

-- --------------------------------------------------------

--
-- Table structure for table `tabel_matkul`
--

CREATE TABLE `tabel_matkul` (
  `id_matkul` int(11) NOT NULL,
  `nama_matkul` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_matkul`
--

INSERT INTO `tabel_matkul` (`id_matkul`, `nama_matkul`) VALUES
(4, 'Aljabar Linear\r\n'),
(5, 'Jaringan Komputer'),
(10, 'Kecerdasan buatan'),
(6, 'Logika Matematika\r\n'),
(8, 'PBB & Mental Disiplin'),
(7, 'Pemrograman Berorientasi Objek'),
(3, 'Perancangan UI/UX'),
(9, 'Rekayasa Perangkat Lunak'),
(2, 'Struktur Data');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_tugas`
--

CREATE TABLE `tabel_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_matkul` int(11) NOT NULL,
  `nama_tugas` varchar(200) NOT NULL,
  `deadline` date NOT NULL,
  `prioritas` enum('Tinggi','Sedang','Rendah') NOT NULL DEFAULT 'Sedang',
  `status` enum('In Progress','Pending','Done','Terlewat') NOT NULL DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_tugas`
--

INSERT INTO `tabel_tugas` (`id_tugas`, `id_user`, `id_matkul`, `nama_tugas`, `deadline`, `prioritas`, `status`, `created_at`) VALUES
(10, 4, 3, 'projek uas', '2026-06-21', 'Sedang', 'Pending', '2026-06-20 01:21:02');

-- --------------------------------------------------------

--
-- Table structure for table `tabel_users`
--

CREATE TABLE `tabel_users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tabel_users`
--

INSERT INTO `tabel_users` (`id_user`, `username`, `password`, `created_at`) VALUES
(4, 'aaa', 'ed02457b5c41d964dbd2f2a609d63fe1bb7528dbe55e1abf5b52c249cd735797', '2026-06-20 01:20:23'),
(5, 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '2026-06-20 04:36:59');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tabel_matkul`
--
ALTER TABLE `tabel_matkul`
  ADD PRIMARY KEY (`id_matkul`),
  ADD UNIQUE KEY `nama_matkul` (`nama_matkul`);

--
-- Indexes for table `tabel_tugas`
--
ALTER TABLE `tabel_tugas`
  ADD PRIMARY KEY (`id_tugas`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_matkul` (`id_matkul`);

--
-- Indexes for table `tabel_users`
--
ALTER TABLE `tabel_users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tabel_matkul`
--
ALTER TABLE `tabel_matkul`
  MODIFY `id_matkul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tabel_tugas`
--
ALTER TABLE `tabel_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tabel_users`
--
ALTER TABLE `tabel_users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tabel_tugas`
--
ALTER TABLE `tabel_tugas`
  ADD CONSTRAINT `tabel_tugas_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tabel_users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `tabel_tugas_ibfk_2` FOREIGN KEY (`id_matkul`) REFERENCES `tabel_matkul` (`id_matkul`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
