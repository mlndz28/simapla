SELECT 'Table EventType';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`EventType` (
  `idEventType` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEventType`))
ENGINE = InnoDB;
