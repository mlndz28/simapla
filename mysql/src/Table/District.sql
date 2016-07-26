SELECT 'Table District';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`District` (
  `idDistrict` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDistrict`))
ENGINE = InnoDB;
