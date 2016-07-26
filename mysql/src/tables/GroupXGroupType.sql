SELECT 'tables/GroupXGroupType';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXGroupType` (
  `Group_idGroup` INT NOT NULL,
  `GroupType_idGroupType` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `GroupType_idGroupType`),
  INDEX `fk_Group_has_GroupType_GroupType1_idx` (`GroupType_idGroupType` ASC),
  INDEX `fk_Group_has_GroupType_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_GroupType_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_GroupType_GroupType1`
    FOREIGN KEY (`GroupType_idGroupType`)
    REFERENCES `SimaplaDb`.`GroupType` (`idGroupType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
