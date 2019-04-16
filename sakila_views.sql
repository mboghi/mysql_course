create or replace view sakila.vwCustomerFilmRentalPayment
as
select
	c.first_name,
    c.last_name,
    f.title as rented_film,
    p.amount,
    p.payment_date,
    a.address
from
	sakila.film f
    join sakila.inventory i on f.film_id = i.film_id
    join sakila.rental r on i.inventory_id = r.inventory_id
    join sakila.payment p on r.rental_id = p.rental_id
    join sakila.customer c on p.customer_id = c.customer_id
    left join sakila.store s on i.store_id = s.store_id
    left join sakila.address a on s.address_id = a.address_id;

select * from sakila.vwCustomerFilmRentalPayment;

create or replace view sakila.vwStaff
as
select
	concat(s.first_name, ' ', s.last_name) as staff_name,
    a.address,
    1 as is_manager
from
	sakila.staff s
    join sakila.store st on s.staff_id = st.manager_staff_id
    join sakila.address a on st.address_id = a.address_id

union distinct

select
	concat(s.first_name, ' ', s.last_name) as staff_name,
    a.address,
    0 as is_manager
from
	sakila.staff s
    join sakila.rental r on s.staff_id = r.staff_id
    join sakila.inventory i on r.inventory_id = i.inventory_id
    join sakila.store st on i.store_id = st.store_id
    join sakila.address a on st.address_id = a.address_id;

select * from sakila.vwStaff;