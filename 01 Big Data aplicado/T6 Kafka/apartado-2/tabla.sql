CREATE DATABASE bluesky_db;

USE bluesky_db;

-- El código que crea la tabla no lo he ejecutado ya que 
-- lo ejecuta el archivo del sink automáticamente.

-- Lo dejo aquí anotado simplemente para mostrar la estructura de la tabla

CREATE TABLE generative_ai_posts (
	uri VARCHAR(255),
    cid VARCHAR(255),
    text VARCHAR(255),
    createdAt DATETIME,
    handle VARCHAR(255),
    displayName VARCHAR(255) DEFAULT NULL,
    avatar VARCHAR(500) DEFAULT NULL
);