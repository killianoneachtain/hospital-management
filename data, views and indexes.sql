-- -----------------------------------------------------
-- Populate table Ward
-- -----------------------------------------------------

insert into Ward values
('A01003', 'Yeats', 'Accident and Emergency');
insert into Ward values
('A02004', 'Clarke', 'General Surgical');
insert into Ward values
('A02012', 'Kavanagh', 'Oncology Day Ward');
insert into Ward values
('B01003', 'Suir', 'Day Patients 1');
insert into Ward values
('B01013', 'Nore', 'Children\'s Ward 1');
insert into Ward values
('B02011', 'Barrow', 'Intensive Care Unit');
insert into Ward values
('B02015', 'Liffey', 'Children\'s Ward 2');
insert into Ward values
('C02002', 'Dondi', 'Maternity');
insert into Ward values
('C02008', 'Goldie', 'Ear, Nose and Throat');
insert into Ward values
('C02012', 'Banksy', 'Patient Recovery 1');

-- -----------------------------------------------------
-- Populate table WardCapacity
-- -----------------------------------------------------

insert into WardCapacity values
('A01003', '6','0');
insert into WardCapacity values
('A02004', '8','0');
insert into WardCapacity values
('A02012', '6','0');
insert into WardCapacity values
('B01003', '8','0');
insert into WardCapacity values
('B01013', '6','0');
insert into WardCapacity values
('B02011', '6','0');
insert into WardCapacity values
('B02015', '6','0');
insert into WardCapacity values
('C02002', '6','0');
insert into WardCapacity values
('C02008', '6','0');
insert into WardCapacity values
('C02012', '8','0');


-- -----------------------------------------------------
-- Populate table Gender
-- -----------------------------------------------------

INSERT Gender values
('M','Male'),
('F','Female');


-- -----------------------------------------------------
-- Populate table Admissions
-- -----------------------------------------------------

INSERT INTO Admissions(patientID,arriveDate,dischargeDate,bedNumber) VALUES
	('500','2018-10-01','2018-10-04','2014007'),
	('502','2019-02-07','2019-03-01','2014034'),
	('502','2019-04-20','2019-04-21','2014025'),
    ('505','2019-05-08','2019-05-12','2014004'),
	('506','2019-05-12','2019-05-12','2014018'),
	('507','2019-05-12','2019-05-12','2014004'),
	('508','2019-05-12','2019-05-12','2014038'),
	('509','2019-06-02','2019-06-13','2014007'),
	('510','2019-06-02','2019-06-16','2014019'),
	('511','2019-06-02','2019-06-12','2014023'),
	('512','2019-06-05','2019-07-12','2014028'),
    ('524','2018-01-05','2018-01-13','2014046'),
	('513','2019-06-05','2019-07-05','2014045'),
	('514','2019-06-07','2019-06-07','2014044'),
	('515','2019-06-12','2019-06-13','2014064'),
	('516','2019-07-05','2019-07-12','2014061'),
    ('518','2016-10-12','2016-10-13','2014063'),
	('517','2019-07-06','2019-07-12','2014012'),
	('518','2019-07-07','2019-07-12','2014001'),
	('519','2019-07-10','2019-07-12','2014007'),
	('523','2019-08-07','2019-08-12','2014024'),
	('524','2019-08-06','2019-08-13','2014095'),
	('525','2019-08-08','2019-08-12','2014015'),
	('526','2019-08-09','2019-08-12','2014036'),
	('527','2019-08-10','2019-08-12','2014033'),
	('528','2019-08-11','2019-08-12','2014032'),
	('529','2019-08-07','2019-08-12','2014051'),
	('529','2019-08-01','2019-08-12','2014015'),   
	('530', '2019-10-12', NULL,NULL),
	('531', '2019-10-14', NULL,NULL),
	('532', '2019-09-12', '2019-09-12','2014045'),
	('532', '2019-09-12', '2019-09-12','2014058'),
	('533', '2019-10-14', NULL,NULL),
	('534', '2018-12-12', '2018-12-23','2014062'),
	('535', '2019-06-24', '2019-06-27','2014066'),
	('536', '2019-10-16', NULL,NULL),
	('537', '2019-10-14', NULL,NULL),
	('542', '2019-10-13', NULL,NULL),
	('545', '2019-10-08', NULL,NULL),
	('547', '2019-10-08', NULL,NULL),
	('548', '2019-10-01', NULL,NULL),
	('549', '2019-10-01', NULL,NULL),
	('550', '2019-10-02', NULL,NULL),
	('551', '2019-10-03', NULL,NULL),
	('553', '2019-10-05', NULL,NULL),
	('554', '2019-10-06', NULL,NULL),
	('556', '2019-10-11', NULL,NULL),
	('557', '2019-10-12', NULL,NULL),
    ('559', '2019-11-01', NULL,NULL),
	('560', '2019-10-15', NULL,NULL),
	('561', '2019-10-15', NULL,NULL),
	('562', '2019-10-13', NULL,NULL),
	('563', '2019-10-14', '2019-10-15','2014010'),
	('564', '2019-10-15', NULL,NULL),
	('565', '2019-10-16', NULL,NULL),
	('566', '2019-10-16', NULL,NULL),
	('567', '2019-10-16', NULL,NULL),
	('568', '2019-10-16', NULL,NULL),
	('569', '2019-10-16', NULL,NULL),
	('570', '2019-10-16', NULL,NULL),
    ('581', '2019-10-19', NULL,NULL),
	('583', '2019-10-21', NULL,NULL),    
	('571', '2019-10-16', NULL,NULL);


-- -----------------------------------------------------
-- Populate table Patient
-- -----------------------------------------------------

INSERT INTO Patient (fName,lName, DOB, sex, street,town,county,contactNo) VALUES 
(NULL,NULL, '1978-04-20', 'M', '21 Main Street', 'Castlecomer', 'Kilkenny', '051354126'),
('Ronan', 'Murphy','1981-05-21','M', '15A Barrack Street', 'Clonmel', 'Tipperary', '0839461237'),
('James', 'O\'Rourke','1958-11-03','M', '66 Clarinwood', 'Tramore', 'Waterford', '0831092748'),
('David', 'Kennedy','1967-06-13','M', '10 BridgeStreet', 'Bennetsbridge', 'Kilkenny', '053694721'),
('Trevor', 'Croke','1952-10-03','M', '3 Limerick Road', 'Bansha', 'Tipperary', '0839542187'),
('Nicola', 'Hough','1948-06-03', 'F', '1 Railway View', 'Freshford', 'Kilkenny', '053269514'),
('Olivia', 'Musgrave','1994-12-25','F', '43 Riverwalk', 'Old Ross', 'Wexford', '0879188577'),
('Sinead', 'Piper','1982-02-15','F', '12 Suirway Drive', 'Mooncoin', 'Kilkenny', ''),
('Ciara', 'McCormack','1947-03-30','F', '1 Tannery Row', 'Portlaw', 'Waterford', '0862200344'),
('Eve', 'Leahy','1978-04-16', 'F','15 Meadow Lane', 'Loughmore', 'Tipperary', '057841576'),
('Aideen', 'Lynch','1990-06-08','F', '87 Greengrass Street', 'Fethard', 'Wexford', '0869448100'),
('Catherine', 'Malarkey','1976-04-20','F', '156C Glendale Street', 'New Ross', 'Wexford', '052987412'),
('Marguerite', 'Kiely','1978-04-24', 'F','15 Refinery Row', 'Fiddown', 'Kilkenny', '0513841256'),
('Claire', 'Jones','1964-10-18', 'F','8 Main Street', 'Ballyhale', 'Kilkenny', '0849568596'),
('Jane', 'Horgan','1964-05-02', 'F','9 Quayside', 'Ballyhack', 'Wexford', ''),
('Ross', 'Geraghty','1955-07-29','M', '49 Upper Bridge Street', 'Bouladuff', 'Tipperary', '0873225104'),
('Daniel', 'Migchels','1955-11-05','M', '15 Common Street', 'New ross', 'Wexford', '051952368'),
('Martin', 'Scorsese','1985-11-05','M', '1 Beach Street', 'Bunmahon', 'Waterford', '051386379'),
('Aidan', 'Harrington','1982-06-13','M', '58 Riviera Lane', 'Donohill', 'Tipperary', '0861008425'),
('Colin', 'Bartley','1983-06-24','M', '27D Summer Hill', 'Tramore', 'Waterford', '051390338'),
('Sean', 'O\'Brien','1982-08-30','M', '15A Queens Street', 'Ferrybank', 'Kilkenny', '051359698'),
('Dennis', 'O\'Sullivan','1971-01-02','M', 'Suirview Cottage', 'Woodstown', 'Waterford', '051842569'),
('Alan', 'Moore','1975-06-20','M', 'Old School House', 'Inistioge', 'Kilkenny', '0873596004'),
('Fred', 'Stacey','1995-06-08','M', ' 32 Rotunda Lane', 'Dunmore East', 'Waterford', '051370845'),
('Gregory', 'Taylor','1998-06-08','M', '150 Fr. Senan Street', 'Portroe', 'Tipperary', ''),
('Rasputin', 'McKenna','2005-06-08','M', 'Red Square Villa', 'Woodstown', 'Waterford', '051328900'),
('John', 'Walsh','2007-06-08','M', '254 Viewmount Court', 'Ballinakill', 'Waterford', '051389547'),
('Aoife', 'Power','2009-03-18', 'F', '14 Suir Lane', 'Slieverue', 'Kilkenny', '0861480750'),
('Evelyn', 'Welsh','2002-07-21','F', '78 Main Street', 'Piltown', 'Kilkenny', '0859300845'),
('Aine', 'Crowley','1998-08-23','F', '35 Comeragh View', 'Fiddown', 'Kilkenny', '0869418007'),
('John', 'Smith','1996-08-01','M', 'The Deelings', 'Dunhill', 'Waterford', '051389421'),
('Mike', 'Smith','1993-06-02','M', '143 Main Street', 'Carrick-On-Suir', 'Tipperary', '051376521'),
('Robyn', 'Jones','1985-06-29', 'F','7 Nore Avenue', 'Ballyhack', 'Wexford', '0841589634'),
('Frank', 'Walsh','1986-06-08','M', '356 Moonlight Crescent', 'Carrick-On-Suir', 'Tipperary', '051946851'),
('Isabele', 'McGrath','1975-06-08','F', '10 Carrigeen', 'Ballycotton', 'Cork', '021845269'),
('Gemma', 'Nesdale','1979-06-08','F', 'Orchard Road', 'Cork City', 'Cork', '0861487564'),
('Caitriona', 'Murphy','2005-06-08','F', 'Farran', 'Dunhill', 'Waterford', '051478569'),
('Imelda', 'O\'Sullivan','1995-01-08','F', '34 Cliff Road', 'Tramore', 'Waterford', '0836842526'),
('Niall', 'Cowman','1997-01-01','M', '2 Lower Road', 'Callan', 'Kilkenny', '0859571684'),
('John', 'O\'Brien','1985-10-12','M', '45 Bay View', 'Tramore', 'Waterford', '0879431586'),
('Sinead', 'O\'Rourke','1982-12-25', 'F','132 Viewmount Court', 'Ardkeen', 'Waterford', '051945876'),
('Liam', 'Reed','1985-04-12','M', '68 Cherrymount Road', 'Ballygunner', 'Waterford', '0879458216'),
('Tom', 'Dunphy','1968-07-30','M', 'Sunside House', 'Kilkenny', 'Kilkenny', ''),
('Derek', 'Weir','1965-12-11','M', 'Parochial House', 'Craggy Island', 'Wexford',''),
('Eimear', 'O\'Byrne','2004-10-12','F', '45 Church Road', 'Annestown', 'Waterford', '0862487512'),
('Aura', 'Matthey','2001-01-30','F', '143 Lower Branch Road', 'Ballybeg', 'Waterford', '051266548'),
('Trish', 'O\'Connell','1999-06-25','F', '165B Bishops Row', 'Waterford', 'Waterford', ''),
('Sile', 'Daly','1968-03-05','F', '59 Comeragh View', 'Carrick-On-Suir', 'Tipperary', ''),
('Mary', 'McCormack','1978-02-24','F', 'Traylock House', 'Dunmore East', 'Waterford', '051384657'),
('Peadar', 'Mulligan','1994-03-25','M', '47 Cliff Road', 'Tramore', 'Waterford', '0861085402'),
('Seamus', 'Harkin','1993-08-24','M', '12 Slieve Na Mban Road', 'Mooncoin', 'Kilkenny', '0832485606'),
('Sean', 'Eade','1992-03-18','M', 'The Maltings', 'Kilbarry', 'Waterford', '051374851'),
('Emma', 'Mulligan','1972-07-08', 'F','127 Ocean Boulevarde', 'Dunmore East', 'Waterford', '0875072030'),
('Lucas', 'Chan','1965-06-08','M', 'Rocky Road House', 'Portlaw', 'Waterford', '051384127'),
('Eugene', 'Palmer','2005-06-08','M', 'Quebec View', 'Ballinattin', 'Waterford', '0849512332'),
('Grainne', 'O\'Toole','2009-10-08','F', '12 Priest Road', 'Tramore', 'Waterford', '051347589'),
('Conor', 'Brady','2007-11-21','M', '432 Ursuline Court', 'Waterford', 'Waterford', ''),
('Helena', 'Allen','2001-02-18','F', '32 Ballybeg Rise', 'Ballybeg', 'Waterford', '051369852'),
('Richard', 'Young','2004-05-16','M', '12 Lismore Park', 'Ballinakill', 'Waterford', '0821471047'),
('Nicole', 'Appleton','1994-12-31','F', '87 Roselawn', 'Tramore', 'Waterford', '051384125'),
('Lara', 'Croft','1989-11-12','F', '43 The Folley', 'Waterford', 'Waterford', '0896587412'),
('Kate', 'Moss','1971-03-20', 'F','66 Johns Hill', 'Waterford', 'Waterford', '0864104107'),
('Laura', 'Doherty','1962-09-11','F', '12 Main Street', 'Fiddown', 'Kilkenny', '0835984174'),
('Dwayne', 'Walsh','1958-01-08','M', '12 Suirview', 'Ferrybank', 'Wexford', ''),
('Fred', 'Perry','1984-08-12','M', '38 The Crescent', 'Slieverue', 'Wexford', '0839008420'),
('Daniel', 'Power','1982-03-14','M', '12 Brewer Street', 'Klkenny', 'Kilkenny', '0831230123'),
('Joan', 'D\'Arc','1957-11-11','F', '101 The Quay', 'Waterford', 'Waterford', '051386295'),
('Mary', 'Mulrooney','1995-06-08','F', '6 Smithwick Row', 'Kilkenny', 'Kilkenny', ''),
('Anne', 'Healy','2004-10-30','F', 'Old Farm Manor', 'Mooncoin', 'Kilkenny', '0826396369'),
('Julia', 'Enright','2008-05-12','F', '46 Opera Lane', 'New Ross', 'Wexford', '0815410355'),
('Stanley', 'Ugubu','2002-11-29','M', '10 The Hill', 'Dunmore East', 'Waterford', '051386477'),
('David', 'Chan','2009-12-13','M', '15 Dunhill Lawn', 'Lismore Park', 'Waterford', '0833200236'),
('Sheila', 'Walsh','2010-03-07','F', '15 Swan Apartments', 'The Glen', 'Waterford', ''),
('Cormac', 'O\'Hanlon','1954-08-30','M', '8 Bird Lane', 'Old Ross', 'Wexford', ''),
('Eilish', 'Desterville','1962-06-08','F', '12 Bridge Street', 'Carrick-On-Suir', 'Tipperary', '051456285'),
('Daryl', 'Kenna','1930-04-12','M', 'Cuman na Oir', 'Ballyhale', 'Kilkenny', ''),
('Deirdre', 'Ryan','2008-01-11', 'F','8 Market Street', 'Tramore', 'Waterford', '051385266'),
('Bartholemew', 'O\'Sullivan','1983-11-17', 'M','12 Alphonsus Road', 'Waterford', 'Waterford', '0879008478'),
('Colm', 'Walsh','1997-06-12','M', 'The Hedgerow', 'Woodstown', 'Waterford', '051321123'),
('Finola', 'Pollard','1984-06-08', 'F','57 Suirway Lawn', 'Ferrybank', 'Wexford', '0832102477'),
('Frances', 'McCann','2012-08-25','F', '35 D\'Olier Street', 'Waterford', 'Waterford', '0863266320'),
('Gemma', 'Hoban','2014-06-04', 'F','6 Bunkers Hill', 'Waterford', 'Waterford', '051987879'),
('Aoife', 'Murphy','2015-05-09','F', 'Grange Villa', 'Slieverue', 'Wexford', ''),
('Dolores', 'Hewson','2018-10-13','F', 'The Castle', 'Kilsheelan', 'Tipperary', '0829556688'),
('Matthew', 'Agostino','2017-11-13','M', '154 Viewmount Court', 'Ardkeen', 'Waterford', '0864779028');


-- -----------------------------------------------------
-- Populate table Bed Type
-- -----------------------------------------------------

insert into BedType values
('001', 'Gatch Bed', '3219.23'),
('002', 'Electric Bed', '5198.25'),
('003', 'Low Bed', '2415.89'),
('004', 'Air Loss Mattress', '6845.19'),
('005', 'Circo-Electric Bed', '12584.99'),
('006', 'Clinitron Bed', '10978.99'),
('007', 'Air Fluidized Bed', '15698.58'),
('08', 'Trolley', '1862.29');
 
 
-- -----------------------------------------------------
-- Populate table Bed
-- bedNumber, bedType, wardID, patientID
-- -----------------------------------------------------

# patientID, fName, lName, DOB, sex, street, town, county, contactNo

insert into Bed(bedNumber, bedType, wardID, patientID) values
('2014001','007', 'A01003', '530'),
('2014001','007', 'A01003', '502'),
('2014002','003', 'A01003', '542'),
('2014003','002', 'A01003', '531'),
('2014004','001', 'A01003', '533'),
('2014005','001', 'A01003', NULL),
('2014006','001', 'A01003', '564'),
('2014007','001', 'A02004', NULL),
('2014008','001', 'A02004', '537'),
('2014009','001', 'A02004', NULL),
('2014010','003', 'A02004', '547'),
('2014011','004', 'A02004', '548'),
('2014012','005', 'A02004', NULL),
('2014013','006', 'A02004', '550'),
('2014014','006', 'A02004', '551'),
('2014015','006', 'A02012', '553'),
('2014016','006', 'A02012', NULL),
('2014017','006', 'A02012', NULL),
('2014018','006', 'A02012', '565'),
('2014019','006', 'A02012', NULL),
('2014020','006', 'A02012', '560'),
('2014021','002', 'B01003', '561'),
('2014022','002', 'B01003', '562'),
('2014023','002', 'B01003', NULL),
('2014024','002', 'B01003', NULL),
('2014025','002', 'B01003', NULL),
('2014026','002', 'B01003', '566'),
('2014027','002', 'B01003', '567'),
('2014028','002', 'B01003', NULL),
('2014029','004', 'B01013', NULL),
('2014030','004', 'B01013', NULL),
('2014031','004', 'B01013', NULL),
('2014032','004', 'B01013', NULL),
('2014033','004', 'B01013', '568'),
('2014034','004', 'B01013', NULL),
('2014035','006', 'B02011', NULL),
('2014036','007', 'B02011', NULL),
('2014037','006', 'B02011', '554'),
('2014038','006', 'B02011', NULL),
('2014039','006', 'B02011', NULL),
('2014040','006', 'B02011', NULL),
('2014041','002', 'B02015', NULL),
('2014042','002', 'B02015', '556'),
('2014043','002', 'B02015', NULL),
('2014044','002', 'B02015', '581'),
('2014045','002', 'B02015', '583'),
('2014046','002', 'B02015', NULL),
('2014047','003', 'C02002', '557'),
('2014048','003', 'C02002', NULL),
('2014049','003', 'C02002', '545'),
('2014050','003', 'C02002', '536'),
('2014051','003', 'C02002', '559'),
('2014052','002', 'C02008', NULL),
('2014053','002', 'C02008', NULL),
('2014054','002', 'C02008', '549'),
('2014055','002', 'C02008', NULL),
('2014056','001', 'C02012', NULL),
('2014057','001', 'C02012', NULL),
('2014058','001', 'C02012', NULL),
('2014059','001', 'C02012', NULL),
('2014060','001', 'C02012', NULL),
('2014061','001', 'C02012', '569'),
('2014062','001', 'C02012', '570'),
('2014063','001', 'C02012', '571'),
('2014064','001', null, NULL),
('2014065','001', NULL, NULL),
('2014066','003', 'C02002', NULL),
('2014067','003', NULL, NULL),
('2014068','001', NULL, NULL),
('2014069','002', 'C02008', NULL),
('2014070','002', 'C02008', NULL),
('2014071','008', NULL, NULL),
('2014072','008', NULL, NULL),
('2014073','008', NULL, NULL),
('2014074','008', NULL, NULL),
('2014075','008', NULL, NULL),
('2014076','008', NULL, NULL),
('2014077','008', NULL, NULL),
('2014078','008', NULL, NULL),
('2014079','003', NULL, NULL);

-- -----------------------------------------------------
-- Populate table Doctor
-- -----------------------------------------------------

insert into Doctor values
('7274718RA', 'Killian', 'O\'Neachtain', '66 Glenside', 'Tramore', 'Waterford', '0879054125', '2016-10-07', 'Gynaecology'),
('5736498XE', 'Michael', 'Turner', 'Freedom Cottage', 'Ballinakill', 'Waterford', '0876855412', '2013-12-17', 'Pulmonology'),
('7953284FZ', 'James', 'Hogan', 'Snow Pines', 'Dunhill', 'Waterford', '0862465102', '2004-06-01', 'Dermatology'),
('3846512NG', 'Anthea', 'Duggan', '6 Quayside View', 'Dunmore East', 'Waterford', '0839241875', '2013-04-27', 'Paediatrics'),
('2841568FB', 'Apu', 'Zhagar', '37 Church Road', 'Tramore', 'Waterford', '051863942', '2018-03-15', 'General Practioner'),
('6833454ZQ', 'Monty', 'Burns', '12 Railway Esplanade', 'Mooncoin', 'Kilkenny', '0835006986', '2013-12-25', 'Psychiatry'),
('4682195CR', 'Sinbad', 'D\'Sayler', '14 Starboard Street', 'Portferry', 'Cork', '0871002745', '2008-06-03', 'Oncology'),
('6842578FT', 'Ali', 'Baba', '16 Old Rectory Road', 'Slieverue', 'Wexford', '0879063212', '2006-06-06', 'Paediatrics'),
('1472584KI', 'Etta', 'Synge', 'The Graveyard', 'Woodstown', 'Waterford', '051369151', '1996-07-25', 'General Practioner'),
('2053841HT', 'Edward', 'Livingston', 'Cliff House', 'Annestown', 'Waterford', '051382103', '2001-01-01', 'Oncology'),
('4105206GD', 'Julia', 'McGrath-Smith', '120 Viewmount', 'Ardkeen', 'Waterford', '0873960909', '2017-06-07', 'General Practioner'),
('5087412SX', 'Jacqueline', 'Moran', '10 Golf Drive', 'Ferrybank', 'Kilkenny', '0869494875', '2015-11-23', 'Rheumatology'),
('8056321VF', 'Amelie', 'Derueplaintain', 'Augusta House', 'Ballinakill', 'Waterford', '051395693', '2017-10-20', 'Podiatry'),
('5421368BR', 'Isobel', 'O\'Neachtain', 'Three Sister Cottage', 'Cheek Point', 'Waterford', '051378459', '2013-04-01', 'Orthopaedics'),
('5412045SW', 'Sinead', 'Mulligan', 'Greystoke', 'Ballindud', 'Waterford', '0874184310', '2019-10-07', 'General Practioner');
-- -----------------------------------------------------
-- Populate table Drug
-- -----------------------------------------------------

insert INTO Drug (drugName, manufacturer) VALUES
('Oxyconfolin', 'Bayer'),
('Prozac' ,'GSK'),
('Codenanol', 'Sanofi'),
('Vicodin', 'Novartis'),
('Simvastatin', 'Bayer'),
('Lisinopril', 'Pfizer'),
('Levothyroxine', 'Merck'),
('Azithromycin', 'Bayer'),
('Metformin', 'Novartis'),
('Lipitor', 'Sanofi'),
('Amlodipine', 'Hoffman-La Roche'),
('Amoxicillin', 'AbbVie'),
('Hydrochlorothiazide', 'Sanofi');


-- -----------------------------------------------------
-- Populate table Visit
-- -----------------------------------------------------
insert into Visit (patientID, PPS, date, time) values
('500','2841568FB', '2018-10-01','09:00'),
('501','6833454ZQ', '2019-10-01','09:00'),
('502','2053841HT', '2019-04-20','09:30'),
('543','4682195CR', '2019-10-01','09:45'),
('547','2841568FB', '2019-10-09','10:15'),
('572','6842578FT', '2019-10-01','10:45'),
('506','7274718RA', '2019-10-05','11:15'),
('512','4682195CR', '2019-10-01','11:30'),
('532','7274718RA', '2019-10-01','11:45'),
('523','2053841HT', '2019-10-01','12:30'),
('543','8056321VF', '2019-10-12','13:45'),
('563','2053841HT', '2019-10-02','15:00'),
('561','7274718RA', '2019-10-15','11:00'),
('552','2053841HT', '2019-10-02','09:15'),
('546','5421368BR', '2019-10-02','10:15'),
('521','6833454ZQ', '2019-10-02','10:30'),
('583','3846512NG', '2019-09-02','11:15'),
('567','8056321VF', '2019-10-17','11:45'),
('576','5412045SW', '2019-10-02','10:45'),
('532','6833454ZQ', '2019-10-03','09:30'),
('506','5421368BR', '2019-10-02','12:30'),
('565','6833454ZQ', '2019-10-17','15:15'),
('537','1472584KI', '2019-10-15','11:00'),
('565','7953284FZ', '2019-10-02','10:00'),
('506','7274718RA', '2019-11-29','09:15'),
('561','8056321VF', '2019-11-29','10:15'),
('532','5421368BR', '2019-11-29','12:15');

-- -----------------------------------------------------
-- Populate table Prescription
-- -----------------------------------------------------

insert into Prescription values
('1000', '100000', 'Take two, twice daily with food, for four days'),
('1003', '100002', 'Take one in morning, and one before bed, for seven days.'),
('1006', '100005', 'Take one every four hours, for three days.'),
('1002', '100006', 'Take one each day, with food, for five days.'),
('1004', '100007', 'Take two every twelve hours, for seven days.'),
('1005', '100008', 'Take three each day with meals, for four days.'),
('1001', '100002', 'Take one every eight hours, for two days.'),
('1009', '100003', 'Take two each day before sleep, for fourteen days.'),
('1007', '100007', 'Take four every ten hours, for six days.'),
('1010', '100009', 'Take one with each meal, for four days.'),
('1011', '100010', 'Take two every four hours, for two days.'),
('1012', '100010', 'Take one every eight hours, for four days.'),
('1015', '100001', 'Take three each morning, for seven days.'),
('1013', '100003', 'Take one each morning with food, for twenty-one days.'),
('1016', '100007', 'Take one each day before sleep, for nine days.'),
('1014', '100006', 'Take one every six hours, for two days.'),
('1017', '100006', 'Take one each morning, for ten days.'),
('1019', '100009', 'Take one every eight hours, for ten days.'),
('1021', '100001', 'Take one each night before sleep, for sixty days.'),
('1020', '100005', 'Take three every twelve hours, for six days.'),
('1022', '100006', 'Take one every four hours, for three days.'),
('1018', '100004', 'Take two every six hours, for five days.');



-- -----------------------------------------------------
-- Create Users and Privileges
-- -----------------------------------------------------

DROP USER IF EXISTS DatabaseAdministrator;

CREATE USER DatabaseAdministrator IDENTIFIED BY 'DBAdmin';
GRANT ALL ON hospital.* TO DatabaseAdministrator WITH GRANT OPTION;

DROP USER IF EXISTS Admissions;

CREATE USER Admissions IDENTIFIED BY 'Admissions';
GRANT ALL ON Admissions TO Admissions;
REVOKE DELETE ON Admissions FROM Admissions;

GRANT ALL ON Bed TO Admissions;
REVOKE DELETE ON Bed FROM Admissions;

GRANT ALL ON Patient TO Admissions;
REVOKE Delete ON Patient FROM Admissions;

-- For User only with access to discharge patients possibility
-- GRANT UPDATE(dischargeDate),SELECT ON Admissions TO Admissions;

DROP USER IF EXISTS Bed_Management;

CREATE USER Bed_Management IDENTIFIED BY 'bedManagement';
GRANT ALL ON BedType to Bed_Management;
GRANT INSERT(bedNumber),UPDATE(bedNumber,wardID),SELECT ON Bed TO Bed_Management;

DROP USER IF EXISTS Doctor;

CREATE USER Doctor IDENTIFIED BY 'Doctor';
GRANT INSERT,UPDATE,SELECT ON Visit TO Doctor;
GRANT INSERT,SELECT,UPDATE(drugID) ON Prescription TO Doctor;

DROP USER IF EXISTS HumanResources;

CREATE USER HumanResources IDENTIFIED BY 'Human_Resouurces';
GRANT ALL ON Doctor TO HumanResources;



-- -----------------------------------------------------
-- Create Views
-- -----------------------------------------------------

CREATE OR REPLACE VIEW availableBeds AS
	SELECT bedNumber,Bed.wardID AS 'Current Location',BedType.*
    FROM Bed JOIN BedType ON BedType.bedType = Bed.bedType
    WHERE patientID IS NULL
    ORDER BY bedNumber;
    
CREATE OR REPLACE VIEW currentBedPatientPrescriptions AS
	SELECT Ward.wardID, wardName,Admissions.bedNumber, bedDescription, Patient.patientID, concat(Patient.fName,' ',Patient.lName) AS 'Patient Name', arriveDate, 
	concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor', Visit.visitID, Visit.date AS 'Date of Visit', Visit.time AS 'Time of Visit',
	drugName AS 'Prescription', dosageDetails AS 'Dosage'
	FROM Bed JOIN BedType ON Bed.bedType = BedType.bedType
	JOIN Patient ON Bed.patientID = Patient.patientID
    JOIN Admissions ON Patient.patientID = Admissions.patientID
	JOIN Ward ON Bed.wardID = Ward.wardID
	JOIN Visit ON Patient.patientID = Visit.patientID
	JOIN Doctor ON Visit.PPS = Doctor.PPS
	JOIN Prescription ON Visit.visitID = Prescription.visitID
	JOIN Drug ON Prescription.drugID = Drug.drugID
    WHERE dischargeDate IS NULL
	ORDER BY patientID, date, time;
    
CREATE OR REPLACE VIEW allPreviousVisits AS
	SELECT date, time, Visit.visitId,Patient.patientID, concat(patient.fName,' ',patient.lName) AS 'Patient', 
       DOB, sex,concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor', specialisation, Drug.*, dosageDetails
	FROM Visit JOIN Doctor ON Visit.PPS = Doctor.PPS
	JOIN Patient ON Visit.patientID = Patient.patientID
	LEFT JOIN Prescription ON Visit.visitID = Prescription.visitID
	LEFT JOIN Drug ON Prescription.drugID = Drug.drugID
	WHERE date < now()
	ORDER BY date desc,time;
    
CREATE OR REPLACE VIEW futureVisitAppointments AS
	SELECT date,time, visitId, Patient.patientID, concat(patient.fName,' ',patient.lName) AS 'Patient Name', DOB, sex,
		   concat(Doctor.fName,' ',Doctor.lName) AS 'Doctor',specialisation FROM
	visit join Doctor on Visit.PPS = Doctor.PPS
	JOIN Patient on Visit.patientID = Patient.patientID
	WHERE date > now()
	ORDER BY date desc,time;
    
CREATE OR REPLACE VIEW gatchBedDetails AS
	SELECT Bed.bedNumber, Ward.wardID, wardName, Bed.patientID, arriveDate
	FROM Bed LEFT JOIN Ward ON Ward.wardID = Bed.wardID
	LEFT JOIN Admissions ON Bed.patientID = Admissions.patientID
	WHERE bedType =
	  (SELECT bedType
	   FROM BedType
	   WHERE bedDescription = 'Gatch Bed');
	

-- -----------------------------------------------------
-- Create Indexes
-- -----------------------------------------------------
	
-- DOB in patient
CREATE INDEX patientDOB ON Patient(DOB);

-- sex in patient
CREATE INDEX patientGender ON Patient(sex);

-- wardName in ward
CREATE INDEX nameOfWard ON Ward(wardName);

-- arriveDate in admissions
CREATE INDEX patientArrive ON Admissions(arriveDate);

-- dischargeDate in admissions
CREATE INDEX patientDepart ON Admissions(dischargeDate);

-- drugName in drug
CREATE INDEX nameOfDrug ON Drug(drugName);

-- date in Visit table
CREATE INDEX visitDate ON Visit(date);

-- specialisation in Doctor table
CREATE INDEX doctorSpecialisation ON Doctor(specialisation);

