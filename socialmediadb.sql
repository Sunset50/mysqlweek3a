drop database if exists socialmedia;
create database if not exists socialmedia;


use socialmedia;

drop table if exists comments;
drop table if exists posts;
drop table if exists users;

CREATE TABLE users (
    id INT(7) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(40) NOT NULL,
    password VARCHAR(20) NOT NULL,
    login_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    logout_time DATETIME,
    PRIMARY KEY (id)
);

CREATE TABLE posts (
    id INT(7) NOT NULL AUTO_INCREMENT,
    nid INT(7),
    name VARCHAR(100) NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    post VARCHAR(200),
    PRIMARY KEY (id),
    FOREIGN KEY (nid)
        REFERENCES users (id)
);
CREATE TABLE comments (
    id INT(10) NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    pid INT(7) NOT NULL,
    uid INT(7),
    login DATETIME DEFAULT CURRENT_TIMESTAMP,
    logout DATETIME,
    comment VARCHAR(200),
    PRIMARY KEY (id),
    FOREIGN KEY (pid)
        REFERENCES posts (id),
    FOREIGN KEY (uid)
        REFERENCES users (id)
);
    
INSERT into users (name, email, password) 
values ('Tim', 'tim@gamil.com', '1234');
INSERT into users (name, email, password) 
values ('Von', 'von@gmail.com', '5678');
INSERT into users (name, email, password) 
values ('Sam', 'sam@gmail.com', '9878');
INSERT into users (name, email, password)
 values ('Fay', 'fay@gmail.com', 'f9878');
 INSERT into users (name, email, password) 
 values ('Bob', 'bob@gmail.com', 'b 99878');
insert into posts ( id, name, post) 
values ( 1, 'Tim', 'I did not complete my project on time');
insert into posts ( id, name, post)
 values (3, 'Sam', 'I did complete my project on time');
 insert into comments( name, pid, uid, comment)
 values ('Von', 1, 1, 'sorry you did not complete your project on time');
 insert into comments( name, pid, uid, comment) 
 values ('Bob', 1, 2, ' The project was differnt compared to last week');
 insert into comments( name, pid, uid, comment) 
 values ('Fay', 3, 2, ' you completed your project on time');
select u.id, u.name, u.login_time, p.id, p.name, p.date, p.post, 
c.name, c.pid, c.uid, c.login, c.comment from users u 
inner join posts p on u.id = p.id 
inner join comments c on c.id = p.id;

 