SELECT 'Table Session';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Session` (
  `idSession` INT NOT NULL AUTO_INCREMENT,
  `numSession` INT NOT NULL,
  `dateSession` DATE NOT NULL,
  PRIMARY KEY (`idSession`))
ENGINE = InnoDB;
