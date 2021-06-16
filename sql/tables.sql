create table users(
	user_id INT PRIMARY KEY auto_increment,
    username VARCHAR(45) UNIQUE,
    pass varchar(45)
);