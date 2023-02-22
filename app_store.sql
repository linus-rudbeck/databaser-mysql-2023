CREATE DATABASE app_store;

USE app_store;

CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    
    PRIMARY KEY (user_id)
);

CREATE TABLE apps (
	app_id INT NOT NULL AUTO_INCREMENT,
    app_name VARCHAR(255) NOT NULL,
    price INT NOT NULL,
    
    PRIMARY KEY (app_id)
);

CREATE TABLE downloads (
	download_id INT NOT NULL AUTO_INCREMENT,
    app_id INT NOT NULL,
    user_id INT NOT NULL,
    download_time DATETIME NOT NULL,
    
    PRIMARY KEY (download_id),
    FOREIGN KEY (app_id) REFERENCES apps(app_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO apps (app_name, price)
VALUES
	('Flappy Bird', 0),
    ('Super GPS', 100);


INSERT INTO users (username, email)
VALUES
	('linus', 'linus@distansakademin.se'),
	('anna', 'anna@distansakademin.se');

INSERT INTO downloads (app_id, user_id, download_time)
VALUES
	(1, 1, '2020-01-13 12:34:56'), -- linus downloaded Flappy bird
	(1, 2, '2020-01-13 13:37:00'), -- anna downloaded Flappy bird
	(2, 1, '2022-04-24 14:00:00'); -- linus downloaded Super GPS
    


CREATE TABLE ratings (
	rating_id INT NOT NULL AUTO_INCREMENT,
    app_id INT NOT NULL,
    user_id INT NOT NULL,
    rating_score INT NOT NULL,
    user_comment VARCHAR(5000),
    
    PRIMARY KEY (rating_id),
    FOREIGN KEY (app_id) REFERENCES apps(app_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);



SELECT * FROM apps;
SELECT * FROM users;
SELECT * FROM downloads;
