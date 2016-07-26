SELECT 'tables/EventTypeXEvent';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventTypeXEvent` (
  `EventType_idEventType` INT NOT NULL,
  `Event_idEvent` INT NOT NULL,
  PRIMARY KEY (`EventType_idEventType`, `Event_idEvent`),
  INDEX `fk_EventType_has_Event_Event1_idx` (`Event_idEvent` ASC),
  INDEX `fk_EventType_has_Event_EventType1_idx` (`EventType_idEventType` ASC),
  CONSTRAINT `fk_EventType_has_Event_EventType1`
    FOREIGN KEY (`EventType_idEventType`)
    REFERENCES `SimaplaDb`.`EventType` (`idEventType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EventType_has_Event_Event1`
    FOREIGN KEY (`Event_idEvent`)
    REFERENCES `SimaplaDb`.`Event` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
