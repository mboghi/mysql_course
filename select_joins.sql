select
	*
from
	dev.student s
    join dev.studentcurs sc on s.Id = sc.IdStudent
    join dev.curs c on sc.IdCurs = c.Id
    join dev.studentexamen se on s.Id = se.IdStudent
    join dev.examen e on se.IdExamen = e.Id;
    
select
	c.Nume as NumeCurs,
    s.Prenume as PrenumeStudent,
    s.Nume as NumeStudent
from
	dev.curs c
    left join dev.examen e on c.Id = e.IdCurs
    left join dev.studentexamen se on e.Id = se.IdExamen
    left join student s on se.IdStudent = s.Id;

select
	c.Nume as NumeCurs,
    p.NumeIntreg as NumeProfesor
from
	dev.curs c
    right join dev.profesor p on c.IdProfesor = p.Id;
    
select
	p.NumeIntreg as NumeProfesor,
    e.Nume as NumeExamen
from
	dev.profesor p
    cross join (
		select
			c.Nume
		from
			dev.examen e
            join dev.curs c on e.IdCurs = c.Id) as e;

select
	c.first_name,
    c.last_name,
    f.title,
    i.inventory_id,
    i.film_id,
    r.rental_id
from
sakila.customer c
right join sakila.rental r on c.customer_id = r.customer_id
right join sakila.inventory i on r.inventory_id = i.inventory_id
join sakila.film f on i.film_id = f.film_id
where c.customer_id is null;

select
	c.first_name,
    c.last_name,
    f.title,
    i.inventory_id,
    i.film_id,
    r.rental_id
from
	sakila.film f
    left join sakila.inventory i on f.film_id = i.film_id
    left join sakila.rental r on i.inventory_id = r.inventory_id
    left join sakila.customer c on r.customer_id = c.customer_id
where r.rental_id is null;