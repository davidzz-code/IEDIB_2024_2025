REGISTER /usr/lib/pig/piggybank.jar;

-- Leer archivo
prime_data = LOAD 'tasca_2/prime.csv' USING org.apache.pig.piggybank.storage.CSVExcelStorage(
  ',', 'NO_MULTILINE', 'UNIX', 'SKIP_INPUT_HEADER' )
 AS (
    url: chararray,
    title: chararray,
    type:chararray,
    genres:chararray,
    releaseYear: int,
    imdbId:chararray,
    imdbAverageRating: float,
    imdbNumVotes: int,
    availableCountries: chararray
);


-- 1) Mostra el nombre de files de dades que hi ha en total (no s'ha de comptar la capçalera).
grouped_data = GROUP prime_data ALL;
total_rows = FOREACH grouped_data GENERATE COUNT(prime_data);

DUMP total_rows;

-- RESULTADO: (47167)



-- 2) Mostra el nombre de sèries.
series = FILTER prime_data BY type == 'TV Series';
total_series = FOREACH (GROUP series ALL) GENERATE COUNT(series);

DUMP total_series;

-- RESULTADO: (8332)



-- 3) Mostra la mitjana de valoració en IMDB de les pel·lícules que només tenguin el gènere comèdia.
comedy_movies = FILTER prime_data BY genres MATCHES '^Comedy$';
average_rating = FOREACH (GROUP comedy_movies ALL) GENERATE AVG(comedy_movies.imdbAverageRating);

DUMP average_rating;

-- RESULTADO: (5.823483920262313)



-- 4) Mostra el nombre de pel·lícules disponibles a Espanya (ES).
movies_in_spain = FILTER prime_data BY availableCountries MATCHES '.*ES.*' AND type == 'Movie';
total_movies_in_spain = FOREACH (GROUP movies_in_spain ALL) GENERATE COUNT(movies_in_spain);

DUMP total_movies_in_spain;

-- RESULTADO: (3543)



-- 5) Mostra el total de vots en IMDB de totes les sèries del gènere de ciència-ficció (poden haver-hi altres gèneres també).
science_fiction_series = FILTER prime_data BY genres MATCHES '.*Sci-Fi.*' AND type == 'TV Series';
total_votes = FOREACH science_fiction_series GENERATE imdbNumVotes;
total_votes_sum = FOREACH (GROUP total_votes ALL) GENERATE SUM(total_votes);

DUMP total_votes_sum;

-- RESULTADO: (3373251)



-- 6) Mostra de cop la valoració mitjana en IMDB de les pel·lícules i de les sèries de l'any 2024 (per separat les pel·lícules i les sèries).
data_2024 = FILTER prime_data BY releaseYear == 2024 AND (type == 'Movie' OR type == 'TV Series');
average_imdb_2024 = FOREACH (GROUP data_2024 BY type) GENERATE group AS type, AVG(data_2024.imdbAverageRating) AS avg_imdb_rating;

DUMP average_imdb_2024;

/* RESULTADO: (Movie,5.723170728218265)
	      (TV Series,6.7458823512582216)
*/




-- 7) Mostra els 10 anys en què s'han llançat més pel·lícules, ordenats de major a menor nombre de pel·lícules.
movies = FILTER prime_data BY type == 'Movie';
grouped_by_year = GROUP movies BY releaseYear;
count_movies_by_year = FOREACH grouped_by_year GENERATE group AS year, COUNT(movies) AS num_movies;
sorted_movies_by_year = ORDER count_movies_by_year BY num_movies DESC;
top_10_years = LIMIT sorted_movies_by_year 10;

DUMP top_10_years;

/* RESULTADO: (2017,2643)
		(2016,2425)
		(2018,2358)
		(2015,2252)
		(2014,2073)
		(2013,1931)
		(2012,1544)
		(2011,1313)
		(2010,1146)
		(2009,1082)
*/

-- 8) Mostra els 5 anys que tenen una millor valoració mitjana en IMDB de les seves sèries de drama (poden haver-hi altres gèneres també), ordenats de major a menor valoració.
drama_series = FILTER prime_data BY type == 'TV Series' AND genres MATCHES '.*Drama.*';
grouped_by_year = GROUP drama_series BY releaseYear;
average_rating_by_year = FOREACH grouped_by_year GENERATE group AS year, AVG(drama_series.imdbAverageRating) AS avg_rating;
sorted_by_rating = ORDER average_rating_by_year BY avg_rating DESC;
top_5_years = LIMIT sorted_by_rating 5;

DUMP top_5_years;

/* RESULTADO: (1963,8.300000190734863)
		(1967,8.150000095367432)
		(1979,8.019999980926514)
		(1972,8.0)
		(1969,8.0)
*/

-- 9) Exporta a un fitxer els següents camps de les 10 sèries des de l'any 2020 (inclòs) amb millor valoració: title, releaseYear, imdbAverageRating i imdbNumVotes.
series_2020_onwards = FILTER prime_data BY releaseYear >= 2020 AND type == 'TV Series';
ordered_series = ORDER series_2020_onwards BY imdbAverageRating DESC;
top_10_series = LIMIT ordered_series 10;
result = FOREACH top_10_series GENERATE title, releaseYear, imdbAverageRating, imdbNumVotes;

STORE result INTO 'output_series_2020_best_rating' USING PigStorage(',');

-- RESULTADO: No hay resultado ya que hemos usado STORE para guardar el resultado en otro archivo



-- 10) Carrega el fitxer que has exportat i mostra el total de vots en IMDB de totes les sèries que hi conté.
loaded_series = LOAD 'output_series_2020_best_rating' USING PigStorage(',') AS (title:chararray, releaseYear:int, imdbAverageRating:float, imdbNumVotes:int);
total_imdb_votes = FOREACH (GROUP loaded_series ALL) GENERATE SUM(loaded_series.imdbNumVotes);

DUMP total_imdb_votes;

-- RESULTADO: (315240)



