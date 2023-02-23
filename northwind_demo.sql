CREATE DATABASE northwind_demo;

USE northwind_demo;

CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
    country VARCHAR(255),
    city VARCHAR(255),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (customer_id)
);

SELECT * FROM customers
WHERE country = 'Germany' AND city = 'Berlin';

SELECT * FROM customers
WHERE country = 'Germany' OR city = 'Stockholm';

SELECT * FROM customers WHERE NOT city = 'Berlin';
SELECT * FROM customers WHERE NOT first_name = 'Linus';

SELECT * FROM customers
WHERE country = 'Germany'
AND (city = 'Berlin' OR city = 'Hamburg');

SELECT * FROM customers
WHERE NOT country = 'Germany'
AND NOT country = 'Sweden';

SELECT * FROM customers
WHERE country IS NULL;

SELECT customer_id, first_name, last_name FROM customers
WHERE country IS NOT NULL;

CREATE TABLE products (
	product_id INT NOT NULL AUTO_INCREMENT,
    product_name VARCHAR(255),
    description TEXT,
    price INT NOT NULL,
    
    PRIMARY KEY (product_id)
);

SELECT * FROM products;


SELECT 
	MAX(price) AS highest_price, 
	MIN(price) AS lowest_price,
    COUNT(product_id) AS products_count
    FROM products;


SELECT COUNT(product_id) AS products_count FROM products
	WHERE price > 100;



SELECT 
	MAX(price) AS highest_price, 
	MIN(price) AS lowest_price,
    COUNT(product_id) AS products_count,
    AVG(price) AS average_price,
    SUM(price) AS price_sum
    FROM products;

SELECT SUM(price) AS price_sum FROM products WHERE price < 200;

SELECT * FROM customers;
SELECT * FROM customers WHERE first_name LIKE 'L%';
SELECT * FROM customers WHERE first_name LIKE '%e';
SELECT * FROM customers WHERE city LIKE '%G';
SELECT * FROM customers WHERE last_name LIKE '%ander%';
SELECT * FROM customers WHERE first_name LIKE '_a%';
SELECT * FROM customers WHERE first_name LIKE '_a__e';
SELECT * FROM customers WHERE last_name LIKE 'p__%';

SELECT * FROM customers 
	WHERE last_name LIKE '%an%'
    OR first_name LIKE '%an%'
    OR country LIKE '%an%'
    OR city LIKE '%an%';
    

SELECT COUNT(customer_id) search_result FROM customers 
	WHERE last_name LIKE '%an%'
    OR first_name LIKE '%an%'
    OR country LIKE '%an%'
    OR city LIKE '%an%';
    
    
SELECT * FROM customers
	WHERE country IN ('Sweden', 'Denmark');
    
CREATE TABLE suppliers (
	supplier_id INT NOT NULL AUTO_INCREMENT,
    company VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (supplier_id)
);

SELECT * FROM suppliers;

SELECT * FROM customers 
	WHERE country IN (SELECT country FROM suppliers)
	AND city IN (SELECT city FROM suppliers);
    
    
SELECT * FROM products
	WHERE price BETWEEN 110 AND 190;
    
SELECT * FROM customers
	WHERE first_name BETWEEN 'L' AND 'Q';
    
SELECT * FROM products
	WHERE price NOT BETWEEN 100 AND 200;
    
SELECT * FROM products
	WHERE price BETWEEN 100 AND 200
    AND product_name LIKE '%nike%';
    


CREATE TABLE events (
	event_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    
    PRIMARY KEY (event_id)
);

-- YYYY-MM-DD HH:MM:SS
SELECT * FROM events;


SELECT * FROM events 
	WHERE start_time BETWEEN '2023-04-01' AND '2023-04-27';
    
SELECT * FROM suppliers;


SELECT city FROM customers
UNION
SELECT city FROM suppliers;



SELECT * FROM customers;
SELECT * FROM events;
SELECT * FROM products;
SELECT * FROM supplies;


SELECT COUNT(customer_id) AS count, country, city
FROM customers
GROUP BY country;




CREATE TABLE shippers (
	shipper_id INT NOT NULL AUTO_INCREMENT,
    shipper_name VARCHAR(255) NOT NULL,
    company VARCHAR(255),
    
    PRIMARY KEY (shipper_id)
);

CREATE TABLE orders (
	order_id INT NOT NULL AUTO_INCREMENT,
    shipper_id INT NOT NULL,
    customer_id INT NOT NULL,
    order_time DATETIME NOT NULL,
    
    PRIMARY KEY (order_id),
    FOREIGN KEY (shipper_id) REFERENCES shippers(shipper_id)
);

ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);




SELECT * FROM shippers;
SELECT * FROM customers;
SELECT * FROM orders;



SELECT s.shipper_name, COUNT(o.order_id) AS orders_count 
FROM orders AS o
LEFT JOIN shippers AS s ON s.shipper_id = o.shipper_id
GROUP BY s.shipper_id;
