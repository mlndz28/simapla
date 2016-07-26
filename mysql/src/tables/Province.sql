SELECT 'tables/Province';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Province` (
  `idProvince` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProvince`))
ENGINE = InnoDB;
