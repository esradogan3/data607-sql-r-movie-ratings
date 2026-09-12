CREATE TABLE users(
      user_id INTEGER,
	  name TEXT
)
ALTER TABLE users
ADD PRIMARY KEY (user_id);

CREATE TABLE movies(
      movie_id INTEGER,
	  title TEXT
)
ALTER TABLE movies
ADD PRIMARY KEY (movie_id);

CREATE TABLE ratings(
      user_id INTEGER,
	  movie_id INTEGER,
	  rating INTEGER
);
ALTER TABLE ratings
ADD PRIMARY KEY (user_id, movie_id);

ALTER TABLE ratings
ADD FOREIGN KEY (user_id)
REFERENCES users(user_id);

ALTER TABLE ratings 
ADD FOREIGN KEY (movie_id) 
REFERENCES movies(movie_id);

ALTER TABLE ratings
ADD CONSTRAINT rating_range
CHECK (rating BETWEEN 1 AND 5);

INSERT INTO users (user_id, name)
VALUES
    (1, 'user_1'),
    (2, 'user_2'),
    (3, 'user_3'),
    (4, 'user_4'),
    (5, 'user_5'),
    (6, 'user_6');

INSERT INTO movies (movie_id, title)
VALUES
    (1, 'Spider-Man: Brand New Day (2026)'),
    (2, 'The Odyssey (2026)'),
    (3, 'Dune: Part Two (2024)'),
    (4, 'Oppenheimer (2023)'),
    (5, 'The Batman (2022)'),
    (6, 'Dune (2021)');

INSERT INTO ratings (user_id, movie_id, rating)
VALUES
    (1, 1, 4),
    (1, 2, 4),
    (1, 3, 2),
    (1, 4, 4),
    (1, 5, 2),
    (1, 6, 1),

    (2, 1, 4),
    (2, 2, NULL),
    (2, 3, NULL),
    (2, 4, 4),
    (2, 5, 3),
    (2, 6, NULL),

    (3, 1, 5),
    (3, 2, 5),
    (3, 3, 5),
    (3, 4, 5),
    (3, 5, 4),
    (3, 6, 3),

    (4, 1, 2),
    (4, 2, 4),
    (4, 3, 4),
    (4, 4, NULL),
    (4, 5, 1),
    (4, 6, 5),

    (5, 1, 5),
    (5, 2, 5),
    (5, 3, NULL),
    (5, 4, NULL),
    (5, 5, NULL),
    (5, 6, 1),

    (6, 1, 5),
    (6, 2, NULL),
    (6, 3, NULL),
    (6, 4, NULL),
    (6, 5, NULL),
    (6, 6, NULL);

SELECT
    users.name,
    movies.title,
    ratings.rating
FROM ratings
JOIN users
    ON ratings.user_id = users.user_id
JOIN movies
    ON ratings.movie_id = movies.movie_id
ORDER BY users.user_id, movies.movie_id;

SELECT
    movies.title,
    ROUND(AVG(ratings.rating), 2) AS average_rating,
    COUNT(ratings.rating) AS number_of_ratings,
    COUNT(*) - COUNT(ratings.rating) AS missing_ratings
FROM ratings
JOIN movies
    ON ratings.movie_id = movies.movie_id
GROUP BY movies.movie_id, movies.title
ORDER BY average_rating DESC;