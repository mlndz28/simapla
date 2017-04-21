Create or replace view Instruments as
	-- Created by Marcello Avila
    -- 7-ago-16
    select i.idInstrument as 'idInstrument', n.name, i.serialNumber as 'serialNumber',
		i.price as 'price', i.color as 'color', i.model as 'model', p.name as  'patrimony'
    From
		Instrument i
			inner join InstrumentName n on n.idInstrumentName = i.InstrumentName_idInstrumentName
            inner join Patrimony p on p.idPatrimony = i.Patrimony_idPatrimony
	order by n.name;


Create or replace view Persons as
	-- Created by Marcello Avila
    -- 7-ago-16
	Select p.idPerson, p.name, p.lastname, p.carnet, p.cedula, FLOOR(DATEDIFF (NOW(), p.birthdate)/365) as age,
		e.mail, t.number as 'phone', a.district, DATE_FORMAT(p.dateJoinedProgram, '%dd %MMM %YY') as 'dateJoined'

	from Person p
		inner join Email e on e.idEmail = p.Email_idEmail
		inner join Phone t on t.idPhone = p.Phone_idPhone
		inner join
			(
				Select idSpecificAddress, d.name as 'district'
				from SpecificAddress s inner join District d on d.idDistrict = s.District_idDistrict
			) a on a.idSpecificAddress = p.SpecificAddress_idSpecificAddress
	order by p.lastname;

Create or Replace VIEW Students AS
	-- Created by Marcello Avila
    -- 21-abr-17
    Select
        p.name AS name, p.lastname AS lastname,p.carnet AS carnet, p.cedula AS cedula,
        p.age AS age, p.mail AS mail,
        p.phone AS phone, p.district AS district,
        IF((s.isLefty = 1), 'Si', 'No') AS lefty, IF((s.hasAdequacy = 1), 'Si', 'No') AS adecuacy,
        s.specialCondition AS condition, s.medication AS medication
    FROM
        SimaplaDb.Student s
        JOIN SimaplaDb.Persons p ON s.Person_idPerson = p.idPerson
    ORDER BY p.lastname


Create or replace view Teachers as
	-- Created by Marcello Avila
    -- 7-ago-16
	Select
		p.name, p.lastname, ina.name as 'instrument', p.carnet, p.cedula, p.age, p.mail, p.phone, p.district
	From
		Teacher t
		inner join Persons p on t.Person_idPerson = p.idPerson
		inner join InstrumentName ina on ina.idInstrumentName = t.InstrumentName_idInstrumentName
	order by p.lastname;


	Create or replace view Administrators as
	-- Created by Marcello Avila
    -- 7-ago-16
	Select
		p.name, p.lastname, p.carnet, mp.name as 'position', p.cedula, p.age, p.mail, p.phone, p.district
	From
		Administrator a
		inner join Persons p on a.Person_idPerson = p.idPerson
		inner join ManagementPosition mp on mp.idManagementPosition = a.ManagementPosition_idManagementPosition
	order by p.lastname;


Create or replace view Events as
	-- Created by Marcello Avila
    -- 6-abr-17
	Select
		e.name as Nombre, e.date as Fecha, e.location as Dirección, e.CoordX, e.CoordY, et.name as Tipo
	From
		Event e
        inner join EventType et on et.idEventType = e.EventType_idEventType


Create or replace view Groups as
	-- Created by Marcello Avila
    -- 6-abr-17
	Select
    	g.name as Nombre, g.description as Descripción, gt.name as Tipo, concat(p.name, " ", p.lastname) as Encargado
    From
    	`Group` g
        inner join GroupType gt on gt.idGroupType = g.GroupType_idGroupType
        inner join Person p on g.Person_idPerson = p.idPerson;
