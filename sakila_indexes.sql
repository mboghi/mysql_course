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