begin work;
update dev.adresa set Numar = 3 where Strada like "%t%";
select * from dev.adresa where Strada like "%t%";
rollback;
select * from dev.adresa where Strada like "%t%";

set autocommit = 0;
select * from dev.adresa where Strada like "%t%";
update dev.adresa set Numar = 2 where Strada like "%t%";
-- reconnect to server
select * from dev.adresa where Strada like "%t%";

set autocommit = 1;

select * from dev.adresa where Strada like "%t%";
start transaction;

update dev.adresa set Numar = 3 where Strada like "%t%";
savepoint updated_to_three;

update dev.adresa set Numar = 4 where Strada like "%t%";
savepoint updated_to_four;

update dev.adresa set Numar = 5 where Strada like "%t%";
savepoint updated_to_five;

select * from dev.adresa where Strada like "%t%";
rollback to updated_to_four;
select * from dev.adresa where Strada like "%t%";
rollback to updated_to_three;

commit;
select * from dev.adresa where Strada like "%t%";

lock tables film read;
select count(1) from film;
unlock tables;