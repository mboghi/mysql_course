CREATE TEMPORARY TABLE sakila.tmpFilm
(
	id int auto_increment primary key,
    title varchar(255) not null,
    description text
);

create temporary table sakila.tmpCountry
as select * from sakila.country;

select * from sakila.tmpFilm;
select * from sakila.tmpCountry;