CREATE DATABASE ex CHARACTER SET utf8 COLLATE utf8_bin;
CREATE USER 'exuser'@'%' IDENTIFIED BY 'exuserpass';
GRANT ALL ON ex.* TO 'exuser'@'%';
FLUSH PRIVILEGES;
USE ex;
CREATE TABLE `tbl_user` (
  `User_ID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Index',
  `Username` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Username',
  `Password` varchar(32) COLLATE utf8_bin NOT NULL COMMENT 'Password',
  `Role` enum('READ ONLY','NO ACCESS','ADMIN','USER') COLLATE utf8_bin NOT NULL DEFAULT 'NO ACCESS' COMMENT 'Role-based permission for xataface',
  `DateCreated` timestamp NOT NULL DEFAULT current_timestamp() COMMENT 'Date record created',
  `DateModified` datetime DEFAULT NULL COMMENT 'Date record last modified',
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Xataface Credentials';
CREATE TABLE `A` (
  `A_ID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Index',
  `A_Name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Name',
  PRIMARY KEY (`A_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table A';
CREATE TABLE `B` (
  `B_ID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Index',
  `B_Name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Name',
  `Filename` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT 'Image filename',
  `Filename_mimetype` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT 'Type of file',
  PRIMARY KEY (`B_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table B';
CREATE TABLE `C` (
  `C_ID` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Index',
  `C_Name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT 'Name',
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table C';
CREATE TABLE `AB` (
  `A_ID` smallint(6) NOT NULL COMMENT 'Associated A',
  `B_ID` smallint(6) NOT NULL COMMENT 'Associated B',
  PRIMARY KEY (`A_ID`,`B_ID`),
  CONSTRAINT `A_ibfk_1` FOREIGN KEY (`A_ID`) REFERENCES `A` (`A_ID`) ON DELETE CASCADE,
  CONSTRAINT `B_ibfk_2` FOREIGN KEY (`B_ID`) REFERENCES `B` (`B_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table AB';
CREATE TABLE `BC` (
  `B_ID` smallint(6) NOT NULL COMMENT 'Associated B',
  `C_ID` smallint(6) NOT NULL COMMENT 'Associated C',
  PRIMARY KEY (`B_ID`,`C_ID`),
  CONSTRAINT `B_ibfk_1` FOREIGN KEY (`B_ID`) REFERENCES `B` (`B_ID`) ON DELETE CASCADE,
  CONSTRAINT `C_ibfk_2` FOREIGN KEY (`C_ID`) REFERENCES `C` (`C_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table BC';
INSERT INTO `tbl_user` VALUES (1,'admin',MD5('abc123'),'ADMIN','2020-09-09 12:37:04',NULL);
INSERT INTO `A` VALUES (1,'Alpha1'),(2,'Alpha2'),(3,'Alpha3');
INSERT INTO `B` VALUES (1,'Beta1','Beta1.png','image/png'),(2,'Beta2','Beta2.png','image/png'),(3,'Beta3','Beta3.png','image/png');
INSERT INTO `C` VALUES (1,'Charlie1'),(2,'Charlie2'),(3,'Charlie3');
INSERT INTO `AB` VALUES (1,1),(1,2),(1,3),(2,2),(2,3),(3,3);
INSERT INTO `BC` VALUES (1,1),(1,2),(1,3),(2,2),(2,3),(3,3);

