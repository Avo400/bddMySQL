-- MySQL dump 10.13  Distrib 5.7.36, for Win64 (x86_64)
--
-- Host: localhost    Database: javabdd
-- ------------------------------------------------------
-- Server version	5.7.36

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
-- Table structure for table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adresse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rue` varchar(100) DEFAULT NULL,
  `numeroRue` varchar(50) DEFAULT NULL,
  `codePostal` varchar(50) DEFAULT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adresse`
--

LOCK TABLES `adresse` WRITE;
/*!40000 ALTER TABLE `adresse` DISABLE KEYS */;
INSERT INTO `adresse` VALUES (1,'Rue du Sentier militaire','15','75000','Paris'),(2,'Rue du Sentier','3','74100','Annemasse'),(3,'Rue du geneve','5','74100','Gaillard'),(4,'douane de moellesulaz','5','74100','Gaillard'),(5,'vitam rue du chablais','11','74160','ZAC Chablais'),(7,'restaurant jade','9','74160','ZAC Chablais'),(15,'rue de gaulle','2','75000','Paris'),(16,'rue du soleil','3','01000','Bellegarde'),(17,'impasse du parfum','5','01000','Bellegarde'),(18,'pont artagnan','2','01000','Bellegarde');
/*!40000 ALTER TABLE `adresse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `prixUnitaire` int(11) DEFAULT NULL,
  `categorieId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_article_categorieID` (`categorieId`),
  CONSTRAINT `FK_article_categorieID` FOREIGN KEY (`categorieId`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (3,'voiture mercedes AMG - 3',33000,4),(12,'voiture kawatry',12,4),(14,'alfa romeo version 2',10500,5),(20,'voiture mercedes AMG turbo v8',70000,4),(22,'voiture kawa',13,4),(23,'voiture coco',10,4),(24,'avocat mur',4,4),(27,'vivo v21',500,3),(31,'carte son focusrite 2i2',180,5);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articlecommande`
--

DROP TABLE IF EXISTS `articlecommande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articlecommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `articleId` int(11) DEFAULT NULL,
  `quantite` int(11) NOT NULL,
  `commandeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articleId` (`articleId`),
  KEY `commandeId` (`commandeId`),
  CONSTRAINT `articlecommande_ibfk_1` FOREIGN KEY (`articleId`) REFERENCES `article` (`id`),
  CONSTRAINT `articlecommande_ibfk_2` FOREIGN KEY (`commandeId`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articlecommande`
--

LOCK TABLES `articlecommande` WRITE;
/*!40000 ALTER TABLE `articlecommande` DISABLE KEYS */;
INSERT INTO `articlecommande` VALUES (5,12,555,5),(6,27,2,6),(7,24,5,7),(8,23,1,8),(9,20,5,9),(10,3,189,27),(11,14,5,76),(12,3,5,89),(13,12,7,91),(14,14,8,93),(15,31,2,94),(16,23,3,95),(17,12,7,99),(18,12,4,100),(19,20,4,101),(20,3,1,102),(21,12,2,103),(22,14,3,104),(23,27,5,105),(24,22,15,109);
/*!40000 ALTER TABLE `articlecommande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `isbn` varchar(255) DEFAULT NULL,
  `photo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `photo_id` (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'titre numero 1','111111111111111',1),(2,'titre numero 2','2222222222222',2);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'alimentaire'),(2,'multimedia'),(3,'vetements'),(4,'vehicules automobile'),(5,'jeux de société');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `adresseId` int(11) DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adresseId` (`adresseId`),
  CONSTRAINT `client_ibfk_1` FOREIGN KEY (`adresseId`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (4,'Rabarijaona','Avo Mandresy',3,'2012-07-15'),(5,'Rabarijaona','Olivier',18,'1972-07-15'),(6,'Dupont','Jean',3,'1980-08-23'),(7,'Dupraz','Antoine',4,'1995-11-10'),(8,'Rippo','Nino',5,'1965-02-18'),(9,'Matelas','Michel',7,'1960-01-01'),(10,'Diana','Carla',15,'1955-08-13'),(11,'Diana','Chloe',15,'1955-08-13');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numeroCommande` int(11) DEFAULT NULL,
  `dateCommande` datetime DEFAULT NULL,
  `clientId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_commande_clientID` (`clientId`),
  CONSTRAINT `FK_commande_clientID` FOREIGN KEY (`clientId`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (5,1,'2022-01-09 00:00:00',4),(6,2,'2021-10-15 00:00:00',5),(7,3,'2021-02-18 00:00:00',6),(8,4,'2021-12-24 00:00:00',7),(9,5,'2021-05-20 00:00:00',8),(12,8,'2021-05-20 00:00:00',10),(13,11,'2021-12-25 00:00:00',10),(15,15,'2023-01-18 00:00:00',6),(16,14,'2023-03-15 00:00:00',10),(17,19,'2022-05-08 00:00:00',5),(18,20,'2022-03-01 00:00:00',11),(19,20,'2021-02-03 00:00:00',10),(20,25,'2022-06-05 00:00:00',6),(21,25,'2022-06-05 00:00:00',6),(22,26,'2022-05-03 00:00:00',10),(23,26,'2022-05-03 00:00:00',10),(24,56,'2022-03-05 00:00:00',5),(25,56,'2022-03-05 00:00:00',5),(26,57,'2022-06-05 00:00:00',5),(27,57,'2022-06-05 00:00:00',5),(28,145,'2022-06-05 00:00:00',8),(29,145,'2022-06-05 00:00:00',8),(30,149,'2022-06-05 00:00:00',7),(31,149,'2022-06-05 00:00:00',7),(32,150,'2022-06-05 00:00:00',6),(33,150,'2022-06-05 00:00:00',6),(34,20,'2021-02-03 00:00:00',10),(35,124,'2022-06-05 00:00:00',6),(36,124,'2022-06-05 00:00:00',6),(37,123,'2022-06-05 00:00:00',9),(38,123,'2022-06-05 00:00:00',9),(39,20,'2021-02-03 00:00:00',10),(40,40,'2022-06-05 00:00:00',9),(41,40,'2022-06-05 00:00:00',9),(42,125,'2022-06-05 00:00:00',8),(43,125,'2022-06-05 00:00:00',8),(44,126,'2022-06-05 00:00:00',4),(45,45,'2022-06-05 00:00:00',5),(46,35,'2022-06-05 00:00:00',4),(47,37,'2022-06-05 00:00:00',5),(48,78,'2022-06-05 00:00:00',10),(49,51,'2022-06-05 00:00:00',9),(50,88,'2022-06-05 00:00:00',7),(51,155,'2022-06-05 00:00:00',7),(52,126,'2022-06-05 00:00:00',7),(53,128,'2022-06-05 00:00:00',6),(54,129,'2022-06-05 00:00:00',8),(55,129,'2022-06-05 00:00:00',6),(56,123,'2022-06-05 00:00:00',6),(57,455,'2022-06-05 00:00:00',7),(58,145,'2022-06-05 00:00:00',8),(59,127,'2022-06-05 00:00:00',9),(60,129,'2022-06-05 00:00:00',8),(61,148,'2022-06-05 00:00:00',6),(62,145,'2022-06-05 00:00:00',5),(63,154,'2022-06-05 00:00:00',9),(64,148,'2022-06-05 00:00:00',6),(65,160,'2022-06-05 00:00:00',7),(66,157,'2022-06-05 00:00:00',6),(67,159,'2022-06-05 00:00:00',5),(68,80,'2021-02-03 00:00:00',10),(69,180,'2002-05-08 00:00:00',5),(70,90,'2022-08-09 00:00:00',10),(71,92,'2022-08-09 00:00:00',10),(72,59,'2022-06-05 00:00:00',10),(73,79,'2022-06-05 00:00:00',4),(74,45,'2002-05-08 00:00:00',11),(75,150,'2022-06-09 00:00:00',9),(76,80,'2022-06-05 00:00:00',7),(77,105,'2020-05-09 00:00:00',9),(78,157,'2022-03-02 00:00:00',6),(79,145,'2022-09-01 00:00:00',9),(81,81,'2021-03-05 00:00:00',5),(82,99,'2022-01-01 00:00:00',10),(83,79,'2022-03-02 00:00:00',11),(85,92,'2022-03-05 00:00:00',9),(86,78,'2022-10-08 00:00:00',10),(87,42,'2020-12-11 00:00:00',10),(88,78,'2020-02-03 00:00:00',6),(89,95,'2022-06-06 00:00:00',5),(90,45,'2002-09-09 00:00:00',10),(91,71,'2022-08-09 00:00:00',9),(92,78,'2022-08-09 00:00:00',8),(93,45,'2022-03-03 00:00:00',5),(94,88,'2022-03-03 00:00:00',4),(95,71,'2022-03-03 00:00:00',7),(96,50,'2022-06-06 00:00:00',10),(97,45,'2022-09-08 00:00:00',10),(98,78,'2022-08-08 00:00:00',8),(99,78,'2022-06-06 00:00:00',11),(100,47,NULL,5),(101,47,'2022-03-03 00:00:00',4),(102,78,'2022-03-03 00:00:00',5),(103,12,'2022-03-03 00:00:00',5),(104,41,'2022-03-03 00:00:00',4),(105,47,'2022-03-03 00:00:00',9),(106,45,'2022-08-07 00:00:00',10),(107,43,'2022-03-03 00:00:00',5),(108,89,'2022-03-03 00:00:00',11),(109,78,'2022-03-03 00:00:00',9),(110,41,'2022-03-03 00:00:00',8);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monuser2`
--

DROP TABLE IF EXISTS `monuser2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monuser2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monuser2`
--

LOCK TABLES `monuser2` WRITE;
/*!40000 ALTER TABLE `monuser2` DISABLE KEYS */;
INSERT INTO `monuser2` VALUES (1,'avo','avo@gmail.com'),(2,'toto','toto@gmail.com');
/*!40000 ALTER TABLE `monuser2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monuser3`
--

DROP TABLE IF EXISTS `monuser3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `monuser3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `adresseId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse_id` (`adresseId`),
  CONSTRAINT `fk_adresse_id` FOREIGN KEY (`adresseId`) REFERENCES `adresse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monuser3`
--

LOCK TABLES `monuser3` WRITE;
/*!40000 ALTER TABLE `monuser3` DISABLE KEYS */;
INSERT INTO `monuser3` VALUES (1,'jean','jean@gmail.com',1),(2,'marc','mar@gmail.com',2),(3,'tata','tata@gmail.com',3),(5,'katia','katia@mail.com',5),(6,'stephane','stephane@gmail.com',7);
/*!40000 ALTER TABLE `monuser3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo`
--

DROP TABLE IF EXISTS `photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photo` (
  `photo_id` int(11) NOT NULL AUTO_INCREMENT,
  `url_large` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`photo_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photo`
--

LOCK TABLES `photo` WRITE;
/*!40000 ALTER TABLE `photo` DISABLE KEYS */;
INSERT INTO `photo` VALUES (1,'http://photo1','ma photo1'),(2,'http://photo2','ma photo2');
/*!40000 ALTER TABLE `photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `categorieId` int(11) DEFAULT NULL,
  `prixUnitaire` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorieId` (`categorieId`),
  CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`categorieId`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'riz',1,2),(2,'ipad',2,500),(3,'persil',1,1),(4,'veste quechua',3,100);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-16  8:59:28
