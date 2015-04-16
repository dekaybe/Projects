-- MySQL dump 10.10
--
-- Host: localhost    Database: srgp
-- ------------------------------------------------------
-- Server version	5.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `srgp_voters`
--

DROP TABLE IF EXISTS `srgp_voters`;
CREATE TABLE `srgp_voters` (
  `v_id` int(7) NOT NULL auto_increment,
  `v_PD` char(2) collate utf8_unicode_ci default NULL,
  `v_ENO` int(7) default NULL,
  `v_Title` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Forename` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Middle` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Surname` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_1` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_2` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_3` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_4` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_5` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_6` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Line_7` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Postcode` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_Country` varchar(100) collate utf8_unicode_ci default NULL,
  `v_Address_md5` char(32) collate utf8_unicode_ci default NULL,
  `v_import_source` char(1) collate utf8_unicode_ci default NULL,
  `v_leaflet_num` char(1) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`v_id`),
  UNIQUE KEY `c2` (`v_PD`,`v_ENO`),
  KEY `idx3` (`v_Address_md5`),
  KEY `idx_v_ENO` (`v_ENO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds voters';
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-30 21:48:00
