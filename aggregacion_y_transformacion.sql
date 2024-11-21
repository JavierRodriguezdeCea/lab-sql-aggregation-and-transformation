USE sakila

SELECT MAX(FILM.LENGTH) AS max_duration, MIN(FILM.LENGTH) AS min_duration
FROM FILM;

SELECT FORMAT(AVG(LENGTH),0) AS AVERAGE_FILM
FROM FILM;

SELECT DATEDIFF(MAX(RENTAL_DATE), MIN(RENTAL_DATE)) AS N_OPERATING_DAYS
FROM RENTAL;

SELECT RENTAL_DATE, DATE_FORMAT(RENTAL_DATE, '%M') AS MONTH, DATE_FORMAT(RENTAL_DATE, '%W') AS WEEK_DAY, 
		(CASE 
			WHEN DATE_FORMAT(RENTAL_DATE, '%W') = 'Saturday' OR 'Sunday' THEN 'Weekend' 
			ELSE 'Week' 
		END ) AS DAY_TYPE
FROM RENTAL
LIMIT 20;


SELECT FILM.TITLE, IFNULL(FILM.RENTAL_DURATION, 'NOT AVAILABLE') AS RENTAL_DURATION
FROM FILM
ORDER BY FILM.RENTAL_DURATION;

SELECT CONCAT(CUSTOMER.FIRST_NAME, ' ', CUSTOMER.LAST_NAME) AS NOMBRE_COMPLETO, LEFT(CUSTOMER.EMAIL, 3) AS 3_EMAIL
FROM CUSTOMER
ORDER BY CUSTOMER.LAST_NAME;

SELECT COUNT(FILM.RELEASE_YEAR) AS N_RELEASE_FILMS
FROM FILM;

SELECT CATEGORY.NAME, COUNT(FILM_CATEGORY.FILM_ID) AS N_FILMS
FROM CATEGORY
JOIN FILM_CATEGORY
ON CATEGORY.CATEGORY_ID = FILM_CATEGORY.CATEGORY_ID
GROUP BY CATEGORY.NAME;


SELECT CATEGORY.NAME, COUNT(FILM_CATEGORY.FILM_ID) AS N_FILMS
FROM CATEGORY
JOIN FILM_CATEGORY
ON CATEGORY.CATEGORY_ID = FILM_CATEGORY.CATEGORY_ID
GROUP BY CATEGORY.NAME
ORDER BY N_FILMS DESC;


SELECT CATEGORY.NAME, COUNT(FILM_CATEGORY.FILM_ID) AS N_FILMS, ROUND(AVG(FILM.LENGTH), 2) AS AVG_LENGTH
FROM CATEGORY
JOIN FILM_CATEGORY
ON CATEGORY.CATEGORY_ID = FILM_CATEGORY.CATEGORY_ID
JOIN FILM
ON FILM_CATEGORY.FILM_ID = FILM.FILM_ID
GROUP BY CATEGORY.NAME
ORDER BY AVG_LENGTH DESC;

SELECT CATEGORY.NAME, COUNT(FILM_CATEGORY.FILM_ID) AS N_FILMS, ROUND(AVG(FILM.LENGTH), 2) AS AVG_LENGTH
FROM CATEGORY
JOIN FILM_CATEGORY
ON CATEGORY.CATEGORY_ID = FILM_CATEGORY.CATEGORY_ID
JOIN FILM
ON FILM_CATEGORY.FILM_ID = FILM.FILM_ID
GROUP BY CATEGORY.NAME
HAVING AVG_LENGTH > 120
ORDER BY AVG_LENGTH DESC;

SELECT ACTOR.LAST_NAME
FROM ACTOR
GROUP BY ACTOR.LAST_NAME
HAVING COUNT(ACTOR.LAST_NAME) = 1;