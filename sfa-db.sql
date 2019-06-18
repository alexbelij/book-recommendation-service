-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: sfa-db
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `books` (
  `book_asin` bigint(20) NOT NULL,
  `title` varchar(250) NOT NULL,
  `author` varchar(45) NOT NULL,
  `genre` varchar(30) NOT NULL,
  PRIMARY KEY (`book_asin`),
  UNIQUE KEY `book_id_UNIQUE` (`book_asin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2182718,'Improve Your Bowls','Tony Allcock','Sports & Outdoors'),(7210361,'Asthma-Free Naturally: Everything You Need to Know About Taking Control of Your Asthma--Featuring the Buteyko Breathing Method Suitable for Adults and Children','Patrick G. McKeown','Health, Fitness & Dieting'),(7262833,'Seeing Red','Graham Poll','Biographies & Memoirs');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (62);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book_rate`
--

DROP TABLE IF EXISTS `user_book_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_book_rate` (
  `user_id` bigint(20) NOT NULL,
  `book_asin` bigint(20) NOT NULL,
  `rate` varchar(45) DEFAULT NULL,
  UNIQUE KEY `user_id_and_book_asin_unique_index` (`user_id`,`book_asin`),
  UNIQUE KEY `UK6nqqiddw0vme7ikbxsdiqwoh7` (`user_id`,`book_asin`),
  KEY `fk_user_id_idx` (`user_id`),
  KEY `fk_book_asin_idx` (`book_asin`),
  CONSTRAINT `fk_book_asin` FOREIGN KEY (`book_asin`) REFERENCES `books` (`book_asin`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book_rate`
--

LOCK TABLES `user_book_rate` WRITE;
/*!40000 ALTER TABLE `user_book_rate` DISABLE KEYS */;
INSERT INTO `user_book_rate` VALUES (7,2182718,'5'),(7,7210361,'3'),(9,7210361,'4');
/*!40000 ALTER TABLE `user_book_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_book_rate_bookasin`
--

DROP TABLE IF EXISTS `user_book_rate_bookasin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_book_rate_bookasin` (
  `user_book_rate_user_id` bigint(20) NOT NULL,
  `bookasin_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_book_rate_user_id`,`bookasin_user_id`),
  UNIQUE KEY `UK_bdlx00ftoiujyofglxjtdvmj7` (`bookasin_user_id`),
  CONSTRAINT `FK7csfgmlqnnho0s1a56jonnf5x` FOREIGN KEY (`bookasin_user_id`) REFERENCES `user_book_rate` (`user_id`),
  CONSTRAINT `FKg3jv74pa3chhy2xt66e47nsfq` FOREIGN KEY (`user_book_rate_user_id`) REFERENCES `user_book_rate` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_book_rate_bookasin`
--

LOCK TABLES `user_book_rate_bookasin` WRITE;
/*!40000 ALTER TABLE `user_book_rate_bookasin` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_book_rate_bookasin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email_address` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `email_address_UNIQUE` (`email_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (7,'sefa','oduncuoglu','sefaoduncuoglu@gmail.com','2019-06-15 16:56:36','2019-06-15 16:56:36'),(8,'sefa2','asd','sefaoduncuoglu2@gmail.com','2019-06-15 23:15:32','2019-06-16 16:12:16'),(9,'sefa3','oduncuoglu3','sefaoduncuoglu3@gmail.com','2019-06-16 10:27:31','2019-06-16 10:27:31'),(10,'sefa4','oduncuoglu4','sefaoduncuoglu4@gmail.com','2019-06-16 10:29:21','2019-06-16 10:29:21');
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

-- Dump completed on 2019-06-17 22:08:44