CREATE DATABASE web_shop_2023;

USE web_shop_2023;

CREATE TABLE categories (
	category_id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(255) NOT NULL,
    description VARCHAR(2550),
    
    PRIMARY KEY (category_id)
);

CREATE TABLE customers (
	customer_id INT NOT NULL AUTO_INCREMENT,
    customer_name VARCHAR(255) NOT NULL,
    address VARCHAR(255),
    email VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (customer_id)
);

CREATE TABLE products (
	product_id INT NOT NULL AUTO_INCREMENT,
    category_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
	description VARCHAR(2550),
    price INT NOT NULL,
    
    PRIMARY KEY (product_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);


CREATE TABLE carts (
	cart_id INT NOT NULL AUTO_INCREMENT,
    customer_id INT NOT NULL,
    discount INT,
    
    PRIMARY KEY (cart_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE product_carts (
	product_cart_id INT NOT NULL AUTO_INCREMENT,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    product_count INT NOT NULL,
    
    PRIMARY KEY (product_cart_id),
    FOREIGN KEY (cart_id) REFERENCES carts(cart_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE purchases (
	purchase_id INT NOT NULL AUTO_INCREMENT,
    cart_id INT NOT NULL,
    purchase_time DATETIME NOT NULL,
    receipt VARCHAR(2550),
    total_price INT NOT NULL,
    
    PRIMARY KEY (purchase_id),
    FOREIGN KEY (cart_id) REFERENCES carts(cart_id)
);

CREATE TABLE payments (
	payment_id INT NOT NULL AUTO_INCREMENT,
    purchase_id INT NOT NULL,
    payment_time DATETIME NOT NULL,
    currency VARCHAR(25) NOT NULL,
    amount INT NOT NULL,
    
    PRIMARY KEY (payment_id),
    FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id)
);







