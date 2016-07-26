SELECT 'tables/GroupType';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`GroupType` (
  `idGroupType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupType`))
ENGINE = InnoDB;
