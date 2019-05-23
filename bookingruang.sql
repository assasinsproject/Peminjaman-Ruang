-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 23 Bulan Mei 2019 pada 19.47
-- Versi server: 10.1.38-MariaDB
-- Versi PHP: 7.3.3

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
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `NIP` int(20) NOT NULL,
  `nama_dosen` varchar(20) NOT NULL,
  `kd_prodi` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `dosen`
--

INSERT INTO `dosen` (`NIP`, `nama_dosen`, `kd_prodi`) VALUES
(1001, 'Indra', 'IF'),
(1002, 'Tatang', 'IF'),
(1003, 'Fatan', 'IF'),
(1004, 'Leo', 'IF'),
(1005, 'Yoga', 'IF'),
(1006, 'Budi', 'IF'),
(1007, 'Dea', 'IF'),
(2001, 'Luki', 'EL'),
(2002, 'Renhard', 'EL'),
(2003, 'Anugrah', 'EL'),
(2004, 'Wayan', 'EL'),
(2005, 'Andre', 'EL'),
(2006, 'Fauzan', 'EL'),
(2007, 'Fikar', 'EL'),
(2008, 'Alwi', 'EL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
--

CREATE TABLE `jadwal` (
  `kd_jadwal` int(11) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `kd_ruang` varchar(20) NOT NULL,
  `kd_matkul` varchar(20) NOT NULL,
  `NIP` int(20) NOT NULL,
  `sks` int(2) NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`kd_jadwal`, `hari`, `kd_ruang`, `kd_matkul`, `NIP`, `sks`, `waktu_mulai`, `waktu_selesai`) VALUES
(1115, 'Monday', 'GK103', 'IF2211/RA', 1006, 3, '08:00:00', '10:30:00'),
(1116, 'Monday', 'GK104', 'IF2211/RB', 1007, 3, '08:00:00', '10:30:00'),
(1117, 'Monday', 'GK103', 'IF2211/RD', 1006, 3, '13:00:00', '15:30:00'),
(1118, 'Monday', 'GK104', 'IF2211/RC', 1007, 3, '13:00:00', '15:30:00'),
(1120, 'Monday', 'GK105', 'IF2241/RA', 1001, 2, '08:00:00', '09:40:00'),
(1121, 'Monday', 'GK106', 'IF2241/RB', 1002, 2, '08:00:00', '09:40:00'),
(1122, 'Monday', 'GK105', 'IF2241/RC', 1002, 2, '13:00:00', '14:40:00'),
(1123, 'Monday', 'GK106', 'IF2241/RD', 1001, 2, '11:00:00', '14:40:00'),
(1124, 'Tuesday', 'GK101', 'IF2422/RA', 1005, 3, '07:00:00', '09:30:00'),
(1125, 'Tuesday', 'GK102', 'IF2422/RC', 1005, 3, '10:00:00', '12:30:00'),
(1126, 'Tuesday', 'GK101', 'IF2422/RB', 1006, 3, '07:00:00', '09:30:00'),
(1127, 'Tuesday', 'GK102', 'IF2422/RD', 1006, 3, '10:00:00', '12:30:00'),
(1128, 'Wednesday', 'GK107', 'IF2231/RA', 1003, 3, '10:00:00', '12:40:00'),
(1129, 'Wednesday', 'GK108', 'IF2231/RC', 1004, 3, '10:00:00', '12:40:00'),
(1130, 'Wednesday', 'GK107', 'IF2231/RD', 1003, 3, '13:00:00', '15:40:00'),
(1131, 'Wednesday', 'GK108', 'IF2231/RB', 1004, 3, '13:00:00', '15:40:00'),
(1132, 'Thrusday', 'GK109', 'EL2204/RB', 2006, 3, '08:00:00', '10:30:00'),
(1133, 'Thrusday', 'GK106', 'EL2205/RA', 2007, 3, '10:00:00', '12:30:00'),
(1134, 'Thrusday', 'GK105', 'EL2205/RB', 2007, 3, '15:00:00', '17:30:00'),
(1135, 'Friday', 'GK107', 'EL2204/RC', 2007, 3, '10:00:00', '12:30:00'),
(1136, 'Friday', 'GK105', 'EL2205/RC', 2001, 3, '07:00:00', '09:30:00');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kd_matkul` varchar(20) NOT NULL,
  `nama_matkul` varchar(40) NOT NULL,
  `thn_ajaran` year(4) NOT NULL,
  `sks` int(2) NOT NULL,
  `NIP` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `matakuliah`
--

INSERT INTO `matakuliah` (`kd_matkul`, `nama_matkul`, `thn_ajaran`, `sks`, `NIP`) VALUES
('EL2201/RA', 'Rangkaian Elektrik II', 2019, 3, 2003),
('EL2201/RB', 'Rangkaian Elektrik II', 2019, 3, 2003),
('EL2201/RC', 'Rangkaian Elektrik II', 2019, 3, 2004),
('EL2201/RD', 'Rangkaian Elektrik II', 2019, 3, 2004),
('EL2202/RA', 'Praktikum Rangkaian Elektrik II', 2019, 1, 2004),
('EL2202/RB', 'Praktikum Rangkaian Elektrik II', 2019, 1, 2004),
('EL2202/RC', 'Praktikum Rangkaian Elektrik II', 2019, 1, 2005),
('EL2202/RD', 'Praktikum Rangkaian Elektrik II', 2019, 1, 2005),
('EL2203/RA', 'Medan Elektromagnetik', 2019, 3, 2005),
('EL2203/RB', 'Medan Elektromagnetik', 2019, 3, 2005),
('EL2203/RC', 'Medan Elektromagnetik', 2019, 3, 2006),
('EL2203/RD', 'Medan Elektromagnetik', 2019, 3, 2006),
('EL2204/RA', 'Sinyal dan Sistem', 2019, 3, 2006),
('EL2204/RB', 'Sinyal dan Sistem', 2019, 3, 2006),
('EL2204/RC', 'Sinyal dan Sistem', 2019, 3, 2007),
('EL2204/RD', 'Sinyal dan Sistem', 2019, 3, 2007),
('EL2205/RA', 'Pemecahan Masalah dengan C', 2019, 3, 2007),
('EL2205/RB', 'Pemecahan Masalah dengan C\r\n', 2019, 3, 2007),
('EL2205/RC', 'Pemecahan Masalah dengan C\r\n', 2019, 3, 2001),
('EL2205/RD', 'Pemecahan Masalah dengan C\r\n', 2019, 3, 2001),
('EL3201/RA', 'Sistem Instrumentasi', 2019, 3, 2001),
('EL3201/RB', 'Sistem Instrumentasi', 2019, 3, 2001),
('EL3201/RC', 'Sistem Instrumentasi', 2019, 3, 2002),
('EL3201/RD', 'Sistem Instrumentasi', 2019, 3, 2002),
('EL3202/RA', 'Sistem Mikroprosesor', 2019, 3, 2002),
('EL3202/RB', 'Sistem Mikroprosesor', 2019, 3, 2002),
('EL3202/RC', 'Sistem Mikroprosesor', 2019, 3, 2003),
('EL3202/RD', 'Sistem Mikroprosesor', 2019, 3, 2003),
('IF2211/RA', 'Strategi Algoritma', 2019, 3, 1007),
('IF2211/RB', 'Strategi Algoritma', 2019, 3, 1007),
('IF2211/RC', 'Strategi Algoritma', 2019, 3, 1004),
('IF2211/RD', 'Strategi Algoritma', 2019, 3, 1004),
('IF2212/RA', 'Teori Bahasa Formal dan Otomata	', 2019, 3, 1007),
('IF2212/RB', 'Teori Bahasa Formal dan Otomata', 2019, 3, 1006),
('IF2212/RC', 'Teori Bahasa Formal dan Otomata', 2019, 3, 1006),
('IF2212/RD', 'Teori Bahasa Formal dan Otomata', 2019, 3, 1007),
('IF2213/RA', 'Matematika Diskrit 2', 2019, 3, 1003),
('IF2213/RB', 'Matematika Diskrit 2', 2019, 3, 1003),
('IF2213/RC', 'Matematika Diskrit 2', 2019, 3, 1005),
('IF2213/RD', 'Matematika Diskrit 2', 2019, 3, 1005),
('IF2221/RA', 'Pemrograman Berorientasi Objek', 2019, 3, 1002),
('IF2221/RB', 'Pemrograman Berorientasi Objek', 2019, 3, 1002),
('IF2221/RC', 'Pemrograman Berorientasi Objek', 2019, 3, 1001),
('IF2221/RD', 'Pemrograman Berorientasi Objek', 2019, 3, 1001),
('IF2231/RA', 'Sistem Operasi', 2019, 3, 1004),
('IF2231/RB', 'Sistem Operasi ', 2019, 3, 1004),
('IF2231/RC', 'Sistem Operasi ', 2019, 3, 1003),
('IF2231/RD', 'Sistem Operasi ', 2019, 3, 1003),
('IF2241/RA', 'Dasar Rekayasa Perangkat Lunak', 2019, 2, 1001),
('IF2241/RB', 'Dasar Rekayasa Perangkat Lunak', 2019, 2, 1002),
('IF2241/RC', 'Dasar Rekayasa Perangkat Lunak', 2019, 2, 1001),
('IF2241/RD', 'Dasar Rekayasa Perangkat Lunak', 2019, 2, 1002),
('IF2422/RA', 'Basis Data', 2019, 3, 1005),
('IF2422/RB', 'Basis Data', 2019, 3, 1006),
('IF2422/RC', 'Basis Data', 2019, 3, 1005),
('IF2422/RD', 'Basis Data', 2019, 3, 1006);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengguna`
--

CREATE TABLE `pengguna` (
  `kd_user` int(11) NOT NULL,
  `username` varchar(21) NOT NULL,
  `password` varchar(21) NOT NULL,
  `level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pengguna`
--

INSERT INTO `pengguna` (`kd_user`, `username`, `password`, `level`) VALUES
(1, 'admin', 'admin', 2),
(2, 'leo.14117167', '1999-08-24', 1),
(3, 'fathan.14117157', '1999-08-21', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `kd_pinjam` int(11) NOT NULL,
  `kd_ruang` varchar(20) NOT NULL,
  `hari` varchar(21) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `NIM` varchar(21) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Belum Divalidasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`kd_pinjam`, `kd_ruang`, `hari`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `keterangan`, `NIM`, `status`) VALUES
(39, 'GK102', 'Monday', '2019-05-20', '09:00:00', '10:40:00', 'tess1', '14117157', 'Sudah Divalidasi'),
(42, 'GK103', 'Friday', '2019-05-24', '09:00:00', '10:40:00', 'pengganti', '14117167', 'Belum Divalidasi'),
(44, 'GK310', 'Friday', '2019-05-24', '10:00:00', '11:40:00', 'pengganti matdis', '14117089', 'Belum Divalidasi');

-- --------------------------------------------------------

--
-- Struktur dari tabel `prodi`
--

CREATE TABLE `prodi` (
  `kd_prodi` varchar(20) NOT NULL,
  `nama_prodi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `prodi`
--

INSERT INTO `prodi` (`kd_prodi`, `nama_prodi`) VALUES
('EL', 'Teknik. Elektro'),
('IF', 'Teknik. Informatika');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ruang`
--

CREATE TABLE `ruang` (
  `kd_ruang` varchar(20) NOT NULL,
  `jns_ruang` varchar(20) NOT NULL,
  `kapasitas` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ruang`
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

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `kd_prodi` (`kd_prodi`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_jadwal`),
  ADD KEY `kd_ruang` (`kd_ruang`,`kd_matkul`,`NIP`),
  ADD KEY `NIP` (`NIP`),
  ADD KEY `kd_matkul` (`kd_matkul`);

--
-- Indeks untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD PRIMARY KEY (`kd_matkul`),
  ADD KEY `NIP` (`NIP`);

--
-- Indeks untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`kd_user`);

--
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`kd_pinjam`),
  ADD KEY `kd_ruang` (`kd_ruang`);

--
-- Indeks untuk tabel `prodi`
--
ALTER TABLE `prodi`
  ADD PRIMARY KEY (`kd_prodi`);

--
-- Indeks untuk tabel `ruang`
--
ALTER TABLE `ruang`
  ADD PRIMARY KEY (`kd_ruang`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `kd_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1137;

--
-- AUTO_INCREMENT untuk tabel `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `kd_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  MODIFY `kd_pinjam` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD CONSTRAINT `dosen_ibfk_1` FOREIGN KEY (`kd_prodi`) REFERENCES `prodi` (`kd_prodi`);

--
-- Ketidakleluasaan untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`kd_matkul`) REFERENCES `matakuliah` (`kd_matkul`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_ruang`) REFERENCES `ruang` (`kd_ruang`),
  ADD CONSTRAINT `jadwal_ibfk_3` FOREIGN KEY (`NIP`) REFERENCES `dosen` (`NIP`);

--
-- Ketidakleluasaan untuk tabel `matakuliah`
--
ALTER TABLE `matakuliah`
  ADD CONSTRAINT `matakuliah_ibfk_1` FOREIGN KEY (`NIP`) REFERENCES `dosen` (`NIP`);

--
-- Ketidakleluasaan untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`kd_ruang`) REFERENCES `ruang` (`kd_ruang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
