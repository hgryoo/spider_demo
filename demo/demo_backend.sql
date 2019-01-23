# Partition by Key
CREATE TABLE test1
(
  id int,
  c char(120) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=innodb;

CREATE TABLE test2
(
  id int,
  c char(120) NOT NULL,
  k char(120) NOT NULL,
 PRIMARY KEY (id)
) ENGINE=innodb;

CREATE TABLE test3
(
  id int,
  c char(120) NOT NULL,
  PRIMARY KEY (id, c)
) ENGINE=innodb;

CREATE server IF NOT EXISTS frontend foreign data wrapper mysql options
(host '10.10.10.10', database 'world', user 'dba', password 'demo_password', port 3306);
