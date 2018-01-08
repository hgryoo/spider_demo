CREATE server IF NOT EXISTS backend1 foreign data wrapper mysql options 
(host '10.10.10.11', database 'test', user 'dba', password 'demo_password', port 3306);

CREATE server IF NOT EXISTS backend2 foreign data wrapper mysql options 
(host '10.10.10.12', database 'test', user 'dba', password 'demo_password', port 3306);

CREATE server IF NOT EXISTS backend3 foreign data wrapper mysql options 
(host '10.10.10.13', database 'test', user 'dba', password 'demo_password', port 3306);

DROP TABLE IF EXISTS `test`.`opportunities`;

TRUNCATE TABLE `mysql`.`spider_tables`;

SET SESSION binlog_format = 'MIXED'; ## TEMPORARY FIX FOR MDEV-14019

CREATE TABLE `test`.`opportunities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountName` varchar(128) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `owner` varchar(128) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `closeDate` date DEFAULT NULL,
  `stageName` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`accountName`)
) ENGINE=SPIDER AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='wrapper "mysql", table "opportunities"'
 PARTITION BY KEY (`accountName`)
(PARTITION `pt1` COMMENT = 'srv "backend1 backend2"' ENGINE = SPIDER,
 PARTITION `pt2` COMMENT = 'srv "backend2 backend3"' ENGINE = SPIDER,
 PARTITION `pt3` COMMENT = 'srv "backend3 backend1"' ENGINE = SPIDER);
 
SET SESSION binlog_format = 'ROW'; ## TEMPORARY FIX FOR MDEV-14019

TRUNCATE `test`.`opportunities`;

LOAD DATA INFILE '/tmp/mock_data.csv' INTO TABLE `test`.`opportunities` FIELDS TERMINATED BY ',' (`accountName`,`name`,`owner`,`amount`,`closeDate`,`stageName`);