drop procedure if exists proc_feed;

delimiter $$

create PROCEDURE proc_feed (in runs int)
BEGIN
	declare ind int default 0;
    declare off int;

	while (ind < runs) 
    do   
		set off = ind*1000;
        
		insert into sakila.film_indexpref(title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)
		select
			replace(title,substr(title,1,5),substr(title,6,5)), 
			replace(description,substr(description,1,20),substr(description,21,20)), 
			release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update
		from
			sakila.film_indexpref
		limit 
			off, 1000;
			
		set ind = ind + 1;

	end while;
END;

CALL `sakila`.`proc_feed`(100);
select count(1) from sakila.film_indexpref;