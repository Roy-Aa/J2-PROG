-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema dbfirst
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `dbfirst` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
-- -----------------------------------------------------
-- Schema gameaccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameaccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameaccount` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `dbfirst` ;

-- -----------------------------------------------------
-- Table `gameaccount`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameaccount`.`games` (
  `idgames` INT NOT NULL,
  `Game` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgames`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `dbfirst`.`Achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbfirst`.`Achievements` (
  `idAchievements` INT NOT NULL,
  `Achievementsbehaald` VARCHAR(45) NOT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`idAchievements`, `games_idgames`),
  INDEX `fk_Achievements_games_idx` (`games_idgames` ASC) VISIBLE,
  CONSTRAINT `fk_Achievements_games`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `gameaccount`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `gameaccount` ;

-- -----------------------------------------------------
-- Table `gameaccount`.`gamer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameaccount`.`gamer` (
  `idgamer` VARCHAR(45) NOT NULL,
  `username` INT NOT NULL,
  `profilepicture` VARCHAR(45) NOT NULL,
  `gamertag` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idgamer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameaccount`.`abonementen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameaccount`.`abonementen` (
  `idabonementen` INT NOT NULL,
  `xboxgamepass` VARCHAR(45) NULL DEFAULT NULL,
  `playstationplus` VARCHAR(45) NULL DEFAULT NULL,
  `nintendoonline` VARCHAR(45) NULL DEFAULT NULL,
  `gamer_idgamer` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idabonementen`, `gamer_idgamer`),
  INDEX `fk_abonementen_gamer_idx` (`gamer_idgamer` ASC) VISIBLE,
  CONSTRAINT `fk_abonementen_gamer`
    FOREIGN KEY (`gamer_idgamer`)
    REFERENCES `gameaccount`.`gamer` (`idgamer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameaccount`.`gamer_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameaccount`.`gamer_has_games` (
  `gamer_idgamer` VARCHAR(45) NOT NULL,
  `games_idgames` INT NOT NULL,
  PRIMARY KEY (`gamer_idgamer`, `games_idgames`),
  INDEX `fk_gamer_has_games_games1_idx` (`games_idgames` ASC) VISIBLE,
  INDEX `fk_gamer_has_games_gamer1_idx` (`gamer_idgamer` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_games_gamer1`
    FOREIGN KEY (`gamer_idgamer`)
    REFERENCES `gameaccount`.`gamer` (`idgamer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_games_games1`
    FOREIGN KEY (`games_idgames`)
    REFERENCES `gameaccount`.`games` (`idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `gameaccount`.`gamer_has_Achievements`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameaccount`.`gamer_has_Achievements` (
  `gamer_idgamer` VARCHAR(45) NOT NULL,
  `Achievements_idAchievements` INT NOT NULL,
  `Achievements_games_idgames` INT NOT NULL,
  PRIMARY KEY (`gamer_idgamer`, `Achievements_idAchievements`, `Achievements_games_idgames`),
  INDEX `fk_gamer_has_Achievements_Achievements1_idx` (`Achievements_idAchievements` ASC, `Achievements_games_idgames` ASC) VISIBLE,
  INDEX `fk_gamer_has_Achievements_gamer1_idx` (`gamer_idgamer` ASC) VISIBLE,
  CONSTRAINT `fk_gamer_has_Achievements_gamer1`
    FOREIGN KEY (`gamer_idgamer`)
    REFERENCES `gameaccount`.`gamer` (`idgamer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gamer_has_Achievements_Achievements1`
    FOREIGN KEY (`Achievements_idAchievements` , `Achievements_games_idgames`)
    REFERENCES `dbfirst`.`Achievements` (`idAchievements` , `games_idgames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
