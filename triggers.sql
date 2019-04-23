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

drop trigger dev.ins_bf_student;

delimiter $$

create trigger dev.upd_bf_student before update on dev.student
for each row
begin
	set new.varsta = timestampdiff(year,new.DataNastere,NOW());
end;

update dev.Student set DataNastere = '1989-03-14' where cnp like '1881403233445';

select * from dev.student where cnp like '1881403233445';

delimiter $$

create trigger dev.del_aft_profesor after delete on dev.profesor
for each row
begin
	delete from dev.adresa where Id = old.IdAdresa;
end;
    
insert into dev.Adresa values (default,'Bucuresti','Bucuresti','Eminescu','1','1','1','1');
set @insertedAddress = last_insert_id();
insert into dev.Profesor 
values 
	(default,'Marin','Georgescu',default,@insertedAddress,null),
    (default,'Maria','Andrei',default,@insertedAddress,null);
    
select * from dev.profesor;
select * from dev.adresa;

delete from dev.profesor where Id = 10;

drop trigger dev.del_aft_profesor;

delimiter $$
create procedure dev.spDeleteAddressById(in idAdresa int)
begin
	declare exit handler for 1451 begin end;

	delete from dev.adresa where Id = idAdresa;
end;

delimiter $$
create trigger dev.del_aft_profesor after delete on dev.profesor
for each row
begin
    call dev.spDeleteAddressById(old.IdAdresa);
end;