-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema portfolio
-- -----------------------------------------------------
-- Base de datos para portafolio

-- -----------------------------------------------------
-- Schema portfolio
--
-- Base de datos para portafolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `portfolio` DEFAULT CHARACTER SET utf8 ;
USE `portfolio` ;

-- -----------------------------------------------------
-- Table `portfolio`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`persona` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NULL,
  `telefono` VARCHAR(12) NULL,
  `correo` VARCHAR(45) NULL,
  `sobre_mi` VARCHAR(250) NULL,
  `url_foto` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`lenguage_programacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`lenguage_programacion` (
  `id` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`experiencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`experiencia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `porcentaje` INT NOT NULL,
  `persona_id` INT NOT NULL,
  `lenguage_programacion_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experiencia_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_experiencia_lenguage_programacion1_idx` (`lenguage_programacion_id` ASC) VISIBLE,
  CONSTRAINT `fk_experiencia_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_experiencia_lenguage_programacion1`
    FOREIGN KEY (`lenguage_programacion_id`)
    REFERENCES `portfolio`.`lenguage_programacion` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`servicios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `url_imagen` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  `categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servicios_persona1_idx` (`persona_id` ASC) VISIBLE,
  INDEX `fk_servicios_categoria1_idx` (`categoria_id` ASC) VISIBLE,
  CONSTRAINT `fk_servicios_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicios_categoria1`
    FOREIGN KEY (`categoria_id`)
    REFERENCES `portfolio`.`categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`proyectos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`proyectos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `url_imagen` VARCHAR(150) NOT NULL,
  `url` VARCHAR(150) NULL,
  `persona_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_proyectos_persona1_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_proyectos_persona1`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `portfolio`.`estudio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `portfolio`.`estudio` (
  `id` VARCHAR(2) NOT NULL,
  `titulo` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `url_imagen` VARCHAR(45) NULL,
  `persona_id` INT NOT NULL,
  `contrasena` VARCHAR(10) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estudio_persona_idx` (`persona_id` ASC) VISIBLE,
  CONSTRAINT `fk_estudio_persona`
    FOREIGN KEY (`persona_id`)
    REFERENCES `portfolio`.`persona` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
