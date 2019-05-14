select last_insert_id();
-- deschideti o conexiune noua
insert into dev.Adresa
values (default,'Bucuresti','Bucuresti','Mihai Bravu','1','1','1','1');

select last_insert_id();

insert into dev.Adresa
values (1,'Bucuresti','Bucuresti','Mihai Bravu','1','1','1','1');

select last_insert_id();

select id 
from dev.adresa
where
	Judet = 'Bucuresti'
    AND Oras = 'Bucuresti'
    AND Strada = 'Mihai Bravu'
    AND Numar = 1
    AND Bloc = 1
    AND Scara = 1
    AND NumarAp = 1
