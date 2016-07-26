SELECT 'tables/Teacher';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Teacher` (
  `Person_idPerson` INT NOT NULL,
  `InstrumentName_idInstrumentNames` INT NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `InstrumentName_idInstrumentNames`),
  INDEX `fk_Teacher_InstrumentName1_idx` (`InstrumentName_idInstrumentNames` ASC),
  CONSTRAINT `fk_Teacher_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_InstrumentName1`
    FOREIGN KEY (`InstrumentName_idInstrumentNames`)
    REFERENCES `SimaplaDb`.`InstrumentName` (`idInstrumentNames`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
