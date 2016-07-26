SELECT 'Table Student';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Student` (
  `Person_idPerson` INT NOT NULL,
  `isLefty` BIT NOT NULL,
  `hasAdequacy` BIT NOT NULL,
  `specialCondition` VARCHAR(60) NULL,
  `medication` VARCHAR(60) NULL,
  PRIMARY KEY (`Person_idPerson`),
  CONSTRAINT `fk_Student_Person1`
    FOREIGN KEY (`Person_idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
