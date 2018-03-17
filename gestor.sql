CREATE DATABASE  IF NOT EXISTS `gestor` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestor`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: gestor
-- ------------------------------------------------------
-- Server version	5.7.14

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(20) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `tipo` enum('PERSONA','EMPRESA','OTRO') DEFAULT NULL,
  `razon_social` varchar(60) DEFAULT NULL,
  `documento` enum('RUC','DNI','CARNET-EXT','OTRO') DEFAULT NULL,
  `numero_documento` varchar(45) DEFAULT NULL,
  `persona_contacto` varchar(45) DEFAULT NULL,
  `rubro` varchar(100) DEFAULT NULL,
  `ubigeo` varchar(45) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono1` varchar(12) DEFAULT NULL,
  `telefono2` varchar(12) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pagina_web` varchar(40) DEFAULT NULL,
  `observacion` varchar(80) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'fdfdsfdsfds','PERSONA','Saul Diaz Roblez','DNI','48575569',NULL,'Comercio industrial','010102','Ingenieria 159','6545522','4121222','saul@gmail.com','2212','2121',NULL,NULL,'2017-05-14 15:20:01'),(2,'A00015','PERSONA','Gloria Diaz Roblez','DNI','58785513','','Comercio','150111','Mza. A Lt. 12 Urb. Las Magnolias - Campoy S.J.L','3422119','9845651444','customer@goodm.com','www.goodm.com',NULL,NULL,NULL,'2017-04-10 06:10:04'),(3,'C12545','PERSONA','Daniel Eduardo Carrion Tenorio','DNI','548712',NULL,'Servicios infraestructura','010102','Eucaliptos 154','2154545','4545421','dcarrion@gmail.com',NULL,'Debe mucho',NULL,NULL,'2017-04-10 06:10:04'),(77,'C6666666','PERSONA','Daniel Delgado Diaz','DNI','34777463',NULL,'Tecnologia','010102','Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,NULL,'2017-04-10 06:10:12'),(78,'C59008','EMPRESA','Glosoft','DNI','42935406','Gloria Diaz','Tecnologia','010102','Urb. Ingenieria 975','3548556','984545211','atencion@glosoft.com','www.glosoft.com','Empresa de servicios TI',NULL,NULL,'2017-04-10 06:10:37'),(79,'C66098','EMPRESA','Servelir','RUC','82484233','Wildor Cartagena','Servicios de electricidad',NULL,'Campoy city','3422119','987616413','atencion@servlir.com','www.servlir.com','cliente vip',NULL,NULL,'2017-04-10 06:10:37'),(80,'CE00001','EMPRESA','GN7','RUC','45874545','James covos','Logistica',NULL,'Av. Yafue ps','45874545','1245454','jamesc@gn7app.com','apiv2.gn7logistic.com',NULL,NULL,NULL,'2017-04-10 06:10:38'),(81,'P001124','PERSONA','Abel Diaz Roblez','DNI','4865449',NULL,'Consultoria',NULL,'Av. La molina 5457','987544412','454566658','aeloy@hotmail.com','www.diazroblezconsulting.com','Cliente de confianza garantizada',NULL,NULL,'2017-04-10 06:11:09'),(82,'C0001','PERSONA','Daniel Eduardo Delgado Diaz','DNI','48374648',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,NULL,'2017-05-14 14:45:28'),(84,'CP00015','PERSONA','Daniel Eduardo Carrion Tenorio','DNI','48374666',NULL,'Electricidad',NULL,'Urb. el mal vive en ti 666','5655457','454542512','dacate@puromal.com','www.puromal.com','cliente malevolo',NULL,'2017-03-13 04:36:46','2017-04-10 06:12:52'),(85,'C58377','PERSONA','Andres janjs','DNI','12154',NULL,'121545','010403','212121','121212','1212121','121221@gmail.com','1212121','12121',NULL,'2017-03-18 00:26:29','2017-04-20 02:49:49'),(86,'3232323','EMPRESA','232323','RUC','232','3232','323232',NULL,'3232','3232','323','2323@gmail.com','2323232','32323',NULL,'2017-03-18 01:53:50','2017-04-10 05:14:04'),(87,'12145','EMPRESA','La tiendita de Don Pepe','RUC','1215454',NULL,'1212154',NULL,'121212','21','212','donpepe@donpepe.com','donpepe.com','211212',NULL,'2017-03-18 05:14:39','2017-04-10 05:19:02'),(88,'C583772','EMPRESA','Sanguches el Irvin','RUC','12454542','El Irvin','Sanguches','150111','El pasaje oscuro','125454','1212121','sanguchez@elirvin.com',NULL,'Donde te roban pero comes rico',NULL,'2017-03-18 17:16:46','2017-04-10 05:18:36'),(89,'RQ1245102','EMPRESA','Los Raqueteros de gamarra','RUC','1245454','El Bryan','Delincuencia','150115','Cerro El Pino Pasaje Osucuro','1154545','2124542','bryanelautorizado@loschullis.com','www.terobamosgratis.com','Pa Pa Pammmm',NULL,'2017-03-18 18:26:33','2017-04-10 06:13:40'),(90,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-08 21:54:16','2017-04-10 06:13:40'),(91,NULL,NULL,'George Quisape',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-08 21:55:22','2017-04-10 06:13:48'),(92,'12454545',NULL,'Luana Quispe',NULL,'12398748',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-08 21:56:15','2017-04-10 06:13:48'),(93,'C72742','PERSONA','fdfdsfdsfdsf','DNI','42674884',NULL,'Tecnologia','020202','Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-04-10 04:06:22','2017-04-10 04:09:26'),(94,'C82580','PERSONA','Daniel Eduardo Delgado Diaz','DNI','41041535',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 14:44:31','2017-05-14 14:44:31'),(95,'C81462','PERSONA','Daniel Eduardo Delgado Diaz','DNI','40323546',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 15:22:06','2017-05-14 15:22:06'),(96,'C91316','PERSONA','Daniel Eduardo Delgado Diaz','DNI','34706094',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 15:28:13','2017-05-14 15:28:13'),(97,'C47419','PERSONA','Daniel Eduardo Delgado Diaz','DNI','39584474',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 15:31:26','2017-05-14 15:31:26'),(98,'C28297','PERSONA','Daniel Eduardo Delgado Diaz','DNI','67975099',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 16:34:27','2017-05-14 16:34:27'),(99,'C56255','PERSONA','Daniel Eduardo Delgado Diaz','DNI','35727972',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 16:42:59','2017-05-14 16:42:59'),(100,'C61697','PERSONA','Daniel Eduardo Delgado Diaz','DNI','44960709',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 16:50:05','2017-05-14 16:50:05'),(101,'C81599','PERSONA','Daniel Eduardo Delgado Diaz','DNI','74798843',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 16:50:12','2017-05-14 16:50:12'),(102,'C31496','PERSONA','Daniel Eduardo Delgado Diaz','DNI','53990501',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-14 17:03:18','2017-05-14 17:03:18'),(103,'C90465','PERSONA','Daniel Eduardo Delgado Diaz','DNI','12893456',NULL,'Tecnologia',NULL,'Urb. Ingenieria 975','3422119','987616413','dedd1993@gmail.com','www.dandel.com','cliente vip',NULL,'2017-05-15 00:19:23','2017-05-15 00:19:23');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `documento` enum('FACTURA','BOLETA','OTRO') NOT NULL,
  `numero_documento` varchar(45) NOT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `fecha_emision` datetime DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `moneda` enum('PEN','USD','EUR') NOT NULL DEFAULT 'PEN',
  `igv` decimal(3,2) DEFAULT NULL,
  `monto` decimal(7,2) DEFAULT NULL,
  `abono` decimal(7,2) DEFAULT NULL,
  `orden_compra` varchar(45) DEFAULT NULL,
  `estado` enum('ANULADO','FINALIZADO') DEFAULT NULL,
  `estado_pago` enum('PENDIENTE','CANCELADO') DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `proveedor_id` int(8) NOT NULL,
  `pagos_id` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_compra_pagos1_idx` (`pagos_id`),
  KEY `fk_compra_proveedor1_idx` (`proveedor_id`),
  CONSTRAINT `fk_compra_pagos1` FOREIGN KEY (`pagos_id`) REFERENCES `tipo_de_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion`
--

DROP TABLE IF EXISTS `cotizacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion` (
  `id` int(7) unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `estado` enum('PENDIENTE','ACEPTADO','RECHAZADO','CANCELADO') DEFAULT 'PENDIENTE',
  `fecha_emision` date DEFAULT NULL,
  `fecha_validez` date DEFAULT NULL,
  `moneda` enum('PEN','USD','EUR') NOT NULL DEFAULT 'PEN',
  `sub_total` decimal(7,2) DEFAULT NULL,
  `descuento` decimal(7,2) DEFAULT NULL,
  `igv` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `plazo_entrega` varchar(50) DEFAULT NULL,
  `garantia` varchar(70) DEFAULT NULL,
  `mensaje` varchar(150) DEFAULT NULL,
  `orden_compra` varchar(20) DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo_de_pago_id` int(2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cotizacion_pagos1_idx` (`tipo_de_pago_id`),
  KEY `fk_cotizacion_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_cotizacion_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cotizacion_pagos1` FOREIGN KEY (`tipo_de_pago_id`) REFERENCES `tipo_de_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion`
--

LOCK TABLES `cotizacion` WRITE;
/*!40000 ALTER TABLE `cotizacion` DISABLE KEYS */;
INSERT INTO `cotizacion` VALUES (6,'1487534603','PENDIENTE','2017-02-19','2017-02-28','PEN',4900.00,0.00,882.00,5782.00,'5 dias','1 año',NULL,'O1245011',NULL,NULL,1,1,'2017-02-19 20:03:23','2017-02-19 20:03:23');
/*!40000 ALTER TABLE `cotizacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion_detalle`
--

DROP TABLE IF EXISTS `cotizacion_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion_detalle` (
  `cotizacion_id` int(10) unsigned NOT NULL,
  `producto_id` int(10) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `precio_unitario` decimal(7,2) DEFAULT NULL,
  `descuento_unitario` decimal(3,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `fk_detalle_cotizacion_producto1_idx` (`producto_id`),
  KEY `fk_detalle_cotizacion_cotizacion1_idx` (`cotizacion_id`),
  CONSTRAINT `fk_detalle_cotizacion_cotizacion1` FOREIGN KEY (`cotizacion_id`) REFERENCES `cotizacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_cotizacion_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion_detalle`
--

LOCK TABLES `cotizacion_detalle` WRITE;
/*!40000 ALTER TABLE `cotizacion_detalle` DISABLE KEYS */;
INSERT INTO `cotizacion_detalle` VALUES (6,1,NULL,5,500.00,NULL,2500.00,'2017-02-19 20:03:23','2017-02-19 20:03:23'),(6,3,NULL,2,1200.00,NULL,2400.00,'2017-02-19 20:03:23','2017-02-19 20:03:23');
/*!40000 ALTER TABLE `cotizacion_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cotizacion_estado`
--

DROP TABLE IF EXISTS `cotizacion_estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cotizacion_estado` (
  `id` int(1) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cotizacion_estado`
--

LOCK TABLES `cotizacion_estado` WRITE;
/*!40000 ALTER TABLE `cotizacion_estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `cotizacion_estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_compra` (
  `compra_id` bigint(13) unsigned NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio_unitario` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`producto_id`,`compra_id`),
  KEY `fk_detalle_compra_compra1_idx` (`compra_id`),
  KEY `fk_detalle_compra_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_compra_compra1` FOREIGN KEY (`compra_id`) REFERENCES `compra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_compra_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ficha_tecnica`
--

DROP TABLE IF EXISTS `detalle_ficha_tecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_ficha_tecnica` (
  `ficha_tecnica_id` int(10) unsigned NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `tipo` char(3) DEFAULT NULL,
  PRIMARY KEY (`ficha_tecnica_id`),
  KEY `fk_detalle_ft_ficha_tecnica1_idx` (`ficha_tecnica_id`),
  CONSTRAINT `fk_detalle_ft_ficha_tecnica1` FOREIGN KEY (`ficha_tecnica_id`) REFERENCES `ficha_tecnica` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ficha_tecnica`
--

LOCK TABLES `detalle_ficha_tecnica` WRITE;
/*!40000 ALTER TABLE `detalle_ficha_tecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_ficha_tecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empleado` (
  `id` int(8) unsigned NOT NULL,
  `nombres` varchar(60) NOT NULL,
  `apellido_pat` varchar(30) NOT NULL,
  `apellido_mat` varchar(30) NOT NULL,
  `dni` int(8) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono1` varchar(12) DEFAULT NULL,
  `telefono2` varchar(12) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `estado` char(1) DEFAULT NULL,
  `area_id` int(4) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_empleado_area1_idx` (`area_id`),
  CONSTRAINT `fk_empleado_area1` FOREIGN KEY (`area_id`) REFERENCES `area` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_tecnica`
--

DROP TABLE IF EXISTS `ficha_tecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_tecnica` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `concepto` varchar(150) DEFAULT NULL,
  `rc_nombre` varchar(50) DEFAULT NULL,
  `rc_cargo` varchar(20) DEFAULT NULL,
  `rc_dni` int(8) DEFAULT NULL,
  `empleado_id` int(8) unsigned NOT NULL,
  `cliente_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ficha_tecnica_empleado1_idx` (`empleado_id`),
  KEY `fk_ficha_tecnica_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_ficha_tecnica_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ficha_tecnica_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_tecnica`
--

LOCK TABLES `ficha_tecnica` WRITE;
/*!40000 ALTER TABLE `ficha_tecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_tecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `perfil` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT,
  `perfil` varchar(30) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `categoria` varchar(45) DEFAULT NULL,
  `subcategoria` varchar(45) DEFAULT NULL,
  `precio` decimal(7,2) DEFAULT NULL,
  `precio_moneda` enum('PEN','USD','EUR') DEFAULT 'PEN',
  `unidad_de_medida` varchar(20) DEFAULT NULL,
  `stock_minimo` int(4) DEFAULT NULL,
  `stock_maximo` int(4) DEFAULT NULL,
  `stock_actual` int(4) DEFAULT NULL,
  `fabricante` varchar(45) DEFAULT NULL,
  `marca` varchar(45) DEFAULT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `tamaño` varchar(45) DEFAULT NULL,
  `alto` varchar(45) DEFAULT NULL,
  `ancho` varchar(45) DEFAULT NULL,
  `largo` varchar(45) DEFAULT NULL,
  `observacion` varchar(50) DEFAULT NULL,
  `productocol` varchar(45) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,NULL,'Lavadora',NULL,'electrodomesticos',NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-12 04:44:51'),(2,NULL,'Cocina',NULL,'electrodomesticos',NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,'Refrigeradora',NULL,'electrodomesticos',NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-12 04:29:54','2017-02-12 04:29:54'),(4,NULL,'Televisor',NULL,'electrodomesticos',NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-16 06:20:21','2017-02-16 06:20:21'),(5,NULL,'Radio',NULL,NULL,NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-19 04:16:58','2017-02-19 04:16:58'),(6,NULL,'Arrozera',NULL,NULL,NULL,NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-02-19 04:22:02','2017-02-19 04:22:02');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `tipo` enum('PERSONA','EMPRESA','OTRO') DEFAULT NULL,
  `nombres` varchar(45) DEFAULT NULL,
  `apellidos` varchar(45) DEFAULT NULL,
  `razon_social` varchar(60) DEFAULT NULL,
  `documento` enum('RUC','DNI','CARNET-EXT','OTRO') DEFAULT NULL,
  `numero_documento` varchar(45) DEFAULT NULL,
  `persona_contacto` varchar(60) DEFAULT NULL,
  `rubro` varchar(100) DEFAULT NULL,
  `ubigeo` varchar(45) DEFAULT NULL,
  `direccion` varchar(80) DEFAULT NULL,
  `telefono1` varchar(12) DEFAULT NULL,
  `telefono2` varchar(12) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `pagina_web` varchar(40) DEFAULT NULL,
  `observacion` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor_producto`
--

DROP TABLE IF EXISTS `proveedor_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor_producto` (
  `proveedor_id` int(8) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `garantia` varchar(60) DEFAULT NULL,
  `costo` decimal(7,2) DEFAULT NULL,
  `costo_moneda` enum('PEN','USD','EUR') DEFAULT 'PEN',
  PRIMARY KEY (`proveedor_id`,`producto_id`),
  KEY `fk_proveedor_producto_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_proveedor_producto_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedor_producto_proveedor1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor_producto`
--

LOCK TABLES `proveedor_producto` WRITE;
/*!40000 ALTER TABLE `proveedor_producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `proveedor_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_pago`
--

DROP TABLE IF EXISTS `tipo_de_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_de_pago` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_pago`
--

LOCK TABLES `tipo_de_pago` WRITE;
/*!40000 ALTER TABLE `tipo_de_pago` DISABLE KEYS */;
INSERT INTO `tipo_de_pago` VALUES (1,'AL CONTADO',NULL);
/*!40000 ALTER TABLE `tipo_de_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `api_token_UNIQUE` (`api_token`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Dandel','dedd1993@gmail.com','$2y$10$x53jQgiqTxQmHt.ImMUzreofMVOWklAU0RdKAFdcNo9dKI.qJOD3C','yMwSvj2sOV15gYeHwb3XPlPnF8Ksk8BzhQbhLfG3oSuHF8w7y0hqCWFvlBfQ','2017-03-12 06:10:14','2017-03-12 06:11:16','yMwSvj2sOV15gYeHwb3XPlPnF8Ksk8BzhQbhLfG3oSuHF8w7y0hqCWFvlBfQ');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario` varchar(25) NOT NULL,
  `password` varchar(60) NOT NULL,
  `estado` char(1) NOT NULL,
  `empleado_id` int(8) unsigned NOT NULL,
  PRIMARY KEY (`usuario`),
  KEY `fk_usuario_empleado1_idx` (`empleado_id`),
  CONSTRAINT `fk_usuario_empleado1` FOREIGN KEY (`empleado_id`) REFERENCES `empleado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `valor` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `update` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
INSERT INTO `variables` VALUES (1,'igv','0.18','adsds','2017-02-12 08:21:30');
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta` (
  `id` bigint(13) unsigned NOT NULL AUTO_INCREMENT,
  `documento` enum('BOLETA','FACTURA') NOT NULL DEFAULT 'BOLETA',
  `numero_documento` varchar(45) NOT NULL,
  `contacto` varchar(50) DEFAULT NULL,
  `fecha_emision` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `moneda` enum('PEN','USD','EUR') NOT NULL DEFAULT 'PEN',
  `sub_total` decimal(7,2) DEFAULT NULL,
  `descuento` decimal(7,2) DEFAULT NULL,
  `igv` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `abono` decimal(7,2) DEFAULT NULL,
  `orden_compra` varchar(20) DEFAULT NULL,
  `estado_pago` enum('PENDIENTE','CANCELADO') DEFAULT NULL,
  `estado` enum('ANULADO','CONTABLE') DEFAULT NULL,
  `observaciones` varchar(200) DEFAULT NULL,
  `cotizacion` varchar(45) DEFAULT NULL,
  `cliente_id` int(11) NOT NULL,
  `tipo_de_pago_id` int(2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero_documento_UNIQUE` (`numero_documento`),
  KEY `fk_factura_pagos1_idx` (`tipo_de_pago_id`),
  KEY `fk_factura_cliente1_idx` (`cliente_id`),
  CONSTRAINT `fk_factura_cliente1` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_pagos1` FOREIGN KEY (`tipo_de_pago_id`) REFERENCES `tipo_de_pago` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (2,'BOLETA','1486858742',NULL,'2017-02-12',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-12 05:19:02','2017-02-12 05:19:02'),(4,'BOLETA','1486861883',NULL,'2017-02-12',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-12 06:11:23','2017-02-12 06:11:23'),(5,'BOLETA','1486884376',NULL,'2017-02-12',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-12 12:26:16','2017-02-12 12:26:16'),(6,'BOLETA','1486884577',NULL,'2017-02-12',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-12 12:29:37','2017-02-12 12:29:37'),(7,'BOLETA','1486887741','El raton Perez','2017-02-12',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-12 08:22:21','2017-02-12 08:22:21'),(46,'BOLETA','1487473885','El raton Perez','2017-02-18',NULL,'PEN',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,'2017-02-19 03:11:25','2017-02-19 03:11:25'),(47,'BOLETA','1487486205','El bryan','2017-02-19',NULL,'PEN',3600.00,NULL,648.00,4248.00,NULL,NULL,NULL,'CONTABLE',NULL,NULL,1,1,'2017-02-19 06:36:45','2017-02-19 06:36:45'),(48,'BOLETA','1487486382','El bryan','2017-02-19',NULL,'PEN',3600.00,500.00,558.00,3658.00,NULL,NULL,NULL,'CONTABLE',NULL,NULL,1,1,'2017-02-19 06:39:42','2017-02-19 06:39:42'),(49,'BOLETA','1487487544','El bryan','2017-02-19',NULL,'PEN',4900.00,500.00,792.00,5192.00,NULL,'12454544',NULL,'ANULADO','cliente conforme','1245424512',1,1,'2017-02-19 06:59:04','2017-02-19 17:41:56');
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_detalle`
--

DROP TABLE IF EXISTS `venta_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venta_detalle` (
  `venta_id` bigint(13) unsigned NOT NULL,
  `producto_id` int(11) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `cantidad` int(4) DEFAULT NULL,
  `precio_unitario` decimal(7,2) DEFAULT NULL,
  `total` decimal(7,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`venta_id`,`producto_id`),
  KEY `fk_detalle_venta_producto1_idx` (`producto_id`),
  CONSTRAINT `fk_detalle_venta_producto1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_venta1` FOREIGN KEY (`venta_id`) REFERENCES `venta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_detalle`
--

LOCK TABLES `venta_detalle` WRITE;
/*!40000 ALTER TABLE `venta_detalle` DISABLE KEYS */;
INSERT INTO `venta_detalle` VALUES (2,1,NULL,1,1300.00,1300.00,NULL,NULL),(2,2,NULL,1,1500.00,1500.00,NULL,NULL),(46,1,NULL,2,1300.00,2600.00,'2017-02-19 03:11:25','2017-02-19 03:11:25'),(46,3,NULL,1,1300.00,1300.00,'2017-02-19 03:11:25','2017-02-19 03:11:25'),(47,1,NULL,2,1300.00,2600.00,'2017-02-19 06:36:45','2017-02-19 06:36:45'),(47,3,NULL,1,1000.00,1000.00,'2017-02-19 06:36:45','2017-02-19 06:36:45'),(48,1,NULL,2,1300.00,2600.00,'2017-02-19 06:39:42','2017-02-19 06:39:42'),(48,3,NULL,1,1000.00,1000.00,'2017-02-19 06:39:42','2017-02-19 06:39:42'),(49,1,NULL,5,500.00,2500.00,'2017-02-19 06:59:04','2017-02-19 06:59:04'),(49,3,NULL,2,1200.00,2400.00,'2017-02-19 06:59:04','2017-02-19 06:59:04');
/*!40000 ALTER TABLE `venta_detalle` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-02  2:54:09
