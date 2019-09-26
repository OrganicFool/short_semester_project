-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: website
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `address` (
  `username` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  PRIMARY KEY (`username`,`address`),
  KEY `fk_ADDRESS_USER_idx` (`username`),
  CONSTRAINT `fk_ADDRESS_USER` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `username` varchar(45) NOT NULL,
  `categoryId` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`,`categoryId`),
  KEY `fk_USER_has_PRODUCT_PRODUCT2_idx` (`categoryId`),
  KEY `fk_USER_has_PRODUCT_USER2_idx` (`username`),
  CONSTRAINT `fk_USER_has_PRODUCT_PRODUCT2` FOREIGN KEY (`categoryId`) REFERENCES `product` (`categoryId`),
  CONSTRAINT `fk_USER_has_PRODUCT_USER2` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_has_order`
--

DROP TABLE IF EXISTS `cart_has_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart_has_order` (
  `username` varchar(45) NOT NULL,
  `orderId` varchar(45) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `categoryId` varchar(45) NOT NULL,
  PRIMARY KEY (`orderId`,`categoryId`),
  KEY `fk_CART_has_ORDER_ORDER1_idx` (`orderId`),
  KEY `fk_CART_has_ORDER_PRODUCT1_idx` (`categoryId`),
  CONSTRAINT `fk_CART_has_ORDER_ORDER1` FOREIGN KEY (`orderId`) REFERENCES `checkorder` (`orderId`),
  CONSTRAINT `fk_CART_has_ORDER_PRODUCT1` FOREIGN KEY (`categoryId`) REFERENCES `product` (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_has_order`
--

LOCK TABLES `cart_has_order` WRITE;
/*!40000 ALTER TABLE `cart_has_order` DISABLE KEYS */;
INSERT INTO `cart_has_order` VALUES ('xhdxhd','1',8,'3'),('xhdxhd','1',1,'4'),('xhdxhd','2',4,'1'),('xhdxhd','2',2,'2'),('xhdxhd','2',5,'5'),('xhdxhd','3',2000,'1'),('xhdxhd','3',1000,'2'),('xhdxhd','4',2000,'1'),('xhdxhd','4',100,'3'),('zzjzzj','5',1,'1'),('zzjzzj','5',3,'2'),('zzjzzj','5',2,'3'),('xhdxhd','6',5,'1'),('xhdxhd','6',3,'3'),('xhdxhd','7',2,'2'),('xhdxhd','7',4,'3'),('xhdxhd','8',3,'1'),('xhdxhd','9',1,'1'),('xhdxhd','9',2,'2');
/*!40000 ALTER TABLE `cart_has_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkorder`
--

DROP TABLE IF EXISTS `checkorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `checkorder` (
  `orderId` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `time` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `fk_ORDER_USER1_idx` (`username`),
  CONSTRAINT `fk_ORDER_USER1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkorder`
--

LOCK TABLES `checkorder` WRITE;
/*!40000 ALTER TABLE `checkorder` DISABLE KEYS */;
INSERT INTO `checkorder` VALUES ('1','xhdxhd',5800,'2019-09-24 21:49:52'),('2','xhdxhd',12500,'2019-09-24 22:02:10'),('3','xhdxhd',5000000,'2019-09-24 22:02:56'),('4','xhdxhd',4010000,'2019-09-24 22:03:45'),('5','zzjzzj',5200,'2019-09-25 08:42:44'),('6','xhdxhd',10300,'2019-09-25 12:25:28'),('7','xhdxhd',2400,'2019-09-25 12:32:10'),('8','xhdxhd',6000,'2019-09-25 13:15:50'),('9','xhdxhd',4000,'2019-09-25 14:54:39');
/*!40000 ALTER TABLE `checkorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followed`
--

DROP TABLE IF EXISTS `followed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `followed` (
  `username` varchar(45) NOT NULL,
  `categoryId` varchar(45) NOT NULL,
  PRIMARY KEY (`username`,`categoryId`),
  KEY `fk_USER_has_PRODUCT_PRODUCT1_idx` (`categoryId`),
  KEY `fk_USER_has_PRODUCT_USER1_idx` (`username`),
  CONSTRAINT `fk_USER_has_PRODUCT_PRODUCT1` FOREIGN KEY (`categoryId`) REFERENCES `product` (`categoryId`),
  CONSTRAINT `fk_USER_has_PRODUCT_USER1` FOREIGN KEY (`username`) REFERENCES `user` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followed`
--

LOCK TABLES `followed` WRITE;
/*!40000 ALTER TABLE `followed` DISABLE KEYS */;
/*!40000 ALTER TABLE `followed` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `categoryId` varchar(45) NOT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`categoryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','dog1','electronic',2000),('2','dog2','electronic',1000),('3','dog3','model',100),('4','dog4','remote',5000),('5','dog5','remote',500),('6','dog6','model',300);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telephone` varchar(45) DEFAULT NULL,
  `currentAddress` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('stdfojk','12345678h','11','1000111','bupt'),('xhdxhd','12345678','1000000@bupt.edu.cn','1111111111111','bupt'),('xzcxzc','12345678','33@qq.com','12345','bupt'),('zzjzzj','12345678','2@qq.com','1234','bupt');
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

-- Dump completed on 2019-09-26 14:56:22
