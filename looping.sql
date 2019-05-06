drop procedure if exists dev.loop_loop;
delimiter $$
create procedure dev.loop_loop()
begin
	declare ind int default 1;
    
	repet: loop
		set ind = ind + 1;
		if ind < 10 then iterate repet;
		end if;
		leave repet;
	end loop repet;

	select ind;
end;

call dev.loop_loop

drop procedure if exists dev.loop_repeat;
delimiter $$
create procedure dev.loop_repeat()
begin
	declare ind int default 1;
    
    repetRepeat: repeat
		set ind = ind + 1;
	until ind = 10 
    end repeat repetRepeat;
    
    select ind;
end;

call dev.loop_repeat;

drop procedure if exists dev.loop_while;
delimiter $$
create procedure dev.loop_while()
begin
	declare ind int default 1;
    
    repetWhile: while ind < 10 do
		set ind = ind + 1;
	end while repetWhile;
    
    select ind;
end;

call dev.loop_while;

drop procedure if exists dev.loop_cursor;
delimiter $$
create procedure dev.loop_cursor()
begin
	declare done bit default false;
    declare ds, de datetime;
    declare ids, ide int;
	declare stud cursor for select Id, DataNastere from dev.student;
    declare exam cursor for select Id, DataOra from dev.examen;
    declare continue handler for not found set done = true;
    
    open stud;
    
    stud_loop: loop
		fetch stud into ids, ds;
        if done then
				leave stud_loop;
		end if;
        
        open exam;
        exam_loop: loop
			fetch exam into ide, de;
			if done then
				leave exam_loop;
			end if;
            
			if year(ds) = year(de) and day(ds) = day(de) then
				update dev.studentexamen 
                set Nota = Nota + 1 
                where IdStudent = ids 
					and IdExamen = ide 
                    and Nota <= 9;
			end if;
		end loop exam_loop;
        set done = false;
        close exam;
	end loop stud_loop;
    
    close stud;
end;

call dev.loop_cursor;