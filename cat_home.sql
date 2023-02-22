CREATE DATABASE cat_home;

USE cat_home; 

CREATE TABLE caretakers (
	caretaker_id INT NOT NULL AUTO_INCREMENT,
caretaker_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (caretaker_id)
);

CREATE TABLE cages (
    cage_id INT NOT NULL AUTO_INCREMENT,
    cage_size INT NOT NULL,
    color VARCHAR(255) NOT NULL,
    PRIMARY KEY (cage_id)
);

CREATE TABLE cat_owners (
	cat_owner_id INT NOT NULL AUTO_INCREMENT,
    cat_owner_name VARCHAR(255) NOT NULL,
    birth_year INT,
    phone_number VARCHAR(255),
    PRIMARY KEY (cat_owner_id)
);

CREATE TABLE cats (
	cat_id INT NOT NULL AUTO_INCREMENT,
    cat_owner_id INT NOT NULL,
    cage_id INT,
    caretaker_id INT,
    
    cat_name VARCHAR(255) NOT NULL,
    birth_year VARCHAR(255),
    alive BOOLEAN,
    
    PRIMARY KEY (cat_id),
    FOREIGN KEY (cat_owner_id) REFERENCES cat_owners(cat_owner_id),
    FOREIGN KEY (cage_id) REFERENCES cages(cage_id),
    FOREIGN KEY (caretaker_id) REFERENCES caretakers(caretaker_id)    
);

CREATE TABLE residences (
	residence_id INT NOT NULL AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL,
    area INT,
    PRIMARY KEY (residence_id)
);

CREATE TABLE owner_residences (
	owner_residence_id INT NOT NULL AUTO_INCREMENT,
    residence_id INT NOT NULL,
    cat_owner_id INT NOT NULL, 
    move_in_date DATETIME NOT NULL,
    
    PRIMARY KEY (owner_residence_id),
    FOREIGN KEY (residence_id) REFERENCES residences(residence_id),
    FOREIGN KEY (cat_owner_id) REFERENCES cat_owners(cat_owner_id)
);



INSERT INTO caretakers (caretaker_name, email)
VALUES 
	('Anna', 'anna@cathome.com'),
    ('Pelle', 'pelle@cathome.com');
    

INSERT INTO cages (cage_size, color)
VALUES
	(15, 'green'), 
    (20, 'red'), 
    (25, 'blue');


INSERT INTO cat_owners (cat_owner_name, birth_year, phone_number)
VALUES
	('Linus', 1994, '076123456'),
	('Maria', 1990, '076123458');


INSERT INTO residences (address, area)
VALUES
	('Landalabergen', 90),
	('Guldheden', 50),
	('Dr Fries Torg', 25);

INSERT INTO owner_residences (residence_id, cat_owner_id, move_in_date)
VALUES
	(1, 1, '2000-12-31 00:00:00'),
	(1, 2, '2010-04-24 00:00:00'),
    (3, 2, '2008-05-19 00:00:00');
    

INSERT INTO cats (cat_owner_id, cat_name)
VALUES
	(1, 'Lambada');

INSERT INTO cats (cat_owner_id, cage_id, caretaker_id, cat_name, birth_year, alive)
VALUES
	(1, 3, 1, 'Medusa', NULL, 1),
	(2, 2, 2, 'Albis', 2015, 1);






SELECT * FROM caretakers;
SELECT * FROM cages;
SELECT * FROM cat_owners;
SELECT * FROM residences;
SELECT * FROM owner_residences;
SELECT * FROM cats;