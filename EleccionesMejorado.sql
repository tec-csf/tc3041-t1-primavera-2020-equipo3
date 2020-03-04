-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS
, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS
, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE
, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
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
-- Table `elecciones`.`partido`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`partido`
(
  `siglas` VARCHAR
(15) NOT NULL,
  `nombre` VARCHAR
(45) NULL DEFAULT NULL,
  `presidente_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`siglas`, `presidente_idVotante`),
  INDEX `fk_Partido_Votante1_idx`
(`presidente_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Partido_Votante1`
    FOREIGN KEY
(`presidente_idVotante`)
    REFERENCES `elecciones`.`votante`
(`idVotante`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`colegio`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`colegio`
(
  `noCorrelativos` INT
(11) NOT NULL,
  `fechaInicio` TIMESTAMP
(6) NOT NULL,
  `fechaFin` TIMESTAMP
(6) NOT NULL,
  `cantElectores` INT
(11) NULL DEFAULT NULL,
  PRIMARY KEY
(`noCorrelativos`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`eleccion`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`eleccion`
(
  `idEleccion` INT
(11) NOT NULL,
  PRIMARY KEY
(`idEleccion`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`mesa`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`mesa`
(
  `idMesa` INT
(11) NOT NULL,
  `letraMesa` VARCHAR
(1) NOT NULL,
  `Colegio_noCorrelativos` INT
(11) NOT NULL,
  `Eleccion_idEleccion` INT
(11) NOT NULL,
  PRIMARY KEY
(`idMesa`),
  INDEX `fk_Mesa_Colegio_idx`
(`Colegio_noCorrelativos` ASC) VISIBLE,
  INDEX `fk_Mesa_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Mesa_Colegio`
    FOREIGN KEY
(`Colegio_noCorrelativos`)
    REFERENCES `elecciones`.`colegio`
(`noCorrelativos`),
  CONSTRAINT `fk_Mesa_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `elecciones`.`eleccion`
(`idEleccion`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


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
  `mexicano` TINYINT
(1) NULL,
  `fechaNacimiento` DATE NULL,
  `mesa_idMesa` INT
(11) NOT NULL,
  PRIMARY KEY
(`idVotante`),
  INDEX `fk_Votante_mesa1_idx`
(`mesa_idMesa` ASC) VISIBLE,
  CONSTRAINT `fk_Votante_mesa1`
    FOREIGN KEY
(`mesa_idMesa`)
    REFERENCES `elecciones`.`mesa`
(`idMesa`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `elecciones`.`apoderado`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`apoderado`
(
  `idApoderado` INT
(11) NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idApoderado`, `Partido_siglas`),
  INDEX `fk_Apoderado_Partido1_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_apoderado_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Apoderado_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`partido`
(`siglas`),
  CONSTRAINT `fk_apoderado_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`federales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`federales`
(
  `Eleccion_idEleccion` INT
(11) NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `noVotos` INT
(11) NULL DEFAULT NULL,
  PRIMARY KEY
(`Eleccion_idEleccion`, `Partido_siglas`),
  INDEX `fk_Eleccion_has_Partido_Partido2_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Eleccion_has_Partido_Eleccion2_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Eleccion_has_Partido_Eleccion2`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `elecciones`.`eleccion`
(`idEleccion`),
  CONSTRAINT `fk_Eleccion_has_Partido_Partido2`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`partido`
(`siglas`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`miembro`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`miembro`
(
  `idMiembro` INT
(11) NOT NULL,
  `tipoMiembro` TINYINT
(1) NULL DEFAULT NULL COMMENT '0 - Presidente\\n1 - Vocal\\n2 - Suplente',
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idMiembro`),
  INDEX `fk_miembro_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_miembro_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`municipales`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`municipales`
(
  `Eleccion_idEleccion` INT
(11) NOT NULL,
  `Partido_siglas` VARCHAR
(15) NOT NULL,
  `noVotos` INT
(11) NULL DEFAULT NULL,
  PRIMARY KEY
(`Eleccion_idEleccion`, `Partido_siglas`),
  INDEX `fk_Eleccion_has_Partido_Partido1_idx`
(`Partido_siglas` ASC) VISIBLE,
  INDEX `fk_Eleccion_has_Partido_Eleccion1_idx`
(`Eleccion_idEleccion` ASC) VISIBLE,
  CONSTRAINT `fk_Eleccion_has_Partido_Eleccion1`
    FOREIGN KEY
(`Eleccion_idEleccion`)
    REFERENCES `elecciones`.`eleccion`
(`idEleccion`),
  CONSTRAINT `fk_Eleccion_has_Partido_Partido1`
    FOREIGN KEY
(`Partido_siglas`)
    REFERENCES `elecciones`.`partido`
(`siglas`))
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`suplente`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`suplente`
(
  `idSuplente` INT
(11) NOT NULL,
  `Miembro_idMiembro` INT
(11) NOT NULL,
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  PRIMARY KEY
(`idSuplente`),
  INDEX `fk_Suplente_Miembro1_idx`
(`Miembro_idMiembro` ASC) VISIBLE,
  INDEX `fk_suplente_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Suplente_Miembro1`
    FOREIGN KEY
(`Miembro_idMiembro`)
    REFERENCES `elecciones`.`miembro`
(`idMiembro`),
  CONSTRAINT `fk_suplente_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER
SET = utf8;


-- -----------------------------------------------------
-- Table `elecciones`.`listanominal`
-- -----------------------------------------------------
CREATE TABLE
IF NOT EXISTS `elecciones`.`listanominal`
(
  `Votante_idVotante` VARCHAR
(30) NOT NULL,
  `partido_siglas` VARCHAR
(15) NOT NULL,
  `orden` INT NULL,
  PRIMARY KEY
(`Votante_idVotante`, `partido_siglas`),
  INDEX `fk_Votante_has_partido_partido1_idx`
(`partido_siglas` ASC) VISIBLE,
  INDEX `fk_Votante_has_partido_Votante1_idx`
(`Votante_idVotante` ASC) VISIBLE,
  CONSTRAINT `fk_Votante_has_partido_Votante1`
    FOREIGN KEY
(`Votante_idVotante`)
    REFERENCES `elecciones`.`Votante`
(`idVotante`)
    ON
DELETE NO ACTION
    ON
UPDATE NO ACTION,
  CONSTRAINT `fk_Votante_has_partido_partido1`
    FOREIGN KEY
(`partido_siglas`)
    REFERENCES `elecciones`.`partido`
(`siglas`)
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
