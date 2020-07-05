-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: policydb
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(45) DEFAULT NULL,
  `lname` varchar(45) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `emailid` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `role` varchar(45) DEFAULT 'user',
  PRIMARY KEY (`id`),
  UNIQUE KEY `userid_UNIQUE` (`username`),
  UNIQUE KEY `emailid_UNIQUE` (`emailid`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',NULL,NULL,NULL,NULL,'admin','$2a$10$9bJE8QhjLQ5KSKVyK/Ee7eDIT.rh0a8LfhjvrrTCPwWZoMROpxmqS','admin'),(5,'Shylesh','Giri','2017-11-01',NULL,'9878654342','giri@gmail.com','user123','$2a$10$vmPTBE0RCmxoCqPKr3v23uGK9qpo6M8X/ZuH2DJMWQbbMMkwpqECK','user'),(8,'test111','test111','2017-11-14','test111','111','ff@mms.com','test1111410','$2a$10$NhpXszCIkCb8hHvyuboMGe2/RAeGQ7MgDA3TUa3901qrT9osbNfqO','user'),(9,'q111','q111','2017-11-23','q111','1113','tt@mm.co','q1112310','$2a$10$i6u52wItcPY6nCCBhQ.QQ.KtOCEamH5W4i2upAgnsXtX4XiQcuJda','user'),(11,'g111','g111','2017-11-18','g111','4567','gg@mm.com','g1111810','$2a$10$7BvwXkB34wHnqQMy3dyAseqg92Xmgl.FQOWspPWE7COJwKtDd2BP2','user'),(17,'Shylesh','Giri','2017-11-28','hhh','9654324678','hh@mm.co','Shylesh2810','$2a$10$FDrd4EwxkScJDwMuWumPy.tY6JmFHQlEIS0vkpkrhl6Wudwr9bLR6','user'),(22,'mon','Giri','2017-11-22','dasd','987865666','giri11@gmail.com','mon2210','$2a$10$ekccv052TR0X/E6/gb7eNOgxRQErthHeWLZK4tdimUzWd2L.BWwIi','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-19 22:41:32
