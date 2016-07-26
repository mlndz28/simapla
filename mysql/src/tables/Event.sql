SELECT 'tables/Event';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Event` (
  `idEvent` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(99) NOT NULL,
  `date` DATETIME NOT NULL,
  `location` VARCHAR(255) NOT NULL,
  `CoordX` DECIMAL(4,7) NULL,
  `CoordY` DECIMAL(4,7) NULL,
  PRIMARY KEY (`idEvent`))
ENGINE = InnoDB;
