-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: taxi_app
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `dependientes`
--

DROP TABLE IF EXISTS `dependientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependientes` (
  `SITIO` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `NOMBRE_DUENO` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `NOMBRE` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `APELLIDO` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `DOMICILIO` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `CORREO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CURP` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `RFC` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `UNIDAD` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `MATRICULA` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `COLOR` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`UNIDAD`),
  KEY `fk_SITIO` (`SITIO`),
  CONSTRAINT `fk_SITIO` FOREIGN KEY (`SITIO`) REFERENCES `flotilla` (`SITIO`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependientes`
--

LOCK TABLES `dependientes` WRITE;
/*!40000 ALTER TABLE `dependientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `dependientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flotilla`
--

DROP TABLE IF EXISTS `flotilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flotilla` (
  `SITIO` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `NOMBRE_LIDER` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `DOMICILIO` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`SITIO`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flotilla`
--

LOCK TABLES `flotilla` WRITE;
/*!40000 ALTER TABLE `flotilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `flotilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `independientes`
--

DROP TABLE IF EXISTS `independientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `independientes` (
  `NOMBRE_DUENO` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `NOMBRE` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `APELLIDO` varchar(40) COLLATE utf8_spanish2_ci NOT NULL,
  `TELEFONO` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `DOMICILIO` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `CORREO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `CURP` varchar(18) COLLATE utf8_spanish2_ci NOT NULL,
  `RFC` varchar(13) COLLATE utf8_spanish2_ci NOT NULL,
  `UNIDAD` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `MATRICULA` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `COLOR` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`UNIDAD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `independientes`
--

LOCK TABLES `independientes` WRITE;
/*!40000 ALTER TABLE `independientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `independientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `viajes` (
  `ID` int(5) NOT NULL AUTO_INCREMENT,
  `ORIGEN` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `REFERENCIA_ORIGEN` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `DESTINO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  `REFERENCIA_DESTINO` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25 15:21:49
