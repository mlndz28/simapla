-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema SimaplaDb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `SimaplaDb` ;

-- -----------------------------------------------------
-- Schema SimaplaDb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SimaplaDb` DEFAULT CHARACTER SET latin1 ;
USE `SimaplaDb` ;

-- -----------------------------------------------------
-- Table `SimaplaDb`.`ManagementPosition`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ManagementPosition` (
  `idManagementPosition` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idManagementPosition`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Email` (
  `idEmail` INT(11) NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEmail`),
  UNIQUE INDEX `mail_UNIQUE` (`mail` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 27
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Phone`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Phone` (
  `idPhone` INT(11) NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idPhone`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Country` (
  `idCountry` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCountry`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Province`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Province` (
  `idProvince` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Country_idCountry` INT(11) NOT NULL,
  PRIMARY KEY (`idProvince`, `Country_idCountry`),
  INDEX `fk_Province_Country1_idx` (`Country_idCountry` ASC),
  CONSTRAINT `fk_Province_Country1`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `SimaplaDb`.`Country` (`idCountry`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Canton`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Canton` (
  `idCanton` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Province_idProvince` INT(11) NOT NULL,
  PRIMARY KEY (`idCanton`, `Province_idProvince`),
  INDEX `fk_Canton_Province1_idx` (`Province_idProvince` ASC),
  CONSTRAINT `fk_Canton_Province1`
    FOREIGN KEY (`Province_idProvince`)
    REFERENCES `SimaplaDb`.`Province` (`idProvince`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`District`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`District` (
  `idDistrict` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `Canton_idCanton` INT(11) NOT NULL,
  PRIMARY KEY (`idDistrict`, `Canton_idCanton`),
  INDEX `fk_District_Canton1_idx` (`Canton_idCanton` ASC),
  CONSTRAINT `fk_District_Canton1`
    FOREIGN KEY (`Canton_idCanton`)
    REFERENCES `SimaplaDb`.`Canton` (`idCanton`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`SpecificAddress`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`SpecificAddress` (
  `idSpecificAddress` INT(11) NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(80) NOT NULL,
  `District_idDistrict` INT(11) NOT NULL,
  PRIMARY KEY (`idSpecificAddress`, `District_idDistrict`),
  INDEX `fk_SpecificAddress_District1_idx` (`District_idDistrict` ASC),
  CONSTRAINT `fk_SpecificAddress_District1`
    FOREIGN KEY (`District_idDistrict`)
    REFERENCES `SimaplaDb`.`District` (`idDistrict`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Person` (
  `idPerson` INT(11) NOT NULL AUTO_INCREMENT,
  `carnet` VARCHAR(10) NULL DEFAULT NULL,
  `cedula` VARCHAR(12) NOT NULL,
  `name` VARCHAR(20) NOT NULL,
  `lastname` VARCHAR(20) NOT NULL,
  `birthdate` DATE NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `dateJoinedProgram` DATE NOT NULL,
  `SpecificAddress_idSpecificAddress` INT(11) NOT NULL,
  `Email_idEmail` INT(11) NOT NULL,
  `Phone_idPhone` INT(11) NOT NULL,
  PRIMARY KEY (`idPerson`, `SpecificAddress_idSpecificAddress`, `Email_idEmail`, `Phone_idPhone`),
  UNIQUE INDEX `cedula_UNIQUE` (`cedula` ASC),
  UNIQUE INDEX `Email_idEmail_UNIQUE` (`Email_idEmail` ASC),
  UNIQUE INDEX `carnet_UNIQUE` (`carnet` ASC),
  INDEX `fk_Person_SpecificAddress1_idx` (`SpecificAddress_idSpecificAddress` ASC),
  INDEX `fk_Person_Email1_idx` (`Email_idEmail` ASC),
  INDEX `fk_Person_Phone1_idx` (`Phone_idPhone` ASC),
  CONSTRAINT `fk_Person_Email1`
    FOREIGN KEY (`Email_idEmail`)
    REFERENCES `SimaplaDb`.`Email` (`idEmail`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Person_Phone1`
    FOREIGN KEY (`Phone_idPhone`)
    REFERENCES `SimaplaDb`.`Phone` (`idPhone`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Person_SpecificAddress1`
    FOREIGN KEY (`SpecificAddress_idSpecificAddress`)
    REFERENCES `SimaplaDb`.`SpecificAddress` (`idSpecificAddress`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 24
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Administrator`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Administrator` (
  `Person_idPerson` INT(11) NOT NULL,
  `ManagementPosition_idManagementPosition` INT(11) NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `ManagementPosition_idManagementPosition`),
  INDEX `fk_Administrator_ManagementPosition1_idx` (`ManagementPosition_idManagementPosition` ASC),
  CONSTRAINT `fk_Administrator_ManagementPosition1`
    FOREIGN KEY (`ManagementPosition_idManagementPosition`)
    REFERENCES `SimaplaDb`.`ManagementPosition` (`idManagementPosition`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Administrator_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`AttendanceType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`AttendanceType` (
  `idAttendanceType` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idAttendanceType`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupType` (
  `idGroupType` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupType`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Group` (
  `idGroup` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL DEFAULT NULL,
  `GroupType_idGroupType` INT(11) NOT NULL,
  `Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`idGroup`, `GroupType_idGroupType`, `Person_idPerson`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_Group_GroupType1_idx` (`GroupType_idGroupType` ASC),
  INDEX `fk_Group_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_Group_GroupType1`
    FOREIGN KEY (`GroupType_idGroupType`)
    REFERENCES `SimaplaDb`.`GroupType` (`idGroupType`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Group_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Schedule` (
  `idSchedule` INT(11) NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(10) NOT NULL,
  `hourStart` DATE NOT NULL,
  `hourEnd` DATE NOT NULL,
  `expireDate` DATE NOT NULL,
  PRIMARY KEY (`idSchedule`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`ScheduleXGroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ScheduleXGroup` (
  `idScheduleXGroup` INT(11) NOT NULL AUTO_INCREMENT,
  `Schedule_idSchedule` INT(11) NOT NULL,
  `Group_idGroup` INT(11) NOT NULL,
  PRIMARY KEY (`idScheduleXGroup`, `Schedule_idSchedule`, `Group_idGroup`),
  INDEX `fk_Schedule_has_Group_Group1_idx` (`Group_idGroup` ASC),
  INDEX `fk_Schedule_has_Group_Schedule1_idx` (`Schedule_idSchedule` ASC),
  CONSTRAINT `fk_Schedule_has_Group_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Schedule_has_Group_Schedule1`
    FOREIGN KEY (`Schedule_idSchedule`)
    REFERENCES `SimaplaDb`.`Schedule` (`idSchedule`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Attendance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Attendance` (
  `idAttendance` INT(11) NOT NULL AUTO_INCREMENT,
  `idPerson` INT(11) NULL DEFAULT NULL,
  `Session_idSession` INT(11) NOT NULL,
  `AttendanceType_idAttendanceType` INT(11) NOT NULL,
  `numSession` INT(11) NULL DEFAULT NULL,
  `dateSession` DATE NULL DEFAULT NULL,
  `ScheduleXGroup_idScheduleXGroup` INT(11) NOT NULL,
  PRIMARY KEY (`idAttendance`, `Session_idSession`, `AttendanceType_idAttendanceType`, `ScheduleXGroup_idScheduleXGroup`),
  INDEX `Person_idPerson_idx` (`idPerson` ASC),
  INDEX `fk_Attendance_AttendanceType1_idx` (`AttendanceType_idAttendanceType` ASC),
  INDEX `fk_Attendance_ScheduleXGroup1_idx` (`ScheduleXGroup_idScheduleXGroup` ASC),
  CONSTRAINT `Person_idPerson`
    FOREIGN KEY (`idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Attendance_AttendanceType1`
    FOREIGN KEY (`AttendanceType_idAttendanceType`)
    REFERENCES `SimaplaDb`.`AttendanceType` (`idAttendanceType`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Attendance_ScheduleXGroup1`
    FOREIGN KEY (`ScheduleXGroup_idScheduleXGroup`)
    REFERENCES `SimaplaDb`.`ScheduleXGroup` (`idScheduleXGroup`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Carnet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Carnet` (
  `idCarnet` INT(11) NOT NULL,
  `yearEntrance` TINYINT(4) NOT NULL,
  `consecutive` TINYINT(4) NOT NULL DEFAULT '0',
  `locationInitials` VARCHAR(6) NOT NULL DEFAULT 'mdp',
  `Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`idCarnet`, `Person_idPerson`),
  UNIQUE INDEX `Person_idPerson_UNIQUE` (`Person_idPerson` ASC),
  INDEX `fk_Carnet_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_Carnet_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`ContactMails`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ContactMails` (
  `idContactMails` INT(11) NOT NULL,
  `name` VARCHAR(60) NULL DEFAULT NULL,
  `mail` VARCHAR(60) NULL DEFAULT NULL,
  `message` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`idContactMails`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`EventType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventType` (
  `idEventType` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventType`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Event` (
  `idEvent` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `date` DATETIME NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `CoordX` DECIMAL(11,7) NULL DEFAULT NULL,
  `CoordY` DECIMAL(11,7) NULL DEFAULT NULL,
  `EventType_idEventType` INT(11) NOT NULL,
  PRIMARY KEY (`idEvent`, `EventType_idEventType`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `fk_Event_EventType1_idx` (`EventType_idEventType` ASC),
  CONSTRAINT `fk_Event_EventType1`
    FOREIGN KEY (`EventType_idEventType`)
    REFERENCES `SimaplaDb`.`EventType` (`idEventType`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupXEvent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXEvent` (
  `Group_idGroup` INT(11) NOT NULL,
  `Event_idEvent` INT(11) NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Event_idEvent`),
  INDEX `fk_Group_has_Event_Event1_idx` (`Event_idEvent` ASC),
  INDEX `fk_Group_has_Event_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Event_Event1`
    FOREIGN KEY (`Event_idEvent`)
    REFERENCES `SimaplaDb`.`Event` (`idEvent`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Group_has_Event_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`GroupXPerson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXPerson` (
  `Group_idGroup` INT(11) NOT NULL,
  `Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Person_idPerson`),
  INDEX `fk_Group_has_Person_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Group_has_Person_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Person_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Group_has_Person_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`InstrumentName`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentName` (
  `idInstrumentName` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstrumentName`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Patrimony`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Patrimony` (
  `idPatrimony` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idPatrimony`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Instrument`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Instrument` (
  `idInstrument` INT(11) NOT NULL AUTO_INCREMENT,
  `serialNumber` VARCHAR(20) NOT NULL,
  `price` INT(7) NULL DEFAULT NULL,
  `color` VARCHAR(10) NOT NULL,
  `model` VARCHAR(10) NOT NULL,
  `InstrumentName_idInstrumentName` INT(11) NOT NULL,
  `Patrimony_idPatrimony` INT(11) NOT NULL,
  PRIMARY KEY (`idInstrument`, `InstrumentName_idInstrumentName`, `Patrimony_idPatrimony`),
  UNIQUE INDEX `serialNumber_UNIQUE` (`serialNumber` ASC),
  INDEX `fk_Instrument_InstrumentName1_idx` (`InstrumentName_idInstrumentName` ASC),
  INDEX `fk_Instrument_Patrimony1_idx` (`Patrimony_idPatrimony` ASC),
  CONSTRAINT `fk_Instrument_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentName`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentName`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Instrument_Patrimony1`
    FOREIGN KEY (`Patrimony_idPatrimony`)
    REFERENCES `SimaplaDb`.`Patrimony` (`idPatrimony`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Student` (
  `Person_idPerson` INT(11) NOT NULL,
  `isLefty` BIT(1) NOT NULL,
  `hasAdequacy` BIT(1) NOT NULL,
  `specialCondition` VARCHAR(60) NULL DEFAULT NULL,
  `medication` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`Person_idPerson`),
  CONSTRAINT `fk_Student_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`InstrumentXStudent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentXStudent` (
  `Instrument_idInstrument` INT(11) NOT NULL,
  `Student_Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`Instrument_idInstrument`, `Student_Person_idPerson`),
  INDEX `fk_InstrumentXStudent_Student1_idx` (`Student_Person_idPerson` ASC),
  CONSTRAINT `fk_InstrumentXStudent_Instrument1`
    FOREIGN KEY (`Instrument_idInstrument`)
    REFERENCES `SimaplaDb`.`Instrument` (`idInstrument`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_InstrumentXStudent_Student1`
    FOREIGN KEY (`Student_Person_idPerson`)
    REFERENCES `SimaplaDb`.`Student` (`Person_idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Role` (
  `idRole` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRole`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`PersonXRole`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`PersonXRole` (
  `Person_idPerson` INT(11) NOT NULL,
  `Role_idRole` INT(11) NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `Role_idRole`),
  INDEX `fk_Person_has_Role_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Person_has_Role_Role1_idx` (`Role_idRole` ASC),
  CONSTRAINT `fk_Person_has_Role_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Person_has_Role_Role1`
    FOREIGN KEY (`Role_idRole`)
    REFERENCES `SimaplaDb`.`Role` (`idRole`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Responsible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Responsible` (
  `Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`Person_idPerson`),
  CONSTRAINT `fk_Responsible_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`StudentXResponsible`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`StudentXResponsible` (
  `Student_Person_idPerson` INT(11) NOT NULL,
  `Responsible_Person_idPerson` INT(11) NOT NULL,
  PRIMARY KEY (`Student_Person_idPerson`, `Responsible_Person_idPerson`),
  INDEX `fk_Student_has_Responsible_Responsible1_idx` (`Responsible_Person_idPerson` ASC),
  INDEX `fk_Student_has_Responsible_Student1_idx` (`Student_Person_idPerson` ASC),
  CONSTRAINT `fk_Student_has_Responsible_Responsible1`
    FOREIGN KEY (`Responsible_Person_idPerson`)
    REFERENCES `SimaplaDb`.`Responsible` (`Person_idPerson`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Student_has_Responsible_Student1`
    FOREIGN KEY (`Student_Person_idPerson`)
    REFERENCES `SimaplaDb`.`Student` (`Person_idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `SimaplaDb`.`Teacher`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Teacher` (
  `Person_idPerson` INT(11) NOT NULL,
  `InstrumentName_idInstrumentName` INT(11) NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `InstrumentName_idInstrumentName`),
  INDEX `fk_Teacher_InstrumentName1_idx` (`InstrumentName_idInstrumentName` ASC),
  CONSTRAINT `fk_Teacher_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentName`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentName`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Teacher_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;

USE `SimaplaDb` ;

-- -----------------------------------------------------
-- Placeholder table for view `SimaplaDb`.`Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Events` (`Nombre` INT, `Fecha` INT, `Dirección` INT, `CoordX` INT, `CoordY` INT, `Tipo` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SimaplaDb`.`Groups`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Groups` (`Nombre` INT, `Descripción` INT, `Tipo` INT, `Encargado` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SimaplaDb`.`Instruments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Instruments` (`idInstrument` INT, `name` INT, `serialNumber` INT, `price` INT, `color` INT, `model` INT, `patrimony` INT);

-- -----------------------------------------------------
-- Placeholder table for view `SimaplaDb`.`Persons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Persons` (`idPerson` INT, `name` INT, `lastname` INT, `carnet` INT, `cedula` INT, `age` INT, `mail` INT, `phone` INT, `district` INT, `dateJoined` INT);

-- -----------------------------------------------------
-- procedure administratorInsert
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `administratorInsert`(
	in `pcarnet` varchar(10),
	in `pcedula` varchar(12),
	in `pname` varchar(20),
	in `plastname` varchar(20),
	in `pbirthdate` date ,
	in `ppassword` varchar(45),
	in `pdateJoinedProgram` date,
	in `pSpecificAddress` varchar(80),
	in `pEmail` varchar(255),
	in `pPhone` varchar(12),
    in `pIdDistrict` int(11),
    in `pIdManagementPosition` int(11)
)
BEGIN

    INSERT INTO `SimaplaDb`.`Administrator`(`Person_idPerson`,`ManagementPosition_idManagementPosition`)
	VALUES(insertPerson(pcarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,pSpecificAddress,pEmail,pPhone,pIdDistrict),
    pIdManagementPosition);

    INSERT INTO `SimaplaDb`.`PersonXRole`(`Person_idPerson`,`Role_idRole`)
    VALUES(@idPer,getIdRole('Administrator'));
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure eventInsert
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `eventInsert`(
	in `pName` varchar(45),
	in `pDate` date,
	in `pLocation` varchar(99),
	in `pCoordX` decimal(11,7),
	in `pCoordY` decimal(11,7),
	in `pEventType_idEventType` int(11)
)
BEGIN
	INSERT INTO `SimaplaDb`.`Event`(`name`,`date`,`location`,`CoordX`,`CoordY`,`EventType_idEventType`)
	VALUES(pName, pDate, pLocation,pCoordX,pCoordY,pEventType_idEventType);

END$$

DELIMITER ;

-- -----------------------------------------------------
-- function getIdRole
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `getIdRole`(
	`pRole` varchar(20)
) RETURNS int(11)
BEGIN
    select idRole into @idRole from Role where name = pRole;
	RETURN @idRole;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure groupInsert
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `groupInsert`(
	in `pName` varchar(45),
    in `description` varchar(100),
    in `pGroupType` int(11),
    in `pIdEncargado` int (11)
)
BEGIN
	INSERT INTO `SimaplaDb`.`Group`(`name`,`description`,`GroupType_idGroupType`,`Person_idPerson`)
	VALUES(pName, pDescription, pGroupType, pIdEncargado);
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function insertEmail
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `insertEmail`(
	pEmail varchar(255)
) RETURNS int(11)
BEGIN
	INSERT INTO `SimaplaDb`.`Email`(`mail`)VALUES(pEmail);
    select idEmail into @mai from Email where mail = pEmail;
	RETURN @mai;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function insertPerson
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `insertPerson`(
	`pcarnet` varchar(10),
	`pcedula` varchar(12),
	`pname` varchar(20),
	`plastname` varchar(20),
	`pbirthdate` date ,
	`ppassword` varchar(45),
	`pdateJoinedProgram` date,
	`pSpecificAddress` varchar(80),
	`pEmail` varchar(255),
	`pPhone` varchar(12),
    `pIdDistrict` int(11)
) RETURNS int(11)
BEGIN
	INSERT INTO `SimaplaDb`.`Person`(`carnet`,`cedula`,`name`,`lastname`,`birthdate`,`password`,`dateJoinedProgram`,`SpecificAddress_idSpecificAddress`,`Email_idEmail`,`Phone_idPhone`)
	VALUES(pcarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,
    insertSpecificAddress(pSpecificAddress, pIdDistrict),
    insertEmail(pEmail),
    insertPhone(pPhone));
    select idPerson into @idPer from Person where carnet = pcarnet and name = pname;
	RETURN @idPer;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function insertPhone
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `insertPhone`(
	pPhone varchar(12)
) RETURNS int(11)
BEGIN
	INSERT INTO `SimaplaDb`.`Phone`(`number`)VALUES(pPhone);
    select idPhone into @pho from Phone where `Phone`.`number` = pPhone;
	RETURN @pho;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- function insertSpecificAddress
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` FUNCTION `insertSpecificAddress`(
	pSpecificAddress varchar(80),
	pIdDistrict int(11)
) RETURNS int(11)
BEGIN
	INSERT INTO `SimaplaDb`.`SpecificAddress`(`address`, `District_idDistrict`)VALUES(pSpecificAddress, pIdDistrict);
    select idSpecificAddress into @addr from SpecificAddress where address = pSpecificAddress;
	RETURN @addr;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure loginGet
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginGet`(
	in pCarnet varchar(12),
	in pPwd varchar(45)
)
BEGIN
	select p.idPerson, ur.Role_idRole from
	Person p inner join PersonXRole ur
	on p.idPerson = ur.Person_idPerson
	where p.carnet = pCarnet and pPwd = p.password;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure responsibleInsert
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `responsibleInsert`(
	in `pcarnet` varchar(10),
	in `pcedula` varchar(12),
	in `pname` varchar(20),
	in `plastname` varchar(20),
	in `pbirthdate` date ,
	in `ppassword` varchar(45),
	in `pdateJoinedProgram` date,
	in `pSpecificAddress` varchar(80),
	in `pEmail` varchar(255),
	in `pPhone` varchar(12),
    in `pIdDistrict` int(11)
)
BEGIN

    select @idPer := insertPerson(pcarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,pSpecificAddress,pEmail,pPhone,pIdDistrict);

    INSERT INTO `SimaplaDb`.`Responsible`(`Person_idPerson`)
	VALUES(@idPer);

    INSERT INTO `SimaplaDb`.`PersonXRole`(`Person_idPerson`,`Role_idRole`)
    VALUES(@idPer,getIdRole('Responsible'));
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure studentInsert
-- -----------------------------------------------------

DELIMITER $$
USE `SimaplaDb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `studentInsert`(
	in `pcarnet` varchar(10),
	in `pcedula` varchar(12),
	in `pname` varchar(20),
	in `plastname` varchar(20),
	in `pbirthdate` date ,
	in `ppassword` varchar(45),
	in `pdateJoinedProgram` date,
	in `pSpecificAddress` varchar(80),
	in `pEmail` varchar(255),
	in `pPhone` varchar(12),
    in `pIdDistrict` int(11),
    in `pIsLefty` bit,
    in `pHasAdequacy` bit,
    in `pSpecialCondition` varchar(60),
    in `pMedication` varchar(60)
)
BEGIN

    select @idPer := insertPerson(pcarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,pSpecificAddress,pEmail,pPhone,pIdDistrict);

    INSERT INTO `SimaplaDb`.`Student`(`Person_idPerson`,`isLefty`,`hasAdequacy`,`specialCondition`,`medication`)
	VALUES(
    @idPer,
    pIsLefty, pHasAdequacy,pSpecialCondition,pMedication);

    INSERT INTO `SimaplaDb`.`PersonXRole`(`Person_idPerson`,`Role_idRole`)
    VALUES(@idPer,getIdRole('Student'));
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `SimaplaDb`.`Events`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SimaplaDb`.`Events`;
USE `SimaplaDb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SimaplaDb`.`Events` AS select `e`.`name` AS `Nombre`,`e`.`date` AS `Fecha`,`e`.`location` AS `Dirección`,`e`.`CoordX` AS `CoordX`,`e`.`CoordY` AS `CoordY`,`et`.`name` AS `Tipo` from (`SimaplaDb`.`Event` `e` join `SimaplaDb`.`EventType` `et` on((`et`.`idEventType` = `e`.`EventType_idEventType`)));

-- -----------------------------------------------------
-- View `SimaplaDb`.`Groups`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SimaplaDb`.`Groups`;
USE `SimaplaDb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SimaplaDb`.`Groups` AS select `g`.`name` AS `Nombre`,`g`.`description` AS `Descripción`,`gt`.`name` AS `Tipo`,concat(`p`.`name`,' ',`p`.`lastname`) AS `Encargado` from ((`SimaplaDb`.`Group` `g` join `SimaplaDb`.`GroupType` `gt` on((`gt`.`idGroupType` = `g`.`GroupType_idGroupType`))) join `SimaplaDb`.`Person` `p` on((`g`.`Person_idPerson` = `p`.`idPerson`)));

-- -----------------------------------------------------
-- View `SimaplaDb`.`Instruments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SimaplaDb`.`Instruments`;
USE `SimaplaDb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SimaplaDb`.`Instruments` AS select `i`.`idInstrument` AS `idInstrument`,`n`.`name` AS `name`,`i`.`serialNumber` AS `serialNumber`,`i`.`price` AS `price`,`i`.`color` AS `color`,`i`.`model` AS `model`,`p`.`name` AS `patrimony` from ((`SimaplaDb`.`Instrument` `i` join `SimaplaDb`.`InstrumentName` `n` on((`n`.`idInstrumentName` = `i`.`InstrumentName_idInstrumentName`))) join `SimaplaDb`.`Patrimony` `p` on((`p`.`idPatrimony` = `i`.`Patrimony_idPatrimony`))) order by `n`.`name`;

-- -----------------------------------------------------
-- View `SimaplaDb`.`Persons`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SimaplaDb`.`Persons`;
USE `SimaplaDb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `SimaplaDb`.`Persons` AS select `p`.`idPerson` AS `idPerson`,`p`.`name` AS `name`,`p`.`lastname` AS `lastname`,`p`.`carnet` AS `carnet`,`p`.`cedula` AS `cedula`,floor(((to_days(now()) - to_days(`p`.`birthdate`)) / 365)) AS `age`,`e`.`mail` AS `mail`,`t`.`number` AS `phone`,`a`.`district` AS `district`,date_format(`p`.`dateJoinedProgram`,'%dd %MMM %YY') AS `dateJoined` from (((`SimaplaDb`.`Person` `p` join `SimaplaDb`.`Email` `e` on((`e`.`idEmail` = `p`.`Email_idEmail`))) join `SimaplaDb`.`Phone` `t` on((`t`.`idPhone` = `p`.`Phone_idPhone`))) join (select `s`.`idSpecificAddress` AS `idSpecificAddress`,`d`.`name` AS `district` from (`SimaplaDb`.`SpecificAddress` `s` join `SimaplaDb`.`District` `d` on((`d`.`idDistrict` = `s`.`District_idDistrict`)))) `a` on((`a`.`idSpecificAddress` = `p`.`SpecificAddress_idSpecificAddress`))) order by `p`.`lastname`;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
