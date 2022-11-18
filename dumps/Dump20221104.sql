CREATE DATABASE  IF NOT EXISTS `Telefonica` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `Telefonica`;
-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: Telefonica
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Filiales`
--

DROP TABLE IF EXISTS `Filiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Filiales` (
  `idFiliales` int NOT NULL AUTO_INCREMENT,
  `Nombre_Filial` varchar(45) NOT NULL,
  `Num_Trabajadores` int DEFAULT NULL,
  PRIMARY KEY (`idFiliales`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Filiales`
--

LOCK TABLES `Filiales` WRITE;
/*!40000 ALTER TABLE `Filiales` DISABLE KEYS */;
INSERT INTO `Filiales` VALUES (1,'Especial bcn',45),(2,'Movistar',600),(3,'RedMovil45',400);
/*!40000 ALTER TABLE `Filiales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Marcas_Procesadores`
--

DROP TABLE IF EXISTS `Marcas_Procesadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Marcas_Procesadores` (
  `idMarcas_Procesadores` int NOT NULL AUTO_INCREMENT,
  `Nombre_Marca` varchar(45) NOT NULL,
  PRIMARY KEY (`idMarcas_Procesadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Marcas_Procesadores`
--

LOCK TABLES `Marcas_Procesadores` WRITE;
/*!40000 ALTER TABLE `Marcas_Procesadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Marcas_Procesadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Paises`
--

DROP TABLE IF EXISTS `Paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Paises` (
  `id_Pais` int NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` varcharFilialesProcesadores(45) NOT NULL,
  `Abreviatura` varchar(45) NOT NULL,
  `Renta_Per_Capita` decimal(10,0) NOT NULL,
  `Extension` decimal(10,0) NOT NULL,
  `Num_Habitantes` int NOT NULL,
  PRIMARY KEY (`id_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Paises`
--

LOCK TABLES `Paises` WRITE;
/*!40000 ALTER TABLE `Paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `Paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Poblaciones`
--

DROP TABLE IF EXISTS `Poblaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Poblaciones` (
  `idPoblaciones` int NOT NULL AUTO_INCREMENT,
  `Nombre_Poblacion` varchar(45) NOT NULL,
  `id_Pais` int DEFAULT NULL,
  PRIMARY KEY (`idPoblaciones`),
  KEY `fk_Pais` (`id_Pais`),
  CONSTRAINT `fk_Pais` FOREIGN KEY (`id_Pais`) REFERENCES `Paises` (`id_Pais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Poblaciones`
--

LOCK TABLES `Poblaciones` WRITE;
/*!40000 ALTER TABLE `Poblaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `Poblaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Procesadores`
--

DROP TABLE IF EXISTS `Procesadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Procesadores` (
  `idProcesadores` int NOT NULL AUTO_INCREMENT,
  `Modelo` varchar(45) NOT NULL,
  `Frecuencia` decimal(10,0) DEFAULT NULL,
  `Num_Nucleos` int NOT NULL,
  `idMarcas_Procesadores` int DEFAULT NULL,
  PRIMARY KEY (`idProcesadores`),
  KEY `fk_MarcaProcesador` (`idMarcas_Procesadores`),
  CONSTRAINT `fk_MarcaProcesador` FOREIGN KEY (`idMarcas_Procesadores`) REFERENCES `Marcas_Procesadores` (`idMarcas_Procesadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Procesadores`
--

LOCK TABLES `Procesadores` WRITE;
/*!40000 ALTER TABLE `Procesadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Procesadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sede`
--

DROP TABLE IF EXISTS `Sede`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sede` (
  `idSede` int NOT NULL AUTO_INCREMENT,
  `Nombre_Sede` varchar(45) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Coordenadas_X` varchar(45) NOT NULL,
  `Coordenadas_Y` varchar(45) NOT NULL,
  `Telefono_Contacto` varchar(45) DEFAULT NULL,
  `Central` varchar(45) NOT NULL,
  `idFiliales` int DEFAULT NULL,
  `idPoblaciones` int DEFAULT NULL,
  PRIMARY KEY (`idSede`),
  KEY `fk_Filial` (`idFiliales`),
  KEY `fk_Poblaciones` (`idPoblaciones`),
  CONSTRAINT `fk_Filial` FOREIGN KEY (`idFiliales`) REFERENCES `Filiales` (`idFiliales`),
  CONSTRAINT `fk_Poblaciones` FOREIGN KEY (`idPoblaciones`) REFERENCES `Poblaciones` (`idPoblaciones`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sede`
--

LOCK TABLES `Sede` WRITE;
/*!40000 ALTER TABLE `Sede` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sede` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sede_Servidores`
--

DROP TABLE IF EXISTS `Sede_Servidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sede_Servidores` (
  `Id_Servidores` int NOT NULL,
  `Id_Sede` int NOT NULL,
  `Id_Trabajador` int DEFAULT NULL,
  PRIMARY KEY (`Id_Servidores`,`Id_Sede`),
  KEY `FK_Sede` (`Id_Sede`),
  KEY `FK_Trabajador` (`Id_Trabajador`),
  CONSTRAINT `FK_Sede` FOREIGN KEY (`Id_Sede`) REFERENCES `Sede` (`idSede`),
  CONSTRAINT `FK_Servidores_Sede` FOREIGN KEY (`Id_Servidores`) REFERENCES `Servidores` (`idServidores`),
  CONSTRAINT `FK_Trabajador` FOREIGN KEY (`Id_Trabajador`) REFERENCES `Trabajadores` (`idTrabajadores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sede_Servidores`
--

LOCK TABLES `Sede_Servidores` WRITE;
/*!40000 ALTER TABLE `Sede_Servidores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sede_Servidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Servidores`
--

DROP TABLE IF EXISTS `Servidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Servidores` (
  `idServidores` int NOT NULL AUTO_INCREMENT,
  `Nombre_Servidor` varchar(45) NOT NULL,
  `Memoria_Ram` int NOT NULL,
  `Num_Discos` int NOT NULL,
  `Capacidad_Memoria` int NOT NULL,
  PRIMARY KEY (`idServidores`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Servidores`
--

LOCK TABLES `Servidores` WRITE;
/*!40000 ALTER TABLE `Servidores` DISABLE KEYS */;
INSERT INTO `Servidores` VALUES (1,'popp',600,3,1000),(2,'Mock',700,7,1500);
/*!40000 ALTER TABLE `Servidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tipo_Trabajador`
--

DROP TABLE IF EXISTS `Tipo_Trabajador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tipo_Trabajador` (
  `idTipo_Trabajador` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTipo_Trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tipo_Trabajador`
--

LOCK TABLES `Tipo_Trabajador` WRITE;
/*!40000 ALTER TABLE `Tipo_Trabajador` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tipo_Trabajador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajadores`
--

DROP TABLE IF EXISTS `Trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trabajadores` (
  `idTrabajadores` int NOT NULL AUTO_INCREMENT,
  `Nombre_Completo` varchar(45) NOT NULL,
  `DNI` varchar(9) NOT NULL,
  `idTipo_Trabajador` int DEFAULT NULL,
  PRIMARY KEY (`idTrabajadores`),
  KEY `fk_TipoTrabajador` (`idTipo_Trabajador`),
  CONSTRAINT `fk_TipoTrabajador` FOREIGN KEY (`idTipo_Trabajador`) REFERENCES `Tipo_Trabajador` (`idTipo_Trabajador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


CREATE TABLE  Trabajadores_Sede(
Fecha_Incorporacion DATE ,
Fecha_Baja DATE,
Id_Sede INT,
idTrabajadores INT,
CONSTRAINT pk_idSede PRIMARY KEY (Id_Sede, idTrabajadores),
CONSTRAINT fk_idTrabajadores FOREIGN KEY (idTrabajadores) REFERENCES Trabajadores (idTrabajadores),
CONSTRAINT fk_idServidores FOREIGN KEY (idServidores) REFERENCES Servidores (idServidores)
);

--
-- Dumping data for table `Trabajadores`
--

LOCK TABLES `Trabajadores` WRITE;
/*!40000 ALTER TABLE `Trabajadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabajadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-04  8:26:17
