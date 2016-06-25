-- MySQL dump 10.13  Distrib 5.6.22, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: vientin_campaign_marketing
-- ------------------------------------------------------
-- Server version	5.5.42-log

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
-- Table structure for table `authassignment`
--

DROP TABLE IF EXISTS `authassignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authassignment` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `userid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`itemname`,`userid`),
  CONSTRAINT `authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authassignment`
--

LOCK TABLES `authassignment` WRITE;
/*!40000 ALTER TABLE `authassignment` DISABLE KEYS */;
INSERT INTO `authassignment` VALUES ('Admin','1',NULL,'N;');
/*!40000 ALTER TABLE `authassignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authitem`
--

DROP TABLE IF EXISTS `authitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authitem` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `bizrule` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authitem`
--

LOCK TABLES `authitem` WRITE;
/*!40000 ALTER TABLE `authitem` DISABLE KEYS */;
INSERT INTO `authitem` VALUES ('Admin',2,NULL,NULL,'N;'),('Authenticated',2,NULL,NULL,'N;'),('Guest',2,NULL,NULL,'N;');
/*!40000 ALTER TABLE `authitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authitemchild`
--

DROP TABLE IF EXISTS `authitemchild`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authitemchild` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `authitemchild_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `authitemchild_ibfk_2` FOREIGN KEY (`child`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authitemchild`
--

LOCK TABLES `authitemchild` WRITE;
/*!40000 ALTER TABLE `authitemchild` DISABLE KEYS */;
/*!40000 ALTER TABLE `authitemchild` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rights`
--

DROP TABLE IF EXISTS `rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rights` (
  `itemname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`itemname`),
  CONSTRAINT `rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `AuthItem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rights`
--

LOCK TABLES `rights` WRITE;
/*!40000 ALTER TABLE `rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Admin','Administrator'),(2,'Demo','Demo');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles_fields`
--

DROP TABLE IF EXISTS `profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles_fields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `varname` varchar(50) NOT NULL,
  `title` varchar(255) NOT NULL,
  `field_type` varchar(50) NOT NULL,
  `field_size` varchar(15) NOT NULL DEFAULT '0',
  `field_size_min` varchar(15) NOT NULL DEFAULT '0',
  `required` int(1) NOT NULL DEFAULT '0',
  `match` varchar(255) NOT NULL DEFAULT '',
  `range` varchar(255) NOT NULL DEFAULT '',
  `error_message` varchar(255) NOT NULL DEFAULT '',
  `other_validator` varchar(5000) NOT NULL DEFAULT '',
  `default` varchar(255) NOT NULL DEFAULT '',
  `widget` varchar(255) NOT NULL DEFAULT '',
  `widgetparams` varchar(5000) NOT NULL DEFAULT '',
  `position` int(3) NOT NULL DEFAULT '0',
  `visible` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `varname` (`varname`,`widget`,`visible`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles_fields`
--

LOCK TABLES `profiles_fields` WRITE;
/*!40000 ALTER TABLE `profiles_fields` DISABLE KEYS */;
INSERT INTO `profiles_fields` VALUES (1,'lastname','Last Name','VARCHAR','50','3',1,'','','Incorrect Last Name (length between 3 and 50 characters).','','','','',1,3),(2,'firstname','First Name','VARCHAR','50','3',1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3);
/*!40000 ALTER TABLE `profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promote_codes`
--

DROP TABLE IF EXISTS `promote_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promote_codes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `tenant_info` text,
  `user_info` text,
  `wifi_area` text,
  `parameters` text,
  `created_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promote_codes`
--

LOCK TABLES `promote_codes` WRITE;
/*!40000 ALTER TABLE `promote_codes` DISABLE KEYS */;
INSERT INTO `promote_codes` VALUES (1,'8dffd7bc','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:17:30',0,'2016-05-26 19:17:30'),(2,'8693f0e7','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:19:11',0,'2016-05-26 19:19:11'),(3,'83d65f12','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:19:21',0,'2016-05-26 19:19:21'),(4,'9e611474','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:21:35',0,'2016-05-26 19:21:35'),(5,'ab3a9d4f','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:31:31',0,'2016-05-26 19:31:31'),(6,'5b488ea7','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:32:51',0,'2016-05-26 19:32:51'),(7,'4658f792','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:33:32',0,'2016-05-26 19:33:32'),(8,'5ec1a8','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:49:48',0,'2016-05-26 19:49:48'),(9,'d9e197cd','20%','\"\"','\"{}\"','\"\"','\"\"','2016-06-08 07:53:38',0,'2016-06-08 07:53:38'),(10,'1a514732','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 19:39:11',0,'2016-06-08 19:39:11'),(11,'9f3a4539','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 19:41:00',0,'2016-06-08 19:41:00'),(12,'d39a8c','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 19:41:53',0,'2016-06-08 19:41:53'),(13,'e77cd260','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 19:53:55',0,'2016-06-08 19:53:55'),(14,'f5ff38b4','20%','\"\"',NULL,'\"\"','\"\"','2016-06-25 17:44:05',0,'2016-06-25 17:44:05');
/*!40000 ALTER TABLE `promote_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requests`
--

DROP TABLE IF EXISTS `requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requests`
--

LOCK TABLES `requests` WRITE;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` VALUES (8,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-08 19:06:41'),(9,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-08 19:06:53'),(10,'{\"User\":\"\",\"Tenant\":\"\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-25 17:06:42'),(11,'{\"User\":\"\",\"Tenant\":\"\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-25 17:06:43'),(12,'{\"User\":\"\",\"Tenant\":\"\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-25 17:06:43'),(13,'{\"User\":\"\",\"Tenant\":\"\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-25 17:06:43'),(14,'{\"User\":\"\",\"Tenant\":\"\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-25 17:06:44');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2016-05-08 16:46:39','0000-00-00 00:00:00',1,1,0),(2,'demo','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','demo@example.com','099f825543f7850cc038b90aaff39fac','2016-05-08 16:46:39','0000-00-00 00:00:00',0,1,0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-25 23:43:11
