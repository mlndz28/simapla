SELECT 'tables/SpecificAddress';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`SpecificAddress` (
  `idSpecificAddress` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`idSpecificAddress`))
ENGINE = InnoDB;
