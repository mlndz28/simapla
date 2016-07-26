SELECT 'tables/Phone';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Phone` (
  `idPhone` INT NOT NULL AUTO_INCREMENT,
  `number` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`idPhone`))
ENGINE = InnoDB
COMMENT = '		';
