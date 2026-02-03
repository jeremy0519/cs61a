/* Create & Drop */
CREATE TABLE squares(n UNIQUE, n_squared);

/* Insert */
INSERT INTO USERS values (4, 'Sanatan', 'Mishra', 'sanatan_mishra@berkeley.edu', 'Student');

/* Delete */
DELETE FROM users WHERE first_name="John";

/* Create */
CREATE TABLE names (ID int unique, name string, email string);

/* Insert */
INSERT INTO names SELECT id, first_name || " " || last_name AS name, email from users;
INSERT INTO names SELECT id, first_name || " " || last_name AS name, email from users; -- Note that running it again produces an error: UNIQUE constraint fails
