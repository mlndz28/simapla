SELECT 'Table ProvinceXCountry';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`ProvinceXCountry` (
  `Country_idCountry` INT NOT NULL,
  `Province_idProvince` INT NOT NULL,
  PRIMARY KEY (`Country_idCountry`, `Province_idProvince`),
  INDEX `fk_ProvinceXCountry_Country_idx` (`Country_idCountry` ASC),
  INDEX `fk_ProvinceXCountry_Province1_idx` (`Province_idProvince` ASC),
  CONSTRAINT `fk_ProvinceXCountry_Country`
    FOREIGN KEY (`Country_idCountry`)
    REFERENCES `SimaplaDb`.`Country` (`idCountry`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ProvinceXCountry_Province`
    FOREIGN KEY (`Province_idProvince`)
    REFERENCES `SimaplaDb`.`Province` (`idProvince`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
