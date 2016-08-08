SELECT 'Table AttendanceType';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`AttendanceType` (
  `idAttendanceType` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(15) NULL,
  PRIMARY KEY (`idAttendanceType`))
ENGINE = InnoDB;
