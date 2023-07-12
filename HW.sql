--Week 5 - Wednesday Questions 
--1. List all customers who live in Texas (use JOINs) 

SELECT CONCAT(first_name,' ',last_name)
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
WHERE a.district  = 'Texas';

--ANSWER=
--Jennifer Davis
--Kim Cruz
--Richard Mccrary
--Bryan Hardison
--Ian Still

--2. Get all payments above $6.99 with the Customer's Full Name 

SELECT CONCAT(first_name,' ',last_name), amount 
FROM payment p 
JOIN customer c 
ON c.customer_id = p.customer_id 
WHERE amount > 6.99
ORDER BY amount ASC;

--ANSWER
--Allan Cornish	7.99
--Brittany Riley	7.99
--Violet Rodriquez	7.99
--Yvonne Watkins	7.99
--Brittany Riley	7.99
--Darren Windham	7.99
--Tyrone Asher	7.99
--ect.

--3. Show all customers names who have made payments over $175(use subqueries) 

SELECT CONCAT(first_name,' ', last_name)
FROM customer c 
WHERE customer_id  IN (
SELECT customer_id
FROM payment p
WHERE amount > 175);

--ANSWER 
--NO RETURNS

SELECT CONCAT(first_name,' ', last_name)
FROM customer c 
WHERE customer_id  IN (
SELECT customer_id
FROM payment p
GROUP BY customer_id
HAVING SUM(amount) > 175);

--ANSWER
--Rhonda Kennedy
--Clara Shaw
--Eleanor Hunt
--Marion Snyder
--Tommy Collazo
--Karl Seal


--4. List all customers that live in Nepal (use the city table) 

SELECT CONCAT(first_name,' ', last_name)
FROM customer c 
JOIN address a 
ON a.address_id = c.address_id 
JOIN city c2 
ON c2.city_id = a.city_id 
JOIN country c3 
ON c3.country_id = c2.country_id 
WHERE c3.country = 'Nepal';

--ANSWER
--Kevin Schuler


--5. Which staff member had the most transactions? 

SELECT CONCAT(first_name, ' ', last_name)
FROM staff s 
WHERE staff_id  IN (
SELECT staff_id
FROM (
	SELECT staff_id, COUNT(payment_id) AS num_trans
	FROM payment
	GROUP BY staff_id) sub
WHERE  num_trans  = (
	SELECT MAX(num_trans)
	FROM(
		SELECT staff_id, COUNT(payment_id) AS num_trans
		FROM payment
		GROUP BY staff_id) sub2));

--ANSWER
--Jon Stephens

	
--6. How many movies of each rating are there? 

SELECT rating, COUNT(film_id)
FROM film f 
GROUP BY rating
ORDER BY COUNT(film_id) DESC;

--ANSWER
--PG-13	 223
--NC-17	 210
--R	         195
--PG	     194
--G	         178


--7.Show all customers who have made a single payment above $6.99 (Use Subqueries)

SELECT CONCAT(first_name, ' ', last_name)
FROM customer c 
WHERE customer_id IN (
SELECT customer_id 
FROM payment p
WHERE amount > 6.99)
ORDER BY CONCAT(first_name, ' ', last_name) ASC;

--ANSWER
--Aaron Selby
--Adam Gooch
--Adrian Clary
--Alan Kahn
--Albert Crouse
--ECT.


--8. How many free rentals did our stores give away?

SELECT COUNT(payment_id)
FROM payment p 
WHERE amount  = 0;

--ANSWER
-- 24

