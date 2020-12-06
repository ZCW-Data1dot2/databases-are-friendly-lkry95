/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
i. select first_name, last_name
from actor
where first_name = "Scarlett";

ii. select first_name, last_name
from actor
where last_name = "Johansson";

iii. select count(distinct last_name) 
from actor;

iv. select last_name 
from actor 
group by last_name 
where count(*) < 2;

v. select last_name 
from actor 
group by last_name 
where count(*) > 1;

vi. select actor.actor_id, actor.first_name, actor.last_name, count(actor_id) as num_films
from actor 
join film_actor using (actor_id)
group by actor_id
order by num_films desc
limit 1;

vii. select film.film_id, film.title, store.store_id, inventory.inventory_id
from inventory join store using (store_id) 
join film using (film_id)
where film.title = 'Academy Dinosaur' and store.store_id = 1;

select inventory.inventory_id
from inventory join store using (store_id)
     join film using (film_id)
     join rental using (inventory_id)
where film.title = 'Academy Dinosaur'
      and store.store_id = 1
      and not exists (select * from rental
                      where rental.inventory_id = inventory.inventory_id
                      and rental.return_date is null);

viii. insert into rental (rental_date, inventory_id, customer_id, staff_id)
values (NOW(), 1, 1, 1);
                      
ix. select rental_duration 
from film 
where film_id = 1;

select rental_id from rental order by rental_id desc limit 1;

select rental_date,
       rental_date + interval
                   (select rental_duration from film where film_id = 1) day
                   as due_date
from rental
where rental_id = (select rental_id from rental order by rental_id desc limit 1);

x. select avg(length) from film;

xi. select category.name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length) desc;

xii. No data.
