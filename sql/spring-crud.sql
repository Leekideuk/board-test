-- MySQL Script generated by MySQL Workbench
-- 2019년 11월 21일 (목) 오후 02시 55분 06초
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema board
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema board
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `board` DEFAULT CHARACTER SET utf8 ;
USE `board` ;

-- -----------------------------------------------------
-- Table `board`.`user_tb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`user_tb` (
  `user_id` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `board`.`board_td`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`board_td` (
  `board_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(45) NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `content` VARCHAR(20000) NOT NULL,
  `regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cnt` INT(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`board_id`),
  INDEX `fk_board_td_1_idx` (`user_id` ASC),
  CONSTRAINT `fk_board_td_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `board`.`user_tb` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `board`.`board_file_tb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`board_file_tb` (
  `board_file_id` INT(11) NOT NULL AUTO_INCREMENT,
  `board_id` INT(11) NOT NULL,
  `filename` VARCHAR(45) NOT NULL,
  `realname` VARCHAR(90) NOT NULL,
  `filesize` INT(11) NOT NULL,
  PRIMARY KEY (`board_file_id`),
  INDEX `fk_board_file_tb_1_idx` (`board_id` ASC),
  CONSTRAINT `fk_board_file_tb_1`
    FOREIGN KEY (`board_id`)
    REFERENCES `board`.`board_td` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `board`.`comment_tb`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `board`.`comment_tb` (
  `comment_id` INT(11) NOT NULL AUTO_INCREMENT,
  `board_id` INT(11) NOT NULL,
  `user_id` VARCHAR(45) NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `regdate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_tb_1_idx` (`user_id` ASC),
  INDEX `fk_comment_tb_2_idx` (`board_id` ASC),
  CONSTRAINT `fk_comment_tb_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `board`.`user_tb` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_tb_2`
    FOREIGN KEY (`board_id`)
    REFERENCES `board`.`board_td` (`board_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into user_tb(user_id, password, role) values('admin', 'admin', 1);