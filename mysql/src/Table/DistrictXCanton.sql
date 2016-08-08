SELECT 'Table DistrictXCanton';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`DistrictXCanton` (
  `Canton_idCanton` INT NOT NULL,
  `District_idDistrict` INT NOT NULL,
  PRIMARY KEY (`Canton_idCanton`, `District_idDistrict`),
  INDEX `fk_DistrictXCanton_District1_idx` (`District_idDistrict` ASC),
  CONSTRAINT `fk_DistrictXCanton_Canton`
    FOREIGN KEY (`Canton_idCanton`)
    REFERENCES `SimaplaDb`.`Canton` (`idCanton`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DistrictXCanton_District`
    FOREIGN KEY (`District_idDistrict`)
    REFERENCES `SimaplaDb`.`District` (`idDistrict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
