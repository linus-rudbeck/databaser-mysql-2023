-- CREATE DATABASE test_database;

-- USE test_database;

/* CREATE TABLE persons (
	person_id INT,
    last_name VARCHAR(255),
    first_name VARCHAR(255),
    address VARCHAR(255), 
    city VARCHAR(255)
); */

/* ALTER TABLE persons
ADD  PRIMARY KEY (person_id); */

/* CREATE TABLE orders (
	order_id INT NOT NULL AUTO_INCREMENT,
    order_number INT NOT NULL,
    person_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (person_id) REFERENCES persons(person_id)
); */

-- ALTER TABLE persons MODIFY person_id INT NOT NULL AUTO_INCREMENT;

/* INSERT INTO persons (last_name, first_name, address, city)
VALUES
	('Slättmyr', 'Anna', 'Landalabergen', 'Göteborg'),
	('Slättmyr', 'Maria', 'Guldheden', 'Göteborg'),
	('Rudbeck', 'Pelle', 'Sagogatan', 'Jönköping'); */

/* INSERT INTO orders (order_number, person_id)
VALUES
	(100, 1),
    (101, 2); */

/* ALTER TABLE orders 
ADD summary VARCHAR(255); */


/* UPDATE orders
SET summary = 'En snabb bil'
WHERE order_id = 2; */

/* INSERT INTO orders (order_number, person_id, summary)
VALUES (102, 1, 'En liter kaffe'); */

SELECT first_name, last_name FROM persons WHERE last_name = 'Rudbeck';


SELECT * FROM persons;
SELECT * FROM orders;