drop procedure if exists dev.p;

delimiter $$

create procedure dev.p()
begin
	declare student_insert_duplicate_id condition for 1062;
	declare continue handler for student_insert_duplicate_id 
	begin
		select "The Same Id Already Exists!";
	end;

	insert into dev.Student(Id, Cnp, Prenume, Nume, Varsta, DataNastere, DataInscriere, Facultate)
	values (1,'1990101233445','Ion','Popescu',20,'1999-01-01','2016-07-01','Automatica');
    
    update dev.Student set Nume = CONCAT(Nume, 'o') where Id = 1;
end;

call dev.p;

select * from dev.Student where Id = 1;