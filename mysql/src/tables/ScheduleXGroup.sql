SELECT 'tables/ScheduleXGroup';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ScheduleXGroup` (
  `idScheduleXGroup` INT NOT NULL,
  `Schedule_idSchedule` INT NOT NULL,
  `Group_idGroup` INT NOT NULL,
  PRIMARY KEY (`Schedule_idSchedule`, `Group_idGroup`, `idScheduleXGroup`),
  INDEX `fk_Schedule_has_Group_Group1_idx` (`Group_idGroup` ASC),
  INDEX `fk_Schedule_has_Group_Schedule1_idx` (`Schedule_idSchedule` ASC),
  CONSTRAINT `fk_Schedule_has_Group_Schedule1`
    FOREIGN KEY (`Schedule_idSchedule`)
    REFERENCES `SimaplaDb`.`Schedule` (`idSchedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Schedule_has_Group_Group1`
    FOREIGN KEY (`Group_idGroup`)
    REFERENCES `SimaplaDb`.`Group` (`idGroup`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
