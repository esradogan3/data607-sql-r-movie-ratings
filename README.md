# data607-sql-r-movie-ratings

This project analyzes ratings collected from six participants for six popular movies. The movies were rated on a scale from 1 to 5. The data was stored in a PostgreSQL database and queried directly from R.

## Database Design

The database contains three tables:

users(user_id, name)
movies(movie_id, title)
ratings(user_id, movie_id, rating)

The ratings table connects the users and movies through primary and foreign keys.

## Missing Ratings

Participants could indicate that they had not seen a movie. These responses were stored as NULL in PostgreSQL and appeared as NA in R. Missing ratings were kept in the dataframe but excluded when calculating average ratings.

## Files
create_tables.sql: Creates and populates the PostgreSQL tables and includes SQL queries.
sql-r-movie-ratings.qmd: Contains the R and Quarto analysis.
sql-r-movie-ratings.html: Rendered analysis report.

## Tools

PostgreSQL, R, DBI, RPostgres, dplyr, ggplot2, and Quarto.
