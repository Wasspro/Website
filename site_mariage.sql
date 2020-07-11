-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  Dim 16 déc. 2018 à 21:24
-- Version du serveur :  5.7.23
-- Version de PHP :  7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `site_mariage`
--

-- --------------------------------------------------------

--
-- Structure de la table `buffet`
--

DROP TABLE IF EXISTS `buffet`;
CREATE TABLE IF NOT EXISTS `buffet` (
  `numtable` int(2) DEFAULT NULL,
  `ville` varchar(255) DEFAULT NULL,
  `idreservation` int(5) DEFAULT NULL,
  UNIQUE KEY `idreservation` (`idreservation`),
  KEY `ville` (`ville`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `invitation`
--

DROP TABLE IF EXISTS `invitation`;
CREATE TABLE IF NOT EXISTS `invitation` (
  `idinvitation` int(5) NOT NULL,
  `e-mail` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`idinvitation`),
  UNIQUE KEY `idinvitation` (`idinvitation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `invitation`
--

INSERT INTO `invitation` (`idinvitation`, `e-mail`) VALUES
(92370, 'Admin'),
(45987, 'adresse'),
(12875, 'adresse'),
(95437, 'adresse'),
(89763, 'adresse'),
(43724, 'adresse'),
(73465, 'adresse'),
(13548, 'adresse'),
(23675, 'adresse'),
(76483, 'adresse');

-- --------------------------------------------------------

--
-- Structure de la table `mariage`
--

DROP TABLE IF EXISTS `mariage`;
CREATE TABLE IF NOT EXISTS `mariage` (
  `hotel` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ville` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `jour` date DEFAULT NULL,
  UNIQUE KEY `ville` (`ville`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Déchargement des données de la table `mariage`
--

INSERT INTO `mariage` (`hotel`, `ville`, `jour`) VALUES
('four seasons', 'tunis', '2019-04-27'),
('tour eiffel', 'paris', '2018-12-22');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `entree` varchar(255) COLLATE utf8_bin NOT NULL,
  `plat` varchar(255) COLLATE utf8_bin NOT NULL,
  `dessert` varchar(255) COLLATE utf8_bin NOT NULL,
  `idreservation` int(5) DEFAULT NULL,
  UNIQUE KEY `idreservation_2` (`idreservation`),
  KEY `idreservation` (`idreservation`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
CREATE TABLE IF NOT EXISTS `reservation` (
  `idreservation` int(5) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prenom` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`idreservation`),
  UNIQUE KEY `prenom` (`prenom`)
) ENGINE=MyISAM AUTO_INCREMENT=10183 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
