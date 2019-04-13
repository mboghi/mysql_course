with cteActor as
(
	select
		film_id, count(actor_id) as actor_count
    from
		sakila.film_actor
	group by film_id
),
cteCategory as
(
	select
		film_id, count(category_id) as category_count
	from
		sakila.film_category
	group by film_id
)
select
	f.title,
    ca.actor_count,
    cc.category_count
from
	sakila.film f
	left join cteActor ca on f.film_id = ca.film_id
    left join cteCategory cc on f.film_id = cc.film_id;
    

with recursive cte(Id,Prenume,Nume,NumeSefCatedra) as
(
	select Id,Prenume,Nume,cast('' as char(500)) as NumeSefCatedra
    from dev.profesor
    where IdSefCatedra is null
    union all
    select p.Id,p.Prenume,p.Nume,concat(cte.Prenume,' ',cte.Nume) as NumeSefCatedra
    from dev.profesor p
		join cte on p.IdSefCatedra = cte.Id
)
select
	*
from
	dev.curs
		right join cte on curs.IdProfesor = cte.Id;
        
with cteClient(film_id,customer_id,customer_name,customer_payment) as
(
	select 
		i.film_id,
        c.customer_id,
        concat(c.first_name,' ',c.last_name) as customer_name,
        sum(p.amount) as customer_payment
    from
		sakila.customer c
        join sakila.payment p on c.customer_id = p.customer_id
        join sakila.rental r on p.rental_id = r.rental_id
        join sakila.inventory i on r.inventory_id = i.inventory_id
	group by
		i.film_id, p.customer_id
	order by
		i.film_id,sum(p.amount) desc
)
select
	film.title,
    cteClient.customer_name,
    cteClient.customer_payment,
    dense_rank() over (partition by film.film_id order by cteClient.customer_payment desc) as rank_index
from
	sakila.film
	join cteClient on film.film_id = cteClient.film_id;