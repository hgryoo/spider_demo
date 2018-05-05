USE world;

CREATE TABLE `countrylanguage` (
  `CountryCode` CHAR(3) NOT NULL DEFAULT '',
  `Language` CHAR(30) NOT NULL DEFAULT '',
  `IsOfficial` enum('T','F') NOT NULL DEFAULT 'F',
  `Percentage` FLOAT(4,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`CountryCode`,`Language`),
  KEY `CountryCode` (`CountryCode`)
) ENGINE=InnoDB;
