CREATE DATABASE  IF NOT EXISTS `stu_new` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `stu_new`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: stu_new
-- ------------------------------------------------------
-- Server version	5.6.21-log

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
-- Table structure for table `vv_class`
--

DROP TABLE IF EXISTS `vv_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_class` (
  `class_id` varchar(10) NOT NULL,
  `class_name` varchar(20) DEFAULT NULL,
  `class_desc` varchar(1000) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_class`
--

LOCK TABLES `vv_class` WRITE;
/*!40000 ALTER TABLE `vv_class` DISABLE KEYS */;
INSERT INTO `vv_class` VALUES ('2015000005','青苹果','青苹果开课咯~~ 速速来报名','2015-03-30 21:47:30'),('2015000007','花蕾版','我擦','2015-04-19 10:05:59'),('2015000008','卡卡','卡卡','2015-04-19 10:09:54');
/*!40000 ALTER TABLE `vv_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_class_lesson`
--

DROP TABLE IF EXISTS `vv_class_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_class_lesson` (
  `LES_ID` varchar(6) NOT NULL,
  `LES_NAME` varchar(40) NOT NULL,
  `LES_TYPE` varchar(2) NOT NULL,
  `LES_DES` varchar(2000) DEFAULT NULL,
  `LES_START_TIME` int(11) DEFAULT NULL,
  `LES_END_TIME` int(11) DEFAULT NULL,
  `LES_LESSON_COUNT` int(11) DEFAULT NULL,
  `LES_LESSON_TIME` int(11) DEFAULT NULL,
  `LES_WEEK_TYPE` varchar(2) DEFAULT NULL,
  `LES_STATE` varchar(2) DEFAULT NULL,
  `CREATE_USER` varchar(20) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `LES_FEE` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`LES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_class_lesson`
--

LOCK TABLES `vv_class_lesson` WRITE;
/*!40000 ALTER TABLE `vv_class_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `vv_class_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_class_rela`
--

DROP TABLE IF EXISTS `vv_class_rela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_class_rela` (
  `class_id` varchar(10) NOT NULL,
  `rela_id` varchar(10) NOT NULL,
  `rela_type` varchar(2) NOT NULL,
  PRIMARY KEY (`class_id`,`rela_id`,`rela_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_class_rela`
--

LOCK TABLES `vv_class_rela` WRITE;
/*!40000 ALTER TABLE `vv_class_rela` DISABLE KEYS */;
INSERT INTO `vv_class_rela` VALUES ('2015000005','1','02'),('2015000005','1','03'),('2015000005','TEST001','01'),('2015000005','TEST002','01'),('2015000005','TEST003','01'),('2015000007','000004','04'),('2015000007','2','02'),('2015000007','2','03'),('2015000007','TEST003','01'),('2015000007','TEST005','01'),('2015000008','000001','04'),('2015000008','TE000002','02'),('2015000008','TE000002','03'),('2015000008','TEST001','01'),('2015000008','TEST002','01');
/*!40000 ALTER TABLE `vv_class_rela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_finance`
--

DROP TABLE IF EXISTS `vv_finance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_finance` (
  `fin_id` varchar(20) NOT NULL,
  `fin_create_type` varchar(2) DEFAULT NULL,
  `fin_rela_id` varchar(40) DEFAULT NULL,
  `fin_date` int(11) DEFAULT NULL,
  `fin_type` varchar(10) DEFAULT NULL,
  `fin_money` decimal(20,2) DEFAULT NULL,
  `fin_rela_user` varchar(10) DEFAULT NULL,
  `fin_user` varchar(10) DEFAULT NULL,
  `fin_record_time` datetime DEFAULT NULL,
  `fin_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`fin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_finance`
--

LOCK TABLES `vv_finance` WRITE;
/*!40000 ALTER TABLE `vv_finance` DISABLE KEYS */;
INSERT INTO `vv_finance` VALUES ('0000000006','0',NULL,20150314,'002',1500.00,'wangyi','wangyi','2015-03-14 10:54:21','1111111111111111111111111'),('0000040005','0',NULL,20150309,'102',1500055.34,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('0000050004','0',NULL,20150309,'003',50.00,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('0000060003','0',NULL,20150309,'001',1500.00,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('C001010005','0',NULL,20150306,'001',1500.00,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS00020005','0',NULL,20150307,'102',1500055.34,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS00030004','0',NULL,20150308,'003',50.00,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS01010005','0',NULL,20150224,'001',-1086.36,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS01020005','0',NULL,20150225,'102',816281.79,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS01030004','0',NULL,20150226,'003',-41.05,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS01040005','0',NULL,20150227,'102',-1214729.36,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS01050004','0',NULL,20150227,'003',47.90,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS01060003','0',NULL,20150227,'001',1369.40,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS01070005','0',NULL,20150228,'102',1052623.19,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS01080004','0',NULL,20150301,'003',47.18,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS02010005','0',NULL,20150214,'001',1421.66,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS02020005','0',NULL,20150215,'102',121468.07,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS02030004','0',NULL,20150216,'003',-0.43,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS02040005','0',NULL,20150217,'102',920093.56,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS02050004','0',NULL,20150217,'003',-8.07,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS02060003','0',NULL,20150217,'001',821.13,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS02070005','0',NULL,20150218,'102',650825.14,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS02080004','0',NULL,20150219,'003',-8.32,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS04010005','0',NULL,20150115,'001',866.35,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS04020005','0',NULL,20150116,'102',-734053.46,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS04030004','0',NULL,20150117,'003',37.30,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS04040005','0',NULL,20150118,'102',209798.93,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS04050004','0',NULL,20150118,'003',-4.93,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS04060003','0',NULL,20150118,'001',547.68,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS04070005','0',NULL,20150119,'102',-708601.79,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS04080004','0',NULL,20150120,'003',-9.01,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS05010005','0',NULL,20150105,'001',617.07,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS05020005','0',NULL,20150106,'102',-60752.04,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS05030004','0',NULL,20150107,'003',-12.39,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS05040005','0',NULL,20150108,'102',-81498.43,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS05050004','0',NULL,20150108,'003',26.69,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS05060003','0',NULL,20150108,'001',1347.57,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS05070005','0',NULL,20150109,'102',-717640.06,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS05080004','0',NULL,20150110,'003',-4.58,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS06010005','0',NULL,20141226,'001',768.13,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS06020005','0',NULL,20141227,'102',-458185.94,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS06030004','0',NULL,20141228,'003',-12.37,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS06040005','0',NULL,20141229,'102',816418.91,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS06050004','0',NULL,20141229,'003',-2.81,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS06060003','0',NULL,20141229,'001',-87.81,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS06070005','0',NULL,20141230,'102',727437.79,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS06080004','0',NULL,20141231,'003',26.10,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS07010005','0',NULL,20141216,'001',-317.81,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS07020005','0',NULL,20141217,'102',472488.10,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS07030004','0',NULL,20141218,'003',-14.98,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS07040005','0',NULL,20141219,'102',878828.00,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS07050004','0',NULL,20141219,'003',22.13,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS07060003','0',NULL,20141219,'001',365.91,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS07070005','0',NULL,20141220,'102',-967011.12,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS07080004','0',NULL,20141221,'003',-2.35,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS08010005','0',NULL,20141206,'001',-737.63,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS08020005','0',NULL,20141207,'102',-369212.55,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS08030004','0',NULL,20141208,'003',-19.82,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS08040005','0',NULL,20141209,'102',-127742.76,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS08050004','0',NULL,20141209,'003',31.21,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS08060003','0',NULL,20141209,'001',-593.33,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS08070005','0',NULL,20141210,'102',-387574.12,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS08080004','0',NULL,20141211,'003',4.54,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS09010005','0',NULL,20141126,'001',-559.79,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS09020005','0',NULL,20141127,'102',754381.61,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS09030004','0',NULL,20141128,'003',-37.83,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS09040005','0',NULL,20141129,'102',-233259.95,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS09050004','0',NULL,20141129,'003',16.98,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS09060003','0',NULL,20141129,'001',10.13,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS09070005','0',NULL,20141130,'102',1000023.29,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS09080004','0',NULL,20141201,'003',46.42,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS10010005','0',NULL,20141116,'001',157.65,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS10020005','0',NULL,20141117,'102',735839.09,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS10030004','0',NULL,20141118,'003',-33.73,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS10040005','0',NULL,20141119,'102',-603461.41,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS10050004','0',NULL,20141119,'003',2.15,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS10060003','0',NULL,20141119,'001',-520.67,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS10070005','0',NULL,20141120,'102',864063.98,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS10080004','0',NULL,20141121,'003',-8.23,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS11010005','0',NULL,20141106,'001',-1008.45,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS11020005','0',NULL,20141107,'102',54430.86,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS11030004','0',NULL,20141108,'003',37.45,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS11040005','0',NULL,20141109,'102',892483.06,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS11050004','0',NULL,20141109,'003',35.85,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS11060003','0',NULL,20141109,'001',-831.16,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS11070005','0',NULL,20141110,'102',838526.21,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS11080004','0',NULL,20141111,'003',-31.75,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS12010005','0',NULL,20141027,'001',-669.58,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS12020005','0',NULL,20141028,'102',534071.15,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS12030004','0',NULL,20141029,'003',-36.29,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS12040005','0',NULL,20141030,'102',-1102645.67,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS12050004','0',NULL,20141030,'003',-13.93,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS12060003','0',NULL,20141030,'001',-486.29,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS12070005','0',NULL,20141031,'102',-137006.30,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS12080004','0',NULL,20141101,'003',13.07,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS13010005','0',NULL,20141017,'001',-99.19,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS13020005','0',NULL,20141018,'102',-197426.40,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS13030004','0',NULL,20141019,'003',-31.76,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS13040005','0',NULL,20141020,'102',634587.70,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS13050004','0',NULL,20141020,'003',-46.13,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS13060003','0',NULL,20141020,'001',-816.43,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS13070005','0',NULL,20141021,'102',-694983.70,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS13080004','0',NULL,20141022,'003',8.44,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS14010005','0',NULL,20141007,'001',494.79,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS14020005','0',NULL,20141008,'102',-36182.68,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS14030004','0',NULL,20141009,'003',-30.50,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS14040005','0',NULL,20141010,'102',-873781.45,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS14050004','0',NULL,20141010,'003',-46.92,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS14060003','0',NULL,20141010,'001',-187.61,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS14070005','0',NULL,20141011,'102',-828773.61,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS14080004','0',NULL,20141012,'003',34.27,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS15010005','0',NULL,20140927,'001',778.75,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS15020005','0',NULL,20140928,'102',-66740.33,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS15030004','0',NULL,20140929,'003',4.18,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS15040005','0',NULL,20140930,'102',-243153.38,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS15050004','0',NULL,20140930,'003',42.45,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS15060003','0',NULL,20140930,'001',49.20,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS15070005','0',NULL,20141001,'102',744239.41,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS15080004','0',NULL,20141002,'003',5.20,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS16010005','0',NULL,20140917,'001',-794.75,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS16020005','0',NULL,20140918,'102',740788.07,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS16030004','0',NULL,20140919,'003',27.04,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS16040005','0',NULL,20140920,'102',421449.23,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS16050004','0',NULL,20140920,'003',31.81,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS16060003','0',NULL,20140920,'001',677.60,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS16070005','0',NULL,20140921,'102',-447215.89,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS16080004','0',NULL,20140922,'003',29.20,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS17010005','0',NULL,20140907,'001',1017.57,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS17020005','0',NULL,20140908,'102',-184656.60,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS17030004','0',NULL,20140909,'003',-35.63,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS17040005','0',NULL,20140910,'102',-553768.24,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS17050004','0',NULL,20140910,'003',40.70,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS17060003','0',NULL,20140910,'001',58.29,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS17070005','0',NULL,20140911,'102',-169325.92,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS17080004','0',NULL,20140912,'003',31.77,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS18010005','0',NULL,20140828,'001',374.40,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS18020005','0',NULL,20140829,'102',-398783.92,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS18030004','0',NULL,20140830,'003',-7.41,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS18040005','0',NULL,20140831,'102',39200.62,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS18050004','0',NULL,20140831,'003',-47.37,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS18060003','0',NULL,20140831,'001',-681.25,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS18070005','0',NULL,20140901,'102',581726.22,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS18080004','0',NULL,20140902,'003',1.08,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS19010005','0',NULL,20140818,'001',500.95,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS19020005','0',NULL,20140819,'102',-453357.04,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS19030004','0',NULL,20140820,'003',-16.52,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS19040005','0',NULL,20140821,'102',784215.86,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS19050004','0',NULL,20140821,'003',30.91,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS19060003','0',NULL,20140821,'001',-616.50,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS19070005','0',NULL,20140822,'102',-785472.49,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS19080004','0',NULL,20140823,'003',5.95,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS20010005','0',NULL,20140808,'001',-738.52,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS20020005','0',NULL,20140809,'102',637994.15,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS20030004','0',NULL,20140810,'003',30.04,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS20040005','0',NULL,20140811,'102',1057846.49,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS20050004','0',NULL,20140811,'003',-45.96,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CS20060003','0',NULL,20140811,'001',538.11,'wangyi','wangyi','2015-03-09 16:37:30',NULL),('CS20070005','0',NULL,20140812,'102',-874323.81,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CS20080004','0',NULL,20140813,'003',11.56,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月'),('CSS0070005','0',NULL,20150310,'102',1500055.34,'wangyi','wangyi','2015-03-09 16:44:31','wcaccccccccccccccccccc'),('CSS0080004','0',NULL,20150311,'003',50.00,'wangyi','wangyi','2015-03-09 16:40:54','王子诚的餐费，6月到9月');
/*!40000 ALTER TABLE `vv_finance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_lesson`
--

DROP TABLE IF EXISTS `vv_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_lesson` (
  `LES_ID` varchar(6) DEFAULT NULL,
  `LES_NAME` varchar(40) DEFAULT NULL,
  `LES_TYPE` varchar(2) DEFAULT NULL,
  `LES_TYPE2` varchar(2) DEFAULT NULL,
  `LES_TYPE3` varchar(2) DEFAULT NULL,
  `LES_TYPE4` varchar(2) DEFAULT NULL,
  `LES_DESC` varchar(2000) DEFAULT NULL,
  `LES_STATE` varchar(2) DEFAULT NULL,
  `LES_STATE2` varchar(2) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_lesson`
--

LOCK TABLES `vv_lesson` WRITE;
/*!40000 ALTER TABLE `vv_lesson` DISABLE KEYS */;
INSERT INTO `vv_lesson` VALUES ('X01','我擦课',NULL,NULL,NULL,NULL,'21踩踩撒',NULL,NULL,NULL),('000001','珠心算','01',NULL,NULL,NULL,'01',NULL,NULL,'2015-03-19 18:11:28'),('000002','擦擦擦','02',NULL,NULL,NULL,'02',NULL,NULL,'2015-03-19 18:16:02'),('000003','擦擦擦','02',NULL,NULL,NULL,'02',NULL,NULL,'2015-03-19 18:16:06'),('000004','真心偏移','01',NULL,NULL,NULL,'才2',NULL,NULL,'2015-03-19 18:16:57'),('000005','划擦','01',NULL,NULL,NULL,'达到',NULL,NULL,'2015-03-19 18:18:17');
/*!40000 ALTER TABLE `vv_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_stu_lesson`
--

DROP TABLE IF EXISTS `vv_stu_lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_stu_lesson` (
  `STU_LES_SERIALNO` varchar(16) NOT NULL,
  `STU_ID` varchar(10) NOT NULL,
  `LES_ID` varchar(6) NOT NULL,
  `START_DATE` int(11) DEFAULT NULL,
  `END_DATE` int(11) DEFAULT NULL,
  `STATE` varchar(2) DEFAULT NULL,
  `AL_LES_TIME` int(11) DEFAULT NULL,
  `AL_LES_COUNT` int(11) DEFAULT NULL,
  `PAY_TYPE` varchar(2) DEFAULT NULL,
  `PAY_TO_DATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`STU_LES_SERIALNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_stu_lesson`
--

LOCK TABLES `vv_stu_lesson` WRITE;
/*!40000 ALTER TABLE `vv_stu_lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `vv_stu_lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_stu_lesson_detail`
--

DROP TABLE IF EXISTS `vv_stu_lesson_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_stu_lesson_detail` (
  `STU_LES_SERIALNO` varchar(16) NOT NULL,
  `STU_LES_DATE` int(11) DEFAULT NULL,
  `STU_LES_STATE` varchar(2) DEFAULT NULL,
  `STU_LES_RELA_ID` int(11) DEFAULT NULL,
  `STU_LES_TEA_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`STU_LES_SERIALNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_stu_lesson_detail`
--

LOCK TABLES `vv_stu_lesson_detail` WRITE;
/*!40000 ALTER TABLE `vv_stu_lesson_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `vv_stu_lesson_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_student`
--

DROP TABLE IF EXISTS `vv_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_student` (
  `STU_ID` varchar(10) NOT NULL,
  `STU_NAME` varchar(20) NOT NULL,
  `STU_MAKE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_student`
--

LOCK TABLES `vv_student` WRITE;
/*!40000 ALTER TABLE `vv_student` DISABLE KEYS */;
INSERT INTO `vv_student` VALUES ('TEST001','畅子文','2015-03-27 09:06:53'),('TEST002','吴妍','2015-03-27 09:06:53'),('TEST003','马千祥','2015-03-27 09:06:53'),('TEST004','王艺涵','2015-03-27 09:06:53'),('TEST005','田政昕','2015-03-27 09:06:53'),('TEST006','唐家淇','2015-03-27 09:06:53'),('TEST007','程凯欣','2015-03-27 09:06:53'),('TEST008','薛霄洋','2015-03-27 09:06:53'),('TEST009','张岚博','2015-03-27 09:06:53'),('TEST010','李林曦','2015-03-27 09:06:53'),('TEST011','邓泽轩','2015-03-27 09:06:53'),('TEST012','孙佳英','2015-03-27 09:06:53'),('TEST013','王昱洁','2015-03-27 09:06:53'),('TEST014','卢艺轩','2015-03-27 09:06:53'),('TEST015','张钰清','2015-03-27 09:06:53'),('TEST016','刘梦宇','2015-03-27 09:06:53'),('TEST017','常瑾茹','2015-03-27 09:06:53'),('TEST018','李俁删','2015-03-27 09:06:53'),('TEST019','孙圣博','2015-03-27 09:06:53'),('TEST020','杨越青','2015-03-27 09:06:53'),('TEST021','贾欣雨','2015-03-27 09:06:53'),('TEST022','李欣怡','2015-03-27 09:06:53'),('TEST023','张天富','2015-03-27 09:06:53'),('TEST024','辛嘉昦','2015-03-27 09:06:53'),('TEST025','李张嘉琦','2015-03-27 09:06:53'),('TEST026','吕佳荣','2015-03-27 09:06:53'),('TEST027','朱慧颖','2015-03-27 09:06:53'),('TEST028','李卓越','2015-03-27 09:06:53'),('TEST029','朱亚博','2015-03-27 09:06:53'),('TEST030','吕佳荣','2015-03-27 09:06:53'),('TEST031','燕莹睿','2015-03-27 09:06:53'),('TEST032','王雅兰','2015-03-27 09:06:53'),('TEST033','李尚怡','2015-03-27 09:06:53'),('TEST034','尚佳轩','2015-03-27 09:06:53'),('TEST035','米一凡','2015-03-27 09:06:53'),('TEST036','赵凯宁','2015-03-27 09:06:53'),('TEST037','李佳鑫','2015-03-27 09:06:53'),('TEST038','杨柳文英','2015-03-27 09:06:53'),('TEST039','玥玥','2015-03-27 09:06:53'),('TEST040','牛牛','2015-03-27 09:06:53'),('TEST041','安雅瑄','2015-03-27 09:06:53'),('TEST042','张岚博','2015-03-27 09:06:53'),('TEST043','李林曦','2015-03-27 09:06:53'),('TEST044','王昱洁','2015-03-27 09:06:53'),('TEST045','卢艺轩','2015-03-27 09:06:53'),('TEST046','刘梦宇','2015-03-27 09:06:53'),('TEST047','常瑾茹','2015-03-27 09:06:53'),('TEST048','李俁删','2015-03-27 09:06:53'),('TEST049','孙圣博','2015-03-27 09:06:53'),('TEST050','杨越青','2015-03-27 09:06:53'),('TEST051','贾欣雨','2015-03-27 09:06:53'),('TEST052','李欣怡','2015-03-27 09:06:53'),('TEST053','张天富','2015-03-27 09:06:53'),('TEST054','李张嘉琦','2015-03-27 09:06:53'),('TEST055','卢楚珩','2015-03-27 09:06:53'),('TEST056','朱亚博','2015-03-27 09:06:53'),('TEST057','王雅兰','2015-03-27 09:06:53'),('TEST058','李尚怡','2015-03-27 09:06:53'),('TEST059','肖金妮','2015-03-27 09:06:53'),('TEST060','张娗婧','2015-03-27 09:06:53'),('TEST061','闫厚融','2015-03-27 09:06:53'),('TEST062','刘国宇','2015-03-27 09:06:53'),('TEST063','李佳鑫','2015-03-27 09:06:53'),('TEST064','赵凯宁','2015-03-27 09:06:53'),('TEST065','王芳龄','2015-03-27 09:06:53'),('TEST066','王艺欣','2015-03-27 09:06:53'),('TEST067','张景权','2015-03-27 09:06:53'),('TEST068','张钰清','2015-03-27 09:06:53');
/*!40000 ALTER TABLE `vv_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_student_info`
--

DROP TABLE IF EXISTS `vv_student_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_student_info` (
  `STU_ID` varchar(10) NOT NULL,
  `STU_LITTLE_NAME` varchar(20) DEFAULT NULL,
  `STU_SEX` varchar(1) DEFAULT NULL,
  `STU_BIRTHDAY` int(11) DEFAULT NULL,
  `STU_KINDERGARTEN` varchar(80) DEFAULT NULL,
  `STU_ADDRESS` varchar(200) DEFAULT NULL,
  `STU_PHONE` varchar(20) DEFAULT NULL,
  `STU_BELONG_TEACHER` varchar(20) DEFAULT NULL,
  `STU_BACKINFO` varchar(400) DEFAULT NULL,
  `STU_SOURCE` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_student_info`
--

LOCK TABLES `vv_student_info` WRITE;
/*!40000 ALTER TABLE `vv_student_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `vv_student_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_student_info_old`
--

DROP TABLE IF EXISTS `vv_student_info_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_student_info_old` (
  `STU_ID` varchar(10) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `STU_LITTLE_NAME` varchar(20) NOT NULL,
  `STU_SEX` varchar(1) DEFAULT NULL,
  `STU_BIRTHDAY` int(11) DEFAULT NULL,
  `STU_KINDERGARTEN` varchar(80) DEFAULT NULL,
  `STU_ADDRESS` varchar(200) DEFAULT NULL,
  `STU_PHONE` varchar(20) DEFAULT NULL,
  `STU_BELONG_TEACHER` varchar(20) DEFAULT NULL,
  `STU_BACKINFO` varchar(400) DEFAULT NULL,
  `STU_SOURCE` varchar(2) DEFAULT NULL,
  UNIQUE KEY `IDXU_vv_studenold_STU_ID` (`STU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_student_info_old`
--

LOCK TABLES `vv_student_info_old` WRITE;
/*!40000 ALTER TABLE `vv_student_info_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `vv_student_info_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_code`
--

DROP TABLE IF EXISTS `vv_sys_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_code` (
  `codetype` varchar(40) NOT NULL,
  `code` varchar(20) NOT NULL,
  `codename` varchar(80) DEFAULT NULL,
  `codealias` varchar(100) DEFAULT NULL,
  `codeorder` int(11) DEFAULT NULL,
  PRIMARY KEY (`codetype`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_code`
--

LOCK TABLES `vv_sys_code` WRITE;
/*!40000 ALTER TABLE `vv_sys_code` DISABLE KEYS */;
INSERT INTO `vv_sys_code` VALUES ('class_rela_type','01','学生',NULL,NULL),('class_rela_type','02','老师',NULL,NULL),('class_rela_type','03','班主任',NULL,NULL),('class_rela_type','04','课程',NULL,NULL),('date_choicer','hand','手动选择',NULL,3),('date_choicer','month','最近一月',NULL,1),('date_choicer','week','最近一周',NULL,0),('date_choicer','year','最近一年',NULL,2),('fin_oi_type','0','收入类',NULL,NULL),('fin_oi_type','1','支出类',NULL,NULL),('fin_type','001','学费',NULL,NULL),('fin_type','002','教材费用',NULL,NULL),('fin_type','003','餐费',NULL,NULL),('fin_type','004','文具费','',NULL),('fin_type','005',' 增加测试','',NULL),('fin_type','099','其他','',NULL),('fin_type','101','采购器材',NULL,NULL),('fin_type','102','采购教材',NULL,NULL),('fin_type','103','教师工资',NULL,NULL),('fin_type','104','活动费用',NULL,NULL),('fin_type','199','其他','',NULL),('frequency_choicer','day','日',NULL,0),('frequency_choicer','month','月',NULL,2),('frequency_choicer','week','周',NULL,1),('lesson_type','01','数学','你懂吧？',NULL),('lesson_type','02','英语','因个历史',NULL),('student_state','01','新生','我晕',NULL);
/*!40000 ALTER TABLE `vv_sys_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_code_conf`
--

DROP TABLE IF EXISTS `vv_sys_code_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_code_conf` (
  `codetype` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `desc` varchar(400) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`codetype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_code_conf`
--

LOCK TABLES `vv_sys_code_conf` WRITE;
/*!40000 ALTER TABLE `vv_sys_code_conf` DISABLE KEYS */;
INSERT INTO `vv_sys_code_conf` VALUES ('fin_type','收支类型','0开头的为收入类1开头的为支出类',0),('lesson_type','课程类型','课程类型 唯一',0),('student_state','学生状态','学生状态枚举',0),('student_type','学生类型','学生类型的枚举项a b c',0);
/*!40000 ALTER TABLE `vv_sys_code_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_maxno`
--

DROP TABLE IF EXISTS `vv_sys_maxno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_maxno` (
  `id` varchar(11) NOT NULL,
  `no` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_maxno`
--

LOCK TABLES `vv_sys_maxno` WRITE;
/*!40000 ALTER TABLE `vv_sys_maxno` DISABLE KEYS */;
INSERT INTO `vv_sys_maxno` VALUES ('fin_id',6),('LES2015',8),('les_id',5),('stu_id2015',30),('sysuser',9),('tea_id',2);
/*!40000 ALTER TABLE `vv_sys_maxno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_menu`
--

DROP TABLE IF EXISTS `vv_sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_menu` (
  `menu_id` varchar(10) NOT NULL,
  `menu_name` varchar(40) NOT NULL,
  `menu_url` varchar(100) DEFAULT NULL,
  `open_power` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_menu`
--

LOCK TABLES `vv_sys_menu` WRITE;
/*!40000 ALTER TABLE `vv_sys_menu` DISABLE KEYS */;
INSERT INTO `vv_sys_menu` VALUES ('101|1','学生报名','bootstrap.do','1'),('102|1','学生退学',NULL,'1'),('103|1','学生信息','/stu/stuList.do','1'),('1|0','学生管理',NULL,'0'),('2|0','教师管理','/tea/index.do','1'),('301|3','系统用户管理','/sys/userIndex.do','1'),('302|3','菜单管理','/sys/menu/menuIndex.do','1'),('304|3','系统枚举','/sys/code/confIndex.do','1'),('3|0','系统管理',NULL,'1'),('401|4','新建收支','/fin/createFinance.do',NULL),('402|4','收支信息','/fin/recentFinance.do',NULL),('4|0','财务管理',NULL,'0'),('501|5','课程管理','/les/lessonIndex.do',NULL),('502|5','班级管理','/class/classIndex.do',NULL),('5|0','班级课程管理',NULL,NULL);
/*!40000 ALTER TABLE `vv_sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_user`
--

DROP TABLE IF EXISTS `vv_sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_user` (
  `user_id` varchar(20) NOT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `user_phone` varchar(20) DEFAULT NULL,
  `rela_role_id` varchar(10) DEFAULT NULL,
  `user_password` varchar(45) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `user_state` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_user`
--

LOCK TABLES `vv_sys_user` WRITE;
/*!40000 ALTER TABLE `vv_sys_user` DISABLE KEYS */;
INSERT INTO `vv_sys_user` VALUES ('000002','我擦','13403517100',NULL,'14e1b600b1fd579f47433b88e8d85291',NULL,NULL),('000003','新用户','13403517100',NULL,'2072d493c4fc8bc11b8d2f6f49d178c9',NULL,NULL),('000006','我擦','13403517100',NULL,'',NULL,NULL),('admin','系统管理员','13403517100',NULL,'0c909a141f1f2c0a1cb602b0b2d7d050',NULL,NULL),('lishuang','李二','15835104556',NULL,'07932f02f3323059544d188be8e847e7','2015-03-13 20:31:36',NULL),('sy000001','haha好','13403517105','100','','2015-02-27 10:33:58','01'),('SY000007','wlgq','',NULL,'b626940cf772654ed931b05be5722121',NULL,NULL),('SY000008','王毅','13403517100',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('SY000009','王毅','',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('wangyi','王毅','',NULL,'07932f02f3323059544d188be8e847e7','2015-04-19 10:05:55',NULL),('wangyi2','王毅','',NULL,'03557285e0c7dcf73459ef5cbee4551c',NULL,NULL),('wangyi3','213123','13132321321',NULL,'5b32af2e42cbaa6bdcf216b65cd8287c','2015-02-28 16:11:39',NULL),('wcccccc','eddasdsadasd','',NULL,'044e2952bf40ecc61933d8ad16e0074c',NULL,NULL),('yanshi','演示用户','',NULL,'31bde6a12ed45884f1dd420e50ebcbd4','2015-03-06 11:53:14',NULL);
/*!40000 ALTER TABLE `vv_sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_sys_user_menu`
--

DROP TABLE IF EXISTS `vv_sys_user_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_sys_user_menu` (
  `user_id` varchar(20) NOT NULL,
  `menu_id` varchar(10) NOT NULL,
  PRIMARY KEY (`user_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_sys_user_menu`
--

LOCK TABLES `vv_sys_user_menu` WRITE;
/*!40000 ALTER TABLE `vv_sys_user_menu` DISABLE KEYS */;
INSERT INTO `vv_sys_user_menu` VALUES ('000002','101|1'),('wangyi','101|1'),('wangyi','102|1'),('wangyi','103|1'),('wangyi','2|0'),('wangyi','301|3'),('wangyi','302|3'),('wangyi','304|3'),('wangyi','3|0'),('yanshi','103|1'),('yanshi','301|3'),('yanshi','302|3'),('yanshi','304|3'),('yanshi','3|0');
/*!40000 ALTER TABLE `vv_sys_user_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vv_teacher`
--

DROP TABLE IF EXISTS `vv_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vv_teacher` (
  `TEA_ID` varchar(10) NOT NULL,
  `TEA_NAME` varchar(20) NOT NULL,
  `TEA_STATE` varchar(2) DEFAULT NULL,
  `TEA_TYPE` varchar(2) DEFAULT NULL,
  `TEA_SEX` varchar(1) DEFAULT NULL,
  `TEA_BIRTHDAY` int(11) DEFAULT NULL,
  `TEA_PHONE` varchar(20) DEFAULT NULL,
  `TEA_ADDRESS` varchar(200) DEFAULT NULL,
  `TEA_DESC` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`TEA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vv_teacher`
--

LOCK TABLES `vv_teacher` WRITE;
/*!40000 ALTER TABLE `vv_teacher` DISABLE KEYS */;
INSERT INTO `vv_teacher` VALUES ('1','wanyi',NULL,'1','s',1,'1340','address','this is describe'),('2','wanyi','st',NULL,'s',1,'1340','address','this is describe'),('3','wanyi才','st','1','1',18991222,'1340','address','this is describe'),('4','我擦','st','1','0',20150318,'1340','address','this is describe'),('TE000001','王毅',NULL,NULL,'0',19891010,'13403517100','都擦','都擦擦'),('TE000002','我擦的',NULL,NULL,'0',20150320,'15835104556','马勒戈壁','有一群好玩的草泥马');
/*!40000 ALTER TABLE `vv_teacher` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-19 23:13:46
