SELECT 'tables/CantonXProvince';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`CantonXProvince` (
  `Province_idProvince` INT NOT NULL,
  `Canton_idCanton` INT NOT NULL,
  PRIMARY KEY (`Province_idProvince`, `Canton_idCanton`),
  INDEX `fk_CantonXProvince_Canton1_idx` (`Canton_idCanton` ASC),
  CONSTRAINT `fk_CantonXProvince_Province`
    FOREIGN KEY (`Province_idProvince`)
    REFERENCES `SimaplaDb`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CantonXProvince_Canton`
    FOREIGN KEY (`Canton_idCanton`)
    REFERENCES `SimaplaDb`.`Canton` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
