DELIMITER //
-- UserRolesInsert
DROP PROCEDURE IF EXISTS SimaplaDb.UserRolesInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserRolesInsert`(
	in `Person` <<type>>,
	in `role` int(11)
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;

	INSERT INTO SimaplaDb.UserRoles(
		`idPerson`,
		`role`
	)VALUES(
		@idPerson,
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
	in `Person` <<type>>,
	in `ManagementPosition` <<type>>
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;
	IF NOT EXISTS(select idManagementPosition from idManagementPosition where <<name in table>> = ManagementPosition
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'ManagementPosition does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;
	select @idManagementPosition := idManagementPosition from idManagementPosition where <<name in table>> = ManagementPosition;

	INSERT INTO SimaplaDb.Administrator(
		`Person_idPerson`,
		`ManagementPosition_idManagementPosition`
	)VALUES(
		@idPerson,
		@idManagementPosition
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
	in `Person` <<type>>,
	in `Session_idSession` int(11),
	in `AttendanceType` <<type>>,
	in `numSession` int(11),
	in `dateSession` date,
	in `ScheduleXGroup` <<type>>
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;
	IF NOT EXISTS(select idAttendanceType from idAttendanceType where <<name in table>> = AttendanceType
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'AttendanceType does not exist';
	END IF;
	IF NOT EXISTS(select idScheduleXGroup from idScheduleXGroup where <<name in table>> = ScheduleXGroup
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'ScheduleXGroup does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;
	select @idAttendanceType := idAttendanceType from idAttendanceType where <<name in table>> = AttendanceType;
	select @idScheduleXGroup := idScheduleXGroup from idScheduleXGroup where <<name in table>> = ScheduleXGroup;

	INSERT INTO SimaplaDb.Attendance(
		`idPerson`,
		`Session_idSession`,
		`AttendanceType_idAttendanceType`,
		`numSession`,
		`dateSession`,
		`ScheduleXGroup_idScheduleXGroup`
	)VALUES(
		@idPerson,
		Session_idSession,
		@idAttendanceType,
		numSession,
		dateSession,
		@idScheduleXGroup
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
	in `Province` <<type>>
)
BEGIN
	IF NOT EXISTS(select idProvince from idProvince where <<name in table>> = Province
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Province does not exist';
	END IF;

	select @idProvince := idProvince from idProvince where <<name in table>> = Province;

	INSERT INTO SimaplaDb.Canton(
		`name`,
		`Province_idProvince`
	)VALUES(
		name,
		@idProvince
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
	in `Person` <<type>>
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;

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
		@idPerson
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
	in `Canton` <<type>>
)
BEGIN
	IF NOT EXISTS(select idCanton from idCanton where <<name in table>> = Canton
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Canton does not exist';
	END IF;

	select @idCanton := idCanton from idCanton where <<name in table>> = Canton;

	INSERT INTO SimaplaDb.District(
		`name`,
		`Canton_idCanton`
	)VALUES(
		name,
		@idCanton
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
	in `EventType` <<type>>
)
BEGIN
	IF NOT EXISTS(select idEventType from idEventType where <<name in table>> = EventType
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'EventType does not exist';
	END IF;

	select @idEventType := idEventType from idEventType where <<name in table>> = EventType;

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
		@idEventType
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
	in `Group` <<type>>,
	in `Event` <<type>>
)
BEGIN
	IF NOT EXISTS(select idGroup from idGroup where <<name in table>> = Group
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Group does not exist';
	END IF;
	IF NOT EXISTS(select idEvent from idEvent where <<name in table>> = Event
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Event does not exist';
	END IF;

	select @idGroup := idGroup from idGroup where <<name in table>> = Group;
	select @idEvent := idEvent from idEvent where <<name in table>> = Event;

	INSERT INTO SimaplaDb.GroupXEvent(
		`Group_idGroup`,
		`Event_idEvent`
	)VALUES(
		@idGroup,
		@idEvent
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
	in `Group` <<type>>,
	in `Person` <<type>>
)
BEGIN
	IF NOT EXISTS(select idGroup from idGroup where <<name in table>> = Group
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Group does not exist';
	END IF;
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;

	select @idGroup := idGroup from idGroup where <<name in table>> = Group;
	select @idPerson := idPerson from idPerson where <<name in table>> = Person;

	INSERT INTO SimaplaDb.GroupXPerson(
		`Group_idGroup`,
		`Person_idPerson`
	)VALUES(
		@idGroup,
		@idPerson
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
	in `InstrumentName` <<type>>,
	in `Patrimony` <<type>>
)
BEGIN
	IF NOT EXISTS(select idInstrumentName from idInstrumentName where <<name in table>> = InstrumentName
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'InstrumentName does not exist';
	END IF;
	IF NOT EXISTS(select idPatrimony from idPatrimony where <<name in table>> = Patrimony
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Patrimony does not exist';
	END IF;

	select @idInstrumentName := idInstrumentName from idInstrumentName where <<name in table>> = InstrumentName;
	select @idPatrimony := idPatrimony from idPatrimony where <<name in table>> = Patrimony;

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
		@idInstrumentName,
		@idPatrimony
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
-- InstrumentXStudentInsert
DROP PROCEDURE IF EXISTS SimaplaDb.InstrumentXStudentInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `InstrumentXStudentInsert`(
	in `Instrument` <<type>>,
	in `Person_Person` <<type>>
)
BEGIN
	IF NOT EXISTS(select idInstrument from idInstrument where <<name in table>> = Instrument
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Instrument does not exist';
	END IF;
	IF NOT EXISTS(select Person_idPerson from Person_idPerson where <<name in table>> = Person_Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person_Person does not exist';
	END IF;

	select @idInstrument := idInstrument from idInstrument where <<name in table>> = Instrument;
	select @Person_idPerson := Person_idPerson from Person_idPerson where <<name in table>> = Person_Person;

	INSERT INTO SimaplaDb.InstrumentXStudent(
		`Instrument_idInstrument`,
		`Student_Person_idPerson`
	)VALUES(
		@idInstrument,
		@Person_idPerson
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
	in `SpecificAddress` <<type>>,
	in `Email` <<type>>,
	in `Phone` <<type>>
)
BEGIN
	IF NOT EXISTS(select idSpecificAddress from idSpecificAddress where <<name in table>> = SpecificAddress
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'SpecificAddress does not exist';
	END IF;
	IF NOT EXISTS(select idEmail from idEmail where <<name in table>> = Email
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Email does not exist';
	END IF;
	IF NOT EXISTS(select idPhone from idPhone where <<name in table>> = Phone
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Phone does not exist';
	END IF;

	select @idSpecificAddress := idSpecificAddress from idSpecificAddress where <<name in table>> = SpecificAddress;
	select @idEmail := idEmail from idEmail where <<name in table>> = Email;
	select @idPhone := idPhone from idPhone where <<name in table>> = Phone;

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
		@idSpecificAddress,
		@idEmail,
		@idPhone
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
	in `Country` <<type>>
)
BEGIN
	IF NOT EXISTS(select idCountry from idCountry where <<name in table>> = Country
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Country does not exist';
	END IF;

	select @idCountry := idCountry from idCountry where <<name in table>> = Country;

	INSERT INTO SimaplaDb.Province(
		`name`,
		`Country_idCountry`
	)VALUES(
		name,
		@idCountry
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
	in `Person` <<type>>
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;

	INSERT INTO SimaplaDb.Responsible(
		`Person_idPerson`
	)VALUES(
		@idPerson
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
	in `Schedule` <<type>>,
	in `Group` <<type>>
)
BEGIN
	IF NOT EXISTS(select idSchedule from idSchedule where <<name in table>> = Schedule
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Schedule does not exist';
	END IF;
	IF NOT EXISTS(select idGroup from idGroup where <<name in table>> = Group
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Group does not exist';
	END IF;

	select @idSchedule := idSchedule from idSchedule where <<name in table>> = Schedule;
	select @idGroup := idGroup from idGroup where <<name in table>> = Group;

	INSERT INTO SimaplaDb.ScheduleXGroup(
		`Schedule_idSchedule`,
		`Group_idGroup`
	)VALUES(
		@idSchedule,
		@idGroup
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
	in `District` <<type>>
)
BEGIN
	IF NOT EXISTS(select idDistrict from idDistrict where <<name in table>> = District
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'District does not exist';
	END IF;

	select @idDistrict := idDistrict from idDistrict where <<name in table>> = District;

	INSERT INTO SimaplaDb.SpecificAddress(
		`address`,
		`District_idDistrict`
	)VALUES(
		address,
		@idDistrict
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
	in `Person` <<type>>,
	in `isLefty` bit(1),
	in `hasAdequacy` bit(1),
	in `specialCondition` varchar(60),
	in `medication` varchar(60)
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;

	INSERT INTO SimaplaDb.Student(
		`Person_idPerson`,
		`isLefty`,
		`hasAdequacy`,
		`specialCondition`,
		`medication`
	)VALUES(
		@idPerson,
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
-- TeacherInsert
DROP PROCEDURE IF EXISTS SimaplaDb.TeacherInsert;
//
CREATE DEFINER=`root`@`localhost` PROCEDURE `TeacherInsert`(
	in `Person` <<type>>,
	in `InstrumentName` <<type>>
)
BEGIN
	IF NOT EXISTS(select idPerson from idPerson where <<name in table>> = Person
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'Person does not exist';
	END IF;
	IF NOT EXISTS(select idInstrumentName from idInstrumentName where <<name in table>> = InstrumentName
		THEN
			SIGNAL SQLSTATE '45000'
				SET MESSAGE_TEXT = 'InstrumentName does not exist';
	END IF;

	select @idPerson := idPerson from idPerson where <<name in table>> = Person;
	select @idInstrumentName := idInstrumentName from idInstrumentName where <<name in table>> = InstrumentName;

	INSERT INTO SimaplaDb.Teacher(
		`Person_idPerson`,
		`InstrumentName_idInstrumentName`
	)VALUES(
		@idPerson,
		@idInstrumentName
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
