-- MySQL dump 10.13  Distrib 9.0.1, for macos14 (arm64)
--
-- Host: localhost    Database: ChismesDB
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Chismes`
--

DROP TABLE IF EXISTS `Chismes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chismes` (
  `id_chisme` int NOT NULL AUTO_INCREMENT,
  `id_autor` int DEFAULT NULL,
  `id_persona` int DEFAULT NULL,
  `texto` text NOT NULL,
  `votos` int DEFAULT '0',
  PRIMARY KEY (`id_chisme`),
  KEY `id_autor` (`id_autor`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `chismes_ibfk_1` FOREIGN KEY (`id_autor`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `chismes_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chismes`
--

LOCK TABLES `Chismes` WRITE;
/*!40000 ALTER TABLE `Chismes` DISABLE KEYS */;
INSERT INTO `Chismes` VALUES (1,1,2,'Laura tiene piojos',0),(2,1,2,'Ejemplo de chisme',0),(3,1,5,'Frank no se baña',2),(4,1,2,'Laura tiene un gato sin testis, así que es une gate.',0),(5,1,1,'Josmer es perfecto.',0);
/*!40000 ALTER TABLE `Chismes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Conexiones`
--

DROP TABLE IF EXISTS `Conexiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Conexiones` (
  `id_usuario1` int NOT NULL,
  `id_usuario2` int NOT NULL,
  PRIMARY KEY (`id_usuario1`,`id_usuario2`),
  KEY `id_usuario2` (`id_usuario2`),
  CONSTRAINT `conexiones_ibfk_1` FOREIGN KEY (`id_usuario1`) REFERENCES `Usuarios` (`id_usuario`),
  CONSTRAINT `conexiones_ibfk_2` FOREIGN KEY (`id_usuario2`) REFERENCES `Usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Conexiones`
--

LOCK TABLES `Conexiones` WRITE;
/*!40000 ALTER TABLE `Conexiones` DISABLE KEYS */;
INSERT INTO `Conexiones` VALUES (10,1),(1,2),(1,3),(2,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(4,5);
/*!40000 ALTER TABLE `Conexiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuarios`
--

DROP TABLE IF EXISTS `Usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuarios`
--

LOCK TABLES `Usuarios` WRITE;
/*!40000 ALTER TABLE `Usuarios` DISABLE KEYS */;
INSERT INTO `Usuarios` VALUES (1,'Josmer','josmer@example.com','password1'),(2,'Laura','laura@example.com','password2'),(3,'Felsi','felsi@example.com','password3'),(4,'Ivis','ivis@example.com','password4'),(5,'Frank','frank@example.com','password5'),(6,'NuevoUsuario','nuevo@example.com','password'),(7,'','@example.com',''),(8,'','',''),(9,'Uriel','uriel@example.com','password1'),(10,'Ismael','ismael@example.com','password');
/*!40000 ALTER TABLE `Usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-09  1:35:43
