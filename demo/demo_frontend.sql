# show servers
SELECT * FROM mysql.servers;

# show spider_tables
SELECT table_name FROM mysql.spider_tables;

# Partition by Key
CREATE TABLE test1
(
  id int,
  c char(120) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=spider COMMENT='wrapper "mysql", table "test1"'
 PARTITION BY KEY (id) 
(
 PARTITION pt1 COMMENT = 'srv "backend1"',
 PARTITION pt2 COMMENT = 'srv "backend2"'
) ;

CREATE TABLE test2
(
  id int,
  c char(120) NOT NULL,
  k char(120) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=spider COMMENT='wrapper "mysql", table "test2"'
 PARTITION BY KEY (id) 
(
 PARTITION pt1 COMMENT = 'srv "backend1"',
 PARTITION pt2 COMMENT = 'srv "backend2"'
);

# Insert values
INSERT INTO `test1` VALUES (1,'A');
INSERT INTO `test1` VALUES (2,'B');
INSERT INTO `test1` VALUES (3,'C');
INSERT INTO `test1` VALUES (4,'A');
INSERT INTO `test1` VALUES (5,'B');
INSERT INTO `test1` VALUES (6,'C');

INSERT INTO `test2` VALUES (1, 'B','X');
INSERT INTO `test2` VALUES (2, 'A','Y');
INSERT INTO `test2` VALUES (3, 'C','Z');
INSERT INTO `test2` VALUES (4, 'B','I');
INSERT INTO `test2` VALUES (5, 'A','J');
INSERT INTO `test2` VALUES (6, 'C','K');

SELECT test1.id, test2.id, test1.c, test2.k FROM test1 LEFT JOIN test2 ON test1.c = test2.c

# Alter Table (Resharding)
ALTER TABLE test1
 ENGINE=spider COMMENT='wrapper "mysql", table "test1"'
 PARTITION BY KEY (id) 
(
 PARTITION pt1 COMMENT = 'srv "backend1"',
 PARTITION pt2 COMMENT = 'srv "backend2"',
 PARTITION pt3 COMMENT = 'srv "backend3"'
) ;

# Partition by Range
CREATE TABLE `test3`
(
  id int,
  c char(120) NOT NULL,
  PRIMARY KEY (id, c)
) ENGINE=spider COMMENT='wrapper "mysql", table "test3"'
 PARTITION BY RANGE COLUMNS (c) 
(
 PARTITION pt1 VALUES LESS THAN ('B') COMMENT = 'srv "backend1"',
 PARTITION pt2 VALUES LESS THAN (maxvalue) COMMENT = 'srv "backend2"'
) ;

INSERT INTO `test3` VALUES (1,'A');
INSERT INTO `test3` VALUES (2,'B');
INSERT INTO `test3` VALUES (3,'C');
INSERT INTO `test3` VALUES (4,'A');
INSERT INTO `test3` VALUES (5,'B');
INSERT INTO `test3` VALUES (6,'C');

ALTER TABLE `test3`
 ENGINE=spider COMMENT='wrapper "mysql", table "test3"'
 PARTITION BY RANGE COLUMNS (c) 
(
 PARTITION pt1 VALUES LESS THAN ('B') COMMENT = 'srv "backend1"',
 PARTITION pt2 VALUES LESS THAN ('C') COMMENT = 'srv "backend2"',
 PARTITION pt3 VALUES LESS THAN (maxvalue) COMMENT = 'srv "backend3"'
);

INSERT INTO `test3` VALUES (7,'A');
INSERT INTO `test3` VALUES (8,'B');
INSERT INTO `test3` VALUES (9,'C');


SPIDER_DIRECT_SQL('SELECT * FROM test3;', '', 'srv "backend1", port "8607"')

