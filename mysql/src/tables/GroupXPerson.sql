SELECT 'tables/GroupXPerson';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXPerson` (
  `Group_idGroup` INT NOT NULL,
  `Person_idPerson` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Person_idPerson`),
  INDEX `fk_Group_has_Person_Person1_idx` (`Person_idPerson` ASC),
  INDEX `fk_Group_has_Person_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Person_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Person_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
