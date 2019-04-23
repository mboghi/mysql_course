alter table dev.StudentExamen
change Nota Nota decimal(4,2),
add Absolvit bit,
add constraint ck_studentexamen_nota check (Nota > 0 && Nota <= 10);

alter table dev.Examen
add IdSesiune int not null,
add constraint fk_examen_sesiune foreign key (IdSesiune) references dev.Sesiune(Id);

-- select * 
-- from INFORMATION_SCHEMA.TABLE_CONSTRAINTS
-- where CONSTRAINT_SCHEMA = 'dev';

-- SELECT
--  *
-- FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
-- WHERE
-- CONSTRAINT_SCHEMA = 'dev';

alter table dev.Profesor
add IdSefCatedra int,
add constraint profesor_sefcatedra foreign key (IdSefCatedra) references dev.Profesor(Id) on delete set null;