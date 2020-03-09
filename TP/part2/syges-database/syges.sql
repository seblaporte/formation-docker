# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Hôte: 127.0.0.1 (MySQL 5.7.12)
# Base de données: syges
# Temps de génération: 2016-06-30 14:45:53 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE syges;

USE syges;

# Affichage de la table Agency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Agency`;

CREATE TABLE `Agency` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `calendarNumber` varchar(2) NOT NULL,
  `code` varchar(5) NOT NULL,
  `currentPeriodStartDate` date DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `companyId` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l7bfy8rpdirk18tuou67xktrn` (`companyId`),
  CONSTRAINT `FK_l7bfy8rpdirk18tuou67xktrn` FOREIGN KEY (`companyId`) REFERENCES `Company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Agency` WRITE;
/*!40000 ALTER TABLE `Agency` DISABLE KEYS */;

INSERT INTO `Agency` (`id`, `calendarNumber`, `code`, `currentPeriodStartDate`, `label`, `active`, `companyId`)
VALUES
	(1,'01','TOUR1','2015-04-01','Tours Production',b'1','APTOP'),
	(2,'01','ORLE1','2015-04-01','Orleans Production',b'1','APTOP'),
	(10,'01','TOURS','2015-04-01','Tours Structure',b'1','APTOP'),
	(11,'01','ORLES','2015-04-01','Orleans Structure',b'1','APTOP'),
	(20,'01','GENE1','2015-04-01','Geneve Production',b'1','SUISS');

/*!40000 ALTER TABLE `Agency` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table Company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Company`;

CREATE TABLE `Company` (
  `id` varchar(5) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Company` WRITE;
/*!40000 ALTER TABLE `Company` DISABLE KEYS */;

INSERT INTO `Company` (`id`, `label`, `active`)
VALUES
	('APINF','APSIDE INFOGERANCE',b'1'),
	('APNOR','APSIDE NORD',b'1'),
	('APSHY','APSHYDE TOULOUSE',b'1'),
	('APSID','APSIDE',b'1'),
	('APTEC','APSIDE TECHNOLOGIES',b'1'),
	('APTOP','APSIDE TOP',b'1'),
	('BELGI','APS BELGIUM',b'1'),
	('BRAIN','BRAINPOWER',b'1'),
	('ERGIM','ERG IMC',b'1'),
	('HTI','HTI',b'1'),
	('HTIF','HTI FINANCE',b'1'),
	('QUALI','QUALIPSE GROUPE APSIDE',b'1'),
	('SUISS','APS GENEVE',b'1');

/*!40000 ALTER TABLE `Company` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table Establishment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Establishment`;

CREATE TABLE `Establishment` (
  `id` varchar(5) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `companyId` varchar(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_t60hbp7s9m06tpnxfy29l6rp` (`companyId`),
  CONSTRAINT `FK_t60hbp7s9m06tpnxfy29l6rp` FOREIGN KEY (`companyId`) REFERENCES `Company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Establishment` WRITE;
/*!40000 ALTER TABLE `Establishment` DISABLE KEYS */;

INSERT INTO `Establishment` (`id`, `label`, `active`, `companyId`)
VALUES
	('AIX','APSIDE SA AIX',b'1','APSID'),
	('ATBLG','APSIDE TECHNOLOGIES SAS',b'1','APTEC'),
	('BDX','APSIDE SA BORDEAUX',b'1','APSID'),
	('BLGNE','APSIDE SA BOULOGNE',b'1','APSID'),
	('BRAIN','BRAINPOWER SARL',b'1','BRAIN'),
	('BREST','APSIDE SA BREST',b'1','APSID'),
	('BRUX','APS BELGIUM BRUXELLE',b'1','BELGI'),
	('ERG','ERG IMC',b'1','ERGIM'),
	('FINPA','HTI FINANCE SAS',b'1','HTIF'),
	('GENEV','APSIDE GENEVE',b'1','SUISS'),
	('HTIMO','HIGH TECH INTELLIGENCE MONTBELIARD',b'1','HTI'),
	('HTIPA','HIGH TECH INTELLIGENCE',b'1','HTI'),
	('INFPA','APSIDE INFOGERANCE SAS',b'1','APINF'),
	('LILLE','APSIDE NORD SAS',b'1','APNOR'),
	('LYON','APSIDE SA LYON',b'1','APSID'),
	('NANTE','APSIDE SA NANTES',b'1','APSID'),
	('NICE','APSIDE SA VALBONNE',b'1','APSID'),
	('ORLEA','APSIDE TOP SAS ORLEANS',b'1','APTOP'),
	('QBLG','QUALIPSE SAS',b'1','QUALI'),
	('QNRD','QUALIPSE SAS AGENCE LILLE',b'1','QUALI'),
	('RENNE','APSIDE SA RENNES',b'1','APSID'),
	('STR','APSIDE SA STRASBOURG',b'1','APSID'),
	('TLSE','APSIDE SA TOULOUSE',b'1','APSID'),
	('TOURS','APSIDE TOP SAS',b'1','APTOP');

/*!40000 ALTER TABLE `Establishment` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table Manager
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Manager`;

CREATE TABLE `Manager` (
  `code` varchar(10) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_bxbjgo3gtuyx3dxl78t78pljv` (`code`),
  CONSTRAINT `FK_5i5xb0k7gxwvhhsk80cwrh207` FOREIGN KEY (`id`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Manager` WRITE;
/*!40000 ALTER TABLE `Manager` DISABLE KEYS */;

INSERT INTO `Manager` (`code`, `title`, `id`)
VALUES
	('SRE','Mme.',50),
	('PCO','M.',100),
	('RAS','M.',102);

/*!40000 ALTER TABLE `Manager` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table Manager_Agency
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Manager_Agency`;

CREATE TABLE `Manager_Agency` (
  `managerId` bigint(20) NOT NULL,
  `agencyId` bigint(20) NOT NULL,
  PRIMARY KEY (`managerId`,`agencyId`),
  KEY `FK_o7r4nx4mi0koudw8wmhccdbna` (`agencyId`),
  CONSTRAINT `FK_9cwob7jw1665j2ut0jm5g2k5s` FOREIGN KEY (`managerId`) REFERENCES `Manager` (`id`),
  CONSTRAINT `FK_o7r4nx4mi0koudw8wmhccdbna` FOREIGN KEY (`agencyId`) REFERENCES `Agency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Manager_Agency` WRITE;
/*!40000 ALTER TABLE `Manager_Agency` DISABLE KEYS */;

INSERT INTO `Manager_Agency` (`managerId`, `agencyId`)
VALUES
	(50,1),
	(102,1),
	(50,2);

/*!40000 ALTER TABLE `Manager_Agency` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table ManagerRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ManagerRole`;

CREATE TABLE `ManagerRole` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `active` bit(1) DEFAULT NULL,
  `managerId` bigint(20) NOT NULL,
  `roleId` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_cles8gxxa2xj46uln608wiy2j` (`managerId`),
  KEY `FK_apu549p5puf714sa6qw10iukd` (`roleId`),
  CONSTRAINT `FK_apu549p5puf714sa6qw10iukd` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`),
  CONSTRAINT `FK_cles8gxxa2xj46uln608wiy2j` FOREIGN KEY (`managerId`) REFERENCES `Manager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ManagerRole` WRITE;
/*!40000 ALTER TABLE `ManagerRole` DISABLE KEYS */;

INSERT INTO `ManagerRole` (`id`, `active`, `managerId`, `roleId`)
VALUES
	(1,b'1',50,'AGENCY_MANAGER'),
	(2,b'1',100,'COMMERCIAL_MANAGER'),
	(11,b'1',100,'USER_MANAGER'),
	(30,b'1',102,'ASSISTANT_MANAGER');

/*!40000 ALTER TABLE `ManagerRole` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table Role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
  `id` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `Role` WRITE;
/*!40000 ALTER TABLE `Role` DISABLE KEYS */;

INSERT INTO `Role` (`id`, `label`)
VALUES
	('ADMINISTRATIVE_MANAGER','Responsable Administratif'),
	('AGENCY_MANAGER','Responsable D\'Agence'),
	('ASSISTANT_MANAGER','Responsable Assistante Agence'),
	('COMMERCIAL_MANAGER','Responsable Commercial'),
	('EXPENSE_MANAGER','Responsable Frais'),
	('MANAGEMENT_CONTROLLER','Controleur de Gestion'),
	('OPERATIONAL_MANAGER','Responsable Operationnel'),
	('PAY_MANAGER','Responsable Paie'),
	('PROJECT_MANAGER','Responsable Projet'),
	('QUALITY_MANAGER','Responsable Qualite'),
	('TECHNICAL_MANAGER','Responsable Technique'),
	('USER_MANAGER','Responsable Intervenant'),
	('WEB_MANAGER','Responsable Web');

/*!40000 ALTER TABLE `Role` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table User
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User`;

CREATE TABLE `User` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activityPercentage` float NOT NULL,
  `dayOffEntryEnabled` bit(1) DEFAULT NULL,
  `firstName` varchar(40) DEFAULT NULL,
  `hashedPassword` bit(1) DEFAULT NULL,
  `lastName` varchar(40) NOT NULL,
  `legacyId` varchar(15) NOT NULL,
  `login` varchar(50) NOT NULL,
  `multipleAssignment` bit(1) NOT NULL,
  `partTime` bit(1) NOT NULL,
  `password` varchar(255) NOT NULL,
  `payNumber` varchar(20) DEFAULT NULL,
  `resourceCategory` varchar(4) NOT NULL,
  `resourceType` varchar(2) NOT NULL,
  `active` bit(1) DEFAULT NULL,
  `dayHourCount` decimal(4,2) NOT NULL,
  `timeUnit` varchar(4) NOT NULL,
  `trigramCode` varchar(5) DEFAULT NULL,
  `calendarNumber` varchar(2) NOT NULL,
  `establishmentId` varchar(5) NOT NULL,
  `originAgencyId` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_reva3t0pimgt9hvwo65mggbp6` (`legacyId`),
  KEY `FK_c9e7sq5171gnso36qihotvlxj` (`calendarNumber`),
  KEY `FK_jqgpko51js7f8epcawu13su64` (`establishmentId`),
  KEY `FK_2renbfe2x59g5w446ubxni5jr` (`originAgencyId`),
  CONSTRAINT `FK_2renbfe2x59g5w446ubxni5jr` FOREIGN KEY (`originAgencyId`) REFERENCES `Agency` (`id`),
  CONSTRAINT `FK_c9e7sq5171gnso36qihotvlxj` FOREIGN KEY (`calendarNumber`) REFERENCES `Calendar` (`id`),
  CONSTRAINT `FK_jqgpko51js7f8epcawu13su64` FOREIGN KEY (`establishmentId`) REFERENCES `Establishment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;

INSERT INTO `User` (`id`, `activityPercentage`, `dayOffEntryEnabled`, `firstName`, `hashedPassword`, `lastName`, `legacyId`, `login`, `multipleAssignment`, `partTime`, `password`, `payNumber`, `resourceCategory`, `resourceType`, `active`, `dayHourCount`, `timeUnit`, `trigramCode`, `calendarNumber`, `establishmentId`, `originAgencyId`)
VALUES
	(1,1,NULL,'John',b'1','COLLABORATEUR','COL A A01','',b'0',b'0','$2y$14$jdAV99tgV35HL0PLEccGhOWsJSuDnubHjO9m/KStGRUT21Grqcil2','0001','PROD','EM',b'1',7.40,'DAY','','01','TOURS',1),
	(50,1,NULL,'Sarah',b'1','RESPONSABLE AGENCE','RES A A01','',b'0',b'0','$2y$14$jdAV99tgV35HL0PLEccGhOWsJSuDnubHjO9m/KStGRUT21Grqcil2','0002','ADMI','EM',b'1',7.40,'DAY','','01','TOURS',10),
	(100,1,NULL,'Paul',b'1','COMMERCIAL','COM A A01','',b'0',b'0','$2y$14$jdAV99tgV35HL0PLEccGhOWsJSuDnubHjO9m/KStGRUT21Grqcil2','0003','ADMI','EM',b'1',7.40,'DAY','','01','TOURS',10),
	(102,1,NULL,'Rick',b'1','ASSISTANT','ASS A A01','',b'0',b'0','$2y$14$jdAV99tgV35HL0PLEccGhOWsJSuDnubHjO9m/KStGRUT21Grqcil2','0004','ADMI','EM',b'1',7.40,'DAY','','01','TOURS',10);

/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table User_ManagerRole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `User_ManagerRole`;

CREATE TABLE `User_ManagerRole` (
  `userId` bigint(20) NOT NULL,
  `managerRoleId` bigint(20) NOT NULL,
  PRIMARY KEY (`userId`,`managerRoleId`),
  KEY `FK_smfmsgdtq2k63km5ldwjfvgil` (`managerRoleId`),
  CONSTRAINT `FK_gp71to6l4kssywrc46s5thvw5` FOREIGN KEY (`userId`) REFERENCES `User` (`id`),
  CONSTRAINT `FK_smfmsgdtq2k63km5ldwjfvgil` FOREIGN KEY (`managerRoleId`) REFERENCES `ManagerRole` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `User_ManagerRole` WRITE;
/*!40000 ALTER TABLE `User_ManagerRole` DISABLE KEYS */;

INSERT INTO `User_ManagerRole` (`userId`, `managerRoleId`)
VALUES
	(1,11);

/*!40000 ALTER TABLE `User_ManagerRole` ENABLE KEYS */;
UNLOCK TABLES;


# Affichage de la table UserEmail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserEmail`;

CREATE TABLE `UserEmail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `type` varchar(12) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_hc8o5yaxreojd4t8afg6h0iau` (`userId`),
  CONSTRAINT `FK_hc8o5yaxreojd4t8afg6h0iau` FOREIGN KEY (`userId`) REFERENCES `User` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `UserEmail` WRITE;
/*!40000 ALTER TABLE `UserEmail` DISABLE KEYS */;

INSERT INTO `UserEmail` (`id`, `email`, `type`, `userId`)
VALUES
	(1,'collaborateur@apside.fr','WORK',1),
	(3,'commercial@apside.fr','WORK ',100),
	(4,'responsable-agence@apside.fr','WORK ',50),
	(5,'assistant@apside.fr','WORK ',102);

/*!40000 ALTER TABLE `UserEmail` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
