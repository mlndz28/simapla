SELECT 'tables/Person';
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
  PRIMARY KEY (`idPerson`))
ENGINE = InnoDB;
