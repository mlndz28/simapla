-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema SimaplaDb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SimaplaDb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SimaplaDb` DEFAULT CHARACTER SET utf8mb4 ;
USE `SimaplaDb` ;

-- -----------------------------------------------------
-- Table `SimaplaDb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Country_idCountry` INT NOT NULL,
  PRIMARY KEY (`idProvince`, `Country_idCountry`),
  INDEX `fk_Province_Country1_idx` (`Country_idCountry` ASC),
  CONSTRAINT `fk_Province_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `SimaplaDb`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Canton`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Canton` (
  `idCanton` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Province_idProvince` INT NOT NULL,
  PRIMARY KEY (`idCanton`, `Province_idProvince`),
  INDEX `fk_Canton_Province1_idx` (`Province_idProvince` ASC),
  CONSTRAINT `fk_Canton_Province1`
    FOREIGN KEY (`Province_idProvince`)
    REFERENCES `SimaplaDb`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`District`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`District` (
  `idDistrict` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Canton_idCanton` INT NOT NULL,
  PRIMARY KEY (`idDistrict`, `Canton_idCanton`),
  INDEX `fk_District_Canton1_idx` (`Canton_idCanton` ASC),
  CONSTRAINT `fk_District_Canton1`
    FOREIGN KEY (`Canton_idCanton`)
    REFERENCES `SimaplaDb`.`Canton` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`SpecificAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`SpecificAddress` (
  `idSpecificAddress` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(80) NOT NULL,
  `District_idDistrict` INT NOT NULL,
  PRIMARY KEY (`idSpecificAddress`, `District_idDistrict`),
  INDEX `fk_SpecificAddress_District1_idx` (`District_idDistrict` ASC),
  CONSTRAINT `fk_SpecificAddress_District1`
    FOREIGN KEY (`District_idDistrict`)
    REFERENCES `SimaplaDb`.`District` (`idDistrict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Email` (
  `idEmail` INT NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEmail`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Phone` (
  `idPhone` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idPhone`))
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Person` (
  `idPerson` INT NOT NULL AUTO_INCREMENT,
  `carnet` VARCHAR(10) NULL,
  `cedula` VARCHAR(12) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `birthdate` DATE NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `idSpecificAddress` INT NOT NULL,
  `dateJoinedProgram` DATE NOT NULL,
  `salt` TINYINT(4) NULL DEFAULT 0 COMMENT 'Salt level of someone. 0-9999',
  `SpecificAddress_idSpecificAddress` INT NOT NULL,
  `Email_idEmail` INT NOT NULL,
  `Phone_idPhone` INT NOT NULL,
  PRIMARY KEY (`idPerson`, `SpecificAddress_idSpecificAddress`, `Email_idEmail`, `Phone_idPhone`),
  INDEX `fk_Person_SpecificAddress1_idx` (`SpecificAddress_idSpecificAddress` ASC),
  INDEX `fk_Person_Email1_idx` (`Email_idEmail` ASC),
  INDEX `fk_Person_Phone1_idx` (`Phone_idPhone` ASC),
  CONSTRAINT `fk_Person_SpecificAddress1`
    FOREIGN KEY (`SpecificAddress_idSpecificAddress`)
    REFERENCES `SimaplaDb`.`SpecificAddress` (`idSpecificAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Email1`
    FOREIGN KEY (`Email_idEmail`)
    REFERENCES `SimaplaDb`.`Email` (`idEmail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Person_Phone1`
    FOREIGN KEY (`Phone_idPhone`)
    REFERENCES `SimaplaDb`.`Phone` (`idPhone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Student` (
  `Person_idPerson` INT NOT NULL,
  `isLefty` BIT NOT NULL,
  `hasAdequacy` BIT NOT NULL,
  `specialCondition` VARCHAR(60) NULL,
  `medication` VARCHAR(60) NULL,
  PRIMARY KEY (`Person_idPerson`),
  CONSTRAINT `fk_Student_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`InstrumentName`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentName` (
  `idInstrumentNames` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstrumentNames`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Teacher` (
  `Person_idPerson` INT NOT NULL,
  `InstrumentName_idInstrumentNames` INT NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `InstrumentName_idInstrumentNames`),
  INDEX `fk_Teacher_InstrumentName1_idx` (`InstrumentName_idInstrumentNames` ASC),
  CONSTRAINT `fk_Teacher_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentNames`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentNames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`ManagementPosition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ManagementPosition` (
  `idManagementPosition` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idManagementPosition`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Administrator` (
  `Person_idPerson` INT NOT NULL,
  `ManagementPosition_idManagementPosition` INT NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `ManagementPosition_idManagementPosition`),
  INDEX `fk_Administrator_ManagementPosition1_idx` (`ManagementPosition_idManagementPosition` ASC),
  CONSTRAINT `fk_Administrator_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrator_ManagementPosition1`
    FOREIGN KEY (`ManagementPosition_idManagementPosition`)
    REFERENCES `SimaplaDb`.`ManagementPosition` (`idManagementPosition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Patrimony`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Patrimony` (
  `idPatrimony` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idPatrimony`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Instrument`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Instrument` (
  `idInstrument` INT NOT NULL AUTO_INCREMENT,
  `serialNumber` VARCHAR(20) NOT NULL,
  `price` INT(7) NULL,
  `color` VARCHAR(10) NOT NULL,
  `model` VARCHAR(10) NOT NULL,
  `InstrumentName_idInstrumentNames` INT NOT NULL,
  `Patrimony_idPatrimony` INT NOT NULL,
  PRIMARY KEY (`idInstrument`, `InstrumentName_idInstrumentNames`, `Patrimony_idPatrimony`),
  INDEX `fk_Instrument_InstrumentName1_idx` (`InstrumentName_idInstrumentNames` ASC),
  INDEX `fk_Instrument_Patrimony1_idx` (`Patrimony_idPatrimony` ASC),
  CONSTRAINT `fk_Instrument_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentNames`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentNames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instrument_Patrimony1`
    FOREIGN KEY (`Patrimony_idPatrimony`)
    REFERENCES `SimaplaDb`.`Patrimony` (`idPatrimony`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`InstrumentXStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentXStudent` (
  `Instrument_idInstrument` INT NOT NULL,
  `Student_Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Instrument_idInstrument`, `Student_Person_idPerson`),
  INDEX `fk_InstrumentXStudent_Student1_idx` (`Student_Person_idPerson` ASC),
  CONSTRAINT `fk_InstrumentXStudent_Instrument1`
    FOREIGN KEY (`Instrument_idInstrument`)
    REFERENCES `SimaplaDb`.`Instrument` (`idInstrument`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InstrumentXStudent_Student1`
    FOREIGN KEY (`Student_Person_idPerson`)
    REFERENCES `SimaplaDb`.`Student` (`Person_idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Group` (
  `idGroup` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`idGroup`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupXPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXPerson` (
  `Group_idGroup` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Person_idPerson`),
  INDEX `fk_Group_has_Person_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Group_has_Person_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Person_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Person_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupType` (
  `idGroupType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupXGroupType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXGroupType` (
  `Group_idGroup` INT NOT NULL,
  `GroupType_idGroupType` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `GroupType_idGroupType`),
  INDEX `fk_Group_has_GroupType_GroupType1_idx` (`GroupType_idGroupType` ASC),
  INDEX `fk_Group_has_GroupType_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_GroupType_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_GroupType_GroupType1`
    FOREIGN KEY (`GroupType_idGroupType`)
    REFERENCES `SimaplaDb`.`GroupType` (`idGroupType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Schedule` (
  `idSchedule` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(10) NOT NULL,
  `hourStart` DATE NOT NULL,
  `hourEnd` DATE NOT NULL,
  `expireDate` DATE NOT NULL,
  PRIMARY KEY (`idSchedule`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`ScheduleXGroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ScheduleXGroup` (
  `idScheduleXGroup` INT NOT NULL AUTO_INCREMENT,
  `Schedule_idSchedule` INT NOT NULL,
  `Group_idGroup` INT NOT NULL,
  PRIMARY KEY (`idScheduleXGroup`, `Schedule_idSchedule`, `Group_idGroup`),
  INDEX `fk_Schedule_has_Group_Group1_idx` (`Group_idGroup` ASC),
  INDEX `fk_Schedule_has_Group_Schedule1_idx` (`Schedule_idSchedule` ASC),
  CONSTRAINT `fk_Schedule_has_Group_Schedule1`
    FOREIGN KEY (`Schedule_idSchedule`)
    REFERENCES `SimaplaDb`.`Schedule` (`idSchedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_has_Group_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`AttendanceType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`AttendanceType` (
  `idAttendanceType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NULL,
  PRIMARY KEY (`idAttendanceType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Attendance` (
  `idAttendance` INT NOT NULL AUTO_INCREMENT,
  `idPerson` INT NULL,
  `Session_idSession` INT NOT NULL,
  `AttendanceType_idAttendanceType` INT NOT NULL,
  `numSession` INT NULL,
  `dateSession` DATE NULL,
  `ScheduleXGroup_idScheduleXGroup` INT NOT NULL,
  PRIMARY KEY (`idAttendance`, `Session_idSession`, `AttendanceType_idAttendanceType`, `ScheduleXGroup_idScheduleXGroup`),
  INDEX `Person_idPerson_idx` (`idPerson` ASC),
  INDEX `fk_Attendance_AttendanceType1_idx` (`AttendanceType_idAttendanceType` ASC),
  INDEX `fk_Attendance_ScheduleXGroup1_idx` (`ScheduleXGroup_idScheduleXGroup` ASC),
  CONSTRAINT `Person_idPerson`
    FOREIGN KEY (`idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attendance_AttendanceType1`
    FOREIGN KEY (`AttendanceType_idAttendanceType`)
    REFERENCES `SimaplaDb`.`AttendanceType` (`idAttendanceType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attendance_ScheduleXGroup1`
    FOREIGN KEY (`ScheduleXGroup_idScheduleXGroup`)
    REFERENCES `SimaplaDb`.`ScheduleXGroup` (`idScheduleXGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Carnet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Carnet` (
  `idCarnet` INT NOT NULL,
  `yearEntrance` TINYINT(4) NOT NULL,
  `consecutive` TINYINT(4) NOT NULL DEFAULT 000,
  `locationInitials` VARCHAR(6) NOT NULL DEFAULT 'mdp',
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`idCarnet`, `Person_idPerson`),
  INDEX `fk_Carnet_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_Carnet_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `date` DATETIME NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `CoordX` DECIMAL(11,7) NULL,
  `CoordY` DECIMAL(11,7) NULL,
  PRIMARY KEY (`idEvent`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`EventType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventType` (
  `idEventType` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`EventTypeXEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventTypeXEvent` (
  `EventType_idEventType` INT NOT NULL,
  `Event_idEvent` INT NOT NULL,
  PRIMARY KEY (`EventType_idEventType`, `Event_idEvent`),
  INDEX `fk_EventType_has_Event_Event1_idx` (`Event_idEvent` ASC),
  INDEX `fk_EventType_has_Event_EventType1_idx` (`EventType_idEventType` ASC),
  CONSTRAINT `fk_EventType_has_Event_EventType1`
    FOREIGN KEY (`EventType_idEventType`)
    REFERENCES `SimaplaDb`.`EventType` (`idEventType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventType_has_Event_Event1`
    FOREIGN KEY (`Event_idEvent`)
    REFERENCES `SimaplaDb`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupXEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXEvent` (
  `Group_idGroup` INT NOT NULL,
  `Event_idEvent` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Event_idEvent`),
  INDEX `fk_Group_has_Event_Event1_idx` (`Event_idEvent` ASC),
  INDEX `fk_Group_has_Event_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Event_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Event_Event1`
    FOREIGN KEY (`Event_idEvent`)
    REFERENCES `SimaplaDb`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE USER 'marcello' IDENTIFIED BY '1234';

GRANT ALL ON `SimaplaDb`.* TO 'marcello';
GRANT SELECT ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'marcello';
GRANT EXECUTE ON `SimaplaDb`.* TO 'marcello';
CREATE USER 'fabian' IDENTIFIED BY '1234';

GRANT SELECT ON TABLE `SimaplaDb`.* TO 'fabian';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'fabian';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'fabian';
GRANT EXECUTE ON `SimaplaDb`.* TO 'fabian';
CREATE USER 'emilio' IDENTIFIED BY '1234';

GRANT SELECT ON TABLE `SimaplaDb`.* TO 'emilio';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'emilio';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'emilio';
GRANT EXECUTE ON `SimaplaDb`.* TO 'emilio';
CREATE USER 'nicolas' IDENTIFIED BY '1234';

GRANT SELECT ON TABLE `SimaplaDb`.* TO 'nicolas';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'nicolas';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'nicolas';
GRANT EXECUTE ON `SimaplaDb`.* TO 'nicolas';
CREATE USER 'WebClient' IDENTIFIED BY 'wc*3';

GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'WebClient';
GRANT EXECUTE ON `SimaplaDb`.* TO 'WebClient';
GRANT SELECT ON TABLE `SimaplaDb`.* TO 'WebClient';
CREATE USER 'WebService' IDENTIFIED BY 'ws*3';

GRANT SELECT ON TABLE `SimaplaDb`.* TO 'WebService';
GRANT SELECT, INSERT, TRIGGER ON TABLE `SimaplaDb`.* TO 'WebService';
GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE `SimaplaDb`.* TO 'WebService';
GRANT EXECUTE ON `SimaplaDb`.* TO 'WebService';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
