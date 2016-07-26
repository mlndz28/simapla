SELECT 'tables/Schedule';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Schedule` (
  `idSchedule` INT NOT NULL AUTO_INCREMENT,
  `day` VARCHAR(10) NOT NULL,
  `hourStart` DATE NOT NULL,
  `hourEnd` DATE NOT NULL,
  `expireDate` DATE NOT NULL,
  PRIMARY KEY (`idSchedule`))
ENGINE = InnoDB;
