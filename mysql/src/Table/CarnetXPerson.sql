SELECT 'Table CarnetXPerson';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`CarnetXPerson` (
  `Carnet_idCarnet` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Carnet_idCarnet`, `Person_idPerson`),
  INDEX `fk_Carnet_has_Person_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Carnet_has_Person_Carnet1_idx` (`Carnet_idCarnet` ASC),
  CONSTRAINT `fk_Carnet_has_Person_Carnet1`
    FOREIGN KEY (`Carnet_idCarnet`)
    REFERENCES `SimaplaDb`.`Carnet` (`idCarnet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Carnet_has_Person_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
