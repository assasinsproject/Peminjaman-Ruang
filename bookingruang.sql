-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2019 at 12:18 PM
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
-- Database: `bookingruang`
--

-- --------------------------------------------------------

--
-- Table structure for table `dosen`
--

CREATE TABLE `dosen` (
  `NIP` int(20) NOT NULL,
  `nama_dosen` varchar(20) NOT NULL,
  `kd_prodi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dosen`
--

INSERT INTO `dosen` (`NIP`, `nama_dosen`, `kd_prodi`) VALUES
(1001, 'Indra', 'IF'),
(1002, 'Tatang', 'IF'),
(1003, 'Fatan', 'IF'),
(1004, 'Leo', 'IF'),
(1005, 'Yoga', 'IF'),
(2001, 'Luki', 'EL'),
(2002, 'Renhard', 'EL'),
(2003, 'Anugrah', 'EL'),
(2004, 'Wayan', 'EL'),
(2005, 'Andre', 'EL');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_kelas` varchar(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `kd_ruang` varchar(20) NOT NULL,
  `kd_matkul` varchar(20) NOT NULL,
  `NIP` int(20) NOT NULL,
  `sks` int(2) NOT NULL,
  `waktu_mulai` time(6) NOT NULL,
  `waktu_selesai` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`kd_kelas`, `hari`, `kd_ruang`, `kd_matkul`, `NIP`, `sks`, `waktu_mulai`, `waktu_selesai`) VALUES
('1111', 'senin', 'GK101', 'IF2211', 1001, 3, '08:00:00.000000', '10:40:00.000000'),
('1112', 'senin', 'GK101', 'IF2211', 1002, 3, '08:00:00.000000', '10:40:00.000000');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_matkul` varchar(20) NOT NULL,
  `nama_matkul` varchar(40) NOT NULL,
  `thn_ajaran` year(4) NOT NULL,
  `sks` int(2) NOT NULL,
  `NIP` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kd_matkul`, `nama_matkul`, `thn_ajaran`, `sks`, `NIP`) VALUES
('EL2201', 'Rangkaian Elektrik II', 2019, 3, 2001),
('EL2202', 'Praktikum Rangkaian Elektrik II', 2019, 1, 2002),
('EL2203', 'Medan Elektromagnetik', 2019, 3, 2003),
('EL2204', 'Sinyal dan Sistem', 2019, 3, 2004),
('EL2205', 'Pemecahan Masalah dengan C', 2019, 3, 2005),
('EL3201', 'Sistem Instrumentasi', 2019, 3, 2001),
('EL3202', 'Sistem Mikroprosesor', 2019, 3, 2002),
('IF2211', 'Strategi Algoritma', 2019, 3, 1003),
('IF2212', 'Teori Bahasa Formal dan Otomata	', 2019, 3, 1001),
('IF2213', 'Matematika Diskrit 2', 2019, 2, 1002),
('IF2221', 'Pemrograman Berorientasi Objek', 2019, 3, 1002),
('IF2231', 'Sistem Operasi', 2019, 3, 1004),
('IF2241', 'Dasar Rekayasa Perangkat Lunak', 2019, 2, 1001),
('IF2422', 'Basis Data', 2019, 3, 1005);

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `kd_ruang` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`kd_ruang`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `keterangan`) VALUES
('GK101', '2019-05-09', '08:00:00', '00:00:00', 'Kelas Wajib'),
('GK101', '2019-05-09', '10:00:00', '00:00:00', 'Kelas Wajib'),
('GK102', '2019-05-09', '08:00:00', '00:00:00', 'Kelas Wajib'),
('GK102', '2019-05-09', '11:00:00', '00:00:00', 'Kelas Wajib'),
('GKAULA', '2019-05-11', '10:00:00', '00:00:00', 'Acara Seminar Informatika'),
('GK304', '2019-05-10', '14:00:00', '00:00:00', 'Kelas Pengganti Matdis'),
('GK101', '2019-05-09', '00:08:00', '00:00:00', 'pengganti'),
('GKAULA', '2019-05-09', '00:15:00', '00:00:00', 'seminar'),
('GK103', '2019-05-11', '90:00:00', '00:00:00', 'tes'),
('GK101', '2019-05-13', '17:12:00', '17:12:00', 'kkk');

-- --------------------------------------------------------

--
-- Table structure for table `prodi`
--

CREATE TABLE `prodi` (
  `kd_prodi` varchar(20) NOT NULL,
  `nama_prodi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prodi`
--

INSERT INTO `prodi` (`kd_prodi`, `nama_prodi`) VALUES
('EL', 'Teknik. Elektro'),
('IF', 'Teknik. Informatika');

-- --------------------------------------------------------

--
-- Table structure for table `ruang`
--

CREATE TABLE `ruang` (
  `kd_ruang` varchar(20) NOT NULL,
  `jns_ruang` varchar(20) NOT NULL,
  `kapasitas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ruang`
--

INSERT INTO `ruang` (`kd_ruang`, `jns_ruang`, `kapasitas`) VALUES
('GK101', 'R.Besar', 80),
('GK102', 'R.Besar', 80),
('GK103', 'R.Besar', 80),
('GK104', 'R.Besar', 80),
('GK105', 'R.Kecil', 40),
('GK106', 'R.Kecil', 40),
('GK107', 'R.Besar', 80),
('GK108', 'R.Besar', 80),
('GK109', 'R.Besar', 80),
('GK110', 'R.Besar', 80),
('GK111', 'R.Besar', 80),
('GK112', 'R.Besar', 80),
('GK113', 'R.Besar', 80),
('GK114', 'R.Besar', 80),
('GK201', 'R.Besar', 80),
('GK202', 'R.Besar', 80),
('GK203', 'R.Besar', 80),
('GK204', 'R.Besar', 80),
('GK205', 'R.Besar', 80),
('GK206', 'R.Besar', 80),
('GK207', 'R.Kecil', 40),
('GK208', 'R.Kecil', 40),
('GK209', 'R.Besar', 80),
('GK210', 'R.Besar', 80),
('GK211', 'R.Besar', 80),
('GK212', 'R.Besar', 80),
('GK213', 'R.Besar', 80),
('GK214', 'R.Besar', 80),
('GK301', 'R.Besar', 80),
('GK302', 'R.Besar', 80),
('GK303', 'R.Besar', 80),
('GK304', 'R.Besar', 80),
('GK305', 'R.Besar', 80),
('GK306', 'R.Besar', 80),
('GK307', 'R.Besar', 80),
('GK308', 'R.Besar', 80),
('GK309', 'R.Kecil', 40),
('GK310', 'R.Kecil', 40),
('GK311', 'R.Besar', 80),
('GK312', 'R.Besar', 80),
('GK313', 'R.Besar', 80),
('GK314', 'R.Besar', 80),
('GK401', 'R.Besar', 80),
('GK402', 'R.Besar', 80),
('GK403', 'R.Besar', 80),
('GK404', 'R.Besar', 80),
('GK405', 'R.Besar', 80),
('GK406', 'R.Besar', 80),
('GK407', 'R.Kecil', 40),
('GK408', 'R.Kecil', 40),
('GK409', 'R.Besar', 80),
('GK410', 'R.Besar', 80),
('GKAULA', 'Aula', 300);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `NIM` int(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `nama_mhs` varchar(20) NOT NULL,
  `kd_prodi` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `level` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`NIM`, `username`, `nama_mhs`, `kd_prodi`, `password`, `level`) VALUES
(0, 'admin', '', '', 'admin', 2),
(14117068, 'chandra.14117068', 'Chandra karang', 'IF', '1999-06-29', 1),
(14117099, 'Yoga.14117099', 'Yoga Naufal', 'EL', '1999-04-14', 1),
(14117157, 'fathan.14117157', 'Fathan Rizky', 'EL', '1999-08-21', 0),
(14117167, 'leo.14117167', 'Leo Viranda', 'IF', '1999-08-24', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `kd_prodi` (`kd_prodi`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_kelas`),
  ADD KEY `kd_ruang` (`kd_ruang`,`kd_matkul`,`NIP`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `kd_matkul` (`kd_matkul`);

--
-- Indexes for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_matkul`),
  ADD KEY `NIP` (`NIP`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD KEY `kd_ruang` (`kd_ruang`);

--
-- Indexes for table `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kd_prodi`);

--
-- Indexes for table `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kd_ruang`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NIM`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `matakuliah` (`kd_matkul`);

--
-- Constraints for table `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `dosen` (`NIP`);

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`kd_ruang`) REFERENCES `ruang` (`kd_ruang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
