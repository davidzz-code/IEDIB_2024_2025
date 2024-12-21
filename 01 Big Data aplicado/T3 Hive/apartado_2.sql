CREATE DATABASE streaming;
USE streaming;

-- Crea la tabla 'streaming' usando la partición estática
CREATE TABLE streaming.movies (
    title STRING,
    type STRING,
    genres STRING,
    releaseYear FLOAT,
    imdbId STRING,
    imdbAverageRating FLOAT,
    imdbNumVotes INT,
    availableCountries STRING
)
PARTITIONED BY(platform STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Carga los datos usando 'DATA LOCAL' una vez más
LOAD DATA LOCAL INPATH '/home/cloudera/tarea_3/apartado_2/amazon.csv' INTO TABLE streaming.movies
PARTITION(platform = 'amazon_prime');
LOAD DATA LOCAL INPATH '/home/cloudera/tarea_3/apartado_2/apple.csv' INTO TABLE streaming.movies
PARTITION(platform = 'apple_tv');
LOAD DATA LOCAL INPATH '/home/cloudera/tarea_3/apartado_2/hbo.csv' INTO TABLE streaming.movies
PARTITION(platform = 'hbo_max');
LOAD DATA LOCAL INPATH '/home/cloudera/tarea_3/apartado_2/hulu.csv' INTO TABLE streaming.movies
PARTITION(platform = 'hulu');
LOAD DATA LOCAL INPATH '/home/cloudera/tarea_3/apartado_2/netflix.csv' INTO TABLE streaming.movies
PARTITION(platform = 'netflix');

-- 1
SELECT platform, COUNT(*) AS num_peliculas
FROM streaming.movies
WHERE type = 'movie'
GROUP BY platform
ORDER BY num_peliculas DESC
LIMIT 1;

-- 2
SELECT title, imdbaveragerating, platform
FROM streaming.movies
WHERE type = 'tv'
ORDER BY imdbaveragerating DESC
LIMIT 5;

-- 3
SELECT platform, SUM(imdbNumVotes) AS total_votos
FROM streaming.movies
WHERE genres LIKE '%Sci-Fi%' 
   OR genres LIKE '%Science Fiction%'
   AND type = 'tv'
GROUP BY platform
ORDER BY total_votos DESC;

-- 4
SELECT releaseyear, COUNT(*) AS num_peliculas
FROM streaming.movies
WHERE type = 'movie'
GROUP BY releaseYear
ORDER BY num_peliculas DESC
LIMIT 5;

