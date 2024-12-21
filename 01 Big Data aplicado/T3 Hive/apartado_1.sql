CREATE DATABASE soccer;
USE soccer;

-- Crea la tabla para ‘results.csv’
CREATE TABLE soccer.results (
    date DATE,
    home_team STRING,
    away_team STRING,
    home_score INT,
    away_score INT,
    tournament STRING,
    city STRING,
    country STRING,
    neutral BOOLEAN
)
ROW FORMAT DELIMITED 
FIELDS TERMINATED BY '\t'
TBLPROPERTIES ("skip.header.line.count"="1");

-- Crea la tabla para ‘goalscorers.csv’
CREATE TABLE soccer.goalscorers (
    date STRING,
    home_team STRING,
    away_team STRING,
    team STRING,
    scorer STRING,
    minute INT,
    own_goal BOOLEAN,
    penalty BOOLEAN
)
ROW FORMAT DELIMITED  
FIELDS TERMINATED BY '\t' 
TBLPROPERTIES ("skip.header.line.count"="1");

-- Carga los datos en las tablas
-- Usamos 'DATA LOCAL' ya que en mi caso tengo los archivos en un directorio de cloudera local

LOAD DATA LOCAL INPATH "/home/cloudera/tarea_3/apartado_1/results.csv" INTO TABLE soccer.results;
LOAD DATA LOCAL INPATH "/home/cloudera/tarea_3/apartado_1/goalscorers.csv" INTO TABLE soccer.goalscorers;


-- 1 
SELECT COUNT(*) AS num_goles
FROM soccer.goalscorers
WHERE scorer = 'Lionel Messi' AND own_goal = FALSE;

-- 2
SELECT * 
FROM soccer.results
WHERE home_team = 'Spain' OR away_team = 'Spain'
ORDER BY date DESC
LIMIT 5;

-- 3
SELECT 
SUM(CASE WHEN home_team = 'Spain' THEN home_score ELSE 0 END) +
SUM(CASE WHEN away_team = 'Spain' THEN away_score ELSE 0 END) AS total_goles
FROM soccer.results;


-- 4
SELECT scorer, COUNT(*) AS goles
FROM soccer.goalscorers
WHERE team = 'Spain' AND own_goal = FALSE
GROUP BY scorer
ORDER BY goles DESC
LIMIT 5;


-- 5
SELECT DISTINCT g.scorer AS jugador
FROM soccer.goalscorers g
JOIN soccer.results r
  ON g.date = r.date AND g.home_team = r.home_team AND g.away_team = r.away_team
WHERE g.team = 'Spain' 
AND g.penalty = TRUE
AND r.tournament = 'UEFA Euro'
ORDER BY jugador ASC;


-- 6
SELECT g.scorer, COUNT(*) AS goles
FROM soccer.goalscorers AS g
INNER JOIN soccer.results AS r 
ON r.date = g.date
WHERE g.own_goal=FALSE AND r.tournament = 'FIFA World Cup'
GROUP BY g.scorer
ORDER BY goals DESC
LIMIT 5;