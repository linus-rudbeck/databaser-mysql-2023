CREATE DATABASE java_todos;

USE java_todos;

CREATE TABLE users (
	user_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL,
	company VARCHAR(255) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE tasks (
	task_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	completed BOOLEAN NOT NULL,
	PRIMARY KEY (task_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

SELECT * FROM users;
SELECT * FROM tasks;


