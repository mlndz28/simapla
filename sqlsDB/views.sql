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
				from SpecificAddress s inner join District d on d.name = s.District_idDistrict
			) a on a.idSpecificAddress = p.SpecificAddress_idSpecificAddress
	order by p.lastname;


Create or replace view Students as
	-- Created by Marcello Avila
    -- 7-ago-16
	Select 
		p.name, p.lastname, p.carnet, n.instrument, p.cedula, p.age, p.mail, p.phone, p.district, 
		s.isLefty as 'lefty', s.hasAdequacy as 'adecuacy', s.specialCondition as 'condition', s.medication
	From
		Student s 
		inner join Persons p on s.Person_idPerson = p.idPerson
		inner join 
			(
				Select i.name as 'instrument', Student_Person_idPerson as 'idPerson'
				from Instruments i inner join InstrumentXStudent ixs 
					on ixs.Instrument_idInstrument = i.idInstrument
			) n on n.idPerson = p.idPerson
	order by p.lastname;
        
        
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
    -- 7-ago-16
	Select 
		ety.type, e.name, e.date, e.location, e.CoordX, e.CoordY
	From
		Event e
		inner join (
			Select et.name as 'type', etxe.Event_idEvent as 'idEvent' 
            from EventType et 
				inner join EventTypeXEvent etxe on etxe.EventType_idEventType = et.idEventType
		) ety on e.idEvent = ety.idEvent
	order by ety.type, e.date;
        
        
Create or replace view Groups as
	-- Created by Marcello Avila
    -- 7-ago-16
	Select 
		ty.type, g.name, g.description
	From
		`Group` g
		inner join (
			Select gt.name as 'type', gxgt.Group_idGroup as 'idGroup' 
            from GroupType gt 
				inner join GroupXGroupType gxgt on gxgt.GroupType_idGroupType = gt.idGroupType
		) ty on ty.idGroup = g.idGroup
	order by ty.type;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    