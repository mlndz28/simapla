SELECT 'Table SpecificAddressXDistrict';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`SpecificAddressXDistrict` (
  `District_idDistrict` INT NOT NULL,
  `SpecificAddress_idSpecificAddress` INT NOT NULL,
  PRIMARY KEY (`District_idDistrict`, `SpecificAddress_idSpecificAddress`),
  INDEX `fk_SpecificAddressXDistrict_SpecificAddress1_idx` (`SpecificAddress_idSpecificAddress` ASC),
  CONSTRAINT `fk_SpecificAddressXDistrict_District`
    FOREIGN KEY (`District_idDistrict`)
    REFERENCES `SimaplaDb`.`District` (`idDistrict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SpecificAddressXDistrict_SpecificAddress`
    FOREIGN KEY (`SpecificAddress_idSpecificAddress`)
    REFERENCES `SimaplaDb`.`SpecificAddress` (`idSpecificAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
