SELECT 'Table AddressXPerson';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`AddressXPerson` (
  `SpecificAddress_idSpecificAddress` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`SpecificAddress_idSpecificAddress`, `Person_idPerson`),
  INDEX `fk_AddressXPerson_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_AddressXPerson_SpecificAddress1`
    FOREIGN KEY (`SpecificAddress_idSpecificAddress`)
    REFERENCES `SimaplaDb`.`SpecificAddress` (`idSpecificAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AddressXPerson_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
