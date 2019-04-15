select
	customer.first_name,
    customer.last_name,
    sum(payment.amount) as payment
from
	payment
	join customer on payment.customer_id = customer.customer_id
group by
	customer.customer_id;

-- explain 
select
	customer.first_name,
    customer.last_name,
    store.address,
    sum(payment.amount) as payment
from
	payment
	join customer on payment.customer_id = customer.customer_id
    join rental on payment.rental_id = rental.rental_id
    join inventory on rental.inventory_id = inventory.inventory_id
    join (
		select
			store.store_id,
            address.address
		from
			store
            join address on store.address_id = address.address_id
    ) store on inventory.store_id = store.store_id
group by
	customer.customer_id, store.store_id
order by
	customer.last_name;
    
select
	customer.first_name,
    customer.last_name,
    if(grouping(store.store_id),'All Stores',store.address) as store,
    sum(payment.amount) as payment
from
	payment
	join customer on payment.customer_id = customer.customer_id
    join rental on payment.rental_id = rental.rental_id
    join inventory on rental.inventory_id = inventory.inventory_id
    join (
		select
			store.store_id,
            address.address
		from
			store
            join address on store.address_id = address.address_id
    ) store on inventory.store_id = store.store_id
group by
	customer.customer_id, store.store_id with rollup
order by
	customer.last_name;

select
	actor.first_name,
    actor.last_name,
    if(grouping(film_category.category_id), 'All Movies', category.name) as category,
    count(film_category.film_id) as MoviesPerCategory
from
	actor
    join film_actor on actor.actor_id = film_actor.actor_id
    join film_category on film_actor.film_id = film_category.film_id
    join category on film_category.category_id = category.category_id
group by
	film_actor.actor_id, film_category.category_id with rollup;
    
select
	film.title,
    count(film_actor.actor_id) as NumberOfActors
from
	film
    join film_actor on film.film_id = film_actor.film_id
group by
	film_actor.film_id
having
	count(film_actor.actor_id) >= 10
order by
	count(film_actor.actor_id) desc;
    
