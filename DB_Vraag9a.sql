-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `ID_mutation` INT UNSIGNED NOT NULL,
  `Location_mutation` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`ID_mutation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `ID_gene` INT UNSIGNED NOT NULL,
  `Name_gene` VARCHAR(45) NOT NULL,
  `Location_gene` VARCHAR(45) NOT NULL,
  `Summary` VARCHAR(45) NULL,
  PRIMARY KEY (`ID_gene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `ID_patient` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Sex` ENUM('Male', 'Female') NULL,
  `Age_Diagnose` INT NULL,
  `Mutation_ID` INT UNSIGNED NOT NULL,
  `Gene_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`ID_patient`),
  INDEX `Mutational_ID_idx` (`Mutation_ID` ASC),
  INDEX `Patient_gene_idx` (`Gene_ID` ASC),
  CONSTRAINT `Patient_mutation`
    FOREIGN KEY (`Mutation_ID`)
    REFERENCES `mydb`.`Mutation` (`ID_mutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Patient_gene`
    FOREIGN KEY (`Gene_ID`)
    REFERENCES `mydb`.`Gene` (`ID_gene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
