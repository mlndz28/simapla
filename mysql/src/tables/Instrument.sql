SELECT 'tables/Instrument';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Instrument` (
  `idInstrument` INT NOT NULL AUTO_INCREMENT,
  `serialNumber` VARCHAR(20) NOT NULL,
  `price` INT(7) NULL,
  `color` VARCHAR(10) NOT NULL,
  `model` VARCHAR(10) NOT NULL,
  `InstrumentName_idInstrumentNames` INT NOT NULL,
  `Patrimony_idPatrimony` INT NOT NULL,
  PRIMARY KEY (`idInstrument`, `InstrumentName_idInstrumentNames`, `Patrimony_idPatrimony`),
  INDEX `fk_Instrument_InstrumentName1_idx` (`InstrumentName_idInstrumentNames` ASC),
  INDEX `fk_Instrument_Patrimony1_idx` (`Patrimony_idPatrimony` ASC),
  CONSTRAINT `fk_Instrument_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentNames`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentNames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Instrument_Patrimony1`
    FOREIGN KEY (`Patrimony_idPatrimony`)
    REFERENCES `SimaplaDb`.`Patrimony` (`idPatrimony`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
