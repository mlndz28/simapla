SELECT 'Table SessionXScheduleXGroup';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`SessionXScheduleXGroup` (
  `Session_idSession` INT NOT NULL AUTO_INCREMENT,
  `ScheduleXGroup_idScheduleXGroup` INT NOT NULL,
  PRIMARY KEY (`Session_idSession`, `ScheduleXGroup_idScheduleXGroup`),
  INDEX `fk_Session_has_ScheduleXGroup_Session1_idx` (`Session_idSession` ASC),
  INDEX `fk_SessionXScheduleXGroup_ScheduleXGroup1_idx` (`ScheduleXGroup_idScheduleXGroup` ASC),
  CONSTRAINT `fk_Session_has_ScheduleXGroup_Session1`
    FOREIGN KEY (`Session_idSession`)
    REFERENCES `SimaplaDb`.`Session` (`idSession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SessionXScheduleXGroup_ScheduleXGroup1`
    FOREIGN KEY (`ScheduleXGroup_idScheduleXGroup`)
    REFERENCES `SimaplaDb`.`ScheduleXGroup` (`idScheduleXGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
