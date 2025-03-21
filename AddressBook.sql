-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for osx10.10 (x86_64)
--
-- Host: localhost    Database: AddressBook
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `AddressBook`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `AddressBook` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `AddressBook`;

--
-- Table structure for table `Bill`
--

DROP TABLE IF EXISTS `Bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bill` (
  `tel` varchar(20) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `dd` datetime NOT NULL,
  `hid` int(11) DEFAULT NULL COMMENT '帳單地址',
  PRIMARY KEY (`tel`,`dd`),
  KEY `bill_ibfk_2` (`hid`),
  CONSTRAINT `bill_ibfk_1` FOREIGN KEY (`tel`) REFERENCES `Phone` (`tel`),
  CONSTRAINT `bill_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bill`
--

LOCK TABLES `Bill` WRITE;
/*!40000 ALTER TABLE `Bill` DISABLE KEYS */;
INSERT INTO `Bill` VALUES ('1111',300,'2019-01-01 00:00:00',1),('1111',700,'2019-02-01 00:00:00',1),('1111',900,'2019-11-01 00:00:00',1),('1112',700,'2019-01-01 00:00:00',1),('1112',450,'2019-02-01 00:00:00',1),('1112',200,'2019-03-01 00:00:00',1),('2222',150,'2019-01-01 00:00:00',2),('2222',400,'2019-02-01 00:00:00',2),('2222',300,'2019-03-01 00:00:00',2),('3333',500,'2019-04-01 00:00:00',3),('3333',350,'2019-10-01 00:00:00',3);
/*!40000 ALTER TABLE `Bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HeadPhoto`
--

DROP TABLE IF EXISTS `HeadPhoto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HeadPhoto` (
  `uid` varchar(20) NOT NULL COMMENT '帳號',
  `photo` mediumblob DEFAULT NULL COMMENT '大頭照',
  PRIMARY KEY (`uid`),
  CONSTRAINT `headphoto_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `UserInfo` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HeadPhoto`
--

LOCK TABLES `HeadPhoto` WRITE;
/*!40000 ALTER TABLE `HeadPhoto` DISABLE KEYS */;
/*!40000 ALTER TABLE `HeadPhoto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `House`
--

DROP TABLE IF EXISTS `House`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `House` (
  `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT '屋號（自動編號）',
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `House`
--

LOCK TABLES `House` WRITE;
/*!40000 ALTER TABLE `House` DISABLE KEYS */;
INSERT INTO `House` VALUES (1,'台北市南京東路1號'),(2,'新竹市光復北路1號'),(3,'台中市公益路二段51號'),(4,'高雄市五福路3號');
/*!40000 ALTER TABLE `House` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Live`
--

DROP TABLE IF EXISTS `Live`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Live` (
  `uid` varchar(20) NOT NULL,
  `hid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`hid`),
  KEY `hid` (`hid`),
  CONSTRAINT `live_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `UserInfo` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `live_ibfk_2` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Live`
--

LOCK TABLES `Live` WRITE;
/*!40000 ALTER TABLE `Live` DISABLE KEYS */;
INSERT INTO `Live` VALUES ('A01',1),('A01',3),('A02',1),('A03',1);
/*!40000 ALTER TABLE `Live` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Log`
--

DROP TABLE IF EXISTS `Log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自動編號',
  `body` varchar(200) NOT NULL,
  `dd` datetime NOT NULL DEFAULT current_timestamp() COMMENT '有預設時間',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Log`
--

LOCK TABLES `Log` WRITE;
/*!40000 ALTER TABLE `Log` DISABLE KEYS */;
/*!40000 ALTER TABLE `Log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phone`
--

DROP TABLE IF EXISTS `Phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phone` (
  `tel` varchar(20) NOT NULL COMMENT '家用電話',
  `hid` int(11) DEFAULT NULL COMMENT '裝機地址',
  PRIMARY KEY (`tel`),
  KEY `hid` (`hid`),
  CONSTRAINT `phone_ibfk_1` FOREIGN KEY (`hid`) REFERENCES `House` (`hid`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phone`
--

LOCK TABLES `Phone` WRITE;
/*!40000 ALTER TABLE `Phone` DISABLE KEYS */;
INSERT INTO `Phone` VALUES ('1111',1),('1112',1),('2222',2),('3333',3);
/*!40000 ALTER TABLE `Phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserInfo`
--

DROP TABLE IF EXISTS `UserInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserInfo` (
  `uid` varchar(20) NOT NULL COMMENT '帳號',
  `cname` varchar(45) DEFAULT NULL COMMENT '中文姓名',
  `password` varchar(40) DEFAULT NULL COMMENT '密碼（記得加密）',
  `birthday` date DEFAULT NULL COMMENT '生日',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserInfo`
--

LOCK TABLES `UserInfo` WRITE;
/*!40000 ALTER TABLE `UserInfo` DISABLE KEYS */;
INSERT INTO `UserInfo` VALUES ('A01','王大明',NULL,'1992-05-03'),('A02','李大媽',NULL,'1998-10-02'),('A03','王小毛',NULL,'2013-01-03'),('A04','朱小妹',NULL,'2000-11-12'),('A05',NULL,NULL,NULL),('A06','',NULL,NULL);
/*!40000 ALTER TABLE `UserInfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'AddressBook'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 18:36:46
