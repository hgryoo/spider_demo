DROP TABLE IF EXISTS `test`.`opportunities`;

CREATE TABLE `test`.`opportunities` (
id int,
accountName varchar(128),
name varchar(128),
owner varchar(128),
amount decimal(10,2),
closeDate date,
stageName varchar(11),
primary key (id),
key (accountName)
) engine=InnoDB;