SELECT 'tables/InstrumentXStudent';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`InstrumentXStudent` (
  `Instrument_idInstrument` INT NOT NULL,
  `Student_Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Instrument_idInstrument`, `Student_Person_idPerson`),
  INDEX `fk_InstrumentXStudent_Student1_idx` (`Student_Person_idPerson` ASC),
  CONSTRAINT `fk_InstrumentXStudent_Instrument1`
    FOREIGN KEY (`Instrument_idInstrument`)
    REFERENCES `SimaplaDb`.`Instrument` (`idInstrument`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_InstrumentXStudent_Student1`
    FOREIGN KEY (`Student_Person_idPerson`)
    REFERENCES `SimaplaDb`.`Student` (`Person_idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
