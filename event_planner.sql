CREATE DATABASE event_planner;

USE event_planner;

CREATE TABLE cities (
	city_id INT NOT NULL AUTO_INCREMENT,
	city_name VARCHAR(255) NOT NULL,
	price INT,
    PRIMARY KEY (city_id)
);

CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
	city_id INT NOT NULL,
	customer_name VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (customer_id),
    FOREIGN KEY (city_id) REFERENCES cities(city_id)
);

SELECT * FROM cities;
SELECT * FROM customers;

SELECT cu.customer_name, ci.city_name
FROM customers AS cu
LEFT JOIN cities AS ci ON ci.city_id = cu.city_id
