SELECT 'Table GroupXEvent';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupXEvent` (
  `Group_idGroup` INT NOT NULL,
  `Event_idEvent` INT NOT NULL,
  PRIMARY KEY (`Group_idGroup`, `Event_idEvent`),
  INDEX `fk_Group_has_Event_Event1_idx` (`Event_idEvent` ASC),
  INDEX `fk_Group_has_Event_Group1_idx` (`Group_idGroup` ASC),
  CONSTRAINT `fk_Group_has_Event_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Group_has_Event_Event1`
    FOREIGN KEY (`Event_idEvent`)
    REFERENCES `SimaplaDb`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
