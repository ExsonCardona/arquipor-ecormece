-- MySQL dump 10.16  Distrib 10.1.44-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.1.44-MariaDB-0ubuntu0.18.04.1

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
-- Table structure for table `categoria_producto`
--

DROP TABLE IF EXISTS `categoria_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `categoria_producto_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `categoria_producto_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria_producto`
--

LOCK TABLES `categoria_producto` WRITE;
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
INSERT INTO `categoria_producto` VALUES (1,1,1,'2020-09-20','2020-09-20 10:04:54'),(2,1,1,'2020-09-20','2020-09-20 10:05:24'),(6,1,5,'2020-09-20','2020-09-20 10:05:25'),(7,2,6,'2020-09-20','2020-09-20 10:05:49'),(8,2,7,'2020-09-20','2020-09-20 10:05:49'),(9,2,8,'2020-09-20','2020-09-20 10:05:49'),(10,3,9,'2020-09-20','2020-09-20 10:05:49'),(11,3,10,'2020-09-20','2020-09-20 10:05:50'),(12,4,11,'2020-09-20','2020-09-20 10:06:15'),(13,4,12,'2020-09-20','2020-09-20 10:06:15'),(14,5,13,'2020-09-20','2020-09-20 10:06:15'),(15,5,14,'2020-09-20','2020-09-20 10:06:15'),(16,5,10,'2020-09-20','2020-09-20 10:06:16');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Columna','2020-09-20','2020-09-20 09:54:09'),(2,'Techo','2020-09-20','2020-09-20 09:54:10'),(3,'Pared','2020-09-20','2020-09-20 09:54:10'),(4,'Ventana','2020-09-20','2020-09-20 09:54:10'),(5,'Puerta','2020-09-20','2020-09-20 09:54:12');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_factura`
--

DROP TABLE IF EXISTS `detalle_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `factuar_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factuar_id` (`factuar_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`factuar_id`) REFERENCES `facturas` (`id`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_factura`
--

LOCK TABLES `detalle_factura` WRITE;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dimensiones`
--

DROP TABLE IF EXISTS `dimensiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dimensiones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dimension` varchar(25) DEFAULT NULL,
  `producto_id` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `dimensiones_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dimensiones`
--

LOCK TABLES `dimensiones` WRITE;
/*!40000 ALTER TABLE `dimensiones` DISABLE KEYS */;
/*!40000 ALTER TABLE `dimensiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facturas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `condiciones` varchar(45) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` varchar(20) NOT NULL,
  `seleccionado` tinyint(1) NOT NULL DEFAULT '0',
  `producto_id` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `imagenes_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagenes`
--

LOCK TABLES `imagenes` WRITE;
/*!40000 ALTER TABLE `imagenes` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipios`
--

DROP TABLE IF EXISTS `municipios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `departamento_id` (`departamento_id`),
  CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipios`
--

LOCK TABLES `municipios` WRITE;
/*!40000 ALTER TABLE `municipios` DISABLE KEYS */;
/*!40000 ALTER TABLE `municipios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `imagen` varchar(20) NOT NULL,
  `precio_base` float(11,2) NOT NULL,
  `precio_venta` float(11,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `cantidad_minima` int(11) NOT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'1','1','1600359470.png',1.00,1.00,1,1,'2020-09-17','2020-09-17 10:24:55'),(5,'hi','world','1600457395.png',1.00,1.00,1,1,'2020-09-18','2020-09-18 13:29:55'),(6,'2','2','1600462802.png',2.00,2.00,2,2,'2020-09-18','2020-09-18 15:00:02'),(7,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:18'),(8,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:18'),(9,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:18'),(10,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:18'),(11,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:19'),(12,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:19'),(13,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:19'),(14,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:19'),(15,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(16,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(17,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(18,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(19,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(20,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:20'),(21,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(22,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(23,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(24,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(25,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(26,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:21'),(27,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:22'),(28,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:22'),(29,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:22'),(30,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:23'),(31,'example','descripton example','image.jpg',0.00,0.00,0,0,'2020-09-20','2020-09-20 09:54:23');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `direccion` varchar(75) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `departamento_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  `rol` enum('admin','cliente') DEFAULT NULL,
  `creado` date DEFAULT NULL,
  `actualizado` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `departamento_id` (`departamento_id`),
  KEY `municipio_id` (`municipio_id`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`),
  CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`municipio_id`) REFERENCES `municipios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-20 13:17:03
