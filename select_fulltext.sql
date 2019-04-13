alter table
sakila.film add fulltext film_fulltext (title, description);

select 
	* 
from 
	sakila.film f
where
	match (f.title, f.description)
    against ('drama' in natural language mode);

select 
	* 
from 
	sakila.film f
where
	match (f.title, f.description)
    against ('+drama -emotional' in boolean mode);

select 
	* 
from 
	sakila.film f
where
	match (f.title, f.description)
    against ('name' with query expansion);