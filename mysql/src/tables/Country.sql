SELECT 'tables/Country';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Country` (
  `idCountry` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`idCountry`))
ENGINE = InnoDB;
