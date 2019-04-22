delimiter $$

create trigger dev.ins_bf_student before insert on dev.student
for each row
begin
	set new.varsta = timestampdiff(year,new.DataNastere,NOW());
end;

insert into dev.Student(Id, Cnp, Prenume, Nume, DataNastere, DataInscriere, Facultate)
values
	(default,'1881403233445','Ionel','Florescu','1988-03-14','2016-07-11','Automatica');

select * from dev.student where id = last_insert_id();