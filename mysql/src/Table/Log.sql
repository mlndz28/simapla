SELECT 'Table Log';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Log` (
  `EventSource_idEventSource` INT NOT NULL,
  `ObjectLog_idObjectLog` INT NOT NULL,
  `EventTypet_idEventTypet` INT NOT NULL,
  `EventLevel_idEventLevel` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `prevValue` VARCHAR(45) NULL,
  `value` VARCHAR(45) NULL,
  PRIMARY KEY (`EventSource_idEventSource`, `ObjectLog_idObjectLog`, `EventTypet_idEventTypet`, `EventLevel_idEventLevel`),
  INDEX `fk_Log_ObjectLog1_idx` (`ObjectLog_idObjectLog` ASC),
  INDEX `fk_Log_EventTypet1_idx` (`EventTypet_idEventTypet` ASC),
  INDEX `fk_Log_EventLevel1_idx` (`EventLevel_idEventLevel` ASC),
  CONSTRAINT `fk_Log_EventSource1`
    FOREIGN KEY (`EventSource_idEventSource`)
    REFERENCES `SimaplaDb`.`EventSource` (`idEventSource`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Log_ObjectLog1`
    FOREIGN KEY (`ObjectLog_idObjectLog`)
    REFERENCES `SimaplaDb`.`ObjectLog` (`idObjectLog`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Log_EventTypet1`
    FOREIGN KEY (`EventTypet_idEventTypet`)
    REFERENCES `SimaplaDb`.`EventType` (`idEventTypet`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Log_EventLevel1`
    FOREIGN KEY (`EventLevel_idEventLevel`)
    REFERENCES `SimaplaDb`.`EventLevel` (`idEventLevel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
