DELIMITER //
-- UserRolesInsert
DROP PROCEDURE IF EXISTS SimaplaDb.UserRolesInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserRolesInsert`(
	in `idPerson` int(11),
	in `role` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;

	INSERT INTO SimaplaDb.UserRoles(
		`idPerson`,
		`role`
	)VALUES(
		idPerson,
		role
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- AdministratorInsert
DROP PROCEDURE IF EXISTS SimaplaDb.AdministratorInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdministratorInsert`(
	in `idPerson` int(11),
	in `idManagementPosition` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;
	IF NOT EXISTS (select idManagementPosition from ManagementPosition where idManagementPosition = idManagementPosition)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idManagementPosition does not exist on ManagementPosition';
	END IF;

	INSERT INTO SimaplaDb.Administrator(
		`Person_idPerson`,
		`ManagementPosition_idManagementPosition`
	)VALUES(
		idPerson,
		idManagementPosition
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- AdministratorsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.AdministratorsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdministratorsInsert`(
	in `name` varchar(20),
	in `lastname` varchar(20),
	in `carnet` varchar(10),
	in `position` varchar(45),
	in `cedula` varchar(12),
	in `age` int(9),
	in `mail` varchar(255),
	in `phone` varchar(12),
	in `district` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.Administrators(
		`name`,
		`lastname`,
		`carnet`,
		`position`,
		`cedula`,
		`age`,
		`mail`,
		`phone`,
		`district`
	)VALUES(
		name,
		lastname,
		carnet,
		position,
		cedula,
		age,
		mail,
		phone,
		district
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- AttendanceInsert
DROP PROCEDURE IF EXISTS SimaplaDb.AttendanceInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `AttendanceInsert`(
	in `idPerson` int(11),
	in `Session_idSession` int(11),
	in `idAttendanceType` int(11),
	in `numSession` int(11),
	in `dateSession` date,
	in `idScheduleXGroup` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;
	IF NOT EXISTS (select idAttendanceType from AttendanceType where idAttendanceType = idAttendanceType)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idAttendanceType does not exist on AttendanceType';
	END IF;
	IF NOT EXISTS (select idScheduleXGroup from ScheduleXGroup where idScheduleXGroup = idScheduleXGroup)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idScheduleXGroup does not exist on ScheduleXGroup';
	END IF;

	INSERT INTO SimaplaDb.Attendance(
		`idPerson`,
		`Session_idSession`,
		`AttendanceType_idAttendanceType`,
		`numSession`,
		`dateSession`,
		`ScheduleXGroup_idScheduleXGroup`
	)VALUES(
		idPerson,
		Session_idSession,
		idAttendanceType,
		numSession,
		dateSession,
		idScheduleXGroup
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- AttendanceTypeInsert
DROP PROCEDURE IF EXISTS SimaplaDb.AttendanceTypeInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `AttendanceTypeInsert`(
	in `name` varchar(15)
)
BEGIN
	INSERT INTO SimaplaDb.AttendanceType(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- CantonInsert
DROP PROCEDURE IF EXISTS SimaplaDb.CantonInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CantonInsert`(
	in `name` varchar(45),
	in `idProvince` int(11)
)
BEGIN
	IF NOT EXISTS (select idProvince from Province where idProvince = idProvince)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idProvince does not exist on Province';
	END IF;

	INSERT INTO SimaplaDb.Canton(
		`name`,
		`Province_idProvince`
	)VALUES(
		name,
		idProvince
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- CarnetInsert
DROP PROCEDURE IF EXISTS SimaplaDb.CarnetInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CarnetInsert`(
	in `idCarnet` int(11),
	in `yearEntrance` tinyint(4),
	in `consecutive` tinyint(4),
	in `locationInitials` varchar(6),
	in `idPerson` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;

	INSERT INTO SimaplaDb.Carnet(
		`idCarnet`,
		`yearEntrance`,
		`consecutive`,
		`locationInitials`,
		`Person_idPerson`
	)VALUES(
		idCarnet,
		yearEntrance,
		consecutive,
		locationInitials,
		idPerson
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ContactMailsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ContactMailsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContactMailsInsert`(
	in `idContactMails` int(11),
	in `name` varchar(60),
	in `mail` varchar(60),
	in `message` varchar(1000)
)
BEGIN
	INSERT INTO SimaplaDb.ContactMails(
		`idContactMails`,
		`name`,
		`mail`,
		`message`
	)VALUES(
		idContactMails,
		name,
		mail,
		message
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- CountryInsert
DROP PROCEDURE IF EXISTS SimaplaDb.CountryInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `CountryInsert`(
	in `name` varchar(20)
)
BEGIN
	INSERT INTO SimaplaDb.Country(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- DistrictInsert
DROP PROCEDURE IF EXISTS SimaplaDb.DistrictInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `DistrictInsert`(
	in `name` varchar(45),
	in `idCanton` int(11)
)
BEGIN
	IF NOT EXISTS (select idCanton from Canton where idCanton = idCanton)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idCanton does not exist on Canton';
	END IF;

	INSERT INTO SimaplaDb.District(
		`name`,
		`Canton_idCanton`
	)VALUES(
		name,
		idCanton
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- EmailInsert
DROP PROCEDURE IF EXISTS SimaplaDb.EmailInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `EmailInsert`(
	in `mail` varchar(255)
)
BEGIN
	INSERT INTO SimaplaDb.Email(
		`mail`
	)VALUES(
		mail
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- EventInsert
DROP PROCEDURE IF EXISTS SimaplaDb.EventInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventInsert`(
	in `name` varchar(99),
	in `date` datetime,
	in `location` varchar(255),
	in `CoordX` decimal(11,7),
	in `CoordY` decimal(11,7),
	in `idEventType` int(11)
)
BEGIN
	IF NOT EXISTS (select idEventType from EventType where idEventType = idEventType)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idEventType does not exist on EventType';
	END IF;

	INSERT INTO SimaplaDb.Event(
		`name`,
		`date`,
		`location`,
		`CoordX`,
		`CoordY`,
		`EventType_idEventType`
	)VALUES(
		name,
		date,
		location,
		CoordX,
		CoordY,
		idEventType
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- EventTypeInsert
DROP PROCEDURE IF EXISTS SimaplaDb.EventTypeInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventTypeInsert`(
	in `idEventType` int(11),
	in `name` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.EventType(
		`idEventType`,
		`name`
	)VALUES(
		idEventType,
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- EventsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.EventsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `EventsInsert`(
	in `Nombre` varchar(99),
	in `Fecha` datetime,
	in `Dirección` varchar(255),
	in `CoordX` decimal(11,7),
	in `CoordY` decimal(11,7),
	in `Tipo` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.Events(
		`Nombre`,
		`Fecha`,
		`Dirección`,
		`CoordX`,
		`CoordY`,
		`Tipo`
	)VALUES(
		Nombre,
		Fecha,
		Dirección,
		CoordX,
		CoordY,
		Tipo
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- GroupTypeInsert
DROP PROCEDURE IF EXISTS SimaplaDb.GroupTypeInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `GroupTypeInsert`(
	in `name` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.GroupType(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- GroupXEventInsert
DROP PROCEDURE IF EXISTS SimaplaDb.GroupXEventInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `GroupXEventInsert`(
	in `idGroup` int(11),
	in `idEvent` int(11)
)
BEGIN
	IF NOT EXISTS (select idGroup from Group where idGroup = idGroup)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idGroup does not exist on Group';
	END IF;
	IF NOT EXISTS (select idEvent from Event where idEvent = idEvent)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idEvent does not exist on Event';
	END IF;

	INSERT INTO SimaplaDb.GroupXEvent(
		`Group_idGroup`,
		`Event_idEvent`
	)VALUES(
		idGroup,
		idEvent
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- GroupXPersonInsert
DROP PROCEDURE IF EXISTS SimaplaDb.GroupXPersonInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `GroupXPersonInsert`(
	in `idGroup` int(11),
	in `idPerson` int(11)
)
BEGIN
	IF NOT EXISTS (select idGroup from Group where idGroup = idGroup)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idGroup does not exist on Group';
	END IF;
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;

	INSERT INTO SimaplaDb.GroupXPerson(
		`Group_idGroup`,
		`Person_idPerson`
	)VALUES(
		idGroup,
		idPerson
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- GroupsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.GroupsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `GroupsInsert`(
	in `Nombre` varchar(45),
	in `Descripción` varchar(100),
	in `Tipo` varchar(45),
	in `Encargado` varchar(41)
)
BEGIN
	INSERT INTO SimaplaDb.Groups(
		`Nombre`,
		`Descripción`,
		`Tipo`,
		`Encargado`
	)VALUES(
		Nombre,
		Descripción,
		Tipo,
		Encargado
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- InstrumentInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentInsert`(
	in `serialNumber` varchar(20),
	in `price` int(7),
	in `color` varchar(10),
	in `model` varchar(10),
	in `idInstrumentName` int(11),
	in `idPatrimony` int(11)
)
BEGIN
	IF NOT EXISTS (select idInstrumentName from InstrumentName where idInstrumentName = idInstrumentName)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idInstrumentName does not exist on InstrumentName';
	END IF;
	IF NOT EXISTS (select idPatrimony from Patrimony where idPatrimony = idPatrimony)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPatrimony does not exist on Patrimony';
	END IF;

	INSERT INTO SimaplaDb.Instrument(
		`serialNumber`,
		`price`,
		`color`,
		`model`,
		`InstrumentName_idInstrumentName`,
		`Patrimony_idPatrimony`
	)VALUES(
		serialNumber,
		price,
		color,
		model,
		idInstrumentName,
		idPatrimony
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- InstrumentNameInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentNameInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentNameInsert`(
	in `name` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.InstrumentName(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- InstrumentNamesInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentNamesInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentNamesInsert`(
	in `name` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.InstrumentNames(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- InstrumentXStudentInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentXStudentInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentXStudentInsert`(
	in `idInstrument` int(11),
	in `Person_idPerson` int(11)
)
BEGIN
	IF NOT EXISTS (select idInstrument from Instrument where idInstrument = idInstrument)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idInstrument does not exist on Instrument';
	END IF;
	IF NOT EXISTS (select Person_idPerson from Student where Person_idPerson = Person_idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person_idPerson does not exist on Student';
	END IF;

	INSERT INTO SimaplaDb.InstrumentXStudent(
		`Instrument_idInstrument`,
		`Student_Person_idPerson`
	)VALUES(
		idInstrument,
		Person_idPerson
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- InstrumentsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentsInsert`(
	in `idInstrument` int(11),
	in `name` varchar(45),
	in `serialNumber` varchar(20),
	in `price` int(7),
	in `color` varchar(10),
	in `model` varchar(10),
	in `patrimony` varchar(35)
)
BEGIN
	INSERT INTO SimaplaDb.Instruments(
		`idInstrument`,
		`name`,
		`serialNumber`,
		`price`,
		`color`,
		`model`,
		`patrimony`
	)VALUES(
		idInstrument,
		name,
		serialNumber,
		price,
		color,
		model,
		patrimony
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ManagementPositionInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ManagementPositionInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ManagementPositionInsert`(
	in `name` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.ManagementPosition(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- PatrimonyInsert
DROP PROCEDURE IF EXISTS SimaplaDb.PatrimonyInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `PatrimonyInsert`(
	in `name` varchar(35)
)
BEGIN
	INSERT INTO SimaplaDb.Patrimony(
		`name`
	)VALUES(
		name
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- PersonInsert
DROP PROCEDURE IF EXISTS SimaplaDb.PersonInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `PersonInsert`(
	in `carnet` varchar(10),
	in `cedula` varchar(12),
	in `name` varchar(20),
	in `lastname` varchar(20),
	in `birthdate` date,
	in `password` varchar(45),
	in `dateJoinedProgram` date,
	in `idSpecificAddress` int(11),
	in `idEmail` int(11),
	in `idPhone` int(11)
)
BEGIN
	IF NOT EXISTS (select idSpecificAddress from SpecificAddress where idSpecificAddress = idSpecificAddress)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idSpecificAddress does not exist on SpecificAddress';
	END IF;
	IF NOT EXISTS (select idEmail from Email where idEmail = idEmail)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idEmail does not exist on Email';
	END IF;
	IF NOT EXISTS (select idPhone from Phone where idPhone = idPhone)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPhone does not exist on Phone';
	END IF;

	INSERT INTO SimaplaDb.Person(
		`carnet`,
		`cedula`,
		`name`,
		`lastname`,
		`birthdate`,
		`password`,
		`dateJoinedProgram`,
		`SpecificAddress_idSpecificAddress`,
		`Email_idEmail`,
		`Phone_idPhone`
	)VALUES(
		carnet,
		cedula,
		name,
		lastname,
		birthdate,
		password,
		dateJoinedProgram,
		idSpecificAddress,
		idEmail,
		idPhone
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- PersonsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.PersonsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `PersonsInsert`(
	in `idPerson` int(11),
	in `name` varchar(20),
	in `lastname` varchar(20),
	in `carnet` varchar(10),
	in `cedula` varchar(12),
	in `age` int(9),
	in `mail` varchar(255),
	in `phone` varchar(12),
	in `district` varchar(45),
	in `dateJoined` varchar(76)
)
BEGIN
	INSERT INTO SimaplaDb.Persons(
		`idPerson`,
		`name`,
		`lastname`,
		`carnet`,
		`cedula`,
		`age`,
		`mail`,
		`phone`,
		`district`,
		`dateJoined`
	)VALUES(
		idPerson,
		name,
		lastname,
		carnet,
		cedula,
		age,
		mail,
		phone,
		district,
		dateJoined
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- PhoneInsert
DROP PROCEDURE IF EXISTS SimaplaDb.PhoneInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `PhoneInsert`(
	in `number` varchar(12)
)
BEGIN
	INSERT INTO SimaplaDb.Phone(
		`number`
	)VALUES(
		number
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ProvinceInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ProvinceInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProvinceInsert`(
	in `name` varchar(45),
	in `idCountry` int(11)
)
BEGIN
	IF NOT EXISTS (select idCountry from Country where idCountry = idCountry)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idCountry does not exist on Country';
	END IF;

	INSERT INTO SimaplaDb.Province(
		`name`,
		`Country_idCountry`
	)VALUES(
		name,
		idCountry
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ResponsibleInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ResponsibleInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ResponsibleInsert`(
	in `idPerson` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;

	INSERT INTO SimaplaDb.Responsible(
		`Person_idPerson`
	)VALUES(
		idPerson
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ScheduleInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ScheduleInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ScheduleInsert`(
	in `day` varchar(10),
	in `hourStart` date,
	in `hourEnd` date,
	in `expireDate` date
)
BEGIN
	INSERT INTO SimaplaDb.Schedule(
		`day`,
		`hourStart`,
		`hourEnd`,
		`expireDate`
	)VALUES(
		day,
		hourStart,
		hourEnd,
		expireDate
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- ScheduleXGroupInsert
DROP PROCEDURE IF EXISTS SimaplaDb.ScheduleXGroupInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `ScheduleXGroupInsert`(
	in `idSchedule` int(11),
	in `idGroup` int(11)
)
BEGIN
	IF NOT EXISTS (select idSchedule from Schedule where idSchedule = idSchedule)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idSchedule does not exist on Schedule';
	END IF;
	IF NOT EXISTS (select idGroup from Group where idGroup = idGroup)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idGroup does not exist on Group';
	END IF;

	INSERT INTO SimaplaDb.ScheduleXGroup(
		`Schedule_idSchedule`,
		`Group_idGroup`
	)VALUES(
		idSchedule,
		idGroup
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- SpecificAddressInsert
DROP PROCEDURE IF EXISTS SimaplaDb.SpecificAddressInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `SpecificAddressInsert`(
	in `address` varchar(80),
	in `idDistrict` int(11)
)
BEGIN
	IF NOT EXISTS (select idDistrict from District where idDistrict = idDistrict)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idDistrict does not exist on District';
	END IF;

	INSERT INTO SimaplaDb.SpecificAddress(
		`address`,
		`District_idDistrict`
	)VALUES(
		address,
		idDistrict
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- StudentInsert
DROP PROCEDURE IF EXISTS SimaplaDb.StudentInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentInsert`(
	in `idPerson` int(11),
	in `isLefty` bit(1),
	in `hasAdequacy` bit(1),
	in `specialCondition` varchar(60),
	in `medication` varchar(60)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;

	INSERT INTO SimaplaDb.Student(
		`Person_idPerson`,
		`isLefty`,
		`hasAdequacy`,
		`specialCondition`,
		`medication`
	)VALUES(
		idPerson,
		isLefty,
		hasAdequacy,
		specialCondition,
		medication
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- TeacherInsert
DROP PROCEDURE IF EXISTS SimaplaDb.TeacherInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `TeacherInsert`(
	in `idPerson` int(11),
	in `idInstrumentName` int(11)
)
BEGIN
	IF NOT EXISTS (select idPerson from Person where idPerson = idPerson)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idPerson does not exist on Person';
	END IF;
	IF NOT EXISTS (select idInstrumentName from InstrumentName where idInstrumentName = idInstrumentName)
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'idInstrumentName does not exist on InstrumentName';
	END IF;

	INSERT INTO SimaplaDb.Teacher(
		`Person_idPerson`,
		`InstrumentName_idInstrumentName`
	)VALUES(
		idPerson,
		idInstrumentName
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- StudentsInsert
DROP PROCEDURE IF EXISTS SimaplaDb.StudentsInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `StudentsInsert`(
	in `name` varchar(20),
	in `lastname` varchar(20),
	in `carnet` varchar(10),
	in `cedula` varchar(12),
	in `age` int(9),
	in `mail` varchar(255),
	in `phone` varchar(12),
	in `district` varchar(45),
	in `lefty` varchar(2),
	in `adecuacy` varchar(2),
	in `condition` varchar(60),
	in `medication` varchar(60)
)
BEGIN
	INSERT INTO SimaplaDb.Students(
		`name`,
		`lastname`,
		`carnet`,
		`cedula`,
		`age`,
		`mail`,
		`phone`,
		`district`,
		`lefty`,
		`adecuacy`,
		`condition`,
		`medication`
	)VALUES(
		name,
		lastname,
		carnet,
		cedula,
		age,
		mail,
		phone,
		district,
		lefty,
		adecuacy,
		condition,
		medication
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

DELIMITER //
-- TeachersInsert
DROP PROCEDURE IF EXISTS SimaplaDb.TeachersInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `TeachersInsert`(
	in `name` varchar(20),
	in `lastname` varchar(20),
	in `instrument` varchar(45),
	in `carnet` varchar(10),
	in `cedula` varchar(12),
	in `age` int(9),
	in `mail` varchar(255),
	in `phone` varchar(12),
	in `district` varchar(45)
)
BEGIN
	INSERT INTO SimaplaDb.Teachers(
		`name`,
		`lastname`,
		`instrument`,
		`carnet`,
		`cedula`,
		`age`,
		`mail`,
		`phone`,
		`district`
	)VALUES(
		name,
		lastname,
		instrument,
		carnet,
		cedula,
		age,
		mail,
		phone,
		district
	);
	SELECT LAST_INSERT_ID() AS `id`;
END
//
DELIMITER ;

