-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Erstellungszeit: 10. Sep 2015 um 07:28
-- Server Version: 5.6.17
-- PHP-Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `qinx`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `nodes`
--

DROP TABLE IF EXISTS `nodes`;
CREATE TABLE IF NOT EXISTS `nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `node_type` int(11) NOT NULL,
  `sorting` int(11) NOT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Daten für Tabelle `nodes`
--

INSERT INTO `nodes` (`id`, `parent`, `name`, `node_type`, `sorting`, `starttime`, `endtime`, `created_at`, `updated_at`, `deleted_at`, `properties`) VALUES
(1, 0, 'Qinx', 2, 0, NULL, NULL, '2015-02-14 23:00:00', '2015-02-14 23:00:00', NULL, NULL),
(2, 0, '', 2, 0, NULL, NULL, '2015-09-08 01:39:08', '2015-09-08 01:39:08', NULL, '{"title":"Lala"}'),
(3, 0, '', 1, 0, NULL, NULL, '2015-09-08 01:39:20', '2015-09-08 01:39:20', NULL, '{"header":"LalA"}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `node_types`
--

DROP TABLE IF EXISTS `node_types`;
CREATE TABLE IF NOT EXISTS `node_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `namespace` varchar(255) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `node_types`
--

INSERT INTO `node_types` (`id`, `name`, `namespace`, `updated_at`, `created_at`) VALUES
(1, 'Header', 'Cms\\Nodes\\Header', '2015-02-10 04:00:00', '2015-02-10 04:00:00'),
(2, 'Page', 'Cms\\Nodes\\Page', '2015-02-12 23:00:00', '2015-02-12 23:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
