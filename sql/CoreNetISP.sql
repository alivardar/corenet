-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-04-24 18:09:02
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for corebil
DROP DATABASE IF EXISTS `corebil`;
CREATE DATABASE IF NOT EXISTS `corebil` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `corebil`;


-- Dumping structure for table corebil.coreaboneler
DROP TABLE IF EXISTS `coreaboneler`;
CREATE TABLE IF NOT EXISTS `coreaboneler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carihesapid` bigint(20) NOT NULL,
  `tarifeid` bigint(20) NOT NULL,
  `baslangictarihi` date NOT NULL,
  `sonhesapbitis` date DEFAULT NULL,
  `baslatankullanici` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreaboneler: 6 rows
/*!40000 ALTER TABLE `coreaboneler` DISABLE KEYS */;
INSERT INTO `coreaboneler` (`id`, `carihesapid`, `tarifeid`, `baslangictarihi`, `sonhesapbitis`, `baslatankullanici`) VALUES
	(5, 1020090007, 3, '2009-10-09', NULL, '1'),
	(2, 4, 4, '2009-10-09', NULL, '1'),
	(3, 1, 1, '2009-10-09', NULL, '1'),
	(4, 2, 3, '2009-10-09', NULL, '1'),
	(6, 1020090005, 5, '2009-10-13', NULL, '1'),
	(8, 1, 1, '2009-10-13', NULL, '1');
/*!40000 ALTER TABLE `coreaboneler` ENABLE KEYS */;


-- Dumping structure for table corebil.corebankahareket
DROP TABLE IF EXISTS `corebankahareket`;
CREATE TABLE IF NOT EXISTS `corebankahareket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankaid` bigint(20) NOT NULL,
  `carihesapid` bigint(20) DEFAULT NULL,
  `tarih` date NOT NULL,
  `tutar` decimal(10,2) NOT NULL,
  `borcalacak` varchar(10) NOT NULL,
  `evrakno` varchar(20) DEFAULT NULL,
  `aciklama` varchar(20) DEFAULT NULL,
  `hareketturu` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`bankaid`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corebankahareket: 4 rows
/*!40000 ALTER TABLE `corebankahareket` DISABLE KEYS */;
INSERT INTO `corebankahareket` (`id`, `bankaid`, `carihesapid`, `tarih`, `tutar`, `borcalacak`, `evrakno`, `aciklama`, `hareketturu`) VALUES
	(24, 1, 3, '2009-02-10', 25.00, 'borc', '453434', NULL, 'BTahsilat'),
	(22, 1, NULL, '2005-01-02', 200.00, 'alacak', 'asdasd', 'namkadan para cekeme', 'BTediye'),
	(21, 1, NULL, '2005-01-01', 1000.00, 'borc', '4545', 'bankaya kasadan yatÄ', 'BTahsilat'),
	(25, 2, 1020090007, '2002-02-02', 57.96, 'borc', '323', NULL, 'BTahsilat');
/*!40000 ALTER TABLE `corebankahareket` ENABLE KEYS */;


-- Dumping structure for table corebil.corebankalar
DROP TABLE IF EXISTS `corebankalar`;
CREATE TABLE IF NOT EXISTS `corebankalar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bankaadi` varchar(30) CHARACTER SET utf8 NOT NULL,
  `subeadi` varchar(30) CHARACTER SET utf8 NOT NULL,
  `hesapno` varchar(30) CHARACTER SET utf8 NOT NULL,
  `aciklama` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `sondurum` decimal(20,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corebankalar: 2 rows
/*!40000 ALTER TABLE `corebankalar` DISABLE KEYS */;
INSERT INTO `corebankalar` (`id`, `bankaadi`, `subeadi`, `hesapno`, `aciklama`, `sondurum`) VALUES
	(1, 'Garanti BankasÄ±', 'Deneme Åžubesi', '173-25665226544814', 'deneme bankasÄ±', 825.00),
	(2, 'Ä°ÅŸ BankasÄ±', 'AtaÅŸehir', '253-565655554877', 'Ä°ÅŸ bankasÄ± mozaik', 57.96);
/*!40000 ALTER TABLE `corebankalar` ENABLE KEYS */;


-- Dumping structure for table corebil.corecarihareket
DROP TABLE IF EXISTS `corecarihareket`;
CREATE TABLE IF NOT EXISTS `corecarihareket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carihesapid` bigint(20) NOT NULL DEFAULT '0',
  `faturano` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tarih` date NOT NULL,
  `hareketturu` varchar(10) CHARACTER SET utf8 NOT NULL,
  `bankaid` bigint(20) DEFAULT NULL,
  `aciklama` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `borcalacak` varchar(10) CHARACTER SET utf8 NOT NULL,
  `evrakno` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `tutar` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`,`carihesapid`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corecarihareket: 9 rows
/*!40000 ALTER TABLE `corecarihareket` DISABLE KEYS */;
INSERT INTO `corecarihareket` (`id`, `carihesapid`, `faturano`, `tarih`, `hareketturu`, `bankaid`, `aciklama`, `borcalacak`, `evrakno`, `tutar`) VALUES
	(21, 3, NULL, '2001-01-01', 'BTahsilat', 1, 'dfgfdg', 'alacak', 'dfgdfg', 23.00),
	(22, 2, NULL, '2002-02-02', 'Tahsilat', NULL, 'fsdfsdf', 'alacak', 'sdfsd', 100.00),
	(23, 1, NULL, '2009-05-10', 'Tediye', NULL, 'hÃ¼seyinin deneme kaydÄ±', 'borc', '0135', 7000.00),
	(24, 1, '9', '0000-00-00', 'Fatura', NULL, NULL, 'borc', NULL, 54.66),
	(33, 1020090007, '9090', '2009-10-14', 'Fatura', NULL, NULL, 'borc', NULL, 1106.89),
	(27, 1, '12', '2009-10-08', 'Fatura', NULL, NULL, 'borc', NULL, 342.31),
	(30, 3, NULL, '2009-02-10', 'BTahsilat', 1, NULL, 'alacak', '453434', 25.00),
	(31, 1020090007, '656565', '2009-10-09', 'Fatura', NULL, NULL, 'borc', NULL, 57.96),
	(32, 1020090007, NULL, '2002-02-02', 'BTahsilat', 2, NULL, 'alacak', '323', 57.96);
/*!40000 ALTER TABLE `corecarihareket` ENABLE KEYS */;


-- Dumping structure for table corebil.corecustomers
DROP TABLE IF EXISTS `corecustomers`;
CREATE TABLE IF NOT EXISTS `corecustomers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adi` varchar(50) DEFAULT NULL,
  `soyadi` varchar(50) DEFAULT NULL,
  `unvani` varchar(100) DEFAULT NULL,
  `adres` varchar(250) DEFAULT NULL,
  `tcno` varchar(50) DEFAULT '',
  `vergidairesi` varchar(50) DEFAULT NULL,
  `verginumarasi` varchar(50) DEFAULT NULL,
  `musteritipi` varchar(10) DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `eposta` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `adi` (`adi`,`soyadi`,`unvani`)
) ENGINE=MyISAM AUTO_INCREMENT=1020090008 DEFAULT CHARSET=utf8;

-- Dumping data for table corebil.corecustomers: 7 rows
/*!40000 ALTER TABLE `corecustomers` DISABLE KEYS */;
INSERT INTO `corecustomers` (`id`, `adi`, `soyadi`, `unvani`, `adres`, `tcno`, `vergidairesi`, `verginumarasi`, `musteritipi`, `telefon`, `eposta`) VALUES
	(1, 'Ali', 'Vardar', '', 'AtaÅŸehir', '1234567890', 'Zeytinburnu', '12345679000', 'Bireysel', NULL, 'ali.vardar@turkmesh.com.tr'),
	(2, '', '', 'Deneme FirmasÄ± Limited Åžirketi.', 'eqweqwe', '', 'EminÃ¶nÃ?', '12312345454', 'Kurumsal', NULL, NULL),
	(3, 'HÃ¼seyin', 'Ã‡izmecioÄŸlu', '', 'rwerwerwer', '3213213213', 'KadÄ±kÃ¶y', '24234234234', 'Bireysel', NULL, NULL),
	(4, 'mehmet', 'celik', NULL, 'asdasd', '12345678901', 'hesap', '123123123', 'Bireysel', NULL, NULL),
	(5, NULL, NULL, 'Sistem BiliÅŸim Teknolojileri Yaz.Don.Ltd.Åžti.', 'Muhittin mah. GÃ¶lcÃ¼k meydanÄ± S.Zengin Apt. No:44 \nÃ‡orlu', '', 'Ã‡orlu V.D.', '8590108623', 'SatÄ±cÄ±', '0 282 65430 30 /0282 654 11 11', 'bilgi@sistembilisim.com'),
	(1020090005, 'dilem', 'kocaman', 'x', 'y', '7898789', 'ataÅŸehir', '123456789', 'Bireysel', '321654987', NULL),
	(1020090007, 'Abuzittin', 'ÅženbÃ¼lbÃ¼l', NULL, 'AtaÅŸehir keÅŸmekeÅŸ sok no: 29 \nÄ°stanbul', '54545465454', '', '', 'Bireysel', '0216 556 59 58', 'abuzi.senbul@hotmail.com');
/*!40000 ALTER TABLE `corecustomers` ENABLE KEYS */;


-- Dumping structure for table corebil.corefaturalar
DROP TABLE IF EXISTS `corefaturalar`;
CREATE TABLE IF NOT EXISTS `corefaturalar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `carihesapid` bigint(20) unsigned NOT NULL,
  `faturano` bigint(20) unsigned NOT NULL,
  `hizmetid` bigint(20) unsigned NOT NULL,
  `stokid` bigint(20) unsigned NOT NULL,
  `adet` bigint(20) unsigned NOT NULL,
  `tutar` decimal(20,2) unsigned NOT NULL,
  `turu` varchar(10) NOT NULL,
  `aciklama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- Dumping data for table corebil.corefaturalar: 21 rows
/*!40000 ALTER TABLE `corefaturalar` DISABLE KEYS */;
INSERT INTO `corefaturalar` (`id`, `tarih`, `carihesapid`, `faturano`, `hizmetid`, `stokid`, `adet`, `tutar`, `turu`, `aciklama`) VALUES
	(112, '2009-10-08', 1, 6, 0, 3, 5, 22.23, 'emtia', NULL),
	(113, '2009-10-08', 1, 6, 0, 4, 2, 11.11, 'emtia', NULL),
	(114, '2009-10-08', 1, 6, 0, 0, 0, 24.01, 'kdv', NULL),
	(115, '2009-10-08', 1, 6, 0, 0, 0, 6.67, 'oiv', NULL),
	(116, '2009-10-08', 1, 6, 0, 0, 0, 164.05, 'fatura', 'asdasdasdasdasd'),
	(148, '2009-10-09', 1020090007, 656565, 0, 0, 0, 57.96, 'fatura', 'fsfsdfdsfds  fdsfsdf dsf dsf dsf '),
	(147, '2009-10-09', 1020090007, 656565, 0, 0, 0, 2.36, 'oiv', NULL),
	(146, '2009-10-09', 1020090007, 656565, 0, 0, 0, 8.48, 'kdv', NULL),
	(145, '2009-10-09', 1020090007, 656565, 1, 0, 2, 23.56, 'hizmet', NULL),
	(121, '2009-10-08', 5, 8, 1, 0, 3, 33.33, 'hizmet', NULL),
	(122, '2009-10-08', 5, 8, 0, 0, 0, 18.00, 'kdv', NULL),
	(123, '2009-10-08', 5, 8, 0, 0, 0, 5.00, 'oiv', NULL),
	(124, '2009-10-08', 5, 8, 0, 0, 0, 122.99, 'fatura', ''),
	(108, '2009-10-07', 5, 5, 1, 0, 2, 22.22, 'hizmet', NULL),
	(109, '2009-10-07', 5, 5, 0, 0, 0, 8.00, 'kdv', NULL),
	(110, '2009-10-07', 5, 5, 0, 0, 0, 2.22, 'oiv', NULL),
	(111, '2009-10-07', 5, 5, 0, 0, 0, 54.66, 'fatura', 'zxczxczxczxczxcxzc'),
	(152, '2009-10-14', 1020090007, 9090, 0, 0, 0, 1106.89, 'fatura', 'ggggg'),
	(151, '2009-10-14', 1020090007, 9090, 0, 0, 0, 45.00, 'oiv', NULL),
	(150, '2009-10-14', 1020090007, 9090, 0, 0, 0, 161.98, 'kdv', NULL),
	(149, '2009-10-14', 1020090007, 9090, 1, 0, 9, 99.99, 'hizmet', NULL);
/*!40000 ALTER TABLE `corefaturalar` ENABLE KEYS */;


-- Dumping structure for table corebil.corehatalistesi
DROP TABLE IF EXISTS `corehatalistesi`;
CREATE TABLE IF NOT EXISTS `corehatalistesi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hataturuid` bigint(20) NOT NULL,
  `carihesapid` bigint(20) NOT NULL,
  `tarih` date NOT NULL,
  `durum` varchar(10) DEFAULT NULL,
  `kimsorumlu` varchar(20) DEFAULT NULL,
  `aciklama` varchar(200) DEFAULT NULL,
  `musterinotu` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corehatalistesi: 11 rows
/*!40000 ALTER TABLE `corehatalistesi` DISABLE KEYS */;
INSERT INTO `corehatalistesi` (`id`, `hataturuid`, `carihesapid`, `tarih`, `durum`, `kimsorumlu`, `aciklama`, `musterinotu`) VALUES
	(1, 1, 2, '2009-02-02', 'Aktif', 'alivardar', 'sdfsdfsdfsdfsdf', 'sdfdsfsdfsdf'),
	(2, 1, 1, '2009-10-10', 'Pasif', 'alivardar', 'erewrewrwerwer', 'sfddsfsdf'),
	(3, 1, 2, '2020-02-20', 'Aktif', 'alivardar', 'werwerwerwerasdas', 'erwer'),
	(4, 1, 2, '2009-01-02', 'Pasif', 'huseyincizmeci', '232243234', '423423243243'),
	(5, 1, 2, '2009-02-02', 'Aktif', 'alivardar', 'asasdasdfda', 'dfgfdg'),
	(6, 1, 1, '2005-02-02', 'Pasif', 'alivardar', 'sdfsdfsdfsdf', 'sdfsdf'),
	(7, 1, 3, '2009-10-01', 'Aktif', 'mehmetcelik', 'asdasdasd', 'adasd'),
	(8, 1, 1, '2009-10-02', 'Aktif', 'mehmetcelik', 'fsddsfsdf', 'sdfdsfdsf'),
	(9, 1, 3, '2009-10-09', 'Aktif', 'alivardar', 'dfdfdfdfdf', 'fdfdfdf'),
	(10, 1, 5, '2009-10-13', 'Aktif', NULL, 'werwerwerwer', 'werwer'),
	(11, 1, 4, '2009-10-13', 'Aktif', 'alivardar', '23232323', 'qqwwqqwe');
/*!40000 ALTER TABLE `corehatalistesi` ENABLE KEYS */;


-- Dumping structure for table corebil.corehataturleri
DROP TABLE IF EXISTS `corehataturleri`;
CREATE TABLE IF NOT EXISTS `corehataturleri` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hataturuadi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hataturuadi` (`hataturuadi`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corehataturleri: 1 rows
/*!40000 ALTER TABLE `corehataturleri` DISABLE KEYS */;
INSERT INTO `corehataturleri` (`id`, `hataturuadi`) VALUES
	(1, 'Åžifre kabul etmiyor');
/*!40000 ALTER TABLE `corehataturleri` ENABLE KEYS */;


-- Dumping structure for table corebil.corehizmetturleri
DROP TABLE IF EXISTS `corehizmetturleri`;
CREATE TABLE IF NOT EXISTS `corehizmetturleri` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hizmetadi` varchar(64) NOT NULL,
  `hizmetbedeli` decimal(20,2) DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corehizmetturleri: 1 rows
/*!40000 ALTER TABLE `corehizmetturleri` DISABLE KEYS */;
INSERT INTO `corehizmetturleri` (`id`, `hizmetadi`, `hizmetbedeli`) VALUES
	(1, 'adqwewqasdasdasdqwe', 2.00);
/*!40000 ALTER TABLE `corehizmetturleri` ENABLE KEYS */;


-- Dumping structure for table corebil.coreilaveler
DROP TABLE IF EXISTS `coreilaveler`;
CREATE TABLE IF NOT EXISTS `coreilaveler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carihesapid` bigint(20) NOT NULL,
  `ilaveturu` varchar(15) NOT NULL,
  `ilavebaslangic` date NOT NULL,
  `ilavebitis` date NOT NULL,
  `fiyat` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreilaveler: 0 rows
/*!40000 ALTER TABLE `coreilaveler` DISABLE KEYS */;
/*!40000 ALTER TABLE `coreilaveler` ENABLE KEYS */;


-- Dumping structure for table corebil.coreilaveturleri
DROP TABLE IF EXISTS `coreilaveturleri`;
CREATE TABLE IF NOT EXISTS `coreilaveturleri` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ilaveadi` varchar(40) NOT NULL,
  `aciklama` varchar(50) DEFAULT NULL,
  `tutar` decimal(20,2) NOT NULL,
  `kacay` tinyint(4) NOT NULL,
  `tarifeid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreilaveturleri: 3 rows
/*!40000 ALTER TABLE `coreilaveturleri` DISABLE KEYS */;
INSERT INTO `coreilaveturleri` (`id`, `ilaveadi`, `aciklama`, `tutar`, `kacay`, `tarifeid`) VALUES
	(1, 'DamgaVergisi12AylÄ±k', 'Damga Vergisi Ay BaÅŸÄ±na alÄ±nacak', 2.60, 12, 1),
	(2, 'DamgaVergisiTekSefer', NULL, 24.00, 0, 2),
	(3, 'EriÅŸim Ãœcreti', NULL, 28.00, 0, 2);
/*!40000 ALTER TABLE `coreilaveturleri` ENABLE KEYS */;


-- Dumping structure for table corebil.coreindirimler
DROP TABLE IF EXISTS `coreindirimler`;
CREATE TABLE IF NOT EXISTS `coreindirimler` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carihesapid` bigint(20) NOT NULL,
  `indirimturu` varchar(15) NOT NULL,
  `indirimbaslangic` date NOT NULL,
  `indirimbitis` date NOT NULL,
  `fiyat` decimal(20,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreindirimler: 0 rows
/*!40000 ALTER TABLE `coreindirimler` DISABLE KEYS */;
/*!40000 ALTER TABLE `coreindirimler` ENABLE KEYS */;


-- Dumping structure for table corebil.coreindirimturleri
DROP TABLE IF EXISTS `coreindirimturleri`;
CREATE TABLE IF NOT EXISTS `coreindirimturleri` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `indirimadi` varchar(40) NOT NULL,
  `aciklama` varchar(50) DEFAULT NULL,
  `tutar` decimal(20,2) NOT NULL,
  `kacay` tinyint(4) NOT NULL,
  `tarifeid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreindirimturleri: 4 rows
/*!40000 ALTER TABLE `coreindirimturleri` DISABLE KEYS */;
INSERT INTO `coreindirimturleri` (`id`, `indirimadi`, `aciklama`, `tutar`, `kacay`, `tarifeid`) VALUES
	(1, '1MbpsLimitsizÄ°lkÃ¼Ã§Ay', '1 mbps limitsiz tarifesinde ilk Ã¼Ã§ ay ay baÅŸÄ±n', 8.00, 0, 0),
	(2, '4MbpsLimitsizÄ°lkÃœÃ§Ay', '4 mbps iÃ§in ilk Ã¼Ã§ ay indirimi', 15.00, 0, 0),
	(7, 'ilkucay20tldahaaz', NULL, 20.00, 3, 3),
	(6, 'ilkucay10ytldahaaz', NULL, 10.00, 3, 1);
/*!40000 ALTER TABLE `coreindirimturleri` ENABLE KEYS */;


-- Dumping structure for table corebil.corekasahareket
DROP TABLE IF EXISTS `corekasahareket`;
CREATE TABLE IF NOT EXISTS `corekasahareket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `aciklama` varchar(50) NOT NULL,
  `tutar` decimal(15,2) NOT NULL,
  `borcalacak` varchar(10) NOT NULL,
  `carihesapid` bigint(20) DEFAULT NULL,
  `evrakno` varchar(20) DEFAULT NULL,
  `hareketturu` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corekasahareket: 8 rows
/*!40000 ALTER TABLE `corekasahareket` DISABLE KEYS */;
INSERT INTO `corekasahareket` (`id`, `tarih`, `aciklama`, `tutar`, `borcalacak`, `carihesapid`, `evrakno`, `hareketturu`) VALUES
	(11, '2002-02-02', 'fsdfsdf', 100.00, 'borc', 2, 'sdfsd', 'Tahsilat'),
	(12, '2003-03-03', 'sdfsdf', 20.00, 'borc', NULL, 'sdf', 'Tediye'),
	(13, '2002-02-02', 'qweqwe', 444.00, 'borc', NULL, 'qweqwe', 'Tahsilat'),
	(14, '2009-02-02', 'asdasd', 777.00, 'alacak', NULL, 'asdd', 'Tediye'),
	(15, '2005-01-01', 'bankaya kasadan yatÄ', 1000.00, 'alacak', NULL, '4545', 'Tediye'),
	(16, '2005-01-02', 'namkadan para cekeme', 200.00, 'borc', NULL, 'asdasd', 'Tahsilat'),
	(17, '2005-01-02', 'namkadan para cekeme', 200.00, 'borc', NULL, 'asdasd', 'Tahsilat'),
	(18, '2009-05-10', 'hÃ¼seyinin deneme kaydÄ±', 7000.00, 'alacak', 1, '0135', 'Tediye');
/*!40000 ALTER TABLE `corekasahareket` ENABLE KEYS */;


-- Dumping structure for table corebil.coremusteriyetkili
DROP TABLE IF EXISTS `coremusteriyetkili`;
CREATE TABLE IF NOT EXISTS `coremusteriyetkili` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `carihesapid` bigint(20) NOT NULL,
  `adi` varchar(50) NOT NULL,
  `soyadi` varchar(50) NOT NULL,
  `tcno` varchar(50) NOT NULL,
  `yetkisi` varchar(30) NOT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coremusteriyetkili: 1 rows
/*!40000 ALTER TABLE `coremusteriyetkili` DISABLE KEYS */;
INSERT INTO `coremusteriyetkili` (`id`, `carihesapid`, `adi`, `soyadi`, `tcno`, `yetkisi`, `telefon`) VALUES
	(1, 4, 'mehmet', 'celik', '545454545', 'TÃ¼m Yetkiler', '6465 6565 65 65');
/*!40000 ALTER TABLE `coremusteriyetkili` ENABLE KEYS */;


-- Dumping structure for table corebil.coreradiusservers
DROP TABLE IF EXISTS `coreradiusservers`;
CREATE TABLE IF NOT EXISTS `coreradiusservers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `servername` varchar(20) CHARACTER SET utf8 NOT NULL,
  `hostname` varchar(40) CHARACTER SET utf8 NOT NULL,
  `mysqlserver` varchar(40) NOT NULL,
  `mysqlusername` varchar(20) NOT NULL,
  `mysqlpassword` varchar(20) NOT NULL,
  `mysqldbname` varchar(20) NOT NULL,
  `radiusecretkey` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `servername` (`servername`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coreradiusservers: 2 rows
/*!40000 ALTER TABLE `coreradiusservers` DISABLE KEYS */;
INSERT INTO `coreradiusservers` (`id`, `servername`, `hostname`, `mysqlserver`, `mysqlusername`, `mysqlpassword`, `mysqldbname`, `radiusecretkey`) VALUES
	(1, 'Ä°stanbul', '212.68.36.177', '127.0.0.1', 'radiususer', 'radpass123', 'radiusdb', 'abcabc'),
	(2, 'AtaÅŸehir', '192.168.2.12', '192.168.2.26', 'radiususer', 'radpass123', 'radiusdb', 'abcabc');
/*!40000 ALTER TABLE `coreradiusservers` ENABLE KEYS */;


-- Dumping structure for table corebil.coreradiususers
DROP TABLE IF EXISTS `coreradiususers`;
CREATE TABLE IF NOT EXISTS `coreradiususers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET latin1 NOT NULL,
  `password` varchar(20) CHARACTER SET latin1 NOT NULL,
  `tarifeid` bigint(20) NOT NULL,
  `radiusserverid` bigint(20) NOT NULL,
  `tarih` datetime NOT NULL,
  `islemkullaniciadi` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `islemkullaniciid` bigint(20) DEFAULT NULL,
  `musteriid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Dumping data for table corebil.coreradiususers: 2 rows
/*!40000 ALTER TABLE `coreradiususers` DISABLE KEYS */;
INSERT INTO `coreradiususers` (`id`, `username`, `password`, `tarifeid`, `radiusserverid`, `tarih`, `islemkullaniciadi`, `islemkullaniciid`, `musteriid`) VALUES
	(38, 'abuzittin', '23434324', 3, 2, '2009-10-09 17:37:30', 'deneme', 1, 1020090007),
	(31, 'qwe', 'qwe', 1, 2, '2009-10-01 16:59:45', 'deneme', 1, 1);
/*!40000 ALTER TABLE `coreradiususers` ENABLE KEYS */;


-- Dumping structure for table corebil.corestokhareket
DROP TABLE IF EXISTS `corestokhareket`;
CREATE TABLE IF NOT EXISTS `corestokhareket` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gelengiden` varchar(5) CHARACTER SET latin1 NOT NULL,
  `urunid` bigint(20) NOT NULL,
  `kimekimdenid` bigint(20) DEFAULT NULL,
  `aciklama` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `tarih` date NOT NULL,
  `miktar` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Dumping data for table corebil.corestokhareket: 4 rows
/*!40000 ALTER TABLE `corestokhareket` DISABLE KEYS */;
INSERT INTO `corestokhareket` (`id`, `gelengiden`, `urunid`, `kimekimdenid`, `aciklama`, `tarih`, `miktar`) VALUES
	(13, 'Gelen', 3, 1, 'tttttt', '2006-08-10', 10),
	(11, 'Gelen', 3, 1, 'sdfsdf', '2009-05-09', 24),
	(10, 'Gelen', 2, 1, 'sdfsdf', '2009-05-09', 23),
	(12, 'Gelen', 2, 3, 'denemen', '2009-01-10', 150);
/*!40000 ALTER TABLE `corestokhareket` ENABLE KEYS */;


-- Dumping structure for table corebil.corestokkart
DROP TABLE IF EXISTS `corestokkart`;
CREATE TABLE IF NOT EXISTS `corestokkart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `urunadi` varchar(30) NOT NULL,
  `sondurum` bigint(20) NOT NULL,
  `birim` varchar(10) NOT NULL,
  `aciklama` varchar(20) NOT NULL,
  `barkod` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `urunadi` (`urunadi`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corestokkart: 2 rows
/*!40000 ALTER TABLE `corestokkart` DISABLE KEYS */;
INSERT INTO `corestokkart` (`id`, `urunadi`, `sondurum`, `birim`, `aciklama`, `barkod`) VALUES
	(4, '5 Ghz Anten', 0, 'adet', 'asdas', NULL),
	(3, '2.4 GHZ Anten', 5, 'adet', 'asdasdsad', NULL);
/*!40000 ALTER TABLE `corestokkart` ENABLE KEYS */;


-- Dumping structure for table corebil.coretarife
DROP TABLE IF EXISTS `coretarife`;
CREATE TABLE IF NOT EXISTS `coretarife` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `tarifeadi` varchar(30) NOT NULL,
  `tarifeno` varchar(10) NOT NULL,
  `uploadlimit` varchar(10) NOT NULL,
  `downloadlimit` varchar(10) NOT NULL,
  `fiyat` decimal(10,2) unsigned NOT NULL,
  `kotagigabyte` tinyint(3) unsigned NOT NULL,
  `aciklama` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tarifeadi` (`tarifeadi`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.coretarife: 5 rows
/*!40000 ALTER TABLE `coretarife` DISABLE KEYS */;
INSERT INTO `coretarife` (`id`, `tarifeadi`, `tarifeno`, `uploadlimit`, `downloadlimit`, `fiyat`, `kotagigabyte`, `aciklama`) VALUES
	(1, '1mbpsLimitsiz', '1', '256K', '1024K', 30.03, 0, '1mbps download 256k upload sÄ±nÄ±rsÄ±z'),
	(2, '4mbpsLimitsiz', '2', '1024K', '4M', 51.09, 0, '4mbps download 1 mbps upload sÄ±nÄ±rsÄ±z'),
	(3, '8mbpsLimitsiz', '3', '1024K', '8M', 60.00, 0, '8mbps download 1mbps upload'),
	(4, '1USunucuBarÄ±ndÄ±rma', '50', '0', '0', 120.00, 0, '1U iÃ§in barÄ±ndÄ±rma '),
	(5, '2UBarÄ±ndÄ±rma', '51', '0', '0', 160.00, 0, '2U iÃ§in barÄ±ndÄ±rma');
/*!40000 ALTER TABLE `coretarife` ENABLE KEYS */;


-- Dumping structure for table corebil.coreusers
DROP TABLE IF EXISTS `coreusers`;
CREATE TABLE IF NOT EXISTS `coreusers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET latin1 NOT NULL,
  `password` varchar(64) NOT NULL,
  `fullname` varchar(64) CHARACTER SET latin1 DEFAULT NULL,
  `cari` varchar(1) DEFAULT 'N',
  `fatura` varchar(1) DEFAULT 'N',
  `kasa` varchar(1) DEFAULT 'N',
  `banka` varchar(1) DEFAULT 'N',
  `stok` varchar(1) DEFAULT 'N',
  `sorun` varchar(1) DEFAULT 'N',
  `ayarlar` varchar(1) DEFAULT 'N',
  `erisim` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- Dumping data for table corebil.coreusers: 8 rows
/*!40000 ALTER TABLE `coreusers` DISABLE KEYS */;
INSERT INTO `coreusers` (`id`, `username`, `password`, `fullname`, `cari`, `fatura`, `kasa`, `banka`, `stok`, `sorun`, `ayarlar`, `erisim`) VALUES
	(22, 'mehmetcelik', 'c4ca4238a0b923820dcc509a6f75849b', 'mehmet celik', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'N', 'Y'),
	(21, 'a', '0cc175b9c0f1b6a831c399e269772661', 'a', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
	(20, '1', 'c4ca4238a0b923820dcc509a6f75849b', 'M.Ali Vardar', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(19, 'alivardar', '27f2f84c217835123b2920c1d2d19ead', 'M.Ali Vardar', 'N', 'N', 'N', 'N', 'N', 'N', 'N', 'N'),
	(23, 'huseyinciftci', 'c4ca4238a0b923820dcc509a6f75849b', ' huseyin ciftci', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(24, 'birolgunay', 'c4ca4238a0b923820dcc509a6f75849b', 'birol gunay', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(25, 'dilemkocaman', 'c4ca4238a0b923820dcc509a6f75849b', 'dilem kocaman', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y'),
	(26, 'melihcelik', '4297f44b13955235245b2497399d7a93', ' Melih Ã‡elik', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y');
/*!40000 ALTER TABLE `coreusers` ENABLE KEYS */;


-- Dumping structure for table corebil.corevergiler
DROP TABLE IF EXISTS `corevergiler`;
CREATE TABLE IF NOT EXISTS `corevergiler` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `kdvorani` decimal(10,0) DEFAULT NULL,
  `oivorani` decimal(10,0) DEFAULT NULL,
  `damgavergisi` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table corebil.corevergiler: 1 rows
/*!40000 ALTER TABLE `corevergiler` DISABLE KEYS */;
INSERT INTO `corevergiler` (`id`, `kdvorani`, `oivorani`, `damgavergisi`) VALUES
	(1, 18, 5, NULL);
/*!40000 ALTER TABLE `corevergiler` ENABLE KEYS */;


-- Dumping structure for trigger corebil.bankaharekettodigertablolar
DROP TRIGGER IF EXISTS `bankaharekettodigertablolar`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `bankaharekettodigertablolar` AFTER INSERT ON `corebankahareket` FOR EACH ROW BEGIN
 
   
  if new.hareketturu='BTediye' and new.carihesapid is null then		
	insert into corekasahareket (tarih, aciklama, borcalacak, evrakno, tutar, hareketturu) 
		values (new.tarih, new.aciklama, 'borc', new.evrakno, new.tutar, 'Tahsilat');	
  end if;

  if new.hareketturu='BTahsilat' and new.carihesapid is null then		
	insert into corekasahareket (tarih, aciklama, borcalacak, evrakno, tutar, hareketturu) 
		values (new.tarih, new.aciklama, 'alacak', new.evrakno, new.tutar, 'Tediye');	
  end if;


  SET @INC = (select sondurum from corebankalar where id=new.bankaid);
  if new.hareketturu='BTahsilat' then		
	update corebankalar set sondurum=(new.tutar + @INC) where id=new.bankaid;		
	else 
	update corebankalar set sondurum=(@INC - new.tutar) where id=new.bankaid;
  end if;

 
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger corebil.cariharekettodigertablolar
DROP TRIGGER IF EXISTS `cariharekettodigertablolar`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `cariharekettodigertablolar` AFTER INSERT ON `corecarihareket` FOR EACH ROW BEGIN
 
   
  if new.hareketturu='Tahsilat' then		
	insert into corekasahareket (tarih, aciklama, borcalacak, evrakno, tutar, carihesapid, hareketturu) 
		values (new.tarih, new.aciklama, 'borc', new.evrakno, new.tutar, new.carihesapid, 'Tahsilat');	
  end if;

  if new.hareketturu='Tediye' then		
	insert into corekasahareket (tarih, aciklama, borcalacak, evrakno, tutar, carihesapid, hareketturu) 
		values (new.tarih, new.aciklama, 'alacak', new.evrakno, new.tutar, new.carihesapid, 'Tediye');	
  end if;

  if new.hareketturu='BTahsilat' then		
	insert into corebankahareket (bankaid, tarih, aciklama, borcalacak, evrakno, tutar, carihesapid, hareketturu) 
		values (new.bankaid, new.tarih, new.aciklama, 'borc', new.evrakno, new.tutar, new.carihesapid, 'BTahsilat');	
  end if;

  if new.hareketturu='BTediye' then		
	insert into corebankahareket (bankaid, tarih, aciklama, borcalacak, evrakno, tutar, carihesapid, hareketturu) 
		values (new.bankaid, new.tarih, new.aciklama, 'alacak', new.evrakno, new.tutar, new.carihesapid, 'BTediye');	
  end if;


 
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;


-- Dumping structure for trigger corebil.stokhareketisleme
DROP TRIGGER IF EXISTS `stokhareketisleme`;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `stokhareketisleme` AFTER INSERT ON `corestokhareket` FOR EACH ROW BEGIN
  
  SET @INC = (select sondurum from corestokkart where id=new.urunid);
  if new.gelengiden='gelen' then		
	update corestokkart set sondurum=(new.miktar + @INC) where id=new.urunid;		
	else 
	update corestokkart set sondurum=(@INC - new.miktar) where id=new.urunid;
  end if;
 
 
END//
DELIMITER ;
SET SQL_MODE=@OLD_SQL_MODE;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
