USE sakila;
#How many distinct (different) actors' last names are there?
SELECT distinct last_name FROM sakila.actor
COUNT ;

#In how many different languages where the films originally produced? (Use the column language_id from the film table)
SELECT language_id  FROM sakila.film;

#How many days has been the company operating (check DATEDIFF() function)?
SELECT DATEDIFF(MAX(DATE(rental_date)),MIN(DATE(rental_date)))FROM rental;

#How many movies were released with "PG-13" rating?
SELECT rating , title FROM film
WHERE rating ='PG-13';

#Get 10 the longest movies from 2006.
SELECT title, length FROM film
ORDER BY length desc
LIMIT 10;

#Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date , DATE_FORMAT(CONVERT("2022-11-19 19:30:10.000001", date), '%M') as  month  FROM rental
LIMIT 20;
SELECT rental_date , DATE_FORMAT(CONVERT("2022-11-19 19:30:10.000001", date), '%W') as  weekday  FROM rental
LIMIT 20 ;

#Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN DATE_FORMAT(rental_date, '%W') in ('Monday', 'Tuesday', 'Wednesday', 'Thursday','Friday') THEN 'workday'
ELSE 'weekend'
END AS day_type
FROM rental;



