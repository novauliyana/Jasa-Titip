-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Nov 2019 pada 16.25
-- Versi server: 10.4.6-MariaDB
-- Versi PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jastip`
--

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `rinci_pembelian`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `rinci_pembelian` (
`id_transaksi` varchar(14)
,`nama_penjasa` varchar(30)
,`nohp` int(12)
,`kategori` varchar(120)
,`nama_barang` varchar(10000)
,`keterangan_brg` varchar(120)
,`tanggal_beli` timestamp
,`tanggal_terima` timestamp
,`harga_barang` int(11)
,`harga_jastip` int(11)
,`harga_ongkir` int(100)
,`total_harga` bigint(67)
,`status` varchar(10)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `rinci_penjualan`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `rinci_penjualan` (
`id_transaksi` varchar(14)
,`nama_pembeli` varchar(30)
,`nohp` int(12)
,`kategori` varchar(120)
,`nama_barang` varchar(10000)
,`keterangan_brg` varchar(120)
,`tanggal_beli` timestamp
,`tanggal_terima` timestamp
,`harga_barang` int(11)
,`harga_jastip` int(11)
,`harga_ongkir` int(100)
,`total_harga` bigint(67)
,`status` varchar(10)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbladmin`
--

CREATE TABLE `tbladmin` (
  `IDadmin` int(10) NOT NULL,
  `NamaAdmin` varchar(120) DEFAULT NULL,
  `UserName_adm` varchar(120) DEFAULT NULL,
  `NoHP` bigint(10) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `Password` varchar(120) DEFAULT NULL,
  `hire_date` timestamp NULL DEFAULT current_timestamp(),
  `fk_kategori` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbladmin`
--

INSERT INTO `tbladmin` (`IDadmin`, `NamaAdmin`, `UserName_adm`, `NoHP`, `Email`, `Password`, `hire_date`, `fk_kategori`) VALUES
(1, 'jeki', 'zalf', 1111, 'q@gmail.com', 'jaki', '2019-09-28 04:40:31', NULL),
(2, 'rahmat', 'matt', 112233, 'matt@gmail.com', 'mamat', '2019-10-19 11:10:05', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblbarang`
--

CREATE TABLE `tblbarang` (
  `IDbarang` int(10) NOT NULL,
  `NamaBarang` varchar(100) NOT NULL,
  `Merk` varchar(50) NOT NULL,
  `negara` varchar(50) NOT NULL,
  `hargaBarang` int(100) NOT NULL,
  `harga_jastip` int(11) NOT NULL,
  `fk_iduser` int(11) DEFAULT NULL,
  `fk_idkategori` int(11) DEFAULT NULL,
  `foto` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblbarang`
--

INSERT INTO `tblbarang` (`IDbarang`, `NamaBarang`, `Merk`, `negara`, `hargaBarang`, `harga_jastip`, `fk_iduser`, `fk_idkategori`, `foto`) VALUES
(19, 'iPad Pro', 'Apple', 'USA', 5000000, 1500000, 3, 11, 'ipad.jpg'),
(20, 'Bonneville T120', 'Triumph', 'UK', 10000000, 9000000, 3, 13, 'triumph.jpg'),
(21, 'Mexico 66', 'Onitsuka Tiger', 'Japan', 850000, 150000, 1, 14, 'mexico66.png'),
(22, 'Air Jordan', 'Nike', 'USA', 1000000, 500000, 1, 14, 'jordan.jpg'),
(23, 'Classic 350', 'Royal Enfield', 'India', 1500, 1000, 3, 13, 're classic 350.jpg'),
(24, 'Polystation', 'Sonice', 'China', 1200000, 250000, 2, 11, 'ps.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tblcategory`
--

CREATE TABLE `tblcategory` (
  `IDkategori` int(10) NOT NULL,
  `KategoriBarang` varchar(120) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tblcategory`
--

INSERT INTO `tblcategory` (`IDkategori`, `KategoriBarang`, `CreationDate`) VALUES
(11, 'Elektronik', '2019-10-24 05:39:47'),
(13, 'Motor', '2019-10-24 15:49:11'),
(14, 'Sepatu', '2019-10-25 01:21:03');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbljasa`
--

CREATE TABLE `tbljasa` (
  `idjasa` int(11) NOT NULL,
  `fk_penjasa` int(11) NOT NULL,
  `fk_idkategori` int(11) NOT NULL,
  `negara` varchar(100) NOT NULL,
  `kota` varchar(100) NOT NULL,
  `harga_jastip` int(11) NOT NULL,
  `tanggal_post` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_pulang` date NOT NULL,
  `caption` varchar(1000) NOT NULL,
  `max_penitip` int(11) NOT NULL,
  `max_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbljasa`
--

INSERT INTO `tbljasa` (`idjasa`, `fk_penjasa`, `fk_idkategori`, `negara`, `kota`, `harga_jastip`, `tanggal_post`, `tanggal_pulang`, `caption`, `max_penitip`, `max_harga`) VALUES
(5, 2, 14, 'Italy', 'Roma', 0, '2019-11-17 22:14:42', '2019-11-23', 'Buka Jasa titip barang kategori sepatu', 3, 0),
(6, 2, 13, 'amerika', ' ', 0, '2019-11-18 08:46:00', '2019-11-23', 'Open jasa titip motor gaes', 1, 0),
(7, 2, 14, 'indonesia', 'bandung', 0, '2019-11-18 08:47:47', '2019-11-21', 'buka jasa titip barang sepatu', 4, 0),
(8, 3, 11, 'indonesia', 'Bandung', 0, '2019-11-18 09:25:57', '2019-11-20', 'Open Jasa titip barang elektronik dari BEC Bandung', 3, 2000000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbltransaksi`
--

CREATE TABLE `tbltransaksi` (
  `IDtransaksi` int(11) NOT NULL,
  `fk_idpembeli` int(11) NOT NULL,
  `fk_idpenjasa` int(11) NOT NULL,
  `fk_idkat` int(11) NOT NULL,
  `barang` varchar(10000) NOT NULL,
  `harga_barang` int(11) NOT NULL,
  `harga_jastip` int(11) NOT NULL,
  `harga_ongkir` int(100) NOT NULL,
  `tanggal_beli` timestamp NOT NULL DEFAULT current_timestamp(),
  `tanggal_terima` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `keterangan` varchar(120) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbltransaksi`
--

INSERT INTO `tbltransaksi` (`IDtransaksi`, `fk_idpembeli`, `fk_idpenjasa`, `fk_idkat`, `barang`, `harga_barang`, `harga_jastip`, `harga_ongkir`, `tanggal_beli`, `tanggal_terima`, `keterangan`, `status`) VALUES
(131, 3, 2, 14, 'Sepatu Nike RUN,\r\nSepatu Adidas RUN,', 0, 170000, 15000, '2019-11-17 22:34:49', NULL, 'ukuran sepatu untuk NIke 42, untuk Adidas 39', 'in process'),
(134, 3, 3, 11, 'iPad Pro', 5000000, 1500000, 15000, '2019-11-17 23:30:13', NULL, 'Warna Gold, 256GB', 'out'),
(135, 2, 3, 13, 'Classic 350', 1500, 1000, 15000, '2019-11-18 09:48:24', NULL, 'Warna kuning', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbluser`
--

CREATE TABLE `tbluser` (
  `IDuser` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nohp` int(12) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `noktp` int(15) NOT NULL,
  `password` varchar(10) NOT NULL,
  `rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbluser`
--

INSERT INTO `tbluser` (`IDuser`, `nama`, `username`, `email`, `nohp`, `alamat`, `gender`, `noktp`, `password`, `rating`) VALUES
(1, 'a', 'a', 'a@gmail.com', 2, 'a', 'on', 1, '123', 0),
(2, 'Rahmat', 'matt', 'w@gmail.com', 11, 'w', 'on', 12, 'qwerty', 0),
(3, 'zaki alf', 'zk12', 'q@gmail.com', 10011, 'Sukabumi, Jawa Barat', 'on', 1111, 'zaza', 4),
(5, 'Nova', 'novaulyn', 'nova@mail.com', 834273711, 'Jljl', 'on', 2147483647, 'nova123', 0);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `vprint`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `vprint` (
`IDtransaksi` varchar(14)
,`KategoriBarang` varchar(120)
,`NamaBarang` varchar(10000)
,`id_pembeli` int(11)
,`nama_pembeli` varchar(30)
,`nohp_pembeli` int(12)
,`id_penjual` int(11)
,`nama_penjual` varchar(30)
,`nohp_penjual` int(12)
,`tanggal_beli` timestamp
,`tanggal_terima` timestamp
,`hargaBarang` int(11)
,`harga_jastip` int(11)
,`harga_ongkir` int(100)
,`harga_total` bigint(67)
,`keterangan` varchar(120)
,`status` varchar(10)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `rinci_pembelian`
--
DROP TABLE IF EXISTS `rinci_pembelian`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rinci_pembelian`  AS  select concat('TRN',`tr`.`IDtransaksi`) AS `id_transaksi`,`tpm`.`nama` AS `nama_penjasa`,`tpm`.`nohp` AS `nohp`,`tc`.`KategoriBarang` AS `kategori`,`tr`.`barang` AS `nama_barang`,`tr`.`keterangan` AS `keterangan_brg`,`tr`.`tanggal_beli` AS `tanggal_beli`,`tr`.`tanggal_terima` AS `tanggal_terima`,`tr`.`harga_barang` AS `harga_barang`,`tr`.`harga_jastip` AS `harga_jastip`,`tr`.`harga_ongkir` AS `harga_ongkir`,`tr`.`harga_barang` + `tr`.`harga_jastip` + `tr`.`harga_ongkir` AS `total_harga`,`tr`.`status` AS `status` from ((`tbltransaksi` `tr` join `tbluser` `tpm` on(`tr`.`fk_idpenjasa` = `tpm`.`IDuser`)) join `tblcategory` `tc` on(`tr`.`fk_idkat` = `tc`.`IDkategori`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `rinci_penjualan`
--
DROP TABLE IF EXISTS `rinci_penjualan`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rinci_penjualan`  AS  select concat('TRN',`tr`.`IDtransaksi`) AS `id_transaksi`,`tpm`.`nama` AS `nama_pembeli`,`tpm`.`nohp` AS `nohp`,`tc`.`KategoriBarang` AS `kategori`,`tr`.`barang` AS `nama_barang`,`tr`.`keterangan` AS `keterangan_brg`,`tr`.`tanggal_beli` AS `tanggal_beli`,`tr`.`tanggal_terima` AS `tanggal_terima`,`tr`.`harga_barang` AS `harga_barang`,`tr`.`harga_jastip` AS `harga_jastip`,`tr`.`harga_ongkir` AS `harga_ongkir`,`tr`.`harga_barang` + `tr`.`harga_jastip` + `tr`.`harga_ongkir` AS `total_harga`,`tr`.`status` AS `status` from ((`tbltransaksi` `tr` join `tbluser` `tpm` on(`tr`.`fk_idpembeli` = `tpm`.`IDuser`)) join `tblcategory` `tc` on(`tr`.`fk_idkat` = `tc`.`IDkategori`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `vprint`
--
DROP TABLE IF EXISTS `vprint`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vprint`  AS  select concat('TRN',`tr`.`IDtransaksi`) AS `IDtransaksi`,`tc`.`KategoriBarang` AS `KategoriBarang`,`tr`.`barang` AS `NamaBarang`,`tr`.`fk_idpembeli` AS `id_pembeli`,`tpm`.`nama` AS `nama_pembeli`,`tpm`.`nohp` AS `nohp_pembeli`,`tr`.`fk_idpenjasa` AS `id_penjual`,`tpj`.`nama` AS `nama_penjual`,`tpj`.`nohp` AS `nohp_penjual`,`tr`.`tanggal_beli` AS `tanggal_beli`,`tr`.`tanggal_terima` AS `tanggal_terima`,`tr`.`harga_barang` AS `hargaBarang`,`tr`.`harga_jastip` AS `harga_jastip`,`tr`.`harga_ongkir` AS `harga_ongkir`,`tr`.`harga_barang` + `tr`.`harga_ongkir` + `tr`.`harga_jastip` AS `harga_total`,`tr`.`keterangan` AS `keterangan`,`tr`.`status` AS `status` from (((`tbltransaksi` `tr` join `tbluser` `tpm` on(`tr`.`fk_idpembeli` = `tpm`.`IDuser`)) join `tbluser` `tpj` on(`tr`.`fk_idpenjasa` = `tpj`.`IDuser`)) join `tblcategory` `tc` on(`tr`.`fk_idkat` = `tc`.`IDkategori`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD PRIMARY KEY (`IDadmin`),
  ADD KEY `fk_kategori` (`fk_kategori`);

--
-- Indeks untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD PRIMARY KEY (`IDbarang`),
  ADD KEY `fk_IDuser` (`fk_iduser`),
  ADD KEY `fk_idkategori` (`fk_idkategori`);

--
-- Indeks untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  ADD PRIMARY KEY (`IDkategori`);

--
-- Indeks untuk tabel `tbljasa`
--
ALTER TABLE `tbljasa`
  ADD PRIMARY KEY (`idjasa`),
  ADD KEY `fk_idkategori` (`fk_idkategori`),
  ADD KEY `fk_penjasa` (`fk_penjasa`);

--
-- Indeks untuk tabel `tbltransaksi`
--
ALTER TABLE `tbltransaksi`
  ADD PRIMARY KEY (`IDtransaksi`),
  ADD KEY `fk_idpembeli` (`fk_idpembeli`),
  ADD KEY `fk_idpenjasa` (`fk_idpenjasa`),
  ADD KEY `fk_idkat` (`fk_idkat`);

--
-- Indeks untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`IDuser`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  MODIFY `IDadmin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  MODIFY `IDbarang` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `tblcategory`
--
ALTER TABLE `tblcategory`
  MODIFY `IDkategori` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `tbljasa`
--
ALTER TABLE `tbljasa`
  MODIFY `idjasa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbltransaksi`
--
ALTER TABLE `tbltransaksi`
  MODIFY `IDtransaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=136;

--
-- AUTO_INCREMENT untuk tabel `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `IDuser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tbladmin`
--
ALTER TABLE `tbladmin`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`fk_kategori`) REFERENCES `tblcategory` (`IDkategori`);

--
-- Ketidakleluasaan untuk tabel `tblbarang`
--
ALTER TABLE `tblbarang`
  ADD CONSTRAINT `fk_IDuser` FOREIGN KEY (`fk_iduser`) REFERENCES `tbluser` (`IDuser`),
  ADD CONSTRAINT `tblbarang_ibfk_1` FOREIGN KEY (`fk_idkategori`) REFERENCES `tblcategory` (`IDkategori`);

--
-- Ketidakleluasaan untuk tabel `tbljasa`
--
ALTER TABLE `tbljasa`
  ADD CONSTRAINT `fk_idkategori` FOREIGN KEY (`fk_idkategori`) REFERENCES `tblcategory` (`IDkategori`),
  ADD CONSTRAINT `fk_penjasa` FOREIGN KEY (`fk_penjasa`) REFERENCES `tbluser` (`IDuser`);

--
-- Ketidakleluasaan untuk tabel `tbltransaksi`
--
ALTER TABLE `tbltransaksi`
  ADD CONSTRAINT `fk_idkat` FOREIGN KEY (`fk_idkat`) REFERENCES `tblcategory` (`IDkategori`),
  ADD CONSTRAINT `fk_idpembeli` FOREIGN KEY (`fk_idpembeli`) REFERENCES `tbluser` (`IDuser`),
  ADD CONSTRAINT `fk_idpenjasa` FOREIGN KEY (`fk_idpenjasa`) REFERENCES `tbluser` (`IDuser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
