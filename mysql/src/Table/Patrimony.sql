SELECT 'Table Patrimony';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Patrimony` (
  `idPatrimony` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idPatrimony`))
ENGINE = InnoDB;
