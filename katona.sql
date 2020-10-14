-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Oct 14, 2020 at 06:52 AM
-- Server version: 8.0.18
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
-- Database: `katona`
--

-- --------------------------------------------------------

--
-- Table structure for table `c_trieda`
--

DROP TABLE IF EXISTS `c_trieda`;
CREATE TABLE IF NOT EXISTS `c_trieda` (
  `idc_trieda` int(9) NOT NULL AUTO_INCREMENT,
  `nazovc_trieda` varchar(50) COLLATE utf8_slovak_ci NOT NULL,
  `skupina` int(1) NOT NULL,
  PRIMARY KEY (`idc_trieda`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `c_trieda`
--

INSERT INTO `c_trieda` (`idc_trieda`, `nazovc_trieda`, `skupina`) VALUES
(1, '1.A', 1),
(2, '2.A', 2),
(3, '3.B', 3);

-- --------------------------------------------------------

--
-- Table structure for table `preklad`
--

DROP TABLE IF EXISTS `preklad`;
CREATE TABLE IF NOT EXISTS `preklad` (
  `idpreklad` int(9) NOT NULL AUTO_INCREMENT,
  `jazyk` varchar(2) COLLATE utf8_slovak_ci NOT NULL,
  `retazec` varchar(100) COLLATE utf8_slovak_ci NOT NULL,
  `preklad` text COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`idpreklad`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `preklad`
--

INSERT INTO `preklad` (`idpreklad`, `jazyk`, `retazec`, `preklad`) VALUES
(1, 'sk', 'pfg', 'Programovacie a interaktivne prostredia'),
(2, 'en', 'pfg', 'Programming and interactive enviroments');

-- --------------------------------------------------------

--
-- Table structure for table `rozvrh`
--

DROP TABLE IF EXISTS `rozvrh`;
CREATE TABLE IF NOT EXISTS `rozvrh` (
  `idrozvrh` int(9) NOT NULL AUTO_INCREMENT,
  `den` int(3) NOT NULL,
  `hodina` int(3) NOT NULL,
  `predmet` varchar(20) COLLATE utf8_slovak_ci NOT NULL,
  `trieda` varchar(3) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`idrozvrh`)
) ENGINE=MyISAM AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci;

--
-- Dumping data for table `rozvrh`
--

INSERT INTO `rozvrh` (`idrozvrh`, `den`, `hodina`, `predmet`, `trieda`) VALUES
(6, 0, 0, 'PGC', '3.B'),
(7, 0, 1, 'PGC', '3.B'),
(8, 0, 2, 'ANJ', '3.B'),
(9, 0, 3, 'ZEQ', '3.B'),
(10, 0, 4, 'PRO', '3.B'),
(11, 0, 5, 'PRO', '3.B'),
(12, 0, 6, 'SIE', '3.B'),
(13, 0, 7, 'SIE', '3.B'),
(14, 1, 2, 'OBN', '3.B'),
(15, 1, 3, 'MAT', '3.B'),
(16, 1, 4, 'ZEQ', '3.B'),
(17, 1, 5, 'TKM', '3.B'),
(18, 1, 6, 'RSE', '3.B'),
(19, 1, 7, 'TSV', '3.B'),
(20, 2, 0, 'PFG', '3.B'),
(21, 2, 0, 'PFG', '3.B'),
(22, 2, 1, 'PFG', '3.B'),
(23, 2, 2, 'MAT', '3.B'),
(24, 2, 3, 'XSS', '3.B'),
(25, 2, 4, 'ANJ', '3.B'),
(26, 2, 5, 'SJL', '3.B'),
(27, 2, 6, 'XSS', '3.B'),
(28, 3, 1, 'XSS', '3.B'),
(29, 3, 1, 'XSS', '3.B'),
(30, 3, 2, 'MAT', '3.B'),
(31, 3, 3, 'ANJ', '3.B'),
(32, 3, 4, 'SJL', '3.B'),
(33, 3, 5, 'XSS', '3.B'),
(34, 3, 6, 'PJL', '3.B'),
(35, 3, 7, 'PJL', '3.B'),
(36, 4, 0, 'PXO', '3.B'),
(37, 4, 1, 'PXO', '3.B'),
(38, 4, 2, 'PXO', '3.B'),
(39, 4, 3, 'TSV', '3.B'),
(40, 4, 4, 'TKM', '3.B'),
(41, 4, 5, 'SJL', '3.B'),
(42, 1, 0, 'IDK', '2.B'),
(43, 1, 1, 'IDK', '2.B'),
(44, 2, 7, 'IDK', '2.B'),
(45, 3, 0, 'BST', '1.B'),
(46, 3, 0, 'BST', '1.B'),
(47, 4, 6, 'BST', '1.B'),
(48, 4, 7, 'BST', '1.B');

-- --------------------------------------------------------

--
-- Table structure for table `uzivatelia`
--

DROP TABLE IF EXISTS `uzivatelia`;
CREATE TABLE IF NOT EXISTS `uzivatelia` (
  `iduzivatelia` int(9) NOT NULL AUTO_INCREMENT,
  `meno` varchar(50) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `priezvisko` varchar(100) CHARACTER SET utf16 COLLATE utf16_slovak_ci NOT NULL,
  `datum_narodenia` date NOT NULL,
  `id_c_trieda` int(3) NOT NULL DEFAULT '0',
  `logname` varchar(150) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_slovak_ci NOT NULL,
  PRIMARY KEY (`iduzivatelia`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_slovak_ci COMMENT='toto je tabulka pouzivatelov od kubicu 14.10.2020';

--
-- Dumping data for table `uzivatelia`
--

INSERT INTO `uzivatelia` (`iduzivatelia`, `meno`, `priezvisko`, `datum_narodenia`, `id_c_trieda`, `logname`, `password`) VALUES
(1, 'Lukáš', 'Katona', '2002-11-14', 0, 'LukoKat', '7aff03960854665c74950f430469641f755d583c'),
(2, 'Dan', 'Valníček', '2002-10-25', 0, 'juceShady', '4b84b15bff6ee5796152495a230e45e3d7e947d9'),
(3, 'Jakub', 'Vdrážka', '2002-12-21', 0, 'abs3nce', '0466f855273bca9af4455a4d0245314b2d154b62'),
(4, 'Ľuboš', 'Lošonský', '2002-04-23', 0, 'Astimos', '72765ed8df48e6eb847772fc1e9aa6fb09185464');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
