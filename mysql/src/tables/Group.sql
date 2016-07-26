SELECT 'tables/Group';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Group` (
  `idGroup` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`idGroup`))
ENGINE = InnoDB;
