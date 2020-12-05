/* SQL "Sakila" database query exercises - phase 1 */

-- Database context
USE sakila;

-- Your solutions...
1a. select first_name, last_name
from actor;

1b. select concat(first_name," ", last_name) as ActorName
from actor;

2a. select actor_id,first_name,last_name
from actor
where first_name = "Joe";

2b. select actor_id,first_name,last_name
from actor
where last_name like '%GEN%';

2c. select last_name,first_name
from actor
where last_name like '%LI%';

2d. select country_id, country
from country
where country in ("Afghanistan", "Bangladesh","China");

3a. alter table actor
add middle_name varchar(255) after first_name;

3b. alter table actor
modify column middle_name blob;

3c. alter table actor
drop column middle_name;

4a. SELECT last_name, COUNT(*)
FROM actor
GROUP BY last_name;

4b. SELECT last_name, count(*)
FROM actor
GROUP BY last_name having count(*) > 1;

4c. UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = "GROUCHO" and last_name = "WILLIAMS";

4d. UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = "HARPO" and last_name = "WILLIAMS";

5a. SHOW CREATE TABLE address;

6a. select staff.first_name, staff.last_name, address.address
from staff
join address on staff.address_id = address.address_id;

6b. select staff.first_name, staff.last_name, sum(payment.amount) over () as total
from staff
join payment on staff.staff_id = payment.staff_id
group by staff.first_name, staff.last_name;

6c. select film.title, sum(film_actor.actor_id) as num_actors
from film
inner join film_actor on film.film_id = film_actor.film_id
group by film.title;

6d. SELECT title, COUNT(inventory_id) as num_copies
FROM film f
INNER JOIN inventory i 
ON f.film_id = i.film_id
WHERE title = "Hunchback Impossible";

