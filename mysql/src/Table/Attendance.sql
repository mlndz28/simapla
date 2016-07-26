SELECT 'Table Attendance';
CREATE TABLE IF NOT EXISTS `SimaplaDb`.`Attendance` (
  `idAttendance` INT NOT NULL AUTO_INCREMENT,
  `idPerson` INT NULL,
  `Session_idSession` INT NOT NULL,
  `AttendanceType_idAttendanceType` INT NOT NULL,
  PRIMARY KEY (`idAttendance`, `Session_idSession`, `AttendanceType_idAttendanceType`),
  INDEX `Person_idPerson_idx` (`idPerson` ASC),
  INDEX `fk_Attendance_Session1_idx` (`Session_idSession` ASC),
  INDEX `fk_Attendance_AttendanceType1_idx` (`AttendanceType_idAttendanceType` ASC),
  CONSTRAINT `Person_idPerson`
    FOREIGN KEY (`idPerson`)
    REFERENCES `SimaplaDb`.`Person` (`idPerson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attendance_Session1`
    FOREIGN KEY (`Session_idSession`)
    REFERENCES `SimaplaDb`.`Session` (`idSession`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Attendance_AttendanceType1`
    FOREIGN KEY (`AttendanceType_idAttendanceType`)
    REFERENCES `SimaplaDb`.`AttendanceType` (`idAttendanceType`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
