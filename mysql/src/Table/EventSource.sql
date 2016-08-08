SELECT 'Table EventSource';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventSource` (
  `idEventSource` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventSource`))
ENGINE = InnoDB;
