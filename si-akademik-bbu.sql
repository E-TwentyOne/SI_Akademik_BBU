-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2023 at 08:22 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `si-akademik-bbu`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` varchar(18) NOT NULL,
  `username` varchar(18) NOT NULL,
  `password` varchar(18) NOT NULL,
  `email` varchar(40) NOT NULL,
  `no_hp` int(18) NOT NULL,
  `id_pegawai` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_instruktur`
--

CREATE TABLE `tb_instruktur` (
  `id_instruktur` varchar(18) NOT NULL,
  `namainstruktur` varchar(18) NOT NULL,
  `Gender` varchar(18) NOT NULL,
  `no_hp` varchar(18) NOT NULL,
  `id_jenisdiklat` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisdiklat`
--

CREATE TABLE `tb_jenisdiklat` (
  `id_jenisdiklat` varchar(18) NOT NULL,
  `namadiklat` varchar(18) NOT NULL,
  `hari` varchar(18) NOT NULL,
  `jumlahjam` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `id_kelas` varchar(18) NOT NULL,
  `id_instruktur` varchar(18) NOT NULL,
  `id_mapel` varchar(18) NOT NULL,
  `Id_Jenisdiklat` varchar(18) NOT NULL,
  `Id_siswa` varchar(18) NOT NULL,
  `hari` varchar(18) NOT NULL,
  `jumlahjam` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_matapelajaran`
--

CREATE TABLE `tb_matapelajaran` (
  `id_mapel` varchar(18) NOT NULL,
  `Nama_Mapel` varchar(18) NOT NULL,
  `Nama_Instruktur` varchar(18) NOT NULL,
  `Id_Jenisdiklat` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_nilai`
--

CREATE TABLE `tb_nilai` (
  `Id_siswa` varchar(18) NOT NULL,
  `id_instruktur` varchar(18) NOT NULL,
  `id_jenisdiklat` varchar(18) NOT NULL,
  `nilai` int(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `id_pegawai` varchar(18) NOT NULL,
  `nama` varchar(18) NOT NULL,
  `Alamat` varchar(25) NOT NULL,
  `Jabatan` varchar(18) NOT NULL,
  `no_hp` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_user` varchar(18) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `Id_siswa` varchar(18) NOT NULL,
  `Nama_siswa` varchar(18) NOT NULL,
  `periode_diklat` varchar(18) NOT NULL,
  `angkatan` varchar(18) NOT NULL,
  `Alamat` varchar(18) NOT NULL,
  `no_hp` varchar(18) NOT NULL,
  `Gender` varchar(18) NOT NULL,
  `Namaortu` varchar(18) NOT NULL,
  `Pekerjaanortu` varchar(18) NOT NULL,
  `Penghasilan` int(18) NOT NULL,
  `id_jenisdiklat` varchar(18) NOT NULL,
  `id_user` varchar(18) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `tb_instruktur`
--
ALTER TABLE `tb_instruktur`
  ADD PRIMARY KEY (`id_instruktur`),
  ADD KEY `id_jenisdiklat` (`id_jenisdiklat`);

--
-- Indexes for table `tb_jenisdiklat`
--
ALTER TABLE `tb_jenisdiklat`
  ADD PRIMARY KEY (`id_jenisdiklat`);

--
-- Indexes for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`id_kelas`),
  ADD KEY `id_instruktur` (`id_instruktur`,`id_mapel`,`Id_Jenisdiklat`,`Id_siswa`),
  ADD KEY `Id_siswa` (`Id_siswa`),
  ADD KEY `Id_Jenisdiklat` (`Id_Jenisdiklat`),
  ADD KEY `id_mapel` (`id_mapel`);

--
-- Indexes for table `tb_matapelajaran`
--
ALTER TABLE `tb_matapelajaran`
  ADD PRIMARY KEY (`id_mapel`),
  ADD KEY `Id_Jenisdiklat` (`Id_Jenisdiklat`);

--
-- Indexes for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD PRIMARY KEY (`Id_siswa`,`id_jenisdiklat`),
  ADD KEY `id_instruktur` (`id_instruktur`),
  ADD KEY `id_jenisdiklat` (`id_jenisdiklat`);

--
-- Indexes for table `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`Id_siswa`),
  ADD KEY `id_jenisdiklat` (`id_jenisdiklat`,`id_user`),
  ADD KEY `id_user` (`id_user`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `tb_admin_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `tb_pegawai` (`id_pegawai`);

--
-- Constraints for table `tb_instruktur`
--
ALTER TABLE `tb_instruktur`
  ADD CONSTRAINT `tb_instruktur_ibfk_1` FOREIGN KEY (`id_instruktur`) REFERENCES `tb_kelas` (`id_instruktur`),
  ADD CONSTRAINT `tb_instruktur_ibfk_2` FOREIGN KEY (`id_instruktur`) REFERENCES `tb_nilai` (`id_instruktur`);

--
-- Constraints for table `tb_jenisdiklat`
--
ALTER TABLE `tb_jenisdiklat`
  ADD CONSTRAINT `tb_jenisdiklat_ibfk_2` FOREIGN KEY (`id_jenisdiklat`) REFERENCES `tb_instruktur` (`id_jenisdiklat`);

--
-- Constraints for table `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD CONSTRAINT `tb_kelas_ibfk_1` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_siswa` (`Id_siswa`),
  ADD CONSTRAINT `tb_kelas_ibfk_2` FOREIGN KEY (`Id_Jenisdiklat`) REFERENCES `tb_jenisdiklat` (`id_jenisdiklat`),
  ADD CONSTRAINT `tb_kelas_ibfk_3` FOREIGN KEY (`id_mapel`) REFERENCES `tb_matapelajaran` (`id_mapel`);

--
-- Constraints for table `tb_matapelajaran`
--
ALTER TABLE `tb_matapelajaran`
  ADD CONSTRAINT `tb_matapelajaran_ibfk_1` FOREIGN KEY (`Id_Jenisdiklat`) REFERENCES `tb_jenisdiklat` (`id_jenisdiklat`);

--
-- Constraints for table `tb_nilai`
--
ALTER TABLE `tb_nilai`
  ADD CONSTRAINT `tb_nilai_ibfk_1` FOREIGN KEY (`id_jenisdiklat`) REFERENCES `tb_jenisdiklat` (`id_jenisdiklat`);

--
-- Constraints for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD CONSTRAINT `tb_pengguna_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_siswa` (`id_user`);

--
-- Constraints for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD CONSTRAINT `tb_siswa_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `tb_pengguna` (`id_user`),
  ADD CONSTRAINT `tb_siswa_ibfk_3` FOREIGN KEY (`Id_siswa`) REFERENCES `tb_nilai` (`Id_siswa`),
  ADD CONSTRAINT `tb_siswa_ibfk_4` FOREIGN KEY (`id_jenisdiklat`) REFERENCES `tb_jenisdiklat` (`id_jenisdiklat`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
