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



