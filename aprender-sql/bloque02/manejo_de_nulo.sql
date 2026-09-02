-- NULL: Representa la ausencia de un valor
-- MANEJO DE NULL

-- COALESCE: COALESCE devuelve el primer valor no nulo de una lista de argumentos.
-- Es perfecto para reemplazar NULL con un valor por defecto:
SELECT title, COALESCE(developer, 'Desconocido') AS developer
FROM videogames;

-- NULLIF: Convertir un valor a NULL pero es muy útil para evitar divisiones por cero:
SELECT title, playtime_hours / NULLIF(year - 2000, 0) AS ratio
FROM videogames;

-- ==== Ejercicio ====
-- 1. Selecciona todos los videojuegos cuyo desarrollador sea NULL.
SELECT *
FROM videogames
WHERE developer IS NULL

-- 2. Selecciona todos los videojuegos que tengan horas de juego registradas (playtime_hours no es NULL).
SELECT *
FROM videogames
WHERE playtime_hours NOT NULL

-- 3. Selecciona el título y el desarrollador de todos los juegos, mostrando 'Desconocido' cuando el desarrollador sea NULL.
SELECT t.title, IFNULL(t.developer, "Desconocido") as developer
FROM videogames AS t

-- 4. Selecciona el título y las horas de juego, mostrando 0 cuando playtime_hours sea NULL.
SELECT title, IFNULL(playtime_hours, 0) as playtime_hours
FROM videogames
