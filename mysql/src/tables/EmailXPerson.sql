SELECT 'tables/EmailXPerson';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EmailXPerson` (
  `Email_idEmail` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Email_idEmail`, `Person_idPerson`),
  INDEX `fk_EmailXPerson_Person1_idx` (`Person_idPerson` ASC),
  CONSTRAINT `fk_EmailXPerson_Email1`
    FOREIGN KEY (`Email_idEmail`)
    REFERENCES `SimaplaDb`.`Email` (`idEmail`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EmailXPerson_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
