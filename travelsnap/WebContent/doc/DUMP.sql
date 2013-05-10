CREATE DATABASE  IF NOT EXISTS `travelsnap` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `travelsnap`;
-- MySQL dump 10.13  Distrib 5.6.10, for Win64 (x86_64)
--
-- Host: localhost    Database: travelsnap
-- ------------------------------------------------------
-- Server version	5.6.10

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `commid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) DEFAULT NULL,
  `postid` int(11) DEFAULT NULL,
  `content` text,
  `commtime` datetime DEFAULT NULL,
  PRIMARY KEY (`commid`),
  KEY `username_idx` (`username`),
  KEY `comm_post_idx` (`postid`),
  CONSTRAINT `comm_post` FOREIGN KEY (`postid`) REFERENCES `post` (`postid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comm_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'admin',1,'nice!',NULL),(3,'b',2,'nice~',NULL),(5,'a',1,'null','2013-04-19 20:21:53'),(6,'a',1,'ahahaha','2013-04-19 20:22:15'),(7,'a',1,'a','2013-04-19 20:23:14'),(8,'a',5,'ding','2013-04-19 20:47:36'),(9,'c',6,'HEY','2013-04-19 22:07:02'),(13,'mary',9,'also\r\ntest 123','2013-04-22 18:59:16'),(14,'y',27,'馮達飛','2013-05-06 17:58:25'),(15,'y',27,'發的啥','2013-05-06 17:58:58'),(18,'testing',27,'飛','2013-05-06 18:27:45'),(22,'testing',35,'范德薩','2013-05-06 19:08:15'),(23,'y',40,'日趨v','2013-05-07 14:16:40'),(26,'y',40,'發的薩芬','2013-05-07 15:33:43');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `friendid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `friendname` varchar(64) NOT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`friendid`),
  KEY `username_idx` (`username`),
  KEY `friend_user_idx` (`friendname`),
  CONSTRAINT `friend_user` FOREIGN KEY (`friendname`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (2,'a','b','2013-04-25 16:27:44'),(15,'y','testing','2013-04-25 16:27:48'),(21,'testing','mary','2013-05-06 19:25:57');
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photoid` int(11) NOT NULL AUTO_INCREMENT,
  `postid` int(11) DEFAULT NULL,
  `url` varchar(256) NOT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  PRIMARY KEY (`photoid`),
  KEY `photo_post_idx` (`postid`),
  CONSTRAINT `photo_post` FOREIGN KEY (`postid`) REFERENCES `post` (`postid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,1,'images/photo/fx.gif',NULL,NULL),(3,27,'http://localhost:8080/travelsnap/images/photo/ccdacd9c-7a27-47b0-b823-f78b70e56f9c.jpg',-116.3016196017795,33.87546081542969),(4,29,'http://localhost:8080/travelsnap/images/photo/5a9eab3e-a43b-48f3-b57f-44201199ce07.png',-115.3016196017795,20.87546081542969),(5,34,'http://localhost:8080/travelsnap/images/photo/c7dba86b-57cc-4444-9885-380d9d0e13bd.png',-122.3016196017795,38.87546081542969),(6,35,'http://localhost:8080/travelsnap/images/photo/4dd7ff2f-7111-4423-8c59-c243dc57f592.gif',0,0),(7,36,'http://localhost:8080/travelsnap/images/photo/4dd7ff2f-7111-4423-8c59-c243dc57f592.gif',0,0),(9,40,'http://localhost:8080/travelsnap/images/photo/86ce97c6-708f-4865-81fa-42801840166d.jpg',0,0);
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `postid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text,
  `time` datetime DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `location` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`postid`),
  KEY `username_idx` (`username`),
  CONSTRAINT `post_user` FOREIGN KEY (`username`) REFERENCES `user` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'Hong Kong','@polyu logo gate',NULL,'a','Hong Kong'),(2,'Taiwan','@101',NULL,'admin','Taiwan'),(4,'Tokyo','@Anywhere',NULL,'a','Tokyo'),(5,'Beijing','Nice day in Beijing!\r\nGreat trip.','2013-04-19 20:47:24','a','Beijing'),(6,'Test','this is a test','2013-04-19 22:06:50','c','HONG KONG'),(9,'hihihi','this\r\nis    ？？？\r\nthe test\r\n~','2013-04-22 18:56:25','mary','hong kong'),(27,'飛','biking day!!fsdfdsa','2013-05-06 13:33:47','y','Hong Kong'),(29,'Time is up!','null','2013-05-06 05:03:49','uitest','Hong Kong'),(34,'Test','1','2013-05-06 05:23:23','y','Hong Kong'),(35,'test','hiF ','2013-05-06 19:33:14','testing','hong kong'),(36,'test','hi','2013-05-06 18:13:59','testing','hong kong'),(40,'5','5','2013-05-07 15:42:59','y','Hong Kong');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(64) NOT NULL,
  `fname` varchar(45) NOT NULL,
  `lname` varchar(45) NOT NULL,
  `info` varchar(256) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `regtime` datetime DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('12345','12@12.com','12345678','Qwer','Rewq','f','','2013-04-21 14:37:08',2,'female'),('a','a','f','a','a','a','images/avatar/default.gif','2013-04-19 17:15:59',1,'male'),('admin','admin@admin.com','admin','travel','snap','administrator','images/avatar/default.gif','2013-04-19 17:15:53',99,'male'),('b','b','b','b','b','b','images/avatar/default.gif','2013-04-19 21:42:35',2,NULL),('c','d','a','ccfff','cvfff','lalalalalalalaa','xF','2013-04-19 21:42:34',222,'male'),('ddc','ds@fds.com','11111111','Fds','Fdsaf','fds','','2013-04-20 15:34:02',3,'other'),('f','f@f.ff','f','f','f','','','2013-04-20 14:44:54',2,'other'),('fdd','f@qq.com','qwe','Qwqw','Erere','fd','','2013-04-20 15:17:04',3,'other'),('FFF','11@11.COM','11111111','FD','DD','HI','http://localhost:8080/travelsnap/images/avatar/085ba7ac-3720-4b04-92f0-ae74db0dbd0c.jpg','2013-05-06 17:34:58',32,'male'),('mary','mary@he.com','11111111','Mary','Mary','自我介紹 : \r\n馬俐〈Mary Ma〉， 08年春天因父親離世成為素食者。\r\n素食讓我更珍愛所有的生命。 \r\n我相信我父親來到這個世界是為了愛和奉獻，我也是。 ','http://localhost:8080/travelsnap/images/avatar/c194adc1-4b5c-44b8-af73-42d4ccf1f261.gif','2013-04-22 18:38:21',25,'female'),('S','F@Q.COM','F','dfd','Edfd','fdfdd','','2013-04-20 15:05:37',3,'male'),('testing','12@12.com','11111111','Fdsf','Fdsafds','hi','http://localhost:8080/travelsnap/images/avatar/1065b966-ce76-46cf-9fc3-3db8d18e0f69.jpg','2013-04-22 14:29:28',2,'male'),('uitest','1@qq.com','11111111','Ui','TFF','This is a test profile.','http://localhost:8080/travelsnap/images/avatar/2d78b093-7899-46ca-bd45-bb1d5ee31d17.jpg','2013-05-06 04:13:27',22,'male'),('y','yfdd@gmail.com','yyyyyyyyy','Y','Hj','good and bad','http://localhost:8080/travelsnap/images/avatar/6f50981d-c918-4366-9e88-51e8fef7fd08.jpg','2013-04-20 00:52:19',22,'male');
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

-- Dump completed on 2013-05-07 15:45:21
