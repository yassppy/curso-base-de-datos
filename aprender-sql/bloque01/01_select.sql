-- Consulta básica con SELECT
-- Base de datos: Lugar organizado para guardar información
-- SELECT: Recupera datos de la base de datos
-- FROM: Especifica la tabla de la que se recuperan los datos

-- Selecciona todas las columnas de la tabla
SELECT * FROM videogames;

-- Seleccionar columnas especificas separado por comas
SELECT title, year
FROM videogames;

-- LIMIT: La cláusula LIMIT limita el número de filas devueltas indicando el número máximo de filas a devolver
SELECT * FROM videogames
LIMIT 5; -- Los primeros 5 registros

SELECT title
FROM videogames
LIMIT 5; -- Los primeros 5 registros de la columna title

/*
Esto es para comentarios de varias líneas:

Consejo: Evitar utilizar SELECT * en consultas, especificar las columnas necesarias
*/

-- ==== EJERCICIOS ====
-- 1. Selecciona todos los campos de la tabla videogames.
SELECT * FROM videogames;

-- 2. Selecciona únicamente el título (title) de todos los videojuegos.
SELECT title FROM videogames;

-- 3. Selecciona el título (title) y el año (year) de todos los videojuegos.
SELECT title, year FROM videogames;

-- 4. Selecciona el título (title), el desarrollador (developer) y las horas de juego (playtime_hours).
SELECT title, developer, playtime_hours
FROM videogames;
