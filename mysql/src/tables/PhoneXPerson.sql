SELECT 'tables/PhoneXPerson';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`PhoneXPerson` (
  `Phone_idPhone` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Phone_idPhone`, `Person_idPerson`),
  INDEX `fk_PhoneXPerson_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_PhoneXPerson_Phone1`
    FOREIGN KEY (`Phone_idPhone`)
    REFERENCES `SimaplaDb`.`Phone` (`idPhone`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PhoneXPerson_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
