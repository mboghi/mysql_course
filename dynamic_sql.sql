prepare dynamic_query from "select * from dev.student where Prenume like ?";
set @name_param = "%ria%";

execute dynamic_query using @name_param;

deallocate prepare dynaimc_query;

delimiter $$
create procedure dev.spUpdateStudent(in field varchar(255), in fieldValue varchar(255), in idStudent int)
begin
	set @execValue = fieldValue;
    set @execText = CONCAT("update dev.student set ",field," = ? where id = ",idStudent);
    
    prepare run_stmt from @execText;
    execute run_stmt using @execValue;
    deallocate prepare run_stmt;
end;

select * from dev.Student;
call dev.spUpdateStudent('Nume','Popescul',1)