-- 1. How many actors are there with the last name ‘Wahlberg’?
SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- Answer: 2

-- 2. How many payments were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- Answer: 4794

-- 3. What film does the store have the most of? (search in inventory table)
SELECT film_id, inventory_id
FROM inventory
GROUP BY film_id, inventory_id, store_id
ORDER BY inventory_id DESC;

-- Answer: 1 

-- 4. How many customers have the last name ‘William’?
SELECT last_name
FROM customer
WHERE last_name = 'William';


-- Answer: 0

-- 5. What store employee (get the id) sold the most rentals?
SELECT staff_id, rental_id
FROM payment
WHERE staff_id <> 1;

SELECT staff_id, rental_id
FROM payment
WHERE staff_id <> 2;

-- Answer: Judging by rental_id employee 2 has 7304 rental_id's and employee 1 has 7292 rental_id's
-- employee 2 has more rental_id's

-- 6. How many different distinct names are there?
SELECT COUNT(DISTINCT first_name)
FROM staff;
-- 2 from staff
SELECT COUNT(DISTINCT first_name)
FROM actor;
-- 140 from actor
SELECT COUNT(DISTINCT first_name)
FROM customer;
-- 591 from customer

-- Answer: 733 distinct names

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- Answer: film 508 has the most actors with 15

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
SELECT last_name
FROM customer
WHERE last_name LIKE '%es' AND store_id <> 2;

-- Answer: 13

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250;
--Answer: 3 

-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT rating, COUNT(title)
FROM film
GROUP BY rating
ORDER BY COUNT(title) DESC;
--Answer: PG-13 has the most with 223
