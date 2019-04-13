select
	title,
    concat(a.last_name, ' ', a.first_name) as actor_name,
    row_number() over ord as rownr,
    rank() over ord as rnk,
    dense_rank() over ord as dns_rnk
from
	sakila.film f
	join sakila.film_actor fa on f.film_id = fa.film_id
    join sakila.actor a on fa.actor_id = a.actor_id
window ord as (order by f.title);