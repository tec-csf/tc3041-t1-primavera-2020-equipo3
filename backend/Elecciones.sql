-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS
, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS
, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE
, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Elecciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Elecciones
-- -----------------------------------------------------
CREATE SCHEMA
IF NOT EXISTS `Elecciones` DEFAULT CHARACTER
SET utf8 ;
USE `Elecciones`
;

-- -----------------------------------------------------
-- Table `Elecciones`.`Colegio`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Colegio`
(
  `noCorrelativos` INT NOT NULL,
  `electores` INT NULL,
  PRIMARY KEY
(`noCorrelativos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Eleccion`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Eleccion`
(
  `idEleccion` INT NOT NULL,
  PRIMARY KEY
(`idEleccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Mesa`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Mesa`
(
  `idMesa` CHAR
(1) NOT NULL,
  `cantElectores` INT NULL,
  `Colegio_noCorrelativos` INT NOT NULL,
  `Eleccion_idEleccion` INT NOT NULL,
  PRIMARY KEY
(`idMesa`),
  INDEX `fk_Mesa_Colegio_idx`
(`Colegio_noCorrelativos` ASC) VISIBLE,
  INDEX `fk_Mesa_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Mesa_Colegio`
    FOREIGN KEY
(`Colegio_noCorrelativos`)
    REFERENCES `Elecciones`.`Colegio`
(`noCorrelativos`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Mesa_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `Elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Votante`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Votante`
(
  `idVotante` VARCHAR
(30) NOT NULL,
  `nombre` VARCHAR
(50) NULL,
  `direccion` VARCHAR
(50) NULL,
  `fechaNacimiento` DATE NULL,
  `mexicano` TINYINT
(1) NOT NULL,
  `Mesa_idMesa` CHAR
(1) NOT NULL,
  PRIMARY KEY
(`idVotante`),
  INDEX `fk_Votante_Mesa1_idx`
(`Mesa_idMesa` ASC) VISIBLE,
  CONSTRAINT `fk_Votante_Mesa1`
    FOREIGN KEY
(`Mesa_idMesa`)
    REFERENCES `Elecciones`.`Mesa`
(`idMesa`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Partido`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Partido`
(
  `siglas` VARCHAR
(15) NOT NULL,
  `nombre` VARCHAR
(45) NULL,
  `presidente_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`siglas`, `presidente_idVotante`),
  INDEX `fk_Partido_Votante1_idx`
(`presidente_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Partido_Votante1`
    FOREIGN KEY
(`presidente_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Municipales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Municipal`
(
  `Eleccion_idEleccion` INT NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `noVotos` INT NULL,
  PRIMARY KEY
(`Eleccion_idEleccion`, `Partido_siglas`),
  INDEX `fk_Eleccion_has_Partido_Partido1_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Eleccion_has_Partido_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Eleccion_has_Partido_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `Elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Eleccion_has_Partido_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `Elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Federales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Federal`
(
  `Eleccion_idEleccion` INT NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `noVotos` INT NULL,
  PRIMARY KEY
(`Eleccion_idEleccion`, `Partido_siglas`),
  INDEX `fk_Eleccion_has_Partido_Partido2_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Eleccion_has_Partido_Eleccion2_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Eleccion_has_Partido_Eleccion2`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `Elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Eleccion_has_Partido_Partido2`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `Elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`ListaNominal`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`ListaNominal`
(
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `Orden` INT NULL,
  PRIMARY KEY
(`Votante_idVotante`, `Partido_siglas`),
  INDEX `fk_Votante_has_Partido_Partido1_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Votante_has_Partido_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  UNIQUE INDEX `Orden_UNIQUE`
(`Orden` ASC) VISIBLE,
  CONSTRAINT `fk_Votante_has_Partido_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Votante_has_Partido_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `Elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Miembro`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Miembro`
(
  `idMiembro` INT NOT NULL,
  `tipoMiembro` TINYINT
(1) NULL COMMENT '0 - Presidente\n1 - Vocal\n2 - Suplente',
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idMiembro`),
  INDEX `fk_Miembro_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Miembro_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Suplente`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Suplente`
(
  `idSuplente` INT NOT NULL,
  `Miembro_idMiembro` INT NOT NULL,
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idSuplente`),
  INDEX `fk_Suplente_Miembro1_idx`
(`Miembro_idMiembro` ASC) VISIBLE,
  INDEX `fk_Suplente_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Suplente_Miembro1`
    FOREIGN KEY
(`Miembro_idMiembro`)
    REFERENCES `Elecciones`.`Miembro`
(`idMiembro`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Suplente_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Apoderado`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Apoderado`
(
  `idApoderado` INT NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idApoderado`, `Partido_siglas`),
  INDEX `fk_Apoderado_Partido1_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Apoderado_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Apoderado_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `Elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Apoderado_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Elecciones`.`Periodo`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `Elecciones`.`Periodo`
(
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  `Eleccion_idEleccion` INT NOT NULL,
  `periodoInicio` TIMESTAMP
(6) NULL,
  `periodoFinal` TIMESTAMP
(6) NULL,
  PRIMARY KEY
(`Votante_idVotante`, `Eleccion_idEleccion`),
  INDEX `fk_Votante_has_Eleccion_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  INDEX `fk_Votante_has_Eleccion_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Votante_has_Eleccion_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `Elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Votante_has_Eleccion_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `Elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE
=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS
=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS
=@OLD_UNIQUE_CHECKS;
