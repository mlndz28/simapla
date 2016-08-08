SELECT 'Table EventLevel';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventLevel` (
  `idEventLevel` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventLevel`))
ENGINE = InnoDB;
