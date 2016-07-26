SELECT 'Table Email';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Email` (
  `idEmail` INT NOT NULL AUTO_INCREMENT,
  `mail` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idEmail`))
ENGINE = InnoDB;
