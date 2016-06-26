-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: dbapp
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.12.04.1

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
INSERT INTO `authitem` VALUES ('Admin',2,NULL,NULL,'N;'),('Authenticated',2,NULL,NULL,'N;'),('Guest',2,NULL,NULL,'N;'),('Promote.View',0,'Promote.View',NULL,'N;');
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
-- Table structure for table `tbl_profiles`
--

DROP TABLE IF EXISTS `tbl_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_profiles` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `lastname` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  CONSTRAINT `user_profile_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_profiles`
--

LOCK TABLES `tbl_profiles` WRITE;
/*!40000 ALTER TABLE `tbl_profiles` DISABLE KEYS */;
INSERT INTO `tbl_profiles` VALUES (1,'Admin','Administrator'),(2,'Demo','Demo');
/*!40000 ALTER TABLE `tbl_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_profiles_fields`
--

DROP TABLE IF EXISTS `tbl_profiles_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_profiles_fields` (
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
-- Dumping data for table `tbl_profiles_fields`
--

LOCK TABLES `tbl_profiles_fields` WRITE;
/*!40000 ALTER TABLE `tbl_profiles_fields` DISABLE KEYS */;
INSERT INTO `tbl_profiles_fields` VALUES (1,'lastname','Last Name','VARCHAR','50','3',1,'','','Incorrect Last Name (length between 3 and 50 characters).','','','','',1,3),(2,'firstname','First Name','VARCHAR','50','3',1,'','','Incorrect First Name (length between 3 and 50 characters).','','','','',0,3);
/*!40000 ALTER TABLE `tbl_profiles_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_promote_codes`
--

DROP TABLE IF EXISTS `tbl_promote_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_promote_codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `discount` varchar(255) NOT NULL,
  `tenant_info` text,
  `user_info` text,
  `wifi_area` text,
  `parameters` text,
  `created_at` datetime NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_promote_codes`
--

LOCK TABLES `tbl_promote_codes` WRITE;
/*!40000 ALTER TABLE `tbl_promote_codes` DISABLE KEYS */;
INSERT INTO `tbl_promote_codes` VALUES (0,'8dffd7bc','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:17:30',0,'2016-05-26 19:17:30'),(0,'8693f0e7','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:19:11',0,'2016-05-26 19:19:11'),(0,'83d65f12','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:19:21',0,'2016-05-26 19:19:21'),(0,'9e611474','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:21:35',0,'2016-05-26 19:21:35'),(0,'ab3a9d4f','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:31:31',0,'2016-05-26 19:31:31'),(0,'5b488ea7','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:32:51',0,'2016-05-26 19:32:51'),(0,'4658f792','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:33:32',0,'2016-05-26 19:33:32'),(0,'5ec1a8','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-26 19:49:48',0,'2016-05-26 19:49:48'),(0,'f1df2a86','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-30 22:49:45',0,'2016-05-30 22:49:45'),(0,'7a295de7','20%','{\"id\":367}','{\"name\":\"John\", \"surname\":\"Doe\", \"gender\":\"Male\", \"username\":\"john_user\", \"email\":\"example@example.com\"}','','','2016-05-30 22:57:01',0,'2016-05-30 22:57:01'),(0,'395d9b2b','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-05-30 23:27:07',0,'2016-05-30 23:27:07'),(0,'6abb3737','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-05-30 23:29:22',0,'2016-05-30 23:29:22'),(0,'1e925f27','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-05-30 23:29:25',0,'2016-05-30 23:29:25'),(0,'099c73c8','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-05-30 23:33:05',0,'2016-05-30 23:33:05'),(0,'fa647f3f','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-05-31 00:17:59',0,'2016-05-31 00:17:59'),(0,'9ee8f861','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 11:33:09',0,'2016-06-02 11:33:09'),(0,'5551187','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 11:33:25',0,'2016-06-02 11:33:25'),(0,'6582e4ed','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 11:38:52',0,'2016-06-02 11:38:52'),(0,'01d9f86e','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 11:49:04',0,'2016-06-02 11:49:04'),(0,'58743ac3','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:11:35',0,'2016-06-02 12:11:35'),(0,'93eb11b3','20%','{\"name\":\"Tenant Test\",\"wifi_areas\":\"\"}','{\"name\":\"John\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:27:06',0,'2016-06-02 12:27:06'),(0,'115c6212','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:28:39',0,'2016-06-02 12:28:39'),(0,'6c8fb297','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:33:58',0,'2016-06-02 12:33:58'),(0,'e8dfeed2','20%',NULL,'{\"name\":\"John\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:47:14',0,'2016-06-02 12:47:14'),(0,'b44d0523','20%',NULL,'{\"name\":\"John\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:47:27',0,'2016-06-02 12:47:27'),(0,'43c470ad','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:48:34',0,'2016-06-02 12:48:34'),(0,'dc0f01a5','20%',NULL,'{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:50:19',0,'2016-06-02 12:50:19'),(0,'5f282f8d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 12:56:09',0,'2016-06-02 12:56:09'),(0,'49987f10','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 13:04:16',0,'2016-06-02 13:04:16'),(0,'dd4c6968','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-02 13:09:24',0,'2016-06-02 13:09:24'),(0,'1a43536d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-06 09:00:32',0,'2016-06-06 09:00:32'),(0,'f534685c','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:30:10',0,'2016-06-07 09:30:10'),(0,'c78cfdc6','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:32:52',0,'2016-06-07 09:32:52'),(0,'2aa23ac5','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:33:08',0,'2016-06-07 09:33:08'),(0,'dd3d8a31','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:33:09',0,'2016-06-07 09:33:09'),(0,'c5bff5fd','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:33:10',0,'2016-06-07 09:33:10'),(0,'b8ceae65','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:33:10',0,'2016-06-07 09:33:10'),(0,'4ffbfbd','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:33:33',0,'2016-06-07 09:33:33'),(0,'1e46df5d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:37:32',0,'2016-06-07 09:37:32'),(0,'d5ef2757','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-07 09:37:44',0,'2016-06-07 09:37:44'),(0,'a6e82a50','20%',NULL,'{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\"}',NULL,NULL,'2016-06-07 09:42:45',0,'2016-06-07 09:42:45'),(0,'1f21d741','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\",\"hotspots_list\":\"\",\"readOnly\":\"true\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"status\":\"online\",\"username\":\"john_user\"}','{\"id\":\"367\"}',NULL,'2016-06-07 09:46:14',0,'2016-06-07 09:46:14'),(0,'ec6b074d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\",\"hotspots_list\":\"\",\"readOnly\":\"true\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"status\":\"online\",\"username\":\"john_user\"}','{\"id\":\"367\"}',NULL,'2016-06-07 09:46:16',0,'2016-06-07 09:46:16'),(0,'b6111663','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-08 08:47:32',0,'2016-06-08 08:47:32'),(0,'a84489','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-08 11:25:25',0,'2016-06-08 11:25:25'),(0,'e913927c','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 12:38:00',0,'2016-06-08 12:38:00'),(0,'d53f6e2b','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"\\\", \\\"surname\\\":\\\"\\\", \\\"gender\\\":\\\"\\\", \\\"username\\\":\\\"\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 12:38:20',0,'2016-06-08 12:38:20'),(0,'c9736289','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"\\\", \\\"surname\\\":\\\"\\\", \\\"gender\\\":\\\"\\\", \\\"username\\\":\\\"\\\", \\\"email\\\":\\\"\\\"}\"','\"\"','\"\"','2016-06-08 12:38:26',0,'2016-06-08 12:38:26'),(0,'b8b77dca','20%','\"{\\\"id\\\":367}\"','\"{}\"','\"\"','\"\"','2016-06-08 12:38:47',0,'2016-06-08 12:38:47'),(0,'be842752','20%','\"{\\\"id\\\":367}\"','\"{}\"','\"\"','\"\"','2016-06-08 12:38:50',0,'2016-06-08 12:38:50'),(0,'cfa9eb41','20%','\"\"','\"{}\"','\"\"','\"\"','2016-06-08 12:40:29',0,'2016-06-08 12:40:29'),(0,'83b5757d','20%','\"\"','\"{}\"','\"\"','\"\"','2016-06-08 12:42:41',0,'2016-06-08 12:42:41'),(0,'7cd75d7f','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-08 12:43:34',0,'2016-06-08 12:43:34'),(0,'620d87e0','20%','\"\"','\"{}\"','\"\"','\"\"','2016-06-08 13:01:32',0,'2016-06-08 13:01:32'),(0,'72966ed2','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-09 00:58:53',0,'2016-06-09 00:58:53'),(0,'6197ae62','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-09 00:59:31',0,'2016-06-09 00:59:31'),(0,'f3395de3','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-09 00:59:44',0,'2016-06-09 00:59:44'),(0,'01c9628','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-09 16:08:41',0,'2016-06-09 16:08:41'),(0,'32b3937f','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-16 10:09:05',0,'2016-06-16 10:09:05'),(0,'e7fffec3','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-16 10:23:00',0,'2016-06-16 10:23:00'),(0,'b998da78','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"}',NULL,NULL,'2016-06-16 10:23:13',0,'2016-06-16 10:23:13'),(0,'0041e723','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-16 22:49:28',0,'2016-06-16 22:49:28'),(0,'7a41a851','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-16 22:49:39',0,'2016-06-16 22:49:39'),(0,'ad78b1a2','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-19 23:44:52',0,'2016-06-19 23:44:52'),(0,'39cf5405','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-19 23:46:29',0,'2016-06-19 23:46:29'),(0,'9b14063a','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-19 23:50:54',0,'2016-06-19 23:50:54'),(0,'c3e8498d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-19 23:59:25',0,'2016-06-19 23:59:25'),(0,'6d22ec','20%','{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\"}','{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"}','{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"}',NULL,'2016-06-21 23:37:01',0,'2016-06-21 23:37:01'),(0,'fab84142','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"}',NULL,NULL,'2016-06-25 08:19:14',0,'2016-06-25 08:19:14'),(0,'8ca3d85d','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"}',NULL,NULL,'2016-06-25 08:20:28',0,'2016-06-25 08:20:28'),(0,'41fa7727','20%','{\"id\":\"366\",\"name\":\"Tenant Test\"}','{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"}',NULL,NULL,'2016-06-25 22:12:32',0,'2016-06-25 22:12:32'),(0,'1c011b95','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-26 02:53:04',0,'2016-06-26 02:53:04'),(0,'8c6aac0e','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-26 03:11:34',0,'2016-06-26 03:11:34'),(0,'ad5263dc','20%','\"{\\\"id\\\":367}\"','\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\"','\"\"','\"\"','2016-06-26 13:24:26',0,'2016-06-26 13:24:26');
/*!40000 ALTER TABLE `tbl_promote_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_requests`
--

DROP TABLE IF EXISTS `tbl_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(8000) DEFAULT NULL,
  `posted_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_requests`
--

LOCK TABLES `tbl_requests` WRITE;
/*!40000 ALTER TABLE `tbl_requests` DISABLE KEYS */;
INSERT INTO `tbl_requests` VALUES (1,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-09 00:06:59'),(2,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"f5d99ffb53064860127cf786d54d887b\",\"production\":\"\",\"installation_id\":\"5c078ff2078ba27e88d140ea677e037e\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-09 16:06:08'),(3,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"f5d99ffb53064860127cf786d54d887b\",\"production\":\"\",\"installation_id\":\"5c078ff2078ba27e88d140ea677e037e\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-16 10:06:09'),(4,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"f5d99ffb53064860127cf786d54d887b\",\"production\":\"\",\"installation_id\":\"5c078ff2078ba27e88d140ea677e037e\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-16 10:06:23'),(5,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"f5d99ffb53064860127cf786d54d887b\",\"production\":\"\",\"installation_id\":\"5c078ff2078ba27e88d140ea677e037e\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-16 10:06:23'),(6,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"339f7a2e087a159e6a31501649027a77\",\"production\":\"\",\"installation_id\":\"d12018c6ffeb826fb62cb73926b09cad\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-16 22:06:49'),(7,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"339f7a2e087a159e6a31501649027a77\",\"production\":\"\",\"installation_id\":\"d12018c6ffeb826fb62cb73926b09cad\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-16 22:06:49'),(8,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"339f7a2e087a159e6a31501649027a77\",\"production\":\"\",\"installation_id\":\"d12018c6ffeb826fb62cb73926b09cad\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-19 23:06:44'),(9,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"339f7a2e087a159e6a31501649027a77\",\"production\":\"\",\"installation_id\":\"d12018c6ffeb826fb62cb73926b09cad\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-19 23:06:46'),(10,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\",\"users_list\":\"[\'de6f9a44-510b-11e3-9edb-525400c317f8\']\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"339f7a2e087a159e6a31501649027a77\",\"production\":\"\",\"installation_id\":\"d12018c6ffeb826fb62cb73926b09cad\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-19 23:06:50'),(11,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"ca71cdff3e485e1760e92d1ddd50b7ca\",\"production\":\"\",\"installation_id\":\"adc29c9096701175ac1889621cbde074\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-19 23:06:59'),(12,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\",\"wifi_areas\":\"\",\"tenants_list\":\"[1]\"},\"WifiArea\":{\"id\":\"367\",\"name\":\"WifiArea Test\",\"hotspots_list\":\"\",\"categories\":\"Unknow\",\"category\":\"Unknow\"},\"User\":{\"id\":\"de6f9a44-510b-11e3-9edb-525400c317f8\",\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"birth_date\":\"1970-01-01\",\"username\":\"john_user\",\"email\":\"example@example.com\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"ca71cdff3e485e1760e92d1ddd50b7ca\",\"production\":\"\",\"installation_id\":\"adc29c9096701175ac1889621cbde074\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"},\"MarketPlace\":{\"apps\":\"[{\\\"id\\\":\\\"104\\\"}]\"}}','2016-06-21 23:06:37'),(13,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"605e22792dffa77fdb85013fa8bf1a6a\",\"production\":\"\",\"installation_id\":\"6badcb9a0bb35767daeb70eef3f14cd3\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-25 08:06:19'),(14,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"605e22792dffa77fdb85013fa8bf1a6a\",\"production\":\"\",\"installation_id\":\"6badcb9a0bb35767daeb70eef3f14cd3\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-25 08:06:20'),(15,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"User\":{\"name\":\"John\",\"surname\":\"Doe\",\"gender\":\"Male\",\"username\":\"john_user\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"605e22792dffa77fdb85013fa8bf1a6a\",\"production\":\"\",\"installation_id\":\"6badcb9a0bb35767daeb70eef3f14cd3\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-25 22:06:12'),(16,'{\"Tenant\":{\"id\":\"366\",\"name\":\"Tenant Test\"},\"MyApp\":{\"id_app\":\"104\",\"api_secret\":\"605e22792dffa77fdb85013fa8bf1a6a\",\"production\":\"\",\"installation_id\":\"6badcb9a0bb35767daeb70eef3f14cd3\",\"getMoreInfo\":\"{\'gestione\':\'Unificata\',\'ownership\':\'Tenant\',\'modulo\':1,\'app_bar\':1,\'enabled\':0,\'frozen\':0}\",\"ckEnableToMange\":\"{\'enabled\':\'TRUE\':\'link\':\'\\/fwebapps\\/test\\/app.php\'}\",\"gestione\":\"Unificata\",\"ownership\":\"Tenant\",\"application_list\":\"{}\"}}','2016-06-25 22:06:12'),(17,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-26 02:06:53'),(18,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-26 03:06:11'),(19,'{\"User\":\"{\\\"name\\\":\\\"John\\\", \\\"surname\\\":\\\"Doe\\\", \\\"gender\\\":\\\"Male\\\", \\\"username\\\":\\\"john_user\\\", \\\"email\\\":\\\"example@example.com\\\"}\",\"Tenant\":\"{\\\"id\\\":367}\",\"WifiArea\":\"\",\"Parameters\":\"\"}','2016-06-26 13:06:24');
/*!40000 ALTER TABLE `tbl_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_user`
--

DROP TABLE IF EXISTS `tbl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `activkey` varchar(128) NOT NULL DEFAULT '',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastvisit` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `superuser` int(1) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`),
  KEY `superuser` (`superuser`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_user`
--

LOCK TABLES `tbl_user` WRITE;
/*!40000 ALTER TABLE `tbl_user` DISABLE KEYS */;
INSERT INTO `tbl_user` VALUES (1,'admin','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','webmaster@example.com','9a24eff8c15a6a141ece27eb6947da0f','2016-05-08 16:46:39','0000-00-00 00:00:00',1,1),(2,'demo','$2a$10$JTJf6/XqC94rrOtzuF397OHa4mbmZrVTBOQCmYD9U.obZRUut4BoC','demo@example.com','099f825543f7850cc038b90aaff39fac','2016-05-08 16:46:39','0000-00-00 00:00:00',0,1);
/*!40000 ALTER TABLE `tbl_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-27  0:24:34
