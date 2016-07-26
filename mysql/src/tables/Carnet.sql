SELECT 'tables/Carnet';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Carnet` (
  `idCarnet` INT NOT NULL,
  `yearEntrance` TINYINT(4) NOT NULL,
  `consecutive` TINYINT(4) NOT NULL DEFAULT 000,
  `locationInitials` VARCHAR(6) NOT NULL DEFAULT 'mdp',
  PRIMARY KEY (`idCarnet`))
ENGINE = InnoDB;
