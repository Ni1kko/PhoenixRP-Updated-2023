-- --------------------------------------------------------
-- Host:                         178.239.166.245
-- Server version:               5.7.32-0ubuntu0.16.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for altislife_v2
CREATE DATABASE IF NOT EXISTS `altislife_v2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `altislife_v2`;

-- Dumping structure for table altislife_v2.cartel_captures
CREATE TABLE IF NOT EXISTS `cartel_captures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gangID` int(11) NOT NULL,
  `cartel` varchar(50) NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29202 DEFAULT CHARSET=latin1;

-- Dumping structure for table altislife_v2.deathgear
CREATE TABLE IF NOT EXISTS `deathgear` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(32) NOT NULL,
  `side` text NOT NULL,
  `gear` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210324 DEFAULT CHARSET=latin1;

-- Dumping structure for procedure altislife_v2.deleteClaimedMail
DELIMITER //
CREATE PROCEDURE `deleteClaimedMail`()
BEGIN
	DELETE FROM `phxmail` WHERE claimed = '1';
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deleteDeadVehicles
DELIMITER //
CREATE PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `phxcars` WHERE `dead` = 1;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deleteOldGangs
DELIMITER //
CREATE PROCEDURE `deleteOldGangs`()
BEGIN
	DELETE FROM `phxgangs` WHERE `active` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deleteOldHouses
DELIMITER //
CREATE PROCEDURE `deleteOldHouses`()
BEGIN
	DELETE FROM `phxhouses` WHERE `owned` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deleteOldRanks
DELIMITER //
CREATE PROCEDURE `deleteOldRanks`()
BEGIN
	DELETE FROM `phxranks` WHERE `active` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deleteOldWanted
DELIMITER //
CREATE PROCEDURE `deleteOldWanted`()
BEGIN
	DELETE FROM `wanted` WHERE `active` = 0;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.deletePollData
DELIMITER //
CREATE PROCEDURE `deletePollData`()
BEGIN
	DELETE FROM `PHXOptions` WHERE `delete` = 1;
	DELETE FROM `PHXResults` WHERE `delete` = 1;
	DELETE FROM `PHXPolls` WHERE `delete` = 1;
	DELETE FROM `PHXVotes` WHERE `delete` = 1;
END//
DELIMITER ;

-- Dumping structure for table altislife_v2.dispute
CREATE TABLE IF NOT EXISTS `dispute` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sendername` varchar(50) NOT NULL,
  `senderuid` varchar(17) NOT NULL,
  `receivername` varchar(50) NOT NULL,
  `receiveruid` varchar(17) NOT NULL,
  `reason` text NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6977 DEFAULT CHARSET=latin1;

-- Dumping structure for table altislife_v2.infocars
CREATE TABLE IF NOT EXISTS `infocars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `classname` varchar(50) NOT NULL,
  `friendlyName` varchar(50) NOT NULL,
  `buyPrice` int(100) DEFAULT NULL,
  `sellPrice` int(100) DEFAULT NULL,
  `storage` int(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=latin1;

-- Dumping structure for table altislife_v2.iteminfo
CREATE TABLE IF NOT EXISTS `iteminfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `className` varchar(50) NOT NULL,
  `friendlyName` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=625 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.moneygraph
CREATE TABLE IF NOT EXISTS `moneygraph` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `steamid` varchar(32) NOT NULL,
  `balance` int(128) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=92197 DEFAULT CHARSET=latin1;

-- Dumping structure for table altislife_v2.phxalliances
CREATE TABLE IF NOT EXISTS `phxalliances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gangID` int(11) NOT NULL,
  `allyID` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `ally_since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=413 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxbasebids
CREATE TABLE IF NOT EXISTS `phxbasebids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gangID` int(11) NOT NULL DEFAULT '-1',
  `bid` int(11) NOT NULL DEFAULT '0',
  `base` varchar(50) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=185 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxcars
CREATE TABLE IF NOT EXISTS `phxcars` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `side` varchar(16) NOT NULL,
  `classname` varchar(64) NOT NULL,
  `type` varchar(16) NOT NULL,
  `pid` varchar(17) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` varchar(50) NOT NULL,
  `color` int(20) NOT NULL,
  `RGB` varchar(50) NOT NULL DEFAULT '"[]"',
  `inventory` text NOT NULL,
  `upgrades` mediumtext NOT NULL,
  `gear` text NOT NULL,
  `fuel` double NOT NULL DEFAULT '1',
  `ammo` double NOT NULL DEFAULT '1',
  `damage` varchar(256) NOT NULL,
  `dead` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=110045 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table altislife_v2.phxcategories
CREATE TABLE IF NOT EXISTS `phxcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `houseid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(14) NOT NULL DEFAULT 'Category',
  `iconid` int(11) NOT NULL DEFAULT '1',
  `storage` text NOT NULL,
  `old` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8105 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxclients
CREATE TABLE IF NOT EXISTS `phxclients` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `aliases` text NOT NULL,
  `playerid` varchar(17) NOT NULL,
  `gangid` varchar(64) NOT NULL DEFAULT '-1',
  `cardid` varchar(64) NOT NULL DEFAULT '-1',
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` bigint(20) NOT NULL DEFAULT '0',
  `ganglevel` bigint(20) NOT NULL DEFAULT '0',
  `adminlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13') NOT NULL DEFAULT '0',
  `havoclevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13') NOT NULL DEFAULT '0',
  `mediclevel` enum('0','1','2','3','4','5','6','7','8','9','10','11','12','13') NOT NULL DEFAULT '0',
  `npaslevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `tpulevel` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0',
  `ctulevel` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0',
  `mi5level` enum('0','1','2','3','4','5','6','7','8') NOT NULL DEFAULT '0',
  `academylevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `mpulevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `hadlevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `hsflevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `hmulevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `hsslevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `sarlevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `donatorLevel` int(11) NOT NULL DEFAULT '0',
  `prestigeLevel` int(11) NOT NULL DEFAULT '0',
  `isSO1` int(11) NOT NULL DEFAULT '0',
  `isJudge` int(11) NOT NULL DEFAULT '0',
  `civ_licenses` text NOT NULL,
  `cop_licenses` text NOT NULL,
  `med_licenses` text NOT NULL,
  `hav_licenses` text NOT NULL,
  `civ_professions` text NOT NULL,
  `cop_professions` text NOT NULL,
  `med_professions` text NOT NULL,
  `hav_professions` text NOT NULL,
  `civ_gear` text NOT NULL,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `hav_gear` text NOT NULL,
  `mi5_gear` text NOT NULL,
  `hss_gear` text NOT NULL,
  `new_gear` text NOT NULL,
  `law_gear` text NOT NULL,
  `tax_gear` text NOT NULL,
  `ser_gear` text NOT NULL,
  `so1_gear` text NOT NULL,
  `judge_gear` text NOT NULL,
  `civ_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `med_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `hav_stats` varchar(32) NOT NULL DEFAULT '"[100,100,0]"',
  `cop_perks` text NOT NULL,
  `med_perks` text NOT NULL,
  `civ_perks` text NOT NULL,
  `hav_perks` text NOT NULL,
  `achievements` text NOT NULL,
  `level` int(11) NOT NULL DEFAULT '1',
  `xp` int(11) NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `civ_arrested_police` tinyint(1) NOT NULL DEFAULT '0',
  `civ_arrested_havoc` tinyint(1) NOT NULL DEFAULT '0',
  `jail_time` int(11) NOT NULL DEFAULT '0',
  `hav_arrested` tinyint(1) NOT NULL DEFAULT '0',
  `hav_jail_time` int(11) NOT NULL DEFAULT '0',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `hav_blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `med_blacklist` tinyint(1) NOT NULL DEFAULT '0',
  `loy_days` int(11) NOT NULL DEFAULT '0',
  `loy_rewards` text NOT NULL,
  `loy_last` date NOT NULL,
  `last_seen` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lastcopseen` timestamp NULL DEFAULT NULL,
  `lastnhsseen` timestamp NULL DEFAULT NULL,
  `lasthavocseen` timestamp NULL DEFAULT NULL,
  `lastcivseen` timestamp NULL DEFAULT NULL,
  `playtime` varchar(32) NOT NULL DEFAULT '"[0,0,0,0,0,0]"',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pid` (`playerid`),
  KEY `name` (`name`),
  KEY `blacklist` (`blacklist`)
) ENGINE=InnoDB AUTO_INCREMENT=67450 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table altislife_v2.phxgangs
CREATE TABLE IF NOT EXISTS `phxgangs` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `type` varchar(32) DEFAULT 'Unknown',
  `perks` text,
  `name` varchar(32) DEFAULT NULL,
  `tag` varchar(6) DEFAULT NULL,
  `ranks` text,
  `maxmembers` int(3) DEFAULT '8',
  `bank` bigint(32) DEFAULT '0',
  `tax` int(100) DEFAULT '0',
  `level` int(100) DEFAULT '1',
  `xp` int(100) DEFAULT '0',
  `active` tinyint(1) DEFAULT '1',
  `insert_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13298 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table altislife_v2.phxhouses
CREATE TABLE IF NOT EXISTS `phxhouses` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `name` varchar(24) NOT NULL DEFAULT '',
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `gang` tinyint(1) NOT NULL DEFAULT '0',
  `world` varchar(18) NOT NULL DEFAULT 'Altis',
  `rent_paid` date NOT NULL,
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `upgrades` text NOT NULL,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=10488 DEFAULT CHARSET=utf8mb4;

-- Dumping structure for table altislife_v2.phxids
CREATE TABLE IF NOT EXISTS `phxids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `playerid` varchar(64) NOT NULL,
  `uid` int(12) NOT NULL,
  `realname` varchar(128) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `ethnicity` varchar(50) NOT NULL,
  `isFake` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26025 DEFAULT CHARSET=latin1;

-- Dumping structure for table altislife_v2.phxmail
CREATE TABLE IF NOT EXISTS `phxmail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from` varchar(32) NOT NULL,
  `to` varchar(32) NOT NULL,
  `type` enum('"Money"','"Experiance"','"Virtual Item"','"Vehicle"','"Physical Item"') NOT NULL,
  `content` text NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `claimed` int(11) NOT NULL DEFAULT '0',
  `isAuction` int(11) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4723 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxoptions
CREATE TABLE IF NOT EXISTS `phxoptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollID` int(11) NOT NULL DEFAULT '-1',
  `name` varchar(50) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `description` varchar(64) NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dumping data for table altislife_v2.phxoptions: ~0 rows (approximately)
/*!40000 ALTER TABLE `phxoptions` DISABLE KEYS */;
/*!40000 ALTER TABLE `phxoptions` ENABLE KEYS */;

-- Dumping structure for table altislife_v2.phxpolls
CREATE TABLE IF NOT EXISTS `phxpolls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT 'General Election',
  `type` varchar(50) NOT NULL DEFAULT 'general_election',
  `description` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `repeat` int(11) NOT NULL DEFAULT '0',
  `isPolling` int(11) NOT NULL DEFAULT '0',
  `isCompleted` int(11) NOT NULL DEFAULT '0',
  `noVotes` int(11) NOT NULL DEFAULT '0',
  `noOptions` int(11) NOT NULL DEFAULT '0',
  `delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table altislife_v2.phxpolls: ~0 rows (approximately)
/*!40000 ALTER TABLE `phxpolls` DISABLE KEYS */;
INSERT INTO `phxpolls` (`id`, `title`, `type`, `description`, `date`, `repeat`, `isPolling`, `isCompleted`, `noVotes`, `noOptions`, `delete`) VALUES
	(1, 'General Election', 'general_election', 'Election of the Governor for the Island of Altis.', '2020-12-14', 15, 0, 0, 0, 0, 0);
/*!40000 ALTER TABLE `phxpolls` ENABLE KEYS */;

-- Dumping structure for table altislife_v2.phxranks
CREATE TABLE IF NOT EXISTS `phxranks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gangID` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `level` int(11) NOT NULL DEFAULT '0',
  `isLeader` int(11) NOT NULL,
  `invite` int(11) NOT NULL DEFAULT '0',
  `kick` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `upgrade` int(11) NOT NULL DEFAULT '0',
  `taxExempt` int(11) NOT NULL DEFAULT '0',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6760 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxresults
CREATE TABLE IF NOT EXISTS `phxresults` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollID` int(11) NOT NULL DEFAULT '-1',
  `results` text NOT NULL,
  `insert_time` date NOT NULL,
  `delete` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table altislife_v2.phxresults: ~0 rows (approximately)
/*!40000 ALTER TABLE `phxresults` DISABLE KEYS */;
/*!40000 ALTER TABLE `phxresults` ENABLE KEYS */;

-- Dumping structure for table altislife_v2.phxstats_users
CREATE TABLE IF NOT EXISTS `phxstats_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(64) DEFAULT NULL,
  `side` text,
  `kills` int(11) NOT NULL DEFAULT '0',
  `deaths` int(11) NOT NULL DEFAULT '0',
  `headshots` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15249 DEFAULT CHARSET=utf8;

-- Dumping structure for table altislife_v2.phxvotes
CREATE TABLE IF NOT EXISTS `phxvotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pollID` int(11) NOT NULL DEFAULT '-1',
  `optionID` int(11) NOT NULL DEFAULT '-1',
  `uid` varchar(50) NOT NULL,
  `delete` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table altislife_v2.phxvotes: ~0 rows (approximately)
/*!40000 ALTER TABLE `phxvotes` DISABLE KEYS */;
/*!40000 ALTER TABLE `phxvotes` ENABLE KEYS */;

-- Dumping structure for procedure altislife_v2.resetLifeVehicles
DELIMITER //
CREATE PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE `phxcars` SET `active`= 0;
	UPDATE `phxcars` SET `alive`= 1;
END//
DELIMITER ;

-- Dumping structure for procedure altislife_v2.resetSettings
DELIMITER //
CREATE PROCEDURE `resetSettings`()
BEGIN
	UPDATE `serversettings` SET restart = restart - 1 WHERE restart > '0' AND `name` <> 'last_governor';
END//
DELIMITER ;

-- Dumping structure for table altislife_v2.serversettings
CREATE TABLE IF NOT EXISTS `serversettings` (
  `name` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL DEFAULT '0',
  `array` text NOT NULL,
  `restart` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table altislife_v2.serversettings: ~23 rows (approximately)
/*!40000 ALTER TABLE `serversettings` DISABLE KEYS */;
INSERT INTO `serversettings` (`name`, `value`, `array`, `restart`) VALUES
	('automated_goal_end', '0', '"[]"', 0),
	('donation_goal_active', '0', '"[]"', 0),
	('evidence_lockup', '0', '"[]"', 0),
	('Fuel', '250', '"[]"', 0),
	('gbase_NE', '-2', '"[]"', 0),
	('gbase_NW', '3', '"[]"', 0),
	('gbase_SW', '-2', '"[]"', 0),
	('gbase_wars', '0', '"[]"', 0),
	('gbase_wars_maxbid', '1000000', '"[]"', 0),
	('goal_end', '8', '"[]"', 0),
	('governor', '-1', '"[]"', 0),
	('governor_details', '0', '"[]"', 0),
	('last_governor', '', '"[]"', 1),
	('legality_cigar', '1', '"[]"', 0),
	('legality_cigarette', '1', '"[]"', 0),
	('legality_coral', '1', '"[]"', 0),
	('legality_fish', '1', '"[]"', 0),
	('legality_oil', '1', '"[]"', 0),
	('legality_turtle', '1', '"[]"', 0),
	('legality_weed', '1', '"[]"', 0),
	('Paycheck', '10000', '"[]"', 0),
	('Revival', '20000', '"[]"', 0),
	('Tax', '10', '"[]"', 0);
/*!40000 ALTER TABLE `serversettings` ENABLE KEYS */;

-- Dumping structure for table altislife_v2.wanted
CREATE TABLE IF NOT EXISTS `wanted` (
  `wantedID` varchar(64) NOT NULL,
  `wantedName` varchar(32) NOT NULL,
  `wantedCrimes` text NOT NULL,
  `wantedBounty` int(100) NOT NULL,
  `removeWanted` tinyint(1) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wantedID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;