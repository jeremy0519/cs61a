CREATE table newest AS
  SELECT title, year FROM titles
  ORDER BY year DESC
  LIMIT 10 ;


CREATE table dog_movies AS
  SELECT title, character
  FROM titles, principals
  ON principals.tconst = titles.tconst
  WHERE character LIKE "%dog%";


CREATE table leads AS
  SELECT name, COUNT(*) AS lead_roles
  FROM principals, names
  ON names.nconst = principals.nconst
  WHERE ordering = 1
  GROUP BY principals.nconst
  HAVING COUNT(*) > 10;


CREATE table long_movies AS
  SELECT (year / 10 * 10) || "s" AS decade, COUNT(*) AS count
  FROM titles
  WHERE runtime > 180
  GROUP BY decade;

