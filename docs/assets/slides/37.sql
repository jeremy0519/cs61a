.mode columns 

-- Simple group by example
SELECT category, COUNT(*) AS total, MIN(ordering), MAX(ordering), ordering
FROM principals GROUP BY category;

-- Actors who have played more than 15 different characters
SELECT name, COUNT(*) AS total
FROM principals JOIN names ON principals.nconst=names.nconst
WHERE category="actor"
GROUP BY nconst
HAVING total > 15;

-- Average movie rating for each person
SELECT name, SUM(averageRating * numVotes) / SUM(numVotes) as realAverage
    FROM ratings JOIN principals JOIN names
    ON ratings.tconst=principals.tconst AND names.nconst=principals.nconst
    ORDER BY realAverage DESC LIMIT 7;

-- Remakes
SELECT title, MIN(year) AS first, MAX(year) AS second
FROM titles
GROUP BY title
HAVING first < second;

-- Two questions that together get the runtime of the first version of the movie
CREATE TABLE IF NOT EXISTS remakes AS SELECT title, MIN(year) AS first, MAX(year) AS second
FROM titles
GROUP BY title
HAVING first < second;

SELECT titles.title, year, runtime
FROM remakes JOIN titles
ON remakes.title=titles.title
WHERE remakes.first=titles.year;