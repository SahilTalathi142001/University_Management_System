DROP SCHEMA IF EXISTS `University_Management_System` ;

-- -----------------------------------------------------
-- Schema University_Management_System
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `University_Management_System` DEFAULT CHARACTER SET utf8 ;
USE `University_Management_System` ;

-- -----------------------------------------------------
-- Table `University_Management_System`.`Examination_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Examination_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Examination_info` (
  `Examination_Id` INT NOT NULL,
  `Centre_fee` INT  NOT NULL,
  `Exam_Fee` INT NOT NULL,
  `Accessories_Fee` INT NOT NULL,
  PRIMARY KEY (`Examination_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Student_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Student_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Student_info` (
  `Student_Id` INT NOT NULL,
  `Student_Name` VARCHAR(45) NOT NULL,
  `Examination_Id` INT NOT NULL,
  PRIMARY KEY (`Student_Id`),
  INDEX `idx_FK_Examination_Id` (`Examination_Id` ASC) VISIBLE,
  CONSTRAINT `FK_Examination_Id_Student_info`
    FOREIGN KEY (`Examination_Id`)
    REFERENCES `University_Management_System`.`Examination_info` (`Examination_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`College_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`College_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`College_info` (
  `College_Id` INT NOT NULL,
  `College_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`College_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Degree_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Degree_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Degree_info` (
  `Degree_Id` INT NOT NULL,
  `Degree_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Degree_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Subject_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Subject_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Subject_info` (
  `Subject_Id` INT NOT NULL,
  `Subject_Name` VARCHAR(45) NOT NULL,
  `Subject_Section` CHAR(1) NOT NULL,
  PRIMARY KEY (`Subject_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Centre_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Centre_info` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Centre_info` (
  `Centre_Id` INT NOT NULL,
  `Centre_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Centre_Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`University_Fact`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`University_Fact` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`University_Fact` (
  `Seat_No` INT NOT NULL,
  `Subject_Id` INT NOT NULL,
  `College_Id` INT NOT NULL,
  `Student_Id` INT NOT NULL,
  `Centre_Id` INT NOT NULL,
  `Degree_Id` INT NOT NULL,
  `Examination_Id` INT NOT NULL,
  `Marks` INT NOT NULL,
  PRIMARY KEY (`Seat_No`),
  UNIQUE INDEX `idUniversity_Fact_Seat_No_UNIQUE` (`Seat_No` ASC) VISIBLE,
  INDEX `FK_Subject_Id_idx` (`Subject_Id` ASC) VISIBLE,
  INDEX `FK_College_Id_idx` (`College_Id` ASC) VISIBLE,
  INDEX `FK_Student_Id_idx` (`Student_Id` ASC) VISIBLE,
  INDEX `FK_Centre_Id_idx` (`Centre_Id` ASC) VISIBLE,
  INDEX `FK_Degree_Id_idx` (`Degree_Id` ASC) VISIBLE,
  INDEX `FK_Examination_Id_idx` (`Examination_Id` ASC) VISIBLE,
  CONSTRAINT `FK_Subject_Id`
    FOREIGN KEY (`Subject_Id`)
    REFERENCES `University_Management_System`.`Subject_info` (`Subject_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_College_Id`
    FOREIGN KEY (`College_Id`)
    REFERENCES `University_Management_System`.`College_info` (`College_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Student_Id`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `University_Management_System`.`Student_info` (`Student_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Centre_Id`
    FOREIGN KEY (`Centre_Id`)
    REFERENCES `University_Management_System`.`Centre_info` (`Centre_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Degree_Id`
    FOREIGN KEY (`Degree_Id`)
    REFERENCES `University_Management_System`.`Degree_info` (`Degree_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Examination_Id`
    FOREIGN KEY (`Examination_Id`)
    REFERENCES `University_Management_System`.`Examination_info` (`Examination_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Exam_Timetable`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Exam_Timetable` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Exam_Timetable` (
  `Centre_Id` INT NOT NULL,
  `Subject_Id` INT NOT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NOT NULL,
  INDEX `FK_Centre_Id_idx` (`Centre_Id` ASC) VISIBLE,
  INDEX `FK_Subject_Id_idx` (`Subject_Id` ASC) VISIBLE,
  PRIMARY KEY (`Centre_Id`, `Subject_Id`, `Date`, `Time`),
  CONSTRAINT `FK_Centre_Id_Exam_Timetable`
    FOREIGN KEY (`Centre_Id`)
    REFERENCES `University_Management_System`.`Centre_info` (`Centre_Id`)
   ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Subject_Id_Exam_Timetable`
    FOREIGN KEY (`Subject_Id`)
    REFERENCES `University_Management_System`.`Subject_info` (`Subject_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `University_Management_System`.`Student_Subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `University_Management_System`.`Student_Subject` ;

CREATE TABLE IF NOT EXISTS `University_Management_System`.`Student_Subject` (
  `Student_Id` INT NOT NULL,
  `Subject_Id` INT NOT NULL,
  PRIMARY KEY (`Student_Id`, `Subject_Id`),
  INDEX `FK_Subject_Id_idx` (`Subject_Id` ASC) VISIBLE,
  CONSTRAINT `FK_Student_Id_Student_Subject`
    FOREIGN KEY (`Student_Id`)
    REFERENCES `University_Management_System`.`Student_info` (`Student_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Subject_Id_Student_Subject`
    FOREIGN KEY (`Subject_Id`)
    REFERENCES `University_Management_System`.`Subject_info` (`Subject_Id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE `University_Management_System` ;
