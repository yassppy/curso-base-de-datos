-- Búsquedas avanzadas: BETWEEN, IN y LIKE
-- BETWEEN: selecciona valores dentro de un rango (ambos extremos incluidos)

SELECT * FROM videogames
WHERE year BETWEEN 2010 AND 2015;

-- IN: permite comprobar si un valor coincide con alguno de una lista
SELECT * FROM videogames
WHERE developer IN ('Nintendo', 'Valve', 'Bungie');

-- LIKE: permite buscar valores que coincidan con un patrón
SELECT * FROM videogames
WHERE title LIKE 'The%';

-- Negando búsquedas: NOT
-- NOT BETWEEN: Excluye un rango de valores, en este caso fuera del rango 2010–2015
SELECT * FROM videogames
WHERE year NOT BETWEEN 2010 AND 2015;

-- NOT IN: Excluye valores de una lista
SELECT * FROM videogames
WHERE developer NOT IN ('Nintendo', 'Valve');

-- NOT LIKE: Excluye valores que coincidan con un patrón
SELECT * FROM videogames
WHERE title NOT LIKE 'The%';

-- Consejo: En PosgreSQL, LIKE es case-sensitive, usa ILIKE para búsquedas case-insensitive
-- ILIKE: Excluye valores que coincidan con un patrón, ignorando mayúsculas/minúsculas
SELECT * FROM videogames
WHERE title ILIKE 'the%';


-- ==== Ejercicio ====
-- 1. Selecciona todos los videojuegos publicados entre 2010 y 2015 (ambos incluidos).
SELECT * FROM videogames WHERE year BETWEEN 2010 AND 2015;

-- 2. Selecciona el título y el desarrollador de los videojuegos de 'Nintendo' o 'Valve'.
SELECT title, developer
FROM videogames
WHERE developer IN ('Nintendo', 'Valve')

-- 3. Selecciona todos los videojuegos cuyo título comience con 'The'.
SELECT *
FROM videogames
WHERE title LIKE "The%"

-- 4. Selecciona el título y las horas de juego de los videojuegos cuyo título contenga la palabra 'of'.
SELECT title, playtime_hours
FROM videogames
WHERE title LIKE "%of%"
