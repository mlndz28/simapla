-- Country
INSERT INTO `SimaplaDb`.`Country`(`idCountry`,`name`)VALUES('1','Costa Rica');

-- Province
INSERT INTO `SimaplaDb`.`Province`(`idProvince`,`name`,`Country_idCountry`)VALUES
('1','San José','1'),
('2','Cartago','1');

-- Canton
INSERT INTO `SimaplaDb`.`Canton`(`idCanton`,`name`,`Province_idProvince`)VALUES
    ('1','Goicoechea','1'),
    ('2','Montes de Oca','1'),
    ('3','La Unión','2'),
    ('4','Cartago','2');

-- District
INSERT INTO `SimaplaDb`.`District`(`idDistrict`,`name`,`Canton_idCanton`)VALUES
    ('1','Mata de Plátano','1'),
    ('2','Purral','1'),
    ('3','Sabanilla','2'),
    ('4','Granadilla','2'),
    ('5','San Diego','3'),
    ('6','Tres Ríos','3'),
    ('7','Taras','4'),
    ('8','Dulce Nombre','4');

-- Specific Address
INSERT INTO `SimaplaDb`.`SpecificAddress`(`idSpecificAddress`,`address`,`District_idDistrict`)VALUES
    ('1','100 Sur del palo de mango por el super de don Pedro.','1'),
    ('2','200 Sur del palo de mango por el super de don Pedro.','1'),
    ('3','300 Sur del palo de mango por el super de don Pedro.','2'),
    ('4','400 Sur del palo de mango por el super de don Pedro.','2'),
    ('5','500 Sur del palo de mango por el super de don Pedro.','3'),
    ('6','600 Sur del palo de mango por el super de don Pedro.','3'),
    ('7','700 Sur del palo de mango por el super de don Pedro.','4'),
    ('8','800 Sur del palo de mango por el super de don Pedro.','4'),
    ('9','900 Sur del palo de mango por el super de don Pedro.','5'),
    ('10','1000 Sur del palo de mango por el super de don Pedro.','5'),
    ('11','1100 Sur del palo de mango por el super de don Pedro.','6'),
    ('12','1200 Sur del palo de mango por el super de don Pedro.','6'),
    ('13','1300 Sur del palo de mango por el super de don Pedro.','7'),
    ('14','1400 Sur del palo de mango por el super de don Pedro.','7'),
    ('15','1500 Sur del palo de mango por el super de don Pedro.','8'),
    ('16','1600 Sur del palo de mango por el super de don Pedro.','8');

-- Email
INSERT INTO `SimaplaDb`.`Email`(`idEmail`,`mail`)VALUES
    ('1','email1@example.com'),
    ('2','email2@example.com'),
    ('3','email3@example.com'),
    ('4','email4@example.com'),
    ('5','email5@example.com'),
    ('6','email6@example.com'),
    ('7','email7@example.com'),
    ('8','email8@example.com'),
    ('9','email9@example.com'),
    ('10','email10@example.com'),
    ('11','email11@example.com'),
    ('12','email12@example.com'),
    ('13','email13@example.com'),
    ('14','email14@example.com'),
    ('15','email15@example.com');

-- Phone
INSERT INTO `SimaplaDb`.`Phone`(`idPhone`,`number`)VALUES
    ('1','8181-1818'),
    ('2','8282-2828'),
    ('3','8383-3838'),
    ('4','8484-4848'),
    ('5','8585-5858'),
    ('6','8686-6868'),
    ('7','8787-7878'),
    ('8','8888-8888'),
    ('9','8989-2929'),
    ('10','8313-3838'),
    ('11','8414-4848'),
    ('12','8515-5858'),
    ('13','8616-6868'),
    ('14','8717-7878'),
    ('15','8818-8888');

-- Patrimony
INSERT INTO `SimaplaDb`.`Patrimony`(`idPatrimony`,`name`)VALUES
    ('1','SINEM General'),
    ('2','Acosimapla'),
    ('3','Propio');

-- Instrument Name
INSERT INTO `SimaplaDb`.`InstrumentName`(`idInstrumentName`,`name`)VALUES
    ('1','Violín'),
    ('2','Violoncello'),
    ('3','Viola'),
    ('4','Contrabajo'),
    ('5','Oboe'),
    ('6','Clarinete'),
    ('7','Flauta traversa'),
    ('8','Trompeta'),
    ('9','Trombón'),
    ('10','Corno Francés');

-- Instrument
INSERT INTO `SimaplaDb`.`Instrument`(`idInstrument`,`serialNumber`,`price`,`color`,`model`,`InstrumentName_idInstrumentName`,`Patrimony_idPatrimony`)VALUES
    ('1','1121314151','1000','Café','someModel','1','1'),
    ('2','1222324252','2000','Café','someModel','2','1'),
    ('3','1323334353','3000','Café','someModel','3','2'),
    ('4','1424344454','4000','Café','someModel','4','1'),
    ('5','1525354555','5000','Plata','someModel','7','3'),
    ('6','1626364656','6000','Negro','someModel','6','2'),
    ('7','1727374757','7000','Negro','someModel','5','2'),
    ('8','1828384858','8000','Bronce','someModel','9','1'),
    ('9','1929394959','9000','Bronce','someModel','10','3'),
    ('10','110210310','10000','Bronce','someModel','8','2'),
    ('11','111211311','11000','Bronce','someModel','8','1');


-- Management Position
INSERT INTO `SimaplaDb`.`ManagementPosition`(`idManagementPosition`,`name`)VALUES
    ('1','Presidente'),
    ('2','Vicepresidente'),
    ('3','Tesorero'),
    ('4','Fiscal'),
    ('5','Vocal');

-- Attendance Type
INSERT INTO `SimaplaDb`.`AttendanceType`(`idAttendanceType`,`name`)VALUES
    ('1','Presente'),
    ('2','Ausente'),
    ('3','Justificado'),
    ('4','Tardía');

-- Event Type
INSERT INTO `SimaplaDb`.`EventType`(`idEventType`,`name`)VALUES
    ('1','Concierto'),
    ('2','Matrícula'),
    ('3','Reunión de Padres'),
    ('4','Exhibición');

-- Event
INSERT INTO `SimaplaDb`.`Event`(`idEvent`,`name`,`date`,`location`,`CoordX`,`CoordY`,`EventType_idEventType`)VALUES
    ('1','Chocolatada','20170213','direccion del evento direccion del evento 1','10.210','9.1232','1'),
    ('2','Omar Dengo','20170312','direccion del evento 2','10.210','9.1232','1'),
    ('3','Santillana','20170411','direccion del evento 3','10.210','9.1232','1'),
    ('4','Semestre I, 2018','20171010','direccion del evento 4','10.210','9.1232','2'),
    ('5','3ra reunión','20171111','direccion del evento 5','10.210','9.1232','3'),
    ('6','1ra reunión','20170125','direccion del evento 6','10.210','9.1232','3'),
    ('7','Municipalidad','20170215','direccion del evento 7','10.210','9.1232','4'),
    ('8','Enamorate de tu ciudad','20170514','direccion del evento 8','10.210','9.1232','4');

-- Person
INSERT INTO `SimaplaDb`.`Person`(`idPerson`,`carnet`,`cedula`,`name`,`lastname`,`birthdate`,`password`,`dateJoinedProgram`,`SpecificAddress_idSpecificAddress`,`Email_idEmail`,`Phone_idPhone`)VALUES
    ('1','mdp16001','1-1965-1234','nombre1','apellido1','19830206','pwd1','20161125','1','7','1'),
    ('2','mdp16002','1-1965-1235','nombre2','apellido2','19820205','pwd2','20161125','2','6','2'),
    ('3','mdp16003','1-1965-1236','nombre3','apellido3','19810204','pwd3','20161125','3','5','3'),
    ('4','mdp17001','1-1965-1237','nombre4','apellido4','19750203','pwd1','20171125','4','4','4'),
    ('5','mdp17002','1-1965-1238','nombre5','apellido5','19980202','pwd2','20171125','5','3','5'),
    ('6','mdp17003','1-1965-1239','nombre6','apellido6','20010504','pwd3','20171125','6','2','6'),
    ('7','mdp17004','1-1965-1230','nombre7','apellido7','20020503','pwd4','20171125','7','1','7'),
    ('8','mdp13001','1-1965-1231','nombre8','apellido8','20030502','pwd1','20131125','8','8','8'),
    ('9','mdp13002','1-1965-1232','nombre9','apellido9','20040501','pwd2','20131125','9','9','9'),
    ('10','mdp13003','1-1965-1233','nombre10','apellido10','20050811','pwd3','20131125','10','10','10'),
    ('11','mdp13004','1-1965-1213','nombre11','apellido11','20060812','pwd4','20131125','11','11','11'),
    ('12','mdp11001','1-1965-1214','nombre12','apellido12','20070813','pwd1','20111125','12','12','12'),
    ('13','mdp11002','1-1965-1215','nombre13','apellido13','20080814','pwd2','20111125','13','13','13'),
    ('14','mdp11003','1-1965-1216','nombre14','apellido14','20090815','pwd3','20111125','14','14','14'),
    ('15','mdp11004','1-1965-1217','nombre15','apellido15','20060816','pwd4','20111125','15','15','15');

-- Teacher
INSERT INTO `SimaplaDb`.`Teacher`(`Person_idPerson`,`InstrumentName_idInstrumentName`)VALUES
    ('1','1'),
    ('2','7');

-- Administrator
INSERT INTO `SimaplaDb`.`Administrator`(`Person_idPerson`,`ManagementPosition_idManagementPosition`)VALUES
    ('3','1');

-- Responsible
INSERT INTO `SimaplaDb`.`Responsible`(`Person_idPerson`)VALUES
    ('4');

-- Student
INSERT INTO `SimaplaDb`.`Student`(`Person_idPerson`,`isLefty`,`hasAdequacy`,`specialCondition`,`medication`)VALUES
    ('5',1,0,'Condición especial 5','Medicación 5'),
    ('6',1,0,'Condición especial 6','Medicación 6'),
    ('7',0,1,'Condición especial 7','Medicación 7'),
    ('8',1,1,'Condición especial 8','Medicación 8'),
    ('9',1,0,'Condición especial 9','Medicación 9'),
    ('10',0,1,'Condición especial 10','Medicación 10'),
    ('11',0,0,'Condición especial 11','Medicación 11'),
    ('12',0,0,'Condición especial 12','Medicación 12'),
    ('13',1,1,'Condición especial 13','Medicación 13'),
    ('14',0,0,'Condición especial 14','Medicación 14'),
    ('15',0,1,'Condición especial 15','Medicación 15');

-- Role
INSERT INTO `SimaplaDb`.`Role`(`idRole`,`name`)VALUES
    (1,'Student'),
    (2,'Administrator'),
    (3,'Teacher'),
    (4,'Responsible');


-- PersonXRole
INSERT INTO `SimaplaDb`.`PersonXRole`(`Person_idPerson`,`Role_idRole`)VALUES
    ('1',3),
    ('2',3),
    ('3',2),
    ('4',4),
    ('5',1),
    ('6',1),
    ('7',1),
    ('8',1),
    ('9',1),
    ('10',1),
    ('11',1),
    ('12',1),
    ('13',1),
    ('14',1),
    ('15',1);


-- InstrumentXStudent
INSERT INTO `SimaplaDb`.`InstrumentXStudent`(`Instrument_idInstrument`,`Student_Person_idPerson`)VALUES
    ('1','5'),
    ('2','6'),
    ('3','7'),
    ('4','8'),
    ('5','9'),
    ('6','10'),
    ('7','11'),
    ('8','12'),
    ('9','13'),
    ('10','14'),
    ('11','15');

-- Group Type
INSERT INTO `SimaplaDb`.`GroupType`(`idGroupType`,`name`)VALUES
    ('1','Orquesta'),
    ('2','Camerata'),
    ('3','Junta'),
    ('4','Solfeo'),
    ('5','Banda');

-- Group
INSERT INTO `SimaplaDb`.`Group`(`idGroup`,`name`,`description`,`GroupType_idGroupType`,`Person_idPerson`)VALUES
    ('1','Pilar Jiménez','Orquesta completa del sinem de mata de plátano','1','1'),
    ('2','La Libertad','Conjunto de cuerdas con música de cámara','2','1'),
    ('3','Banda','Agrupación de bronces y maderas','5','2'),
    ('4','Solfeo1','Curso de solfeo','4','2'),
    ('5','Solfeo2','Curso de solfeo','4','2'),
    ('6','Solfeo3','Curso de solfeo','4','1'),
    ('7','Acosimapla','Asociacion de padres del sinem de mata de plátano','3','3');

-- GroupXPerson
INSERT INTO `SimaplaDb`.`GroupXPerson`(`Group_idGroup`,`Person_idPerson`)VALUES
    ('1','4'),
    ('1','5'),
    ('1','6'),
    ('1','9'),
    ('1','10'),
    ('2','4'),
    ('2','5'),
    ('2','6'),
    ('2','7'),
    ('3','8'),
    ('3','9'),
    ('3','10'),
    ('3','7'),
    ('4','8'),
    ('5','7'),
    ('5','9'),
    ('5','10'),
    ('6','4'),
    ('6','5'),
    ('7','3');

-- GroupXEvent
INSERT INTO `SimaplaDb`.`GroupXEvent`(`Group_idGroup`,`Event_idEvent`)VALUES
    ('1','1'),
    ('2','1'),
    ('1','2'),
    ('2','2'),
    ('3','2'),
    ('1','3'),
    ('1','4'),
    ('2','4'),
    ('3','4'),
    ('7','4'),
    ('7','5'),
    ('7','6'),
    ('2','7'),
    ('2','8'),
    ('3','8');
