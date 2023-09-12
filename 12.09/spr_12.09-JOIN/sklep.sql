-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: sklep
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

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
-- Table structure for table `dzial`
--

DROP TABLE IF EXISTS `dzial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dzial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(25) NOT NULL,
  `region_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dzial_name_region_id_uk` (`nazwa`,`region_id`),
  KEY `dzial_region_id_fk` (`region_id`),
  CONSTRAINT `dzial_region_id_fk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dzial`
--

LOCK TABLES `dzial` WRITE;
/*!40000 ALTER TABLE `dzial` DISABLE KEYS */;
INSERT INTO `dzial` VALUES (50,'Administracji',1),(10,'Finansow',1),(41,'Operacyjny',1),(42,'Operacyjny',2),(43,'Operacyjny',3),(44,'Operacyjny',4),(45,'Operacyjny',5),(31,'Sprzedazy',1),(32,'Sprzedazy',2),(33,'Sprzedazy',3),(34,'Sprzedazy',4),(35,'Sprzedazy',5);
/*!40000 ALTER TABLE `dzial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klient`
--

DROP TABLE IF EXISTS `klient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `klient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) NOT NULL,
  `telefon` varchar(25) DEFAULT NULL,
  `adres` varchar(400) DEFAULT NULL,
  `miasto` varchar(30) DEFAULT NULL,
  `wojewodztwo` varchar(20) DEFAULT NULL,
  `kraj` varchar(30) DEFAULT NULL,
  `kod_pocztowy` varchar(75) DEFAULT NULL,
  `ocena_kredytowa` enum('DOSKONALA','DOBRA','ZLA') DEFAULT NULL,
  `pracownik_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `komentarz` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `klient_region_id_fk` (`region_id`),
  KEY `klient_sales_rep_id_fk` (`pracownik_id`),
  CONSTRAINT `klient_region_id_fk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`),
  CONSTRAINT `klient_sales_rep_id_fk` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klient`
--

LOCK TABLES `klient` WRITE;
/*!40000 ALTER TABLE `klient` DISABLE KEYS */;
INSERT INTO `klient` VALUES (201,'Unisport','55-2066101','72 Via Bahia','Sao Paolo',NULL,'Brazil',NULL,'DOSKONALA',12,2,NULL),(202,'OJ Atheletics','81-20101','6741 Takashi Blvd.','Osaka',NULL,'Japan',NULL,'ZLA',14,4,NULL),(203,'Delhi Sports','91-10351','11368 Chanakya','New Delhi',NULL,'India',NULL,'DOBRA',14,4,NULL),(204,'Womansport','1-206-104-0103','281 King Street','Seattle','Washington','USA',NULL,'DOSKONALA',11,1,NULL),(205,'Kam\'s Sporting Goods','852-3692888','15 Henessey Road','Hong Kong',NULL,NULL,NULL,'DOSKONALA',15,4,NULL),(206,'Sportique','33-2257201','172 Rue de Rivoli','Cannes',NULL,'France',NULL,'DOSKONALA',15,5,NULL),(207,'Sweet Rock Sports','234-6036201','6 Saint Antoine','Lagos',NULL,'Nigeria',NULL,'DOBRA',NULL,3,NULL),(208,'Muench Sports','49-527454','435 Gruenestrasse','Stuttgart',NULL,'Germany',NULL,'DOBRA',15,5,NULL),(209,'Beisbol Si!','809-352689','792 Playa Del Mar','San Pedro de Macon\'s',NULL,'Dominican Republic',NULL,'DOSKONALA',11,1,NULL),(210,'Futbol Sonora','52-404562','3 Via Saguaro','Nogales',NULL,'Mexico',NULL,'DOSKONALA',12,2,NULL),(211,'Kuhn\'s Sports','42-111292','7 Modrany','Prague',NULL,'Czechoslovakia',NULL,'DOSKONALA',15,5,NULL),(212,'Hamada Sport','20-1209211','57A Corniche','Alexandria',NULL,'Egypt',NULL,'DOSKONALA',13,3,NULL),(213,'Big John\'s Sports Emporium','1-415-555-6281','4783 18th Street','San Francisco','CA','USA',NULL,'DOSKONALA',11,1,NULL),(214,'Ojibway Retail','1-716-555-7171','415 Main Street','Buffalo','NY','USA',NULL,'ZLA',11,1,NULL),(215,'Sporta Russia','7-3892456','6000 Yekatamina','Saint Petersburg',NULL,'Russia',NULL,'ZLA',15,5,NULL);
/*!40000 ALTER TABLE `klient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magazyn`
--

DROP TABLE IF EXISTS `magazyn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magazyn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `region_id` int(11) NOT NULL,
  `adres` longtext,
  `miasto` varchar(30) DEFAULT NULL,
  `wojewodztwo` varchar(20) DEFAULT NULL,
  `kraj` varchar(30) DEFAULT NULL,
  `kod_pocztowy` varchar(75) DEFAULT NULL,
  `telefon` varchar(25) DEFAULT NULL,
  `kierownik_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `magazyn_region_id_fk` (`region_id`),
  KEY `magazyn_manager_id_fk` (`kierownik_id`),
  CONSTRAINT `magazyn_manager_id_fk` FOREIGN KEY (`kierownik_id`) REFERENCES `pracownik` (`id`),
  CONSTRAINT `magazyn_region_id_fk` FOREIGN KEY (`region_id`) REFERENCES `region` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10502 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magazyn`
--

LOCK TABLES `magazyn` WRITE;
/*!40000 ALTER TABLE `magazyn` DISABLE KEYS */;
INSERT INTO `magazyn` VALUES (101,1,'283 King Street','Seattle','WA','USA',NULL,NULL,6),(201,2,'68 Via Centrale','Sao Paolo',NULL,'Brazil',NULL,NULL,7),(301,3,'6921 King Way','Lagos',NULL,'Nigeria',NULL,NULL,8),(401,4,'86 Chu Street','Hong Kong',NULL,NULL,NULL,NULL,9),(10501,5,'5 Modrany','Bratislava',NULL,'Czechozlovakia',NULL,NULL,10);
/*!40000 ALTER TABLE `magazyn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pozycja`
--

DROP TABLE IF EXISTS `pozycja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pozycja` (
  `zamowienie_id` int(11) NOT NULL,
  `pozycja_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `cena` decimal(11,2) DEFAULT NULL,
  `ilosc` int(11) DEFAULT NULL,
  `ilosc_sprzedana` int(11) DEFAULT NULL,
  PRIMARY KEY (`zamowienie_id`,`pozycja_id`),
  KEY `pozycja_zamowienieid_prodid_uk` (`zamowienie_id`,`produkt_id`),
  KEY `pozycja_produkt_id_fk` (`produkt_id`),
  CONSTRAINT `pozycja_produkt_id_fk` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`),
  CONSTRAINT `pozycja_zamowienie_id_fk` FOREIGN KEY (`zamowienie_id`) REFERENCES `zamowienie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pozycja`
--

LOCK TABLES `pozycja` WRITE;
/*!40000 ALTER TABLE `pozycja` DISABLE KEYS */;
INSERT INTO `pozycja` VALUES (97,1,20106,9.00,1000,1000),(97,2,30321,1500.00,50,50),(98,1,40421,85.00,7,7),(99,1,20510,9.00,18,18),(99,2,20512,8.00,25,25),(99,3,50417,80.00,53,53),(99,4,50530,45.00,69,69),(100,1,10011,135.00,500,500),(100,2,10013,380.00,400,400),(100,3,10021,14.00,500,500),(100,4,10023,36.00,400,400),(100,5,30326,582.00,600,600),(100,6,30433,20.00,450,450),(100,7,41010,8.00,250,250),(101,1,30421,16.00,15,15),(101,2,40422,50.00,30,30),(101,3,41010,8.00,20,20),(101,4,41100,45.00,35,35),(101,5,50169,4.29,40,40),(101,6,50417,80.00,27,27),(101,7,50530,45.00,50,50),(102,1,20108,28.00,100,100),(102,2,20201,123.00,45,45),(103,1,30433,20.00,15,15),(103,2,32779,7.00,11,11),(104,1,20510,9.00,7,7),(104,2,20512,8.00,12,12),(104,3,30321,1669.00,19,19),(104,4,30421,16.00,35,35),(105,1,50273,22.89,16,16),(105,2,50419,80.00,13,13),(105,3,50532,47.00,28,28),(106,1,20108,28.00,46,46),(106,2,20201,123.00,21,21),(106,3,50169,4.29,125,125),(106,4,50273,22.89,75,75),(106,5,50418,75.00,98,98),(106,6,50419,80.00,27,27),(107,1,20106,11.00,50,50),(107,2,20108,28.00,22,22),(107,3,20201,115.00,130,130),(107,4,30321,1669.00,75,75),(107,5,30421,16.00,55,55),(108,1,20510,9.00,9,9),(108,2,20512,8.00,18,18),(108,3,30321,1669.00,85,85),(108,4,32779,7.00,60,60),(108,5,32861,60.00,57,57),(108,6,41080,35.00,50,50),(108,7,41100,45.00,42,42),(109,1,10011,140.00,150,150),(109,2,10012,175.00,600,600),(109,3,10022,21.95,300,300),(109,4,30326,582.00,1500,1500),(109,5,30426,18.25,500,500),(109,6,32861,60.00,50,50),(109,7,50418,75.00,43,43),(110,1,50273,22.89,17,17),(110,2,50536,50.00,23,23),(111,1,40421,65.00,27,27),(111,2,41080,35.00,29,29),(112,1,20106,11.00,50,50);
/*!40000 ALTER TABLE `pozycja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pracownik`
--

DROP TABLE IF EXISTS `pracownik`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pracownik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwisko` varchar(25) NOT NULL,
  `imie` varchar(25) DEFAULT NULL,
  `pracownikid` varchar(8) DEFAULT NULL,
  `data_zatrudnienia` datetime DEFAULT NULL,
  `komentarz` varchar(255) DEFAULT NULL,
  `menadzer_id` int(11) DEFAULT NULL,
  `stanowisko` varchar(25) DEFAULT NULL,
  `dzial_id` int(11) DEFAULT NULL,
  `wynagrodzenie` decimal(11,2) DEFAULT NULL,
  `procent_prowizji` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pracownik_pracownikid_uk` (`pracownikid`),
  KEY `pracownik_dzial_id_fk` (`dzial_id`),
  KEY `pracownik_menadzer_id_fk` (`menadzer_id`),
  KEY `pracownik_stanowisko_fk` (`stanowisko`),
  CONSTRAINT `pracownik_dzial_id_fk` FOREIGN KEY (`dzial_id`) REFERENCES `dzial` (`id`),
  CONSTRAINT `pracownik_menadzer_id_fk` FOREIGN KEY (`menadzer_id`) REFERENCES `pracownik` (`id`),
  CONSTRAINT `pracownik_stanowisko_fk` FOREIGN KEY (`stanowisko`) REFERENCES `stanowisko` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pracownik`
--

LOCK TABLES `pracownik` WRITE;
/*!40000 ALTER TABLE `pracownik` DISABLE KEYS */;
INSERT INTO `pracownik` VALUES (1,'Velasquez','Carmen','cvelasqu','1990-03-03 00:00:00',NULL,NULL,'Prezes',50,2500.00,NULL),(2,'Ngao','LaDoris','lngao','1990-03-08 00:00:00',NULL,1,'Wiceprezes operacyjny',41,1450.00,NULL),(3,'Nagayama','Midori','mnagayam','1991-06-17 00:00:00',NULL,1,'Wiceprezes sprzedazy',31,1400.00,NULL),(4,'Quick-To-See','Mark','mquickto','1990-04-07 00:00:00',NULL,1,'Wiceprezes finansowy',10,1450.00,NULL),(5,'Ropeburn','Audry','aropebur','1990-03-04 00:00:00',NULL,1,'Wiceprezes administracji',50,1550.00,NULL),(6,'Urguhart','Molly','murguhar','1991-01-18 00:00:00',NULL,2,'Kierownik magazynu',41,1200.00,NULL),(7,'Menchu','Roberta','rmenchu','1990-05-14 00:00:00',NULL,2,'Kierownik magazynu',42,1250.00,NULL),(8,'Biri','Ben','bbiri','1990-04-07 00:00:00',NULL,2,'Kierownik magazynu',43,1100.00,NULL),(9,'Catchpole','Antoinette','acatchpo','1992-02-09 00:00:00',NULL,2,'Kierownik magazynu',44,1300.00,NULL),(10,'Havel','Marta','mhavel','1991-02-27 00:00:00',NULL,2,'Kierownik magazynu',45,1307.00,NULL),(11,'Magee','Colin','cmagee','1990-05-14 00:00:00',NULL,3,'Przedstawiciel handlowy',31,1400.00,10.00),(12,'Giljum','Henry','hgiljum','1992-01-18 00:00:00',NULL,3,'Przedstawiciel handlowy',32,1490.00,12.50),(13,'Sedeghi','Yasmin','ysedeghi','1991-02-08 00:00:00',NULL,3,'Przedstawiciel handlowy',33,1515.00,10.00),(14,'Nguyen','Mai','mnguyen','1992-01-22 00:00:00',NULL,3,'Przedstawiciel handlowy',34,1525.00,15.00),(15,'Dumas','Andre','adumas','1991-10-09 00:00:00',NULL,3,'Przedstawiciel handlowy',35,1450.00,17.50),(16,'Maduro','Elena','emaduro','1992-02-07 00:00:00',NULL,6,'Magazynier',41,1400.00,NULL),(17,'Smith','George','gsmith','1990-03-08 00:00:00',NULL,6,'Magazynier',41,940.00,NULL),(18,'Nozaki','Akira','anozaki','1991-02-09 00:00:00',NULL,7,'Magazynier',42,1200.00,NULL),(19,'Patel','Vikram','vpatel','1991-08-06 00:00:00',NULL,7,'Magazynier',42,795.00,NULL),(20,'Newman','Chad','cnewman','1991-07-21 00:00:00',NULL,8,'Magazynier',43,750.00,NULL),(21,'Markarian','Alexander','amarkari','1991-05-26 00:00:00',NULL,8,'Magazynier',43,850.00,NULL),(22,'Chang','Eddie','echang','1990-11-30 00:00:00',NULL,9,'Magazynier',44,800.00,NULL),(23,'Patel','Radha','rpatel','1990-10-17 00:00:00',NULL,9,'Magazynier',34,795.00,NULL),(24,'Dancs','Bela','bdancs','1991-03-17 00:00:00',NULL,10,'Magazynier',45,860.00,NULL),(25,'Schwartz','Sylvie','sschwart','1991-05-09 00:00:00',NULL,10,'Magazynier',45,1100.00,NULL);
/*!40000 ALTER TABLE `pracownik` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) NOT NULL,
  `krotki_opis` varchar(255) DEFAULT NULL,
  `sugerowana_cena` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produkt_name_uk` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=50537 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (10011,'Bunny Boot','Beginner\'s ski boot',150.00),(10012,'Ace Ski Boot','Intermediate ski boot',200.00),(10013,'Pro Ski Boot','Advanced ski boot',410.00),(10021,'Bunny Ski Pole','Beginner\'s ski pole',16.25),(10022,'Ace Ski Pole','Intermediate ski pole',21.95),(10023,'Pro Ski Pole','Advanced ski pole',40.95),(20106,'Junior Soccer Ball','Junior soccer ball',11.00),(20108,'World Cup Soccer Ball','World cup soccer ball',28.00),(20201,'World Cup Net','World cup net',123.00),(20510,'Black Hawk Knee Pads','Knee pads, pair',9.00),(20512,'Black Hawk Elbow Pads','Elbow pads, pair',8.00),(30321,'Grand Prix Bicycle','Road bicycle',1669.00),(30326,'Himalaya Bicycle','Mountain bicycle',582.00),(30421,'Grand Prix Bicycle Tires','Road bicycle tires',16.00),(30426,'Himalaya Tires','Mountain bicycle tires',18.25),(30433,'New Air Pump','Tire pump',20.00),(32779,'Slaker Water Bottle','Water bottle',7.00),(32861,'Safe-T Helmet','Bicycle helmet',60.00),(40421,'Alexeyer Pro Lifting Bar','Straight bar',65.00),(40422,'Pro Curling Bar','Curling bar',50.00),(41010,'Prostar 10 Pound Weight','Ten pound weight',8.00),(41020,'Prostar 20 Pound Weight','Twenty pound weight',12.00),(41050,'Prostar 50 Pound Weight','Fifty pound weight',25.00),(41080,'Prostar 80 Pound Weight','Eighty pound weight',35.00),(41100,'Prostar 100 Pound Weight','One hundred pound weight',45.00),(50169,'Major League Baseball','Baseball',4.29),(50273,'Chapman Helmet','Batting helmet',22.89),(50417,'Griffey Glove','Outfielder\'s glove',80.00),(50418,'Alomar Glove','Infielder\'s glove',75.00),(50419,'Steinbach Glove','Catcher\'s glove',80.00),(50530,'Cabrera Bat','Thirty inch bat',45.00),(50532,'Puckett Bat','Thirty-two inch bat',47.00),(50536,'Winfield Bat','Thirty-six inch bat',50.00);
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `region` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nazwa` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_name_uk` (`nazwa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES (3,'Afryka'),(1,'Ameryka Polnocna'),(2,'Ameryka Poludniowa'),(4,'Azja'),(5,'Europa');
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stan_magazynowy`
--

DROP TABLE IF EXISTS `stan_magazynowy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stan_magazynowy` (
  `produkt_id` int(11) NOT NULL,
  `magazyn_id` int(11) NOT NULL,
  `ilosc_w_magazynie` int(11) DEFAULT NULL,
  `stan_minimalny` int(11) DEFAULT NULL,
  `maksymalnie_na_magazynie` int(11) DEFAULT NULL,
  `wyjasnienie_braku_stanu` varchar(255) DEFAULT NULL,
  `data_powrotu_stanu` datetime DEFAULT NULL,
  PRIMARY KEY (`produkt_id`,`magazyn_id`),
  KEY `stan_magazynowy_magazyn_id_fk` (`magazyn_id`),
  CONSTRAINT `stan_magazynowy_magazyn_id_fk` FOREIGN KEY (`magazyn_id`) REFERENCES `magazyn` (`id`),
  CONSTRAINT `stan_magazynowy_produkt_id_fk` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stan_magazynowy`
--

LOCK TABLES `stan_magazynowy` WRITE;
/*!40000 ALTER TABLE `stan_magazynowy` DISABLE KEYS */;
INSERT INTO `stan_magazynowy` VALUES (10011,101,650,625,1100,NULL,NULL),(10012,101,600,560,1000,NULL,NULL),(10012,10501,300,300,525,NULL,NULL),(10013,101,400,400,700,NULL,NULL),(10013,10501,314,300,525,NULL,NULL),(10021,101,500,425,740,NULL,NULL),(10022,101,300,200,350,NULL,NULL),(10022,10501,502,300,525,NULL,NULL),(10023,101,400,300,525,NULL,NULL),(10023,10501,500,300,525,NULL,NULL),(20106,101,993,625,1000,NULL,NULL),(20106,201,220,150,260,NULL,NULL),(20106,10501,150,100,175,NULL,NULL),(20108,101,700,700,1225,NULL,NULL),(20108,201,166,150,260,NULL,NULL),(20108,10501,222,200,350,NULL,NULL),(20201,101,802,800,1400,NULL,NULL),(20201,201,320,200,350,NULL,NULL),(20201,10501,275,200,350,NULL,NULL),(20510,101,1389,850,1400,NULL,NULL),(20510,201,175,100,175,NULL,NULL),(20510,301,69,40,100,NULL,NULL),(20510,401,88,50,100,NULL,NULL),(20510,10501,57,50,87,NULL,NULL),(20512,101,850,850,1450,NULL,NULL),(20512,201,162,100,175,NULL,NULL),(20512,301,28,20,50,NULL,NULL),(20512,401,75,75,140,NULL,NULL),(20512,10501,62,50,87,NULL,NULL),(30321,101,2000,1500,2500,NULL,NULL),(30321,201,96,80,140,NULL,NULL),(30321,301,85,80,140,NULL,NULL),(30321,401,102,80,140,NULL,NULL),(30321,10501,194,150,275,NULL,NULL),(30326,101,2100,2000,3500,NULL,NULL),(30326,201,147,120,210,NULL,NULL),(30326,401,113,80,140,NULL,NULL),(30326,10501,277,250,440,NULL,NULL),(30421,101,1822,1800,3150,NULL,NULL),(30421,201,102,80,140,NULL,NULL),(30421,301,102,80,140,NULL,NULL),(30421,401,85,80,140,NULL,NULL),(30421,10501,190,150,275,NULL,NULL),(30426,101,2250,2000,3500,NULL,NULL),(30426,201,200,120,210,NULL,NULL),(30426,401,135,80,140,NULL,NULL),(30426,10501,423,250,450,NULL,NULL),(30433,101,650,600,1050,NULL,NULL),(30433,201,130,130,230,NULL,NULL),(30433,301,35,20,35,NULL,NULL),(30433,401,0,100,175,'Uszkodzona przesylka zostala wyslana do Hongkongu i musiala wrocic.','1992-08-07 00:00:00'),(30433,10501,273,200,350,NULL,NULL),(32779,101,2120,1250,2200,NULL,NULL),(32779,201,180,150,260,NULL,NULL),(32779,301,102,95,175,NULL,NULL),(32779,401,135,100,175,NULL,NULL),(32779,10501,280,200,350,NULL,NULL),(32861,101,505,500,875,NULL,NULL),(32861,201,132,80,140,NULL,NULL),(32861,301,57,50,100,NULL,NULL),(32861,401,250,150,250,NULL,NULL),(32861,10501,288,200,350,NULL,NULL),(40421,101,578,350,600,NULL,NULL),(40421,301,70,40,70,NULL,NULL),(40421,401,47,40,70,NULL,NULL),(40421,10501,97,80,140,NULL,NULL),(40422,101,0,350,600,'Super sprzedaz...','1993-02-08 00:00:00'),(40422,301,65,40,70,NULL,NULL),(40422,401,50,40,70,NULL,NULL),(40422,10501,90,80,140,NULL,NULL),(41010,101,250,250,437,NULL,NULL),(41010,301,59,40,70,NULL,NULL),(41010,401,80,70,220,NULL,NULL),(41010,10501,151,140,245,NULL,NULL),(41020,101,471,450,750,NULL,NULL),(41020,301,61,40,70,NULL,NULL),(41020,401,91,70,220,NULL,NULL),(41020,10501,224,140,245,NULL,NULL),(41050,101,501,450,750,NULL,NULL),(41050,301,49,40,70,NULL,NULL),(41050,401,169,70,220,NULL,NULL),(41050,10501,157,140,245,NULL,NULL),(41080,101,400,400,700,NULL,NULL),(41080,301,50,40,70,NULL,NULL),(41080,401,100,70,220,NULL,NULL),(41080,10501,159,140,245,NULL,NULL),(41100,101,350,350,600,NULL,NULL),(41100,301,42,40,70,NULL,NULL),(41100,401,75,70,220,NULL,NULL),(41100,10501,141,140,245,NULL,NULL),(50169,101,2530,1500,2600,NULL,NULL),(50169,201,225,220,385,NULL,NULL),(50169,401,240,200,350,NULL,NULL),(50273,101,233,200,350,NULL,NULL),(50273,201,75,60,100,NULL,NULL),(50273,401,224,150,280,NULL,NULL),(50417,101,518,500,875,NULL,NULL),(50417,201,82,60,100,NULL,NULL),(50417,401,130,120,210,NULL,NULL),(50418,101,244,100,275,NULL,NULL),(50418,201,98,60,100,NULL,NULL),(50418,401,156,100,175,NULL,NULL),(50419,101,230,120,310,NULL,NULL),(50419,201,77,60,100,NULL,NULL),(50419,401,151,150,280,NULL,NULL),(50530,101,669,400,700,NULL,NULL),(50530,201,62,60,100,NULL,NULL),(50530,401,119,100,175,NULL,NULL),(50532,101,0,100,175,'Oczekiwanie na wiosne','1993-04-12 00:00:00'),(50532,201,67,60,100,NULL,NULL),(50532,401,233,200,350,NULL,NULL),(50536,101,173,100,175,NULL,NULL),(50536,201,97,60,100,NULL,NULL),(50536,401,138,100,175,NULL,NULL);
/*!40000 ALTER TABLE `stan_magazynowy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stanowisko`
--

DROP TABLE IF EXISTS `stanowisko`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stanowisko` (
  `nazwa` varchar(25) NOT NULL,
  PRIMARY KEY (`nazwa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stanowisko`
--

LOCK TABLES `stanowisko` WRITE;
/*!40000 ALTER TABLE `stanowisko` DISABLE KEYS */;
INSERT INTO `stanowisko` VALUES ('Kierownik magazynu'),('Magazynier'),('Prezes'),('Przedstawiciel handlowy'),('Wiceprezes administracji'),('Wiceprezes finansowy'),('Wiceprezes operacyjny'),('Wiceprezes sprzedazy');
/*!40000 ALTER TABLE `stanowisko` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zamowienie`
--

DROP TABLE IF EXISTS `zamowienie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zamowienie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `klient_id` int(11) NOT NULL,
  `data_zamowienia` datetime DEFAULT NULL,
  `data_sprzedazy` datetime DEFAULT NULL,
  `pracownik_id` int(11) DEFAULT NULL,
  `suma` decimal(11,2) DEFAULT NULL,
  `typ_zaplaty` enum('GOTOWKA','KREDYT') DEFAULT NULL,
  `zamowienie_zrealizowane` enum('Y','N') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zamowienie_klient_id_fk` (`klient_id`),
  KEY `zamowienie_sales_rep_id_fk` (`pracownik_id`),
  CONSTRAINT `zamowienie_klient_id_fk` FOREIGN KEY (`klient_id`) REFERENCES `klient` (`id`),
  CONSTRAINT `zamowienie_sales_rep_id_fk` FOREIGN KEY (`pracownik_id`) REFERENCES `pracownik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zamowienie`
--

LOCK TABLES `zamowienie` WRITE;
/*!40000 ALTER TABLE `zamowienie` DISABLE KEYS */;
INSERT INTO `zamowienie` VALUES (97,201,'1992-08-28 00:00:00','1992-09-17 00:00:00',12,84000.00,'KREDYT','Y'),(98,202,'1992-08-31 00:00:00','1992-09-10 00:00:00',14,595.00,'GOTOWKA','Y'),(99,203,'1992-08-31 00:00:00','1992-09-18 00:00:00',14,7707.00,'KREDYT','Y'),(100,204,'1992-08-31 00:00:00','1992-09-10 00:00:00',11,601100.00,'KREDYT','Y'),(101,205,'1992-08-31 00:00:00','1992-09-15 00:00:00',14,8056.60,'KREDYT','Y'),(102,206,'1992-09-01 00:00:00','1992-09-08 00:00:00',15,8335.00,'KREDYT','Y'),(103,208,'1992-09-02 00:00:00','1992-09-22 00:00:00',15,377.00,'GOTOWKA','Y'),(104,208,'1992-09-03 00:00:00','1992-09-23 00:00:00',15,32430.00,'KREDYT','Y'),(105,209,'1992-09-04 00:00:00','1992-09-18 00:00:00',11,2722.24,'KREDYT','Y'),(106,210,'1992-09-07 00:00:00','1992-09-15 00:00:00',12,15634.00,'KREDYT','Y'),(107,211,'1992-09-07 00:00:00','1992-09-21 00:00:00',15,142171.00,'KREDYT','Y'),(108,212,'1992-09-07 00:00:00','1992-09-10 00:00:00',13,149570.00,'KREDYT','Y'),(109,213,'1992-09-08 00:00:00','1992-09-28 00:00:00',11,1020935.00,'KREDYT','Y'),(110,214,'1992-09-09 00:00:00','1992-09-21 00:00:00',11,1539.13,'GOTOWKA','Y'),(111,204,'1992-09-09 00:00:00','1992-09-21 00:00:00',11,2770.00,'GOTOWKA','Y'),(112,210,'1992-08-31 00:00:00','1992-09-10 00:00:00',12,550.00,'KREDYT','Y');
/*!40000 ALTER TABLE `zamowienie` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-09-08 23:23:14
