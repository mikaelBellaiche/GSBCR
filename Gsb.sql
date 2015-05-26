-- MySQL dump 10.13  Distrib 5.1.73, for Win64 (unknown)
--
-- Host: localhost    Database: gsbcrslam
-- ------------------------------------------------------
-- Server version	5.1.73-community
DROP DATABASE IF EXISTS 'gsbcrslam';

CREATE DATABASE 'gsbcrslam';

USE 'gsbcrslam';

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
-- Table structure for table `activite_compl`
--

DROP TABLE IF EXISTS `activite_compl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activite_compl` (
  `AC_NUM` int(11) NOT NULL DEFAULT '0',
  `AC_DATE` date DEFAULT NULL,
  `AC_LIEU` varchar(50) DEFAULT NULL,
  `AC_THEME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AC_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activite_compl`
--

LOCK TABLES `activite_compl` WRITE;
/*!40000 ALTER TABLE `activite_compl` DISABLE KEYS */;
/*!40000 ALTER TABLE `activite_compl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `composant`
--

DROP TABLE IF EXISTS `composant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `composant` (
  `CMP_CODE` varchar(8) NOT NULL DEFAULT '',
  `CMP_LIBELLE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `composant`
--

LOCK TABLES `composant` WRITE;
/*!40000 ALTER TABLE `composant` DISABLE KEYS */;
/*!40000 ALTER TABLE `composant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constituer`
--

DROP TABLE IF EXISTS `constituer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `constituer` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `CMP_CODE` varchar(8) NOT NULL DEFAULT '',
  `CST_QTE` float DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`,`CMP_CODE`),
  KEY `FK_CONSTITUER_COMPOSANT` (`CMP_CODE`),
  CONSTRAINT `FK_CONSTITUER_COMPOSANT` FOREIGN KEY (`CMP_CODE`) REFERENCES `composant` (`CMP_CODE`),
  CONSTRAINT `FK_CONSTITUER_MEDICAMENT` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `medicament` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constituer`
--

LOCK TABLES `constituer` WRITE;
/*!40000 ALTER TABLE `constituer` DISABLE KEYS */;
/*!40000 ALTER TABLE `constituer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delegue_regional`
--

DROP TABLE IF EXISTS `delegue_regional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delegue_regional` (
  `DEL_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `DEL_NOM` varchar(50) DEFAULT NULL,
  `DEL_PRENOM` varchar(100) DEFAULT NULL,
  `DEL_ADRESSE` varchar(100) DEFAULT NULL,
  `DEL_CP` varchar(10) DEFAULT NULL,
  `DEL_VILLE` varchar(60) DEFAULT NULL,
  `DEL_DATEEMBAUCHE` date DEFAULT NULL,
  `SEC_CODE` varchar(2) DEFAULT NULL,
  `LAB_CODE` varchar(4) DEFAULT NULL,
  `DEL_MDP` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DEL_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delegue_regional`
--

LOCK TABLES `delegue_regional` WRITE;
/*!40000 ALTER TABLE `delegue_regional` DISABLE KEYS */;
INSERT INTO `delegue_regional` VALUES ('m135','Ndiaye','Mamadou','5 rue du palace','75015','PARIS','2010-11-08','NU','SW','azerty'),('m136','Bellaiche','Mikael','1 rue des corbieres','13000','MARSEILLE','2008-04-19','NU','GY','azerty'),('m200','Lacoste','Valentin','5 rue du pieton','75008','PARIS','2014-01-24','NU','HG','azerty');
/*!40000 ALTER TABLE `delegue_regional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dosage`
--

DROP TABLE IF EXISTS `dosage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dosage` (
  `DOS_CODE` varchar(20) NOT NULL DEFAULT '',
  `DOS_QUANTITE` varchar(20) DEFAULT NULL,
  `DOS_UNITE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DOS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dosage`
--

LOCK TABLES `dosage` WRITE;
/*!40000 ALTER TABLE `dosage` DISABLE KEYS */;
/*!40000 ALTER TABLE `dosage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `famille`
--

DROP TABLE IF EXISTS `famille`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `famille` (
  `FAM_CODE` varchar(6) NOT NULL DEFAULT '',
  `FAM_LIBELLE` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`FAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `famille`
--

LOCK TABLES `famille` WRITE;
/*!40000 ALTER TABLE `famille` DISABLE KEYS */;
INSERT INTO `famille` VALUES ('AA','Antalgiques en association'),('AAA','Antalgiques antipyr?tiques en association'),('AAC','Antid?presseur d\'\'action centrale'),('AAH','Antivertigineux antihistaminique H1'),('ABA','Antibiotique antituberculeux'),('ABC','Antibiotique antiacn?ique local'),('ABP','Antibiotique de la famille des b?ta-lactamines (p?nicilline A)'),('AFC','Antibiotique de la famille des cyclines'),('AFM','Antibiotique de la famille des macrolides'),('AH','Antihistaminique H1 local'),('AIM','Antid?presseur imipraminique (tricyclique)'),('AIN','Antid?presseur inhibiteur s?lectif de la recapture de la s?rotonine'),('ALO','Antibiotique local (ORL)'),('ANS','Antid?presseur IMAO non s?lectif'),('AO','Antibiotique ophtalmique'),('AP','Antipsychotique normothymique'),('AUM','Antibiotique urinaire minute'),('CRT','Cortico?de, antibiotique et antifongique ? usage local'),('HYP','Hypnotique antihistaminique'),('PSA','Psychostimulant, antiasth?nique');
/*!40000 ALTER TABLE `famille` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formuler`
--

DROP TABLE IF EXISTS `formuler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formuler` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `PRE_CODE` varchar(4) NOT NULL DEFAULT '',
  PRIMARY KEY (`MED_DEPOTLEGAL`,`PRE_CODE`),
  KEY `FK_FORMULER_PRESENTATION` (`PRE_CODE`),
  CONSTRAINT `FK_FORMULER_MEDICAMENT` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `medicament` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FK_FORMULER_PRESENTATION` FOREIGN KEY (`PRE_CODE`) REFERENCES `presentation` (`PRE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formuler`
--

LOCK TABLES `formuler` WRITE;
/*!40000 ALTER TABLE `formuler` DISABLE KEYS */;
/*!40000 ALTER TABLE `formuler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interagir`
--

DROP TABLE IF EXISTS `interagir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interagir` (
  `MED_PERTURBATEUR` varchar(20) NOT NULL DEFAULT '',
  `MED_PERTURBE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`MED_PERTURBATEUR`,`MED_PERTURBE`),
  KEY `FK_INTERAGIR_PERTURBE_MEDICAMENT` (`MED_PERTURBE`),
  CONSTRAINT `FK_INTERAGIR_PERTURBATEUR_MEDICAMENT` FOREIGN KEY (`MED_PERTURBATEUR`) REFERENCES `medicament` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FK_INTERAGIR_PERTURBE_MEDICAMENT` FOREIGN KEY (`MED_PERTURBE`) REFERENCES `medicament` (`MED_DEPOTLEGAL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interagir`
--

LOCK TABLES `interagir` WRITE;
/*!40000 ALTER TABLE `interagir` DISABLE KEYS */;
/*!40000 ALTER TABLE `interagir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inviter`
--

DROP TABLE IF EXISTS `inviter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inviter` (
  `AC_NUM` int(11) NOT NULL DEFAULT '0',
  `PRA_NUM` int(11) NOT NULL DEFAULT '0',
  `SPECIALISATION` char(1) DEFAULT NULL,
  PRIMARY KEY (`AC_NUM`,`PRA_NUM`),
  KEY `FK_INVITER_PRATICIEN` (`PRA_NUM`),
  CONSTRAINT `FK_INVITER_ACTIVITE_COMPL` FOREIGN KEY (`AC_NUM`) REFERENCES `activite_compl` (`AC_NUM`),
  CONSTRAINT `FK_INVITER_PRATICIEN` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inviter`
--

LOCK TABLES `inviter` WRITE;
/*!40000 ALTER TABLE `inviter` DISABLE KEYS */;
/*!40000 ALTER TABLE `inviter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratoire`
--

DROP TABLE IF EXISTS `laboratoire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `laboratoire` (
  `LAB_CODE` varchar(4) NOT NULL DEFAULT '',
  `LAB_NOM` varchar(20) DEFAULT NULL,
  `LAB_CHEFVENTE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LAB_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratoire`
--

LOCK TABLES `laboratoire` WRITE;
/*!40000 ALTER TABLE `laboratoire` DISABLE KEYS */;
INSERT INTO `laboratoire` VALUES ('BC','Bichat','Suzanne Terminus'),('GY','Gyverny','Marcel MacDouglas'),('SW','Swiss Kane','Alain Poutre');
/*!40000 ALTER TABLE `laboratoire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicament`
--

DROP TABLE IF EXISTS `medicament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicament` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `MED_NOMCOMMERCIAL` varchar(50) DEFAULT NULL,
  `FAM_CODE` varchar(6) DEFAULT NULL,
  `MED_COMPOSITION` varchar(510) DEFAULT NULL,
  `MED_EFFETS` varchar(510) DEFAULT NULL,
  `MED_CONTREINDIC` varchar(510) DEFAULT NULL,
  `MED_PRIXECHANTILLON` float DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`),
  KEY `FK_MEDICAMENT_FAMILLE` (`FAM_CODE`),
  CONSTRAINT `FK_MEDICAMENT_FAMILLE` FOREIGN KEY (`FAM_CODE`) REFERENCES `famille` (`FAM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicament`
--

LOCK TABLES `medicament` WRITE;
/*!40000 ALTER TABLE `medicament` DISABLE KEYS */;
INSERT INTO `medicament` VALUES ('3MYC7','TRIMYCINE','CRT','Triamcinolone (ac?tonide) + N?omycine + Nystatine','Ce m?dicament est un cortico?de ? activit? forte ou tr?s forte associ? ? un antibiotique et un antifongique, utilis? en application locale dans certaines atteintes cutan?es surinfect?es.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? l\'\'un des constituants, d\'\'infections de la peau ou de parasitisme non trait?s, d\'\'acn?. Ne pas appliquer sur une plaie, ni sous un pansement occlusif.',NULL),('ADIMOL9','ADIMOL','ABP','Amoxicilline + Acide clavulanique','Ce m?dicament, plus puissant que les p?nicillines simples, est utilis? pour traiter des infections bact?riennes sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux p?nicillines ou aux c?phalosporines.',NULL),('AMOPIL7','AMOPIL','ABP','Amoxicilline','Ce m?dicament, plus puissant que les p?nicillines simples, est utilis? pour traiter des infections bact?riennes sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux p?nicillines. Il doit ?tre administr? avec prudence en cas d\'\'allergie aux c?phalosporines.',NULL),('AMOX45','AMOXAR','ABP','Amoxicilline','Ce m?dicament, plus puissant que les p?nicillines simples, est utilis? pour traiter des infections bact?riennes sp?cifiques.','La prise de ce m?dicament peut rendre positifs les tests de d?pistage du dopage.',NULL),('AMOXIG12','AMOXI G','ABP','Amoxicilline','Ce m?dicament, plus puissant que les p?nicillines simples, est utilis? pour traiter des infections bact?riennes sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux p?nicillines. Il doit ?tre administr? avec prudence en cas d\'\'allergie aux c?phalosporines.',NULL),('APATOUX22','APATOUX Vitamine C','ALO','Tyrothricine + T?trac?ne + Acide ascorbique (Vitamine C)','Ce m?dicament est utilis? pour traiter les affections de la bouche et de la gorge.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? l\'\'un des constituants, en cas de ph?nylc?tonurie et chez l\'\'enfant de moins de 6 ans.',NULL),('BACTIG10','BACTIGEL','ABC','Erythromycine','Ce m?dicament est utilis? en application locale pour traiter l\'\'acn? et les infections cutan?es bact?riennes associ?es.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux antibiotiques de la famille des macrolides ou des lincosanides.',NULL),('BACTIV13','BACTIVIL','AFM','Erythromycine','Ce m?dicament est utilis? pour traiter des infections bact?riennes sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'?rythromycine).',NULL),('BITALV','BIVALIC','AAA','Dextropropoxyph?ne + Parac?tamol','Ce m?dicament est utilis? pour traiter les douleurs d\'\'intensit? mod?r?e ou intense.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux m?dicaments de cette famille, d\'\'insuffisance h?patique ou d\'\'insuffisance r?nale.',NULL),('CARTION6','CARTION','AAA','Acide ac?tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Parac?tamol','Ce m?dicament est utilis? dans le traitement symptomatique de la douleur ou de la fi?vre.','Ce m?dicament est contre-indiqu? en cas de troubles de la coagulation (tendances aux h?morragies), d\'\'ulc?re gastroduod?nal, maladies graves du foie.',NULL),('CLAZER6','CLAZER','AFM','Clarithromycine','Ce m?dicament est utilis? pour traiter des infections bact?riennes sp?cifiques. Il est ?galement utilis? dans le traitement de l\'\'ulc?re gastro-duod?nal, en association avec d\'\'autres m?dicaments.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'?rythromycine).',NULL),('DEPRIL9','DEPRAMIL','AIM','Clomipramine','Ce m?dicament est utilis? pour traiter les ?pisodes d?pressifs s?v?res, certaines douleurs rebelles, les troubles obsessionnels compulsifs et certaines ?nur?sies chez l\'\'enfant.','Ce m?dicament est contre-indiqu? en cas de glaucome ou d\'\'ad?nome de la prostate, d\'\'infarctus r?cent, ou si vous avez re? ??u un traitement par IMAO durant les 2 semaines pr?c?dentes ou en cas d\'\'allergie aux atid?presseurs imipraminiques.',NULL),('DIMIRTAM6','DIMIRTAM','AAC','Mirtazapine','Ce m?dicament est utilis? pour traiter les ?pisodes d?pressifs s?v?res.','La prise de ce produit est contre-indiqu?e en cas de d\'\'allergie ? ?  l\'\'un des constituants.',NULL),('DOLRIL7','DOLORIL','AAA','Acide ac?tylsalicylique (aspirine) + Acide ascorbique (Vitamine C) + Parac?tamol','Ce m?dicament est utilis? dans le traitement symptomatique de la douleur ou de la fi?vre.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie au Parac?tamol ou aux salicylates.',NULL),('DORNOM8','NORMADOR','HYP','Doxylamine','Ce m?dicament est utilis? pour traiter l\'\'insomnie chez l\'\'adulte.','Ce m?dicament est contre-indiqu? en cas de glaucome, de certains troubles urinaires (r?tention urinaire) et chez l\'\'enfant de moins de 15 ans.',NULL),('EQUILARX6','EQUILAR','AAH','M?clozine','Ce m?dicament est utilis? pour traiter les vertiges et pour pr?venir le mal des transports.','Ce m?dicament ne doit pas ?tre utilis? en cas d\'\'allergie au produit, en cas de glaucome ou de r?tention urinaire.',NULL),('EVILR7','EVEILLOR','PSA','Adrafinil','Ce m?dicament est utilis? pour traiter les troubles de la vigilance et certains symptomes neurologiques chez le sujet ag','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants.',NULL),('INSXT5','INSECTIL','AH','Diph?nydramine','Ce m?dicament est utilis? en application locale sur les piq?res d\'\'insecte et l\'\'urticaire.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux antihistaminiques.',NULL),('JOVAI8','JOVENIL','AFM','Josamycine','Ce m?dicament est utilis? pour traiter des infections bact?riennes sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux macrolides (dont le chef de file est l\'\'?rythromycine).',NULL),('LIDOXY23','LIDOXYTRACINE','AFC','Oxyt?tracycline +Lidoca??ne','Ce m?dicament est utilis? en injection intramusculaire pour traiter certaines infections sp?cifiques.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants. Il ne doit pas ?tre associ? aux r?tino??des.',NULL),('LITHOR12','LITHORINE','AP','Lithium','Ce m?dicament est indiqu? dans la pr?vention des psychoses maniaco-d?pressives ou pour traiter les ?tats maniaques.','Ce m?dicament ne doit pas ?tre utilis? si vous ?tes allergique au lithium. Avant de prendre ce traitement, signalez ? ?  votre M?decin traitant si vous souffrez d\'\'insuffisance r?nale, ou si vous avez un r?gime sans sel.',NULL),('PARMOL16','PARMOCODEINE','AA','Cod?ine + Parac?tamol','Ce m?dicament est utilis? pour le traitement des douleurs lorsque des antalgiques simples ne sont pas assez efficaces.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants, chez l\'\'enfant de moins de 15 Kg, en cas d\'\'insuffisance h?patique ou respiratoire, d\'\'asthme, de ph?nylc?tonurie et chez la femme qui allaite.',NULL),('PHYSOI8','PHYSICOR','PSA','Sulbutiamine','Ce m?dicament est utilis? pour traiter les baisses d\'\'activit? physique ou psychique, souvent dans un contexte de d?pression.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants.',NULL),('PIRIZ8','PIRIZAN','ABA','Pyrazinamide','Ce m?dicament est utilis?, en association ? d\'\'autres antibiotiques, pour traiter la tuberculose.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants, d\'\'insuffisance r?nale ou h?patique, d\'\'hyperuric?mie ou de porphyrie.',NULL),('POMDI20','POMADINE','AO','Bacitracine','Ce m?dicament est utilis? pour traiter les infections oculaires de la surface de l\'\'oeil.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie aux antibiotiques appliqu?s localement.',NULL),('TROXT21','TROXADET','AIN','Parox?tine','Ce m?dicament est utilis? pour traiter la d?pression et les troubles obsessionnels compulsifs. Il peut ?galement ?tre utilis? en pr?vention des crises de panique avec ou sans agoraphobie.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie au produit.',NULL),('TXISOL22','TOUXISOL Vitamine C','ALO','Tyrothricine + Acide ascorbique (Vitamine C)','Ce m?dicament est utilis? pour traiter les affections de la bouche et de la gorge.','Ce m?dicament est contre-indiqu? en cas d\'\'allergie ? ?  l\'\'un des constituants et chez l\'\'enfant de moins de 6 ans.',NULL),('URIEG6','URIREGUL','AUM','Fosfomycine trom?tamol','Ce m?dicament est utilis? pour traiter les infections urinaires simples chez la femme de moins de 65 ans.','La prise de ce m?dicament est contre-indiqu?e en cas d\'\'allergie ? ?  l\'\'un des constituants et d\'\'insuffisance r?nale.',NULL);
/*!40000 ALTER TABLE `medicament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motif`
--

DROP TABLE IF EXISTS `motif`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `motif` (
  `MOTIF_NUM` int(11) NOT NULL DEFAULT '0',
  `MOTIF_LABEL` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`MOTIF_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motif`
--

LOCK TABLES `motif` WRITE;
/*!40000 ALTER TABLE `motif` DISABLE KEYS */;
INSERT INTO `motif` VALUES (1,'Actualisation annuelle'),(2,'Rapport Annuel'),(3,'Baisse activit');
/*!40000 ALTER TABLE `motif` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offrir`
--

DROP TABLE IF EXISTS `offrir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offrir` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `RAP_NUM` int(11) NOT NULL DEFAULT '0',
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `OFF_QTE` int(11) DEFAULT NULL,
  PRIMARY KEY (`VIS_MATRICULE`,`RAP_NUM`,`MED_DEPOTLEGAL`),
  KEY `FK_OFFRIR_MEDICAMENT` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FK_OFFRIR_MEDICAMENT` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `medicament` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FK_OFFRIR_VISITEUR` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `visiteur` (`VIS_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offrir`
--

LOCK TABLES `offrir` WRITE;
/*!40000 ALTER TABLE `offrir` DISABLE KEYS */;
INSERT INTO `offrir` VALUES ('a17',4,'3MYC7',3),('a17',4,'AMOX45',12);
/*!40000 ALTER TABLE `offrir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posseder`
--

DROP TABLE IF EXISTS `posseder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posseder` (
  `PRA_NUM` int(11) NOT NULL DEFAULT '0',
  `SPE_CODE` varchar(10) NOT NULL DEFAULT '',
  `POS_DIPLOME` varchar(20) DEFAULT NULL,
  `POS_COEFPRESCRIPTION` float DEFAULT NULL,
  PRIMARY KEY (`PRA_NUM`,`SPE_CODE`),
  KEY `FK_POSSEDER_SPECIALITE` (`SPE_CODE`),
  CONSTRAINT `FK_POSSEDER_PRATICIEN` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`),
  CONSTRAINT `FK_POSSEDER_SPECIALITE` FOREIGN KEY (`SPE_CODE`) REFERENCES `specialite` (`SPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posseder`
--

LOCK TABLES `posseder` WRITE;
/*!40000 ALTER TABLE `posseder` DISABLE KEYS */;
/*!40000 ALTER TABLE `posseder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praticien`
--

DROP TABLE IF EXISTS `praticien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `praticien` (
  `PRA_NUM` int(11) NOT NULL DEFAULT '0',
  `PRA_NOM` varchar(50) DEFAULT NULL,
  `PRA_PRENOM` varchar(60) DEFAULT NULL,
  `PRA_ADRESSE` varchar(100) DEFAULT NULL,
  `PRA_CP` varchar(10) DEFAULT NULL,
  `PRA_VILLE` varchar(50) DEFAULT NULL,
  `PRA_COEFNOTORIETE` float DEFAULT NULL,
  `TYP_CODE` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`PRA_NUM`),
  KEY `FK_PRATICIEN_TYPE_PRATICIEN` (`TYP_CODE`),
  CONSTRAINT `FK_PRATICIEN_TYPE_PRATICIEN` FOREIGN KEY (`TYP_CODE`) REFERENCES `type_praticien` (`TYP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praticien`
--

LOCK TABLES `praticien` WRITE;
/*!40000 ALTER TABLE `praticien` DISABLE KEYS */;
INSERT INTO `praticien` VALUES (1,'Notini','Alain','114 r Authie','85000','LA ROCHE SUR YON',290.03,'MH'),(2,'Gosselin','Albert','13 r Devon','41000','BLOIS',307.49,'MV'),(3,'Delahaye','Andr','36 av 6 Juin','25000','BESANCON',185.79,'PS'),(4,'Leroux','Andr','47 av Robert Schuman','60000','BEAUVAIS',172.04,'PH'),(5,'Desmoulins','Anne','31 r St Jean','30000','NIMES',94.75,'PO'),(6,'Mouel','Anne','27 r Auvergne','80000','AMIENS',45.2,'MH'),(7,'Desgranges-Lentz','Antoine','1 r Albert de Mun','29000','MORLAIX',20.07,'MV'),(8,'Marcouiller','Arnaud','31 r St Jean','68000','MULHOUSE',396.52,'PS'),(9,'Dupuy','Benoit','9 r Demolombe','34000','MONTPELLIER',395.66,'PH'),(10,'Lerat','Bernard','31 r St Jean','59000','LILLE',257.79,'PO'),(11,'Mar?ais-Lefebvre','Bertrand','86Bis r Basse','67000','STRASBOURG',450.96,'MH'),(12,'Boscher','Bruno','94 r Falaise','10000','TROYES',356.14,'MV'),(13,'Morel','Catherine','21 r Chateaubriand','75000','PARIS',379.57,'PS'),(14,'Guivarch','Chantal','4 av G?n Laperrine','45000','ORLEANS',114.56,'PH'),(15,'Bessin-Grosdoit','Christophe','92 r Falaise','6000','NICE',222.06,'PO'),(16,'Rossa','Claire','14 av Thi','6000','NICE',529.78,'MH'),(17,'Cauchy','Denis','5 av Ste Th?r?se','11000','NARBONNE',458.82,'MV'),(18,'Gaff','Dominique','9 av 1?re Arm?e Fran?aise','35000','RENNES',213.4,'PS'),(19,'Guenon','Dominique','98 bd Mar Lyautey','44000','NANTES',175.89,'PH'),(20,'Pr?vot','Dominique','29 r Lucien Nelle','87000','LIMOGES',151.36,'PO'),(21,'Houchard','Eliane','9 r Demolombe','49100','ANGERS',436.96,'MH'),(22,'Desmons','Elisabeth','51 r Berni?res','29000','QUIMPER',281.17,'MV'),(23,'Flament','Elisabeth','11 r Pasteur','35000','RENNES',315.6,'PS'),(24,'Goussard','Emmanuel','9 r Demolombe','41000','BLOIS',40.72,'PH'),(25,'Desprez','Eric','9 r Vaucelles','33000','BORDEAUX',406.85,'PO'),(26,'Coste','Evelyne','29 r Lucien Nelle','19000','TULLE',441.87,'MH'),(27,'Lefebvre','Fr?d?ric','2 pl Wurzburg','55000','VERDUN',573.63,'MV'),(28,'Lem','Fr?d?ric','29 av 6 Juin','56000','VANNES',326.4,'PS'),(29,'Martin','Fr?d?ric','B?t A 90 r Bayeux','70000','VESOUL',506.06,'PH'),(30,'Marie','Fr?d?rique','172 r Caponi?re','70000','VESOUL',313.31,'PO'),(31,'Rosenstech','Genevi?ve','27 r Auvergne','75000','PARIS',366.82,'MH'),(32,'Pontavice','Ghislaine','8 r Gaillon','86000','POITIERS',265.58,'MV'),(33,'Leveneur-Mosquet','Guillaume','47 av Robert Schuman','64000','PAU',184.97,'PS'),(34,'Blanchais','Guy','30 r Authie','8000','SEDAN',502.48,'PH'),(35,'Leveneur','Hugues','7 pl St Gilles','62000','ARRAS',7.39,'PO'),(36,'Mosquet','Isabelle','22 r Jules Verne','76000','ROUEN',77.1,'MH'),(37,'Giraudon','Jean-Christophe','1 r Albert de Mun','38100','VIENNE',92.62,'MV'),(38,'Marie','Jean-Claude','26 r H?rouville','69000','LYON',120.1,'PS'),(39,'Maury','Jean-Fran?ois','5 r Pierre Girard','71000','CHALON SUR SAONE',13.73,'PH'),(40,'Dennel','Jean-Louis','7 pl St Gilles','28000','CHARTRES',550.69,'PO'),(41,'Ain','Jean-Pierre','4 r?sid Olympia','2000','LAON',5.59,'MH'),(42,'Chemery','Jean-Pierre','51 pl Ancienne Boucherie','14000','CAEN',396.58,'MV'),(43,'Comoz','Jean-Pierre','35 r Auguste Lechesne','18000','BOURGES',340.35,'PS'),(44,'Desfaudais','Jean-Pierre','7 pl St Gilles','29000','BREST',71.76,'PH'),(45,'Phan','J?r?me','9 r Clos Caillet','79000','NIORT',451.61,'PO'),(46,'Riou','Line','43 bd G?n Vanier','77000','MARNE LA VALLEE',193.25,'MH'),(47,'Chubilleau','Louis','46 r Eglise','17000','SAINTES',202.07,'MV'),(48,'Lebrun','Lucette','178 r Auge','54000','NANCY',410.41,'PS'),(49,'Goessens','Marc','6 av 6 Juin','39000','DOLE',548.57,'PH'),(50,'Laforge','Marc','5 r?sid Prairie','50000','SAINT LO',265.05,'PO'),(51,'Millereau','Marc','36 av 6 Juin','72000','LA FERTE BERNARD',430.42,'MH'),(52,'Dauverne','Marie-Christine','69 av Charlemagne','21000','DIJON',281.05,'MV'),(53,'Vittorio','Myriam','3 pl Champlain','94000','BOISSY SAINT LEGER',356.23,'PS'),(54,'Lapasset','Nhieu','31 av 6 Juin','52000','CHAUMONT',107,'PH'),(55,'Plantet-Besnier','Nicole','10 av 1?re Arm?e Fran?aise','86000','CHATELLEREAULT',369.94,'PO'),(56,'Chubilleau','Pascal','3 r Hastings','15000','AURRILLAC',290.75,'MH'),(57,'Robert','Pascal','31 r St Jean','93000','BOBIGNY',162.41,'MV'),(58,'Jean','Pascale','114 r Authie','49100','SAUMUR',375.52,'PS'),(59,'Chanteloube','Patrice','14 av Thi','13000','MARSEILLE',478.01,'PH'),(60,'Lecuirot','Patrice','r?sid St P?res 55 r Pigaci?re','54000','NANCY',239.66,'PO'),(61,'Gandon','Patrick','47 av Robert Schuman','37000','TOURS',599.06,'MH'),(62,'Mirouf','Patrick','22 r Puits Picard','74000','ANNECY',458.42,'MV'),(63,'Boireaux','Philippe','14 av Thi','10000','CHALON EN CHAMPAGNE',454.48,'PS'),(64,'Cendrier','Philippe','7 pl St Gilles','12000','RODEZ',164.16,'PH'),(65,'Duhamel','Philippe','114 r Authie','34000','MONTPELLIER',98.62,'PO'),(66,'Grigy','Philippe','15 r M?lingue','44000','CLISSON',285.1,'MH'),(67,'Linard','Philippe','1 r Albert de Mun','81000','ALBI',486.3,'MV'),(68,'Lozier','Philippe','8 r Gaillon','31000','TOULOUSE',48.4,'PS'),(69,'Dech?tre','Pierre','63 av Thi','23000','MONTLUCON',253.75,'PH'),(70,'Goessens','Pierre','22 r Jean Romain','40000','MONT DE MARSAN',426.19,'PO'),(71,'Lem?nager','Pierre','39 av 6 Juin','57000','METZ',118.7,'MH'),(72,'N','Pierre','39 av 6 Juin','82000','MONTAUBAN',72.54,'MV'),(73,'Guyot','Pierre-Laurent','43 bd G?n Vanier','48000','MENDE',352.31,'PS'),(74,'Chauchard','Roger','9 r Vaucelles','13000','MARSEILLE',552.19,'PH'),(75,'Mabire','Roland','11 r Boutiques','67000','STRASBOURG',422.39,'PO'),(76,'Leroy','Soazig','45 r Boutiques','61000','ALENCON',570.67,'MH'),(77,'Guyot','St?phane','26 r H?rouville','46000','FIGEAC',28.85,'MV'),(78,'Delposen','Sylvain','39 av 6 Juin','27000','DREUX',292.01,'PS'),(79,'Rault','Sylvie','15 bd Richemond','2000','SOISSON',526.6,'PH'),(80,'Renouf','Sylvie','98 bd Mar Lyautey','88000','EPINAL',425.24,'PO'),(81,'Alliet-Grach','Thierry','14 av Thi','7000','PRIVAS',451.31,'MH'),(82,'Bayard','Thierry','92 r Falaise','42000','SAINT ETIENNE',271.71,'MV'),(83,'Gauchet','Thierry','7 r Desmoueux','38100','GRENOBLE',406.1,'PS'),(84,'Bobichon','Tristan','219 r Caponi?re','9000','FOIX',218.36,'PH'),(85,'Duchemin-Laniel','V?ronique','130 r St Jean','33000','LIBOURNE',265.61,'PO'),(86,'Laurent','Youn','34 r Demolombe','53000','MAYENNE',496.1,'MH');
/*!40000 ALTER TABLE `praticien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prescrire`
--

DROP TABLE IF EXISTS `prescrire`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prescrire` (
  `MED_DEPOTLEGAL` varchar(20) NOT NULL DEFAULT '',
  `TIN_CODE` varchar(10) NOT NULL DEFAULT '',
  `DOS_CODE` varchar(20) NOT NULL DEFAULT '',
  `PRE_POSOLOGIE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`MED_DEPOTLEGAL`,`TIN_CODE`,`DOS_CODE`),
  KEY `FK_PRESCRIRE_TYPE_INDIVIDU` (`TIN_CODE`),
  KEY `FK_PRESCRIRE_DOSAGE` (`DOS_CODE`),
  CONSTRAINT `FK_PRESCRIRE_DOSAGE` FOREIGN KEY (`DOS_CODE`) REFERENCES `dosage` (`DOS_CODE`),
  CONSTRAINT `FK_PRESCRIRE_MEDICAMENT` FOREIGN KEY (`MED_DEPOTLEGAL`) REFERENCES `medicament` (`MED_DEPOTLEGAL`),
  CONSTRAINT `FK_PRESCRIRE_TYPE_INDIVIDU` FOREIGN KEY (`TIN_CODE`) REFERENCES `type_individu` (`TIN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prescrire`
--

LOCK TABLES `prescrire` WRITE;
/*!40000 ALTER TABLE `prescrire` DISABLE KEYS */;
/*!40000 ALTER TABLE `prescrire` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `presentation`
--

DROP TABLE IF EXISTS `presentation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `presentation` (
  `PRE_CODE` varchar(4) NOT NULL DEFAULT '',
  `PRE_LIBELLE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`PRE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `presentation`
--

LOCK TABLES `presentation` WRITE;
/*!40000 ALTER TABLE `presentation` DISABLE KEYS */;
/*!40000 ALTER TABLE `presentation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rapport_visite`
--

DROP TABLE IF EXISTS `rapport_visite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rapport_visite` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `RAP_NUM` int(11) NOT NULL DEFAULT '0',
  `PRA_NUM` int(11) DEFAULT NULL,
  `RAP_DATE` date DEFAULT NULL,
  `RAP_BILAN` varchar(510) DEFAULT NULL,
  `RAP_MOTIF` int(11) DEFAULT NULL,
  `RAP_COEFCONFIANCE` float DEFAULT NULL,
  `RAP_LU` tinyint(1) DEFAULT NULL,
  `RAP_DATE_REDAC` date DEFAULT NULL,
  PRIMARY KEY (`VIS_MATRICULE`,`RAP_NUM`),
  KEY `FK_RAPPORT_VISITE_PRATICIEN` (`PRA_NUM`),
  KEY `FK_MOTIF` (`RAP_MOTIF`),
  CONSTRAINT `FK_MOTIF` FOREIGN KEY (`RAP_MOTIF`) REFERENCES `motif` (`MOTIF_NUM`),
  CONSTRAINT `FK_RAPPORT_VISITE_PRATICIEN` FOREIGN KEY (`PRA_NUM`) REFERENCES `praticien` (`PRA_NUM`),
  CONSTRAINT `FK_RAPPORT_VISITE_VISITEUR` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `visiteur` (`VIS_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rapport_visite`
--

LOCK TABLES `rapport_visite` WRITE;
/*!40000 ALTER TABLE `rapport_visite` DISABLE KEYS */;
INSERT INTO `rapport_visite` VALUES ('a131',3,23,'2013-04-20','M?decin curieux, ?? recontacter en d?cembre pour r?union',1,NULL,NULL,'2014-10-10'),('a131',7,41,'2014-02-12','RAS\nChangement de tel : 05 89 89 89 89',2,NULL,NULL,'2014-10-10'),('a17',4,4,'2014-03-01','Changement de direction, red?finition de la politique m?dicamenteuse, recours au g?n?rique',3,NULL,NULL,'2014-10-10');
/*!40000 ALTER TABLE `rapport_visite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `realiser`
--

DROP TABLE IF EXISTS `realiser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `realiser` (
  `AC_NUM` int(11) NOT NULL DEFAULT '0',
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`AC_NUM`,`VIS_MATRICULE`),
  KEY `FK_REALISER_VISITEUR` (`VIS_MATRICULE`),
  CONSTRAINT `FK_REALISER_ACTIVITE_COMPL` FOREIGN KEY (`AC_NUM`) REFERENCES `activite_compl` (`AC_NUM`),
  CONSTRAINT `FK_REALISER_VISITEUR` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `visiteur` (`VIS_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `realiser`
--

LOCK TABLES `realiser` WRITE;
/*!40000 ALTER TABLE `realiser` DISABLE KEYS */;
/*!40000 ALTER TABLE `realiser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `REG_CODE` varchar(4) NOT NULL DEFAULT '',
  `SEC_CODE` varchar(2) DEFAULT NULL,
  `REG_NOM` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REG_CODE`),
  KEY `FK_REGION_SECTEUR` (`SEC_CODE`),
  CONSTRAINT `FK_REGION_SECTEUR` FOREIGN KEY (`SEC_CODE`) REFERENCES `secteur` (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('AL','E','Alsace Lorraine'),('AQ','S','Aquitaine'),('AU','P','Auvergne'),('BG','O','Bretagne'),('BN','O','Basse Normandie'),('BO','E','Bourgogne'),('CA','N','Champagne Ardennes'),('CE','P','Centre'),('FC','E','Franche Comt'),('HN','N','Haute Normandie'),('IF','P','Ile de France'),('LG','S','Languedoc'),('LI','P','Limousin'),('MP','S','Midi Pyr?n'),('NP','N','Nord Pas de Calais'),('PA','S','Provence Alpes Cote d\'\'Azur'),('PC','O','Poitou Charente'),('PI','N','Picardie'),('PL','O','Pays de Loire'),('RA','E','Rhone Alpes'),('RO','S','Roussilon'),('VD','O','Vend');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secteur`
--

DROP TABLE IF EXISTS `secteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secteur` (
  `SEC_CODE` varchar(2) NOT NULL DEFAULT '',
  `SEC_LIBELLE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secteur`
--

LOCK TABLES `secteur` WRITE;
/*!40000 ALTER TABLE `secteur` DISABLE KEYS */;
INSERT INTO `secteur` VALUES ('E','Est'),('N','Nord'),('O','Ouest'),('P','Paris centre'),('S','Sud');
/*!40000 ALTER TABLE `secteur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `specialite`
--

DROP TABLE IF EXISTS `specialite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `specialite` (
  `SPE_CODE` varchar(10) NOT NULL DEFAULT '',
  `SPE_LIBELLE` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`SPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `specialite`
--

LOCK TABLES `specialite` WRITE;
/*!40000 ALTER TABLE `specialite` DISABLE KEYS */;
INSERT INTO `specialite` VALUES ('ACP','anatomie et cytologie pathologiques'),('AMV','ang?iologie, M?decine vasculaire'),('ARC','anesth?siologie et r?animation chirurgicale'),('BM','biologie m?dicale'),('CAC','cardiologie et affections cardio-vasculaires'),('CCT','chirurgie cardio-vasculaire et thoracique'),('CG','chirurgie g?n?rale'),('CMF','chirurgie maxillo-faciale'),('COM','canc?rologie, oncologie m?dicale'),('COT','chirurgie orthop?dique et traumatologie'),('CPR','chirurgie plastique reconstructrice et esth?tique'),('CU','chirurgie urologique'),('CV','chirurgie vasculaire'),('DN','diab?tologie-nutrition, nutrition'),('DV','dermatologie et v?n?r?ologie'),('EM','endocrinologie et m?tabolismes'),('ETD','?valuation et traitement de la douleur'),('GEH','gastro-ent?rologie et h?patologie (appareil digestif)'),('GMO','gyn?cologie m?dicale, obst?trique'),('GO','gyn?cologie-obst?trique'),('HEM','maladies du sang (h?matologie)'),('MBS','M?decine et biologie du sport'),('MDT','M?decine du travail'),('MMO','M?decine manuelle - ost?opathie'),('MN','M?decine nucl?aire'),('MPR','M?decine physique et de r?adaptation'),('MTR','M?decine tropicale, pathologie infectieuse et tropicale'),('NEP','n?phrologie'),('NRC','neurochirurgie'),('NRL','neurologie'),('ODM','orthop?die dento maxillo-faciale'),('OPH','ophtalmologie'),('ORL','oto-rhino-laryngologie'),('PEA','psychiatrie de l\'\'enfant et de l\'\'adolescent'),('PME','p?diatrie maladies des enfants'),('PNM','pneumologie'),('PSC','psychiatrie'),('RAD','radiologie (radiodiagnostic et imagerie m?dicale)'),('RDT','radioth?rapie (oncologie option radioth?rapie)'),('RGM','reproduction et gyn?cologie m?dicale'),('RHU','rhumatologie'),('STO','stomatologie'),('SXL','sexologie'),('TXA','toxicomanie et alcoologie');
/*!40000 ALTER TABLE `specialite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travailler`
--

DROP TABLE IF EXISTS `travailler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `travailler` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `JJMMAA` date NOT NULL DEFAULT '0000-00-00',
  `REG_CODE` varchar(4) NOT NULL DEFAULT '',
  `TRA_ROLE` varchar(22) DEFAULT NULL,
  PRIMARY KEY (`VIS_MATRICULE`,`JJMMAA`,`REG_CODE`),
  KEY `FK_TRAVAILLER_REGION` (`REG_CODE`),
  CONSTRAINT `FK_TRAVAILLER_REGION` FOREIGN KEY (`REG_CODE`) REFERENCES `region` (`REG_CODE`),
  CONSTRAINT `FK_TRAVAILLER_VISITEUR` FOREIGN KEY (`VIS_MATRICULE`) REFERENCES `visiteur` (`VIS_MATRICULE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travailler`
--

LOCK TABLES `travailler` WRITE;
/*!40000 ALTER TABLE `travailler` DISABLE KEYS */;
INSERT INTO `travailler` VALUES ('a131','2014-01-05','BN','Visiteur'),('a131','2014-03-03','BG','Visiteur'),('a17','2014-01-05','RA','Visiteur'),('a55','2014-03-02','RO','Visiteur'),('a93','2008-02-10','PC','Visiteur'),('b13','2014-03-03','AL','Visiteur'),('b16','2014-04-04','BG','Visiteur'),('b19','2008-02-10','PL','Visiteur'),('b25','2001-01-00','PL','D?l?gu'),('b25','2014-03-02','PL','Visiteur'),('b28','2008-02-10','LG','Visiteur'),('b34','2014-01-20','CE','D?l?gu'),('b4','2003-03-01','AQ','Visiteur'),('b50','2003-03-01','PA','Visiteur'),('b59','2014-03-02','RA','Visiteur'),('c14','2003-03-01','PA','Responsable'),('c14','2014-04-04','PA','D?l?gu'),('c3','2014-01-05','CA','Visiteur'),('c54','2014-01-05','AL','Visiteur'),('d13','2014-01-05','PL','Visiteur'),('d51','2003-03-01','FC','Responsable'),('e22','2014-03-12','AL','Visiteur'),('e24','2008-02-10','AL','Responsable'),('e39','2014-03-12','IF','Visiteur'),('e49','2014-03-03','MP','Visiteur'),('e5','2003-03-01','AQ','Responsable'),('e52','2014-01-05','HN','Visiteur'),('f21','2014-01-20','RA','Visiteur'),('f39','2014-04-04','RA','Visiteur'),('f4','2014-03-02','MP','Visiteur'),('g19','2014-03-03','IF','Visiteur'),('g30','2003-03-01','PI','Responsable'),('g53','2014-02-20','BG','Visiteur'),('g7','2014-03-03','LI','Visiteur'),('h13','2014-01-20','LI','Visiteur'),('h30','2003-03-01','IF','Visiteur'),('h35','2014-01-20','AU','Visiteur'),('h40','2014-01-05','CA','Visiteur'),('j45','2003-03-01','CA','Responsable'),('j50','2014-01-05','NP','Visiteur'),('j8','2008-02-10','IF','Responsable'),('k4','2014-03-03','LG','Visiteur'),('k53','2014-01-05','AL','D?l?gu'),('k53','2014-02-20','CA','Visiteur'),('l14','2014-03-02','PL','Visiteur'),('l23','2014-03-02','PC','Visiteur'),('l46','2014-03-03','PL','Visiteur'),('l56','2014-03-03','FC','Visiteur'),('m35','2014-03-12','MP','Visiteur'),('m45','2014-03-12','AL','Visiteur'),('n42','2014-03-03','HN','Visiteur'),('n58','2014-01-05','CE','Visiteur'),('n59','2014-03-02','PI','Visiteur'),('o26','2014-03-02','LG','Visiteur'),('p32','2014-01-20','IF','Visiteur'),('p40','2008-02-10','BN','Responsable'),('p41','2008-02-10','PC','Visiteur'),('p42','2014-03-02','PI','Visiteur'),('p49','2014-02-20','CE','Visiteur'),('p6','0000-00-00','AQ','Visiteur'),('p7','2014-03-12','RO','Visiteur'),('p8','2014-01-05','BO','Visiteur'),('q17','2003-03-01','BN','Visiteur'),('r24','2014-02-20','BN','Visiteur'),('r58','2014-03-12','BG','Visiteur'),('s10','2014-03-03','FC','Visiteur'),('s21','2014-01-05','LI','Visiteur'),('t43','2014-03-02','BO','Visiteur'),('t47','2004-05-02','PI','Visiteur'),('t55','2014-03-02','MP','Visiteur'),('t60','2014-03-12','CE','Visiteur');
/*!40000 ALTER TABLE `travailler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_individu`
--

DROP TABLE IF EXISTS `type_individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_individu` (
  `TIN_CODE` varchar(10) NOT NULL DEFAULT '',
  `TIN_LIBELLE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TIN_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_individu`
--

LOCK TABLES `type_individu` WRITE;
/*!40000 ALTER TABLE `type_individu` DISABLE KEYS */;
/*!40000 ALTER TABLE `type_individu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type_praticien`
--

DROP TABLE IF EXISTS `type_praticien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type_praticien` (
  `TYP_CODE` varchar(6) NOT NULL DEFAULT '',
  `TYP_LIBELLE` varchar(50) DEFAULT NULL,
  `TYP_LIEU` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`TYP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type_praticien`
--

LOCK TABLES `type_praticien` WRITE;
/*!40000 ALTER TABLE `type_praticien` DISABLE KEYS */;
INSERT INTO `type_praticien` VALUES ('MH','M?decin Hospitalier','Hopital ou clinique'),('MV','M?decine de Ville','Cabinet'),('PH','Pharmacien Hospitalier','Hopital ou clinique'),('PO','Pharmacien Officine','Pharmacie'),('PS','Personnel de sant','Centre param?dical');
/*!40000 ALTER TABLE `type_praticien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visiteur`
--

DROP TABLE IF EXISTS `visiteur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visiteur` (
  `VIS_MATRICULE` varchar(20) NOT NULL DEFAULT '',
  `VIS_NOM` varchar(50) DEFAULT NULL,
  `VIS_PRENOM` varchar(100) DEFAULT NULL,
  `VIS_ADRESSE` varchar(100) DEFAULT NULL,
  `VIS_CP` varchar(10) DEFAULT NULL,
  `VIS_VILLE` varchar(60) DEFAULT NULL,
  `VIS_DATEEMBAUCHE` date DEFAULT NULL,
  `SEC_CODE` varchar(2) DEFAULT NULL,
  `LAB_CODE` varchar(4) DEFAULT NULL,
  `VIS_MDP` varchar(20) DEFAULT '',
  PRIMARY KEY (`VIS_MATRICULE`),
  KEY `FK_VISITEUR_SECTEUR` (`SEC_CODE`),
  KEY `FK_VISITEUR_LABORATOIRE` (`LAB_CODE`),
  CONSTRAINT `FK_VISITEUR_LABORATOIRE` FOREIGN KEY (`LAB_CODE`) REFERENCES `laboratoire` (`LAB_CODE`),
  CONSTRAINT `FK_VISITEUR_SECTEUR` FOREIGN KEY (`SEC_CODE`) REFERENCES `secteur` (`SEC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visiteur`
--

LOCK TABLES `visiteur` WRITE;
/*!40000 ALTER TABLE `visiteur` DISABLE KEYS */;
INSERT INTO `visiteur` VALUES ('a131','Villechalane','Louis','8 cours Lafontaine','29000','BREST','2012-11-08',NULL,'SW','azerty'),('a17','Andre','David','1 r Aimon de Chiss','38100','GRENOBLE','2008-06-19',NULL,'GY','azerty'),('a55','Bedos','Christian','1 r B?n?dictins','65000','TARBES','2007-09-07',NULL,'GY','azerty'),('a93','Tusseau','Louis','22 r Renou','86000','POITIERS','2001-02-09',NULL,'SW','azerty'),('b13','Bentot','Pascal','11 av 6 Juin','67000','STRASBOURG','2003-11-06',NULL,'GY','azerty'),('b16','Bioret','Luc','1 r Linne','35000','RENNES','2003-01-06',NULL,'SW','azerty'),('b19','Bunisset','Francis','10 r Nicolas Chorier','85000','LA ROCHE SUR YON','2013-09-23',NULL,'GY','azerty'),('b25','Bunisset','Denise','1 r Lionne','49100','ANGERS','2007-03-04',NULL,'SW','azerty'),('b28','Cacheux','Bernard','114 r Authie','34000','MONTPELLIER','2008-02-10',NULL,'GY','azerty'),('b34','Cadic','Eric','123 r Caponi?re','41000','BLOIS','2012-06-03','P','SW','azerty'),('b4','Charoze','Catherine','100 pl G?ants','33000','BORDEAUX','2009-05-07',NULL,'SW','azerty'),('b50','Clepkens','Christophe','12 r F?d?rico Garcia Lorca','13000','MARSEILLE','2011-08-18',NULL,'SW','azerty'),('b59','Cottin','Vincenne','36 sq Capucins','5000','GAP','2010-12-19',NULL,'GY','azerty'),('c14','Daburon','Fran?ois','13 r Champs Elys?es','6000','NICE','2012-01-20','S','SW','azerty'),('c3','De','Philippe','13 r Charles Peguy','10000','TROYES','2005-05-29',NULL,'SW','azerty'),('c54','Debelle','Michel','181 r Caponi?re','88000','EPINAL','2004-09-19',NULL,'SW','azerty'),('d13','Debelle','Jeanne','134 r Stalingrad','44000','NANTES','2012-05-25',NULL,'SW','azerty'),('d51','Debroise','Michel','2 av 6 Juin','70000','VESOUL','2011-08-17','E','GY','azerty'),('e22','Desmarquest','Nathalie','14 r F?d?rico Garcia Lorca','54000','NANCY','2013-04-18',NULL,'GY','azerty'),('e24','Desnost','Pierre','16 r Barral de Montferrat','55000','VERDUN','2013-04-18','E','SW','azerty'),('e39','Dudouit','Fr?d?ric','18 quai Xavier Jouvin','75000','PARIS','2013-04-18',NULL,'GY','azerty'),('e49','Duncombe','Claude','19 av Alsace Lorraine','9000','FOIX','2012-09-16',NULL,'GY','azerty'),('e5','Enault-Pascreau','C?line','25B r Stalingrad','40000','MONT DE MARSAN','2012-09-16','S','GY','azerty'),('e52','Eynde','Val?rie','3 r Henri Moissan','76000','ROUEN','2012-09-16',NULL,'GY','azerty'),('f21','Finck','Jacques','rte Montreuil Bellay','74000','ANNECY','2012-09-16',NULL,'SW','azerty'),('f39','Fr?mont','Fernande','4 r Jean Giono','69000','LYON','2005-05-29',NULL,'GY','azerty'),('f4','Gest','Alain','30 r Authie','46000','FIGEAC','2005-05-29',NULL,'GY','azerty'),('g19','Gheysen','Galassus','32 bd Mar Foch','75000','PARIS','2005-05-29',NULL,'SW','azerty'),('g30','Girard','Yvon','31 av 6 Juin','80000','AMIENS','2012-05-25','N','GY','azerty'),('g53','Gombert','Luc','32 r Emile Gueymard','56000','VANNES','2012-05-25',NULL,'GY','azerty'),('g7','Guindon','Caroline','40 r Mar Montgomery','87000','LIMOGES','2012-05-25',NULL,'GY','azerty'),('h13','Guindon','Fran?ois','44 r Picoti?re','19000','TULLE','2012-05-25',NULL,'SW','azerty'),('h30','Igigabel','Guy','33 gal Arlequin','94000','CRETEIL','2008-06-19',NULL,'SW','azerty'),('h35','Jourdren','Pierre','34 av Jean Perrot','15000','AURRILLAC','2008-06-19',NULL,'GY','azerty'),('h40','Juttard','Pierre-Raoul','34 cours Jean Jaur','8000','SEDAN','2008-06-19',NULL,'GY','azerty'),('j45','LABORATOIREur?-Morel','Saout','38 cours Berriat','52000','CHAUMONT','2008-06-19','N','SW','azerty'),('j50','Landr','Philippe','4 av G?n Laperrine','59000','LILLE','2000-05-01',NULL,'GY','azerty'),('j8','Langeard','Hugues','39 av Jean Perrot','93000','BAGNOLET','2000-05-01','P','GY','azerty'),('k4','Lanne','Bernard','4 r Bayeux','30000','NIMES','2000-05-01',NULL,'SW','azerty'),('k53','Le','No','4 av Beauvert','68000','MULHOUSE','2000-05-01',NULL,'SW','azerty'),('l14','Le','Jean','39 r Raspail','53000','LAVAL','2000-05-01',NULL,'SW','azerty'),('l23','Leclercq','Servane','11 r Quinconce','18000','BOURGES','1998-11-23',NULL,'SW','azerty'),('l46','Lecornu','Jean-Bernard','4 bd Mar Foch','72000','LA FERTE BERNARD','1998-11-23',NULL,'GY','azerty'),('l56','Lecornu','Ludovic','4 r Abel Servien','25000','BESANCON','1998-11-23',NULL,'SW','azerty'),('m35','Lejard','Agn','4 r Anthoard','82000','MONTAUBAN','1998-11-23',NULL,'SW','azerty'),('m45','Lesaulnier','Pascal','47 r Thiers','57000','METZ','1998-11-23',NULL,'SW','azerty'),('n42','Letessier','St?phane','5 chem Capuche','27000','EVREUX','1998-11-23',NULL,'GY','azerty'),('n58','Loirat','Didier','Les P?chers cit? Bourg la Croix','45000','ORLEANS','1998-11-23',NULL,'GY','azerty'),('n59','Maffezzoli','Thibaud','5 r Chateaubriand','2000','LAON','2005-12-21',NULL,'SW','azerty'),('o26','Mancini','Anne','5 r D\'\'Agier','48000','MENDE','2005-12-21',NULL,'GY','azerty'),('p32','Marcouiller','G?rard','7 pl St Gilles','91000','ISSY LES MOULINEAUX','2005-12-21',NULL,'GY','azerty'),('p40','Michel','Jean-Claude','5 r Gabriel P?ri','61000','FLERS','2005-12-21','O','SW','azerty'),('p41','Montecot','Fran?oise','6 r Paul Val?ry','17000','SAINTES','2005-12-21',NULL,'GY','azerty'),('p42','Notini','Veronique','5 r Lieut Chabal','60000','BEAUVAIS','2005-12-21',NULL,'SW','azerty'),('p49','Onfroy','Den','5 r Sidonie Jacolin','37000','TOURS','2005-12-21',NULL,'GY','azerty'),('p6','Pascreau','Charles','57 bd Mar Foch','64000','PAU','1997-03-30',NULL,'SW','azerty'),('p7','Pernot','Claude-No?l','6 r Alexandre 1 de Yougoslavie','11000','NARBONNE','2003-01-02',NULL,'SW','azerty'),('p8','Perrier','Ma?tre','6 r Aubert Dubayet','71000','CHALON SUR SAONE','2006-06-23',NULL,'GY','azerty'),('q17','Petit','Jean-Louis','7 r Ernest Renan','50000','SAINT LO','2009-06-07',NULL,'GY','azerty'),('r24','Piquery','Patrick','9 r Vaucelles','14000','CAEN','2007-04-29','O','GY','azerty'),('r58','Quiquandon','Jo?l','7 r Ernest Renan','29000','QUIMPER','2006-09-30',NULL,'GY','azerty'),('s10','Retailleau','Josselin','88Bis r Saumuroise','39000','DOLE','2011-12-05',NULL,'SW','azerty'),('s21','Retailleau','Pascal','32 bd Ayrault','23000','MONTLUCON','2009-05-09',NULL,'SW','azerty'),('t43','Souron','Maryse','7B r Gay Lussac','21000','DIJON','2003-09-03',NULL,'SW','azerty'),('t47','Tiphagne','Patrick','7B r Gay Lussac','62000','ARRAS','1997-08-29',NULL,'SW','azerty'),('t55','Tr?het','Alain','7D chem Barral','12000','RODEZ','1994-11-29',NULL,'SW','azerty'),('t60','Tusseau','Josselin','63 r Bon Repos','28000','CHARTRES','1991-03-29',NULL,'GY','azerty');
/*!40000 ALTER TABLE `visiteur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-05-26  3:51:05
