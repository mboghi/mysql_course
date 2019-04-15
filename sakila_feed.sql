


DROP PROCEDURE IF EXISTS proc_feed;
CREATE PROCEDURE proc_feed()
BEGIN
	set @i = 0;

	while (@i < 100) do
	insert into sakila.film_indexcol(title, description, release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update)
	select
		replace(title,substr(title,1,5),substr(title,6,5)), 
		replace(description,substr(description,1,20),substr(description,21,20)), 
		release_year, language_id, original_language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features, last_update
	from
		sakila.film
	limit 
		@i*1000, (@i+1)*1000;
		
	set @i = @i+1;

	end while;
END;