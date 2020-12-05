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

