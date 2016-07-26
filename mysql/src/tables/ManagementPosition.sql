SELECT 'tables/ManagementPosition';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ManagementPosition` (
  `idManagementPosition` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idManagementPosition`))
ENGINE = InnoDB;
