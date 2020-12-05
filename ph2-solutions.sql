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

6e. SELECT last_name, first_name, SUM(amount)
FROM payment p
INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY p.customer_id
ORDER BY last_name ASC;

7a. SELECT title
FROM film WHERE title 
LIKE 'K%' OR title LIKE 'Q%'
AND title IN 
(
SELECT title 
FROM film 
WHERE language_id = 1
);

7b. SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
Select actor_id
FROM film_actor
WHERE film_id IN 
(
SELECT film_id
FROM film
WHERE title = 'Alone Trip'
));
  
7c. SELECT cus.first_name, cus.last_name, cus.email 
FROM customer cus
JOIN address a 
ON (cus.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id)
WHERE country.country= 'Canada';
  
7d. SELECT title, description FROM film 
WHERE film_id IN
(
SELECT film_id FROM film_category
WHERE category_id IN
(
SELECT category_id FROM category
WHERE name = "Family"
));

7e. SELECT f.title, COUNT(rental_id) AS 'Times Rented'
FROM rental r
JOIN inventory i
ON (r.inventory_id = i.inventory_id)
JOIN film f
ON (i.film_id = f.film_id)
GROUP BY f.title
ORDER BY `Times Rented` DESC;
  
7f. SELECT s.store_id, SUM(amount) AS 'Revenue'
FROM payment p
JOIN rental r
ON (p.rental_id = r.rental_id)
JOIN inventory i
ON (i.inventory_id = r.inventory_id)
JOIN store s
ON (s.store_id = i.store_id)
GROUP BY s.store_id; 
  
7g. SELECT s.store_id, cty.city, country.country 
FROM store s
JOIN address a 
ON (s.address_id = a.address_id)
JOIN city cty
ON (cty.city_id = a.city_id)
JOIN country
ON (country.country_id = cty.country_id);
  
7h. SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross' 
FROM category c
JOIN film_category fc 
ON (c.category_id=fc.category_id)
JOIN inventory i 
ON (fc.film_id=i.film_id)
JOIN rental r 
ON (i.inventory_id=r.inventory_id)
JOIN payment p 
ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross  LIMIT 5;
  
8a. CREATE VIEW genre AS
SELECT c.name AS 'Genre', SUM(p.amount) AS 'Gross' 
FROM category c
JOIN film_category fc 
ON (c.category_id=fc.category_id)
JOIN inventory i 
ON (fc.film_id=i.film_id)
JOIN rental r 
ON (i.inventory_id=r.inventory_id)
JOIN payment p 
ON (r.rental_id=p.rental_id)
GROUP BY c.name ORDER BY Gross  LIMIT 5;
  
8b. SELECT * FROM genre;

8c. DROP VIEW genre;

