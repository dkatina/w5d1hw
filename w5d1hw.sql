-- Question 1
SELECT COUNT(last_name), last_name
FROM actor
WHERE last_name = 'Wahlberg'
GROUP BY last_name;
-- answer 2


--- Question 2
SELECT COUNT(amount)
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;
-- answer 5602

-- Question 3
SELECT inventory.film_id, film.title, COUNT(inventory.film_id)
FROM inventory, film 
WHERE film.film_id = inventory.film_id
GROUP BY inventory.film_id, film.title
HAVING COUNT(inventory.film_id) = (
SELECT MAX(y.mycount)
FROM (
SELECT film_id, COUNT(film_id) mycount
FROM inventory
GROUP BY film_id)y)
ORDER BY film_id;

-- This shows a list every Movie that has the highest count of movies
-- had to connect two tables to link inventory id amounts to their titles
-- Can't use max count directly so you have to use HAVING Count =
-- the max of a subquery(which needed alias so I gave it 'y') where I count my id's (alias 'mycount')

-- Question 4
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';
--answer = 0

--Question 5
SELECT staff.first_name, staff.last_name, rental.staff_id, COUNT(rental.staff_id)
FROM rental, staff
WHERE rental.staff_id = staff.staff_id
GROUP BY staff.first_name, staff.last_name, rental.staff_id
HAVING COUNT(rental.staff_id) = (
SELECT MAX(y.mycount)
FROM (
SELECT staff_id, COUNT(staff_id) mycount
FROM rental
GROUP BY staff_id)y);
-- Well apparenty there are only 2 employees and of the 2 Mike id 1 is better
-- Code very similar to Q3, link the tables so i can get id count and name of id holder
-- Then set Count ID to MAX(y.mycount) of a subquery 'y' where I have a mycount column


--Question 6:
SELECT COUNT(DISTINCT district)
FROM address
-- answer is 378 unique districts

--Question 7:
SELECT COUNT(film_actor.film_id), film_actor.film_id, film.title
FROM film_actor, film
WHERE film.film_id = film_actor.film_id
GROUP BY film_actor.film_id, title
HAVING COUNT(film_actor.film_id) = (
    SELECT MAX(y.mycount)
FROM (
SELECT film_id, COUNT(film_id) as mycount
FROM film_actor
GROUP BY film_id)y)
ORDER BY COUNT(film_actor.film_id) DESC;

-- The Film Lambs Cincinatti, ID: 508, Has 15 actors 

--Question 8

SELECT COUNT(last_name)
FROM customer
WHERE store_id = 1 and last_name LIKE '%es'

-- There are 13 customers that visit store 1 with last names ending in 'es'

-- Question 9
SELECT COUNT(amount), amount
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount) > 250


-- Answer 3 distinct amounts// So we are counting the number of distinct payments,
-- condition 1 that these payments are used for more than 250 rentals
-- condition 2 that these payments are made by customers with ID's between 380 and 430

-- Question 10
SELECT COUNT(DISTINCT rating), rating, COUNT(rating) as NUM_RATING
FROM film
GROUP BY rating
ORDER BY num_rating DESC

-- there are 5 total catagories with PG-13 movies being the most abundant
