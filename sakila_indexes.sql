create table sakila.film_indexpref as select * from sakila.film;
create table sakila.film_indexcol as select * from sakila.film;
create table sakila.film_indexmulticol as select * from sakila.film;
create table sakila.film_indexfull as select * from sakila.film;

alter table  sakila.film_indexpref
add index film_indexpref (description(15));

alter table  sakila.film_indexcol
add index film_indexcol (title);

alter table  sakila.film_indexmulticol
add index film_indexmulticol (title,description(15));

alter table sakila.film_indexfull
add fulltext index film_indexfull (description);

explain
select title, description
from sakila.film
where description like 'A Stu%';

explain
select title, description
from sakila.film_indexpref
where description like 'A Stu%';
    
explain
select title, description
from sakila.film_indexcol
where description like 'A Stu%';
    
select title, description
from sakila.film_indexmulticol
where description like 'A Stu%';

explain
select title, description
from sakila.film_indexfull
where description like 'A Stu%';
    
SET optimizer_trace="enabled=on";
select title, description
from sakila.film
where description like 'A Stu%';
SELECT * FROM INFORMATION_SCHEMA.OPTIMIZER_TRACE;
SET optimizer_trace="enabled=off";

explain sakila.film;