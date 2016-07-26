SELECT 'Table Administrator';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Administrator` (
  `Person_idPerson` INT NOT NULL,
  `ManagementPosition_idManagementPosition` INT NOT NULL,
  PRIMARY KEY (`Person_idPerson`, `ManagementPosition_idManagementPosition`),
  INDEX `fk_Administrator_ManagementPosition1_idx` (`ManagementPosition_idManagementPosition` ASC),
  CONSTRAINT `fk_Administrator_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Administrator_ManagementPosition1`
    FOREIGN KEY (`ManagementPosition_idManagementPosition`)
    REFERENCES `SimaplaDb`.`ManagementPosition` (`idManagementPosition`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
