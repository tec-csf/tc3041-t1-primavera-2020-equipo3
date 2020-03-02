-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS
, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS
, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE
, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema elecciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema elecciones
-- -----------------------------------------------------
CREATE SCHEMA
IF NOT EXISTS `elecciones` DEFAULT CHARACTER
SET utf8 ;
USE `elecciones`
;

-- -----------------------------------------------------
-- Table `elecciones`.`Colegio`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Colegio`
(
  `noCorrelativos` INT NOT NULL,
  `fechaInicio` TIMESTAMP
(6) NOT NULL,
  `fechaFin` TIMESTAMP
(6) NOT NULL,
  `cantElectores` INT NULL,
  PRIMARY KEY
(`noCorrelativos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Eleccion`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Eleccion`
(
  `idEleccion` INT NOT NULL,
  PRIMARY KEY
(`idEleccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Mesa`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Mesa`
(
  `idMesa` CHAR
(4) NOT NULL,
  `Colegio_noCorrelativos` INT NOT NULL,
  `Eleccion_idEleccion` INT NOT NULL,
  `periodoInicio` TIMESTAMP
(6) NULL,
  `periodoFinal` TIMESTAMP
(6) NULL,
  PRIMARY KEY
(`idMesa`),
  INDEX `fk_Mesa_Colegio_idx`
(`Colegio_noCorrelativos` ASC) VISIBLE,
  INDEX `fk_Mesa_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Mesa_Colegio`
    FOREIGN KEY
(`Colegio_noCorrelativos`)
    REFERENCES `elecciones`.`Colegio`
(`noCorrelativos`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Mesa_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Votante`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Votante`
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
    REFERENCES `elecciones`.`Mesa`
(`idMesa`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Partido`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Partido`
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
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Municipales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Municipales`
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
    REFERENCES `elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Eleccion_has_Partido_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Federales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Federales`
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
    REFERENCES `elecciones`.`Eleccion`
(`idEleccion`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Eleccion_has_Partido_Partido2`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`ListaNominal`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`ListaNominal`
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
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Votante_has_Partido_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Miembro`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Miembro`
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
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Suplente`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Suplente`
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
    REFERENCES `elecciones`.`Miembro`
(`idMiembro`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Suplente_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`Apoderado`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`Apoderado`
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
    REFERENCES `elecciones`.`Partido`
(`siglas`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Apoderado_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
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
