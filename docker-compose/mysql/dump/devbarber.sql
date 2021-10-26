-- --------------------------------------------------------
-- Servidor:                     localhost
-- Versão do servidor:           10.4.6-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para devbarber
CREATE DATABASE IF NOT EXISTS `devbarber` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `devbarber`;

-- Copiando estrutura para tabela devbarber.barberavailability
CREATE TABLE IF NOT EXISTS `barberavailability` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_barber` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `hours` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barberavailability: ~60 rows (aproximadamente)
DELETE FROM `barberavailability`;
/*!40000 ALTER TABLE `barberavailability` DISABLE KEYS */;
INSERT INTO `barberavailability` (`id`, `id_barber`, `weekday`, `hours`) VALUES
	(1, 1, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(2, 1, 1, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(3, 1, 2, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(4, 1, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(5, 2, 0, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(6, 2, 1, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(7, 2, 2, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(8, 2, 3, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(9, 3, 0, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(10, 3, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(11, 3, 2, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(12, 3, 3, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(13, 4, 0, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(14, 4, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(15, 4, 2, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(16, 4, 3, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(17, 5, 0, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(18, 5, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(19, 5, 2, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(20, 5, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(21, 6, 0, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(22, 6, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(23, 6, 2, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(24, 6, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(25, 7, 0, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(26, 7, 1, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(27, 7, 2, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(28, 7, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(29, 8, 0, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(30, 8, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(31, 8, 2, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(32, 8, 3, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(33, 9, 0, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(34, 9, 1, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(35, 9, 2, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(36, 9, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(37, 10, 0, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(38, 10, 1, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(39, 10, 2, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(40, 10, 3, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(41, 11, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(42, 11, 1, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(43, 11, 2, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(44, 11, 3, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(45, 12, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(46, 12, 1, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(47, 12, 2, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(48, 12, 3, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(49, 13, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(50, 13, 1, '10:00,11:00,12:00,13:00,14:00,15:00,16:00,17:00'),
	(51, 13, 2, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(52, 13, 3, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(53, 14, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(54, 14, 1, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(55, 14, 2, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(56, 14, 3, '08:00,09:00,10:00,11:00,12:00,13:00,14:00,15:00'),
	(57, 15, 0, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(58, 15, 1, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00'),
	(59, 15, 2, '09:00,10:00,11:00,12:00,13:00,14:00,15:00,16:00'),
	(60, 15, 3, '07:00,08:00,09:00,10:00,11:00,12:00,13:00,14:00');
/*!40000 ALTER TABLE `barberavailability` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.barberphotos
CREATE TABLE IF NOT EXISTS `barberphotos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_barber` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barberphotos: ~60 rows (aproximadamente)
DELETE FROM `barberphotos`;
/*!40000 ALTER TABLE `barberphotos` DISABLE KEYS */;
INSERT INTO `barberphotos` (`id`, `id_barber`, `url`) VALUES
	(1, 1, '4.png'),
	(2, 1, '2.png'),
	(3, 1, '3.png'),
	(4, 1, '5.png'),
	(5, 2, '1.png'),
	(6, 2, '5.png'),
	(7, 2, '3.png'),
	(8, 2, '5.png'),
	(9, 3, '5.png'),
	(10, 3, '4.png'),
	(11, 3, '1.png'),
	(12, 3, '4.png'),
	(13, 4, '4.png'),
	(14, 4, '4.png'),
	(15, 4, '3.png'),
	(16, 4, '5.png'),
	(17, 5, '2.png'),
	(18, 5, '4.png'),
	(19, 5, '2.png'),
	(20, 5, '2.png'),
	(21, 6, '3.png'),
	(22, 6, '1.png'),
	(23, 6, '4.png'),
	(24, 6, '5.png'),
	(25, 7, '2.png'),
	(26, 7, '2.png'),
	(27, 7, '4.png'),
	(28, 7, '3.png'),
	(29, 8, '5.png'),
	(30, 8, '5.png'),
	(31, 8, '1.png'),
	(32, 8, '5.png'),
	(33, 9, '3.png'),
	(34, 9, '1.png'),
	(35, 9, '3.png'),
	(36, 9, '3.png'),
	(37, 10, '3.png'),
	(38, 10, '4.png'),
	(39, 10, '4.png'),
	(40, 10, '4.png'),
	(41, 11, '1.png'),
	(42, 11, '3.png'),
	(43, 11, '3.png'),
	(44, 11, '4.png'),
	(45, 12, '4.png'),
	(46, 12, '3.png'),
	(47, 12, '2.png'),
	(48, 12, '5.png'),
	(49, 13, '4.png'),
	(50, 13, '2.png'),
	(51, 13, '2.png'),
	(52, 13, '3.png'),
	(53, 14, '4.png'),
	(54, 14, '3.png'),
	(55, 14, '3.png'),
	(56, 14, '2.png'),
	(57, 15, '2.png'),
	(58, 15, '3.png'),
	(59, 15, '3.png'),
	(60, 15, '1.png');
/*!40000 ALTER TABLE `barberphotos` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.barberreviews
CREATE TABLE IF NOT EXISTS `barberreviews` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_barber` int(11) NOT NULL,
  `rate` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barberreviews: ~0 rows (aproximadamente)
DELETE FROM `barberreviews`;
/*!40000 ALTER TABLE `barberreviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `barberreviews` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.barbers
CREATE TABLE IF NOT EXISTS `barbers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `stars` double(8,2) NOT NULL,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barbers: ~15 rows (aproximadamente)
DELETE FROM `barbers`;
/*!40000 ALTER TABLE `barbers` DISABLE KEYS */;
INSERT INTO `barbers` (`id`, `name`, `avatar`, `stars`, `latitude`, `longitude`) VALUES
	(1, 'Gabriel Gomes', '4.png', 4.60, '-23.5630907', '-46.6982795'),
	(2, 'Amanada Silva', '1.png', 4.30, '-23.5130907', '-46.6382795'),
	(3, 'Gabriel Alvaro', '1.png', 3.20, '-23.5830907', '-46.6582795'),
	(4, 'Paulo Lacerda', '1.png', 4.40, '-23.5330907', '-46.6482795'),
	(5, 'Bonieky Gomes', '2.png', 2.40, '-23.5330907', '-46.6382795'),
	(6, 'Gabriel Gomes', '3.png', 3.00, '-23.5430907', '-46.6082795'),
	(7, 'Gabriel Gomes', '1.png', 4.30, '-23.5830907', '-46.6882795'),
	(8, 'Amanada Sousa', '2.png', 4.80, '-23.5030907', '-46.6382795'),
	(9, 'Amanada Silva', '4.png', 2.40, '-23.5330907', '-46.6882795'),
	(10, 'Gabriel Silva', '2.png', 3.50, '-23.5230907', '-46.6182795'),
	(11, 'Bonieky Lacerda', '2.png', 3.60, '-23.5430907', '-46.6382795'),
	(12, 'Bonieky Gomes', '1.png', 2.40, '-23.5230907', '-46.6782795'),
	(13, 'Leticia Diniz', '3.png', 4.20, '-23.5230907', '-46.6782795'),
	(14, 'Bonieky Lacerda', '4.png', 2.90, '-23.5930907', '-46.6582795'),
	(15, 'Leticia Silva', '4.png', 3.50, '-23.5930907', '-46.6282795');
/*!40000 ALTER TABLE `barbers` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.barberservices
CREATE TABLE IF NOT EXISTS `barberservices` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_barber` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barberservices: ~73 rows (aproximadamente)
DELETE FROM `barberservices`;
/*!40000 ALTER TABLE `barberservices` DISABLE KEYS */;
INSERT INTO `barberservices` (`id`, `id_barber`, `name`, `price`) VALUES
	(1, 1, 'Corte de Pernas', 63.91),
	(2, 1, 'Corte de Unha', 79.46),
	(3, 1, 'Corte de Sobrancelhas', 31.34),
	(4, 1, 'Efeite de Unha', 77.44),
	(5, 1, 'Pintura de Cabelo', 19.33),
	(6, 2, 'Corte de Pernas', 77.60),
	(7, 2, 'Aparação de Pernas', 83.76),
	(8, 2, 'Aparação de Cabelo', 62.38),
	(9, 2, 'Efeite de Sobrancelhas', 20.54),
	(10, 2, 'Aparação de Pernas', 40.22),
	(11, 3, 'Corte de Cabelo', 15.93),
	(12, 3, 'Corte de Pernas', 20.40),
	(13, 3, 'Corte de Pernas', 59.38),
	(14, 3, 'Aparação de Cabelo', 98.25),
	(15, 3, 'Corte de Pernas', 22.64),
	(16, 3, 'Efeite de Sobrancelhas', 98.91),
	(17, 4, 'Aparação de Pernas', 58.49),
	(18, 4, 'Efeite de Pernas', 95.46),
	(19, 4, 'Corte de Cabelo', 6.66),
	(20, 4, 'Aparação de Unha', 21.60),
	(21, 4, 'Pintura de Sobrancelhas', 71.33),
	(22, 5, 'Corte de Sobrancelhas', 62.28),
	(23, 5, 'Corte de Cabelo', 27.46),
	(24, 5, 'Corte de Cabelo', 82.70),
	(25, 6, 'Corte de Pernas', 19.53),
	(26, 6, 'Pintura de Cabelo', 63.14),
	(27, 6, 'Corte de Unha', 41.42),
	(28, 6, 'Pintura de Cabelo', 4.10),
	(29, 6, 'Corte de Unha', 71.26),
	(30, 7, 'Aparação de Cabelo', 34.10),
	(31, 7, 'Efeite de Sobrancelhas', 15.75),
	(32, 7, 'Pintura de Pernas', 37.68),
	(33, 7, 'Efeite de Unha', 60.37),
	(34, 7, 'Aparação de Sobrancelhas', 17.78),
	(35, 7, 'Corte de Pernas', 91.76),
	(36, 8, 'Corte de Pernas', 30.17),
	(37, 8, 'Pintura de Sobrancelhas', 53.93),
	(38, 8, 'Corte de Cabelo', 10.13),
	(39, 9, 'Aparação de Pernas', 95.44),
	(40, 9, 'Pintura de Sobrancelhas', 99.56),
	(41, 9, 'Corte de Sobrancelhas', 39.44),
	(42, 9, 'Aparação de Unha', 78.35),
	(43, 9, 'Corte de Pernas', 76.82),
	(44, 9, 'Corte de Cabelo', 66.59),
	(45, 10, 'Pintura de Cabelo', 20.30),
	(46, 10, 'Efeite de Cabelo', 84.88),
	(47, 10, 'Corte de Sobrancelhas', 38.78),
	(48, 10, 'Efeite de Pernas', 20.10),
	(49, 10, 'Pintura de Sobrancelhas', 96.11),
	(50, 10, 'Corte de Unha', 74.62),
	(51, 11, 'Pintura de Sobrancelhas', 63.79),
	(52, 11, 'Pintura de Cabelo', 11.85),
	(53, 11, 'Aparação de Pernas', 85.26),
	(54, 11, 'Aparação de Pernas', 90.20),
	(55, 11, 'Corte de Cabelo', 76.21),
	(56, 12, 'Pintura de Cabelo', 68.84),
	(57, 12, 'Corte de Sobrancelhas', 27.25),
	(58, 12, 'Pintura de Cabelo', 33.76),
	(59, 12, 'Pintura de Sobrancelhas', 59.83),
	(60, 12, 'Aparação de Cabelo', 81.22),
	(61, 13, 'Efeite de Sobrancelhas', 93.10),
	(62, 13, 'Corte de Unha', 75.94),
	(63, 13, 'Corte de Unha', 15.39),
	(64, 13, 'Corte de Sobrancelhas', 47.98),
	(65, 13, 'Aparação de Sobrancelhas', 19.49),
	(66, 14, 'Efeite de Sobrancelhas', 71.52),
	(67, 14, 'Aparação de Pernas', 9.92),
	(68, 14, 'Efeite de Cabelo', 47.80),
	(69, 14, 'Pintura de Sobrancelhas', 88.56),
	(70, 15, 'Aparação de Cabelo', 6.95),
	(71, 15, 'Corte de Unha', 70.71),
	(72, 15, 'Pintura de Unha', 17.70),
	(73, 15, 'Corte de Unha', 56.48);
/*!40000 ALTER TABLE `barberservices` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.barbertestimonials
CREATE TABLE IF NOT EXISTS `barbertestimonials` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_barber` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(8,2) NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.barbertestimonials: ~45 rows (aproximadamente)
DELETE FROM `barbertestimonials`;
/*!40000 ALTER TABLE `barbertestimonials` DISABLE KEYS */;
INSERT INTO `barbertestimonials` (`id`, `id_barber`, `name`, `rate`, `body`) VALUES
	(1, 1, 'Leticia Sousa', 2.70, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(2, 1, 'Ronaldo Sousa', 2.40, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(3, 1, 'Ronaldo Silva', 2.70, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(4, 2, 'Leticia Gomes', 4.70, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(5, 2, 'Paulo Lacerda', 2.60, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(6, 2, 'Leticia Lacerda', 2.10, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(7, 3, 'Amanada Silva', 4.70, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(8, 3, 'Amanada Lacerda', 3.10, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(9, 3, 'Amanada Alvaro', 2.80, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(10, 4, 'Gabriel Sousa', 3.00, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(11, 4, 'Bonieky Sousa', 2.20, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(12, 4, 'Gabriel Sousa', 3.00, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(13, 5, 'Gabriel Silva', 3.00, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(14, 5, 'Bonieky Lacerda', 3.60, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(15, 5, 'Amanada Gomes', 3.10, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(16, 6, 'Bonieky Gomes', 3.10, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(17, 6, 'Gabriel Lacerda', 4.20, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(18, 6, 'Leticia Gomes', 3.10, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(19, 7, 'Leticia Sousa', 4.10, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(20, 7, 'Amanada Lacerda', 3.00, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(21, 7, 'Paulo Gomes', 2.70, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(22, 8, 'Bonieky Sousa', 3.50, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(23, 8, 'Gabriel Silva', 3.70, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(24, 8, 'Gabriel Lacerda', 2.50, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(25, 9, 'Paulo Alvaro', 3.20, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(26, 9, 'Ronaldo Lacerda', 2.00, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(27, 9, 'Ronaldo Alvaro', 2.30, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(28, 10, 'Paulo Lacerda', 2.80, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(29, 10, 'Leticia Silva', 2.50, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(30, 10, 'Ronaldo Gomes', 2.70, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(31, 11, 'Amanada Alvaro', 2.30, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(32, 11, 'Paulo Lacerda', 3.40, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(33, 11, 'Amanada Silva', 4.50, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(34, 12, 'Gabriel Sousa', 4.50, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(35, 12, 'Leticia Diniz', 4.30, 'Assim mesmo, o desenvolvimento contínuo de distintas formas de atuação talvez venha a ressaltar a relatividade dos conhecimentos estratégicos para atingir a excelência.'),
	(36, 12, 'Paulo Lacerda', 4.10, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(37, 13, 'Leticia Alvaro', 2.10, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(38, 13, 'Amanada Sousa', 2.30, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(39, 13, 'Paulo Lacerda', 2.00, 'As experiências acumuladas demonstram que a revolução dos costumes maximiza as possibilidades por conta do impacto na agilidade decisória.'),
	(40, 14, 'Amanada Alvaro', 3.80, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(41, 14, 'Paulo Gomes', 3.50, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(42, 14, 'Gabriel Gomes', 4.70, 'Gostaria de enfatizar que a estrutura atual da organização possibilita uma melhor visão global dos paradigmas corporativos.'),
	(43, 15, 'Paulo Diniz', 3.60, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.'),
	(44, 15, 'Amanada Gomes', 2.50, 'Podemos já vislumbrar o modo pelo qual a estrutura atual da organização faz parte de um processo de gerenciamento do fluxo de informações.'),
	(45, 15, 'Ronaldo Alvaro', 4.30, 'Todas estas questões, devidamente ponderadas, levantam dúvidas sobre se o desafiador cenário globalizado obstaculiza a apreciação da importância das condições inegavelmente apropriadas.');
/*!40000 ALTER TABLE `barbertestimonials` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.migrations: ~2 rows (aproximadamente)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(2, '2021_09_18_154815_create_all_tables', 1),
	(3, '2021_09_20_182133_alter_appointment_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.userappointments
CREATE TABLE IF NOT EXISTS `userappointments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_barber` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `ap_datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.userappointments: ~2 rows (aproximadamente)
DELETE FROM `userappointments`;
/*!40000 ALTER TABLE `userappointments` DISABLE KEYS */;
INSERT INTO `userappointments` (`id`, `id_user`, `id_barber`, `id_service`, `ap_datetime`) VALUES
	(1, 1, 1, 4, '2021-09-26 09:00:00'),
	(2, 1, 1, 4, '2021-09-26 10:00:00');
/*!40000 ALTER TABLE `userappointments` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.userfavorites
CREATE TABLE IF NOT EXISTS `userfavorites` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_barber` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.userfavorites: ~2 rows (aproximadamente)
DELETE FROM `userfavorites`;
/*!40000 ALTER TABLE `userfavorites` DISABLE KEYS */;
INSERT INTO `userfavorites` (`id`, `id_user`, `id_barber`) VALUES
	(3, 1, 14),
	(4, 1, 10),
	(5, 1, 1);
/*!40000 ALTER TABLE `userfavorites` ENABLE KEYS */;

-- Copiando estrutura para tabela devbarber.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.png',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela devbarber.users: ~1 rows (aproximadamente)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `avatar`, `email`, `password`) VALUES
	(1, 'Adelson Guimarães', '01adf4a2371ecda5e88be1a507254304.jpg', 'adelsonguimaraes@gmail.com', '$2y$10$U.3AWoVALtB6eicP5WFvfOyVAHq40sL9Ct/8YN34wJWsYXIL3i/jG');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
