-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 15 Bulan Mei 2019 pada 12.52
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
(2001, 'Luki', 'EL'),
(2002, 'Renhard', 'EL'),
(2003, 'Anugrah', 'EL'),
(2004, 'Wayan', 'EL'),
(2005, 'Andre', 'EL');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jadwal`
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
-- Dumping data untuk tabel `jadwal`
--

INSERT INTO `jadwal` (`kd_kelas`, `hari`, `kd_ruang`, `kd_matkul`, `NIP`, `sks`, `waktu_mulai`, `waktu_selesai`) VALUES
('1111', 'senin', 'GK101', 'IF2211', 1001, 3, '08:00:00.000000', '10:40:00.000000'),
('1112', 'senin', 'GK101', 'IF2211', 1002, 3, '08:00:00.000000', '10:40:00.000000');

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
-- Struktur dari tabel `pinjam`
--

CREATE TABLE `pinjam` (
  `kd_ruang` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_mulai` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'Belum Divalidasi'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pinjam`
--

INSERT INTO `pinjam` (`kd_ruang`, `tanggal`, `waktu_mulai`, `waktu_selesai`, `keterangan`, `status`) VALUES
('GK101', '2019-05-09', '08:00:00', '00:00:00', 'Kelas Wajib', 'Belum Divalidasi'),
('GK101', '2019-05-09', '10:00:00', '00:00:00', 'Kelas Wajib', 'Belum Divalidasi'),
('GK102', '2019-05-09', '08:00:00', '00:00:00', 'Kelas Wajib', 'Belum Divalidasi'),
('GK102', '2019-05-09', '11:00:00', '00:00:00', 'Kelas Wajib', 'Belum Divalidasi'),
('GKAULA', '2019-05-11', '10:00:00', '00:00:00', 'Acara Seminar Info', 'Belum Divalidasi'),
('GK304', '2019-05-10', '14:00:00', '00:00:00', 'Kelas Pengganti Ma', 'Belum Divalidasi'),
('GK101', '2019-05-09', '00:08:00', '00:00:00', 'pengganti', 'Belum Divalidasi'),
('GKAULA', '2019-05-09', '00:15:00', '00:00:00', 'seminar', 'Belum Divalidasi'),
('GK101', '2019-05-13', '17:12:00', '17:12:00', 'kkk', 'Belum Divalidasi'),
('GK101', '2019-05-16', '15:43:00', '16:43:00', 'rapat', 'Belum Divalidasi');

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

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
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
-- Dumping data untuk tabel `user`
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
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`NIP`),
  ADD KEY `kd_prodi` (`kd_prodi`);

--
-- Indeks untuk tabel `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`kd_kelas`),
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
-- Indeks untuk tabel `pinjam`
--
ALTER TABLE `pinjam`
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
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`NIM`);

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
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`kd_ruang`) REFERENCES `ruang` (`kd_ruang`);

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
