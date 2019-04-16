drop procedure if exists sakila.spApplyDiscountForCategory;

delimiter $$

create procedure sakila.spApplyDiscountForCategory(in percent int, in category varchar(100), out changes_number int)
begin
	update 
		sakila.payment p
		join sakila.rental r on p.rental_id = r.rental_id
        join sakila.inventory i on r.inventory_id = i.inventory_id
        join sakila.film f on i.film_id = f.film_id
        join 
			(select distinct
				fc.film_id
			from
				sakila.film_category fc
				join sakila.category c on fc.category_id = c.category_id
			where
				c.name = category) c on f.film_id = c.film_id
	set p.amount = (100 - percent)/100 * p.amount;
        
	set changes_number = ROW_COUNT();
end;

call sakila.spApplyDiscountForActionMovies(15,'Action',@changes_nr);
select @changes_nr;

drop function if exists sakila.sfGetCustomerFullAddress;

delimiter $$

create function sakila.sfGetCustomerFullAddress(cust_id int)
returns varchar(255) deterministic
begin
	declare addr varchar(255);
    
	set addr = (select
		concat(a.address,',',ci.city,',',co.country) as addr
	from
		sakila.customer c
        join sakila.address a on c.address_id = a.address_id
        join sakila.city ci on a.city_id = ci.city_id
        join sakila.country co on ci.country_id = co.country_id
	where
		c.customer_id = cust_id
	limit 1);
    
    return addr;
end;

select
	concat(first_name,' ',last_name),
    sakila.sfGetCustomerFullAddress(customer_id)
from sakila.customer;