-- 1
--List the films where the yr is 1962 [Show id, title]

SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2
-- Give year of 'Citizen Kane'.

SELECT yr from movie
where title = 'Citizen Kane';

-- 3
-- List all of the Star Trek movies, include the id,
-- title and yr (all of these movies include the words Star Trek in the title). Order results by year.

SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'
GROUP BY yr;

-- 4
-- What id number does the actor 'Glenn Close' have?

SELECT id from actor
WHERE name = 'Glenn Close';

-- 5
-- What is the id of the film 'Casablanca'

SELECT id FROM movie
where title = 'Casablanca';

-- 6
-- Obtain the cast list for 'Casablanca'.
-- what is a cast list?
-- Use movieid=11768, (or whatever value you got from the previous question)

SELECT name from actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE title = 'Casablanca';

-- 7
-- Obtain the cast list for the film 'Alien'

SELECT name from actor
JOIN casting ON actor.id = casting.actorid
JOIN movie ON movie.id = casting.movieid
WHERE title = 'Alien';

-- 8
-- List the films in which 'Harrison Ford' has appeared

SELECT title from movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name= 'Harrison Ford';

-- 9
-- List the films where 'Harrison Ford' has appeared - but not in the starring role.
-- [Note: the ord field of casting gives the position of the actor.
-- If ord=1 then this actor is in the starring role]

SELECT title from movie
JOIN casting ON casting.movieid = movie.id
JOIN actor ON actor.id = casting.actorid
WHERE actor.name= 'Harrison Ford'
AND casting.ord != 1;

-- 10
-- List the films together with the leading star for all 1962 films.

SELECT title, name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE ord=1 AND yr=1962;

-- 11
-- Which were the busiest years for 'Rock Hudson',
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies.

SELECT yr,COUNT(title) FROM movie 
JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2;

-- 12
-- List the film title and the leading actor for all of the films 'Julie Andrews' played in.
-- Did you get "Little Miss Marker twice"?

SELECT title, name 
FROM movie
JOIN casting ON (movieid = movie.id AND ord=1)
JOIN actor ON (actorid = actor.id)
WHERE movie.id IN (10016,12354,12497,12766,13846,15145,15476,16870,17117,17445,17765,18270,20136,20136,
20180,20181,20509,20627,21023,21154,21171,
21483);

-- 13
-- Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

SELECT name FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE ord = 1 
GROUP BY name
HAVING COUNT(*) >= 15;


-- 14
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.



-- 15
-- 