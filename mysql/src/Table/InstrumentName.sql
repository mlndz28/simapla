SELECT 'Table InstrumentName';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentName` (
  `idInstrumentNames` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idInstrumentNames`))
ENGINE = InnoDB;
