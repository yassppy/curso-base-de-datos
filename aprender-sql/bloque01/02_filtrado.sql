-- Filtrado de datos
-- CLAUSULA WHERE: Filtra las filas que devuelve una consulta.
-- Solo se mostrarán las filas que cumplan la condición especificada.

SELECT columnas
FROM tabla
WHERE condición;

-- Operadores de comparación: =, <, >, <=, >=, <>
-- Operadores lógicos: AND, OR, NOT

-- Filtrado por un valor exacto
SELECT * FROM videogames WHERE year = 2018;

-- Filtrado por comparaciones
SELECT title, playtime_hours
FROM videogames
WHERE playtime_hours > 50;

-- Filtrar por texto
SELECT * FROM videogames WHERE developer = 'Nintendo';

-- Combinación de condiciones AND, OR, NOT

-- AND: Ambas condiciones deben ser verdaderas
SELECT * FROM videogames WHERE year = 2018 AND playtime_hours > 50;

-- OR: Al menos una condición debe ser verdadera
SELECT * FROM videogames
WHERE developer = 'Nintendo' OR developer = 'Valve';

-- NOT: La condición no debe ser verdadera
SELECT * FROM videogames
WHERE NOT developer = 'Nintendo';

-- Paréntesis para controlar el orden: AND tiene prioridad sobre OR
SELECT * FROM videogames
WHERE (developer = 'Nintendo' OR developer = 'Valve')
AND year > 2000;

-- ===== Ejercicios =====

-- 1. Selecciona todos los videojuegos publicados en el año 2018.
SELECT * FROM videogames WHERE year = 2018;

-- 2. Selecciona el título y el año de los videojuegos con más de 50 horas de juego.
SELECT title, year
FROM videogames
WHERE playtime_hours > 50;

-- 3. Selecciona todos los videojuegos desarrollados por 'Nintendo'.
SELECT *
FROM videogames
WHERE developer = "Nintendo";

-- 4. Selecciona el título de los videojuegos publicados antes del año 2000.
SELECT title
FROM videogames
WHERE year < "2000"

-- 5. Selecciona los videojuegos de 'Nintendo' o 'Valve' que además se hayan publicado después del año 2000. Usa paréntesis para agrupar el OR.
SELECT *
FROM videogames
WHERE (developer = "Nintendo" OR developer = "Valve")
AND year > "2000"
