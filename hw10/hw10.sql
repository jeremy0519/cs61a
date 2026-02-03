CREATE TABLE parents (parent TEXT, child TEXT);

INSERT INTO parents VALUES
  ('ace', 'bella'),
  ('ace', 'charlie'),
  ('daisy', 'hank'),
  ('finn', 'ace'),
  ('finn', 'daisy'),
  ('finn', 'ginger'),
  ('ellie', 'finn');

CREATE TABLE dogs (name TEXT, fur TEXT, height INTEGER);

INSERT INTO dogs VALUES
  ('ace',     'long',  26),
  ('bella',   'short', 52),
  ('charlie', 'long',  47),
  ('daisy',   'long',  46),
  ('ellie',   'short', 35),
  ('finn',    'curly', 32),
  ('ginger',  'short', 28),
  ('hank',    'curly', 31);

CREATE TABLE sizes (size TEXT, min INTEGER, max INTEGER);

INSERT INTO sizes VALUES
  ('toy',      24, 28),
  ('mini',     28, 35),
  ('medium',   35, 45),
  ('standard', 45, 60);


-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT child FROM parents, dogs
  ON dogs.name = parents.parent
  ORDER BY height DESC;


-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes
  ON dogs.height > sizes.min AND dogs.height <= sizes.max;


-- [Optional] Filling out this helper table is recommended
CREATE TABLE siblings AS
  SELECT a.child AS name1, b.child AS name2, c.size AS size1, d.size AS size2
  FROM parents AS a, parents AS b, size_of_dogs AS c, size_of_dogs AS d
  ON name1 = c.name AND name2 = d.name
  WHERE a.parent = b.parent AND name1 < name2;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT "The two siblings, " || name1 || " and " || name2 || ", have the same size: " || size1
  FROM siblings
  WHERE size1 = size2;


-- Height range for each fur type where all of the heights differ by no more than 30% from the average height
CREATE TABLE low_variance AS
  SELECT fur, MAX(height) - MIN(height) AS height_range
  FROM dogs
  GROUP BY fur
  HAVING MAX(height) <= 1.3 * AVG(height) AND MIN(height) >= 0.7 * AVG(height);

