SELECT 'Table ObjectLog';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ObjectLog` (
  `idObjectLog` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idObjectLog`))
ENGINE = InnoDB;
