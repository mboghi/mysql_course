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

select
	c.first_name,
    c.last_name,
    c.store_id,
    p.payment_date,
    p.amount,
    sum(p.amount) over (partition by c.store_id) as sumAll,
    sum(p.amount) over (partition by c.store_id rows unbounded preceding) as sumPreceding,
    sum(p.amount) over (partition by c.store_id order by p.payment_date rows unbounded preceding) as sumOrderPreceding,
    sum(p.amount) over (partition by c.store_id rows between 1 preceding and 1 following) as sumPreceding1Following1,
    sum(p.amount) over (partition by c.store_id order by p.payment_date rows between 1 preceding and 1 following) as sumOrderPrecedingFollowing1
from
	sakila.customer c
    join sakila.payment p on c.customer_id = p.customer_id;
    
select
	c.first_name,
    c.last_name,
    c.store_id,
    p.payment_date,
    p.amount,
    avg(p.amount) over (partition by c.store_id order by p.amount range between 1 preceding and current row) as avgOrderPredeging1Curent
from
	sakila.customer c
    join sakila.payment p on c.customer_id = p.customer_id;