insert into dev.Adresa
values 
	(default,'Bucuresti','Bucuresti','Victoriei','1','1','1','1'),
    (default,'Bucuresti','Bucuresti','Dacia','1','1','1','1'),
    (default,'Bucuresti','Bucuresti','Catargiu','1','1','1','1'),
    (default,'Bucuresti','Bucuresti','Decebal','1','1','1','1'),
    (default,'Bucuresti','Bucuresti','Basarabia','1','1','1','1'),
    (default,'Bucuresti','Bucuresti','Stefan Cel Mare','1','1','1','1');

insert into dev.Profesor
values
	(1,'Dan','Marin',default,1,null),
    (2,'Florin','Matei',default,2,null),
    (3,'Marius','Achim',default,3,1),
    (4,'Maria','Achim',default,4,1),
    (5,'Pavel','Stan',default,5,2),
    (6,'Anton','Spirea',default,6,2);

insert into dev.Sesiune(Id,DataInceput,DataSfarsit)
values
	(1,'2018-01-01','2018-06-30'),
    (2,'2018-07-01','2018-12-31');

insert into dev.Curs(Id,Nume,DataInceput,DataSfarsit,IdProfesor)
values
	(1,'BD','2000-01-01',null,1),
    (2,'C#','2001-01-01',null,2),
    (3,'Matematica','1999-01-01',null,null),
    (4,'Electronica','1998-01-01',null,4),
    (5,'Limba Rusa','1981-01-01','1989-12-20',null),
	(6,'Fizica','1997-01-01',null,null);

insert into dev.Examen(Id,DataOra,IdCurs,IdSesiune)
values
	(default,'2018-07-01 11:00:00',1,1),
    (default,'2018-07-02 11:00:00',2,1),
    (default,'2018-06-25 09:00:00',3,1),
    (default,'2018-06-27 15:00:00',4,1),
    (default,'2019-01-03 11:00:00',1,2),
    (default,'2019-01-05 11:00:00',2,2),
    (default,'2019-01-07 09:00:00',3,2),
    (default,'2019-01-09 15:00:00',4,2),
	(default,'2019-01-11 11:00:00',6,2);
    
insert into dev.Student(Id, Cnp, Prenume, Nume, Varsta, DataNastere, DataInscriere, Facultate)
values
	(1,'1990101233445','Ion','Popescu',20,'1999-01-01','2016-07-01','Automatica'),
    (2,'2980202233445','Maria','Ionescu',21,'1998-02-02','2016-07-11','Automatica'),
    (3,'1981202233445','Andrei','Oancea',21,'1998-12-02','2016-07-11','Electronica'),
    (4,'2990413445566','Ioana','Radulescu',1,'1999-01-01','2016-08-22','Automatica'),
    (5,'1990503445566','Florin','Popa',1,'1999-01-01','2016-08-22','Automatica'),
    (6,'2990603445566','Dana','Raducanu',1,'1999-01-01','2016-08-22','Electronica'),
    (7,'2990703445566','Dorina','Coman',1,'1999-01-01','2016-08-22','Electronica'),
    (8,'1990803445566','Mihai','Andronescu',1,'1999-01-01','2016-08-22','Automatica'),
    (9,'2990406445566','Cosmina','Dobescu',1,'1999-01-01','2016-08-22','Electronica'),
    (10,'1991103445566','Laurentiu','Demian',1,'1999-01-01','2016-08-22','Electronica');
    
insert into dev.studentcurs(IdStudent, IdCurs, IdSesiune)
select
	s.Id, c.Id, ses.Id
from
	dev.student s
    cross join dev.curs c
    cross join dev.sesiune ses
where
	UPPER(s.Facultate) = 'AUTOMATICA'
    and c.Id < 4;
    
insert into dev.studentcurs(IdStudent, IdCurs, IdSesiune)
select
	s.Id, c.Id, ses.Id
from
	dev.student s
    cross join dev.curs c
    cross join dev.sesiune ses
where
	LOWER(s.Facultate) = 'electronica'
    and c.Id not in (3,5);

insert into dev.studentexamen(IdStudent,IdExamen,IdSesiune,Nota)
select
	sc.IdStudent,
    e.Id,
    sc.IdSesiune,
    e.IdCurs + 3.5
from
	dev.studentcurs sc
    join dev.examen e on sc.IdCurs = e.IdCurs
where
	sc.IdStudent % 5 != 0
    and e.Id != 9;