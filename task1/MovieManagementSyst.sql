CREATE DATABASE MovieManagementSystem;
USE MovieManagementSystem;

-- 1. Movie Table
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_date DATE,
    duration INT -- in minutes
);

select*from movie;

INSERT INTO Movie (title, genre, release_date, duration) VALUES
('Inception', 'Sci-Fi', '2010-07-16', 148),
('Titanic', 'Romance', '1997-12-19', 195),
('The Dark Knight', 'Action', '2008-07-18', 152);

select*from movie;

UPDATE Movie
SET duration = 150
WHERE title = 'Inception';


select*from movie;

DELETE FROM Movie
WHERE title = 'Titanic';


select*from movie;

DROP TABLE Movie;

RENAME TABLE Movie TO Film;

SELECT * FROM Movie;



-- 2. Director Table
CREATE TABLE Director (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE
);
INSERT INTO Director (name, dob) VALUES
('Christopher Nolan', '1970-07-30'),
('Steven Spielberg', '1946-12-18'),
('James Cameron', '1954-08-16');


DELETE FROM Director
WHERE director_id = 3;

DROP TABLE Director;

TRUNCATE TABLE Director;

RENAME TABLE Director TO FilmDirector;

SELECT * FROM Director;

-- 3. Actor Table
CREATE TABLE Actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE
);

INSERT INTO Actor (name, dob) VALUES
('Leonardo DiCaprio', '1974-11-11'),
('Kate Winslet', '1975-10-05'),
('Christian Bale', '1974-01-30');

UPDATE Actor
SET name = 'Leo DiCaprio'
WHERE name = 'Leonardo DiCaprio';

DELETE FROM Actor
WHERE actor_id = 2;

DROP TABLE Actor;

TRUNCATE TABLE Actor;

SELECT * FROM Actor;



-- 4. Movie_Director (One-to-Many: A movie has one director)
ALTER TABLE Movie ADD director_id INT;

ALTER TABLE Movie
ADD FOREIGN KEY (director_id) REFERENCES Director(director_id);

INSERT INTO Movie (title, genre, release_date, duration, director_id) VALUES
('Interstellar', 'Sci-Fi', '2014-11-07', 169, 1),
('E.T.', 'Adventure', '1982-06-11', 115, 2);

UPDATE Movie
SET director_id = 2
WHERE title = 'Interstellar';

UPDATE Movie SET director_id = NULL WHERE director_id = 1;
DELETE FROM Director WHERE director_id = 1;

ALTER TABLE Movie RENAME COLUMN director_id TO director_ref_id;

SELECT m.title, d.name AS director_name
FROM Movie m
JOIN Director d ON m.director_id = d.director_id;


-- 5. Movie_Actor (Many-to-Many)
CREATE TABLE Movie_Actor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    actor_id INT,
    role VARCHAR(100),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES Actor(actor_id)
);

INSERT INTO Movie_Actor (movie_id, actor_id, role) VALUES
(1, 1, 'Cobb'),               -- Leonardo DiCaprio in Inception
(2, 2, 'Dr. Alan Grant'),     -- Sam Neill in Jurassic Park
(1, 2, 'Professor');          -- Sam Neill in Inception (example)

UPDATE Movie_Actor
SET role = 'Dom Cobb'
WHERE id = 1;

DELETE FROM Movie_Actor
WHERE movie_id = 1 AND actor_id = 2;

DROP TABLE Movie_Actor;

TRUNCATE TABLE Movie_Actor;

RENAME TABLE Movie_Actor TO Cast_Roles;
