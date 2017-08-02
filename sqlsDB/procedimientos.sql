DCREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in c varchar(12))
BEGIN
	select * from Students s where s.cedula = c limit 1;
END

Delimiter \\

CREATE DEFINER=`root`@`localhost` PROCEDURE `login`(in pCedula varchar(12))
BEGIN
	select * from Persons p where cedula = pCedula;
END

Delimiter &&

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerStudent`(
	in `pcarnet` varchar(10),
	in `pcedula` varchar(12),
	in `pname` varchar(20),
	in `plastname` varchar(20),
	in `pbirthdate` date ,
	in `ppassword` varchar(45),
	in `pdateJoinedProgram` date,
	in `pSpecificAddress` varchar(80),
	in `pEmail` varchar(255),
	in `pPhone` varchar(12),
    in `pIdDistrict` int(11),
    in `pIsLefty` bit,
    in `pHasAdequacy` bit,
    in `pSpecialCondition` varchar(60),
    in `pMedication` varchar(60)
)
BEGIN
	INSERT INTO `SimaplaDb`.`Phone`(`number`)VALUES(pPhone);
    select @pho := idPhone from Phone where number = pPhone;

	INSERT INTO `SimaplaDb`.`Email`(`mail`)VALUES(pEmail);
    select @mai := idEmail from Email where mail = pEmail;

	INSERT INTO `SimaplaDb`.`SpecificAddress`(`address`, `District_idDistrict`)VALUES(pSpecificAddress, pIdDistrict);
    select @addr := idSpecificAddress from SpecificAddress where address = pSpecificAddress;

    INSERT INTO `SimaplaDb`.`Person`(`carnet`,`cedula`,`name`,`lastname`,`birthdate`,`password`,`dateJoinedProgram`,`SpecificAddress_idSpecificAddress`,`Email_idEmail`,`Phone_idPhone`)
	VALUES(pCarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,@addr,@mai,@pho);
    select @idPer := idPerson from Person where carnet = pCarnet and Email_idEmail = @mai;

    INSERT INTO `SimaplaDb`.`Student`(`Person_idPerson`,`isLefty`,`hasAdequacy`,`specialCondition`,`medication`)
	VALUES(@idPer,pIsLefty, pHasAdequacy,pSpecialCondition,pMedication);
END

Delimiter \\

CREATE DEFINER=`root`@`localhost` PROCEDURE `registerAdministrator`(
	in `pcarnet` varchar(10),
	in `pcedula` varchar(12),
	in `pname` varchar(20),
	in `plastname` varchar(20),
	in `pbirthdate` date ,
	in `ppassword` varchar(45),
	in `pdateJoinedProgram` date,
	in `pSpecificAddress` varchar(80),
	in `pEmail` varchar(255),
	in `pPhone` varchar(12),
    in `pIdDistrict` int(11),
    in `pIdManagementPosition` int(11)
)
BEGIN
	INSERT INTO `SimaplaDb`.`Phone`(`number`)VALUES(pPhone);
    select @pho := idPhone from Phone where number = pPhone;

	INSERT INTO `SimaplaDb`.`Email`(`mail`)VALUES(pEmail);
    select @mai := idEmail from Email where mail = pEmail;

	INSERT INTO `SimaplaDb`.`SpecificAddress`(`address`, `District_idDistrict`)VALUES(pSpecificAddress, pIdDistrict);
    select @addr := idSpecificAddress from SpecificAddress where address = pSpecificAddress;

    INSERT INTO `SimaplaDb`.`Person`(`carnet`,`cedula`,`name`,`lastname`,`birthdate`,`password`,`dateJoinedProgram`,`SpecificAddress_idSpecificAddress`,`Email_idEmail`,`Phone_idPhone`)
	VALUES(pCarnet,pcedula,pname,plastname,pbirthdate,ppassword,pdateJoinedProgram,@addr,@mai,@pho);
    select @idPer := idPerson from Person where carnet = pCarnet and Email_idEmail = @mai;

    INSERT INTO `SimaplaDb`.`Administrator`(`Person_idPerson`,`ManagementPosition_idManagementPosition`)
	VALUES(@idPer,pIdManagementPosition);
END

Delimiter &&


CREATE DEFINER=`root`@`localhost` PROCEDURE `createGroup`(
	in `pName` varchar(45),
    in `description` varchar(100),
    in `pGroupType` int(11),
    in `pIdEncargado` int (11)
)
BEGIN
INSERT INTO `SimaplaDb`.`Group`(`name`,`description`,`GroupType_idGroupType`,`Person_idPerson`)
VALUES(pName, pDescription, pGroupType, pIdEncargado);

END

Delimiter \\

CREATE DEFINER=`root`@`localhost` PROCEDURE `createEvent`(
	in `pName` varchar(45),
	in `pDate` date,
	in `pLocation` varchar(99),
	in `pCoordX` decimal(11,7),
	in `pCoordY` decimal(11,7),
	in `pEventType_idEventType` int(11)
)
BEGIN
	INSERT INTO `SimaplaDb`.`Event`(`name`,`date`,`location`,`CoordX`,`CoordY`,`EventType_idEventType`)
	VALUES(pName, pDate, pLocation,pCoordX,pCoordY,pEventType_idEventType);

END
