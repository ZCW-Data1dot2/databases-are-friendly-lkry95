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
