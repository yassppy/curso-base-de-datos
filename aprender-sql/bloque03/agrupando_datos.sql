-- Agrupando datos
-- GROUP BY: agrupa filas que tienen los mismos valores en una columna,
-- permitiéndote aplicar funciones de agregación a cada grupo.
SELECT developer, COUNT(*) AS total
FROM videogames
GROUP BY developer;

-- HAVING: es como WHERE, pero para filtrar grupos en lugar de filas individuales.
-- Se usa después de GROUP BY
SELECT developer, COUNT(*) AS total
FROM videogames
GROUP BY developer
HAVING COUNT(*) > 1;

-- Diferencia entre WHERE y HAVING:
-- WHERE: filtra filas individuales antes de agruparlos.
-- HAVING: filtra grupos después de agruparlos.

SELECT developer, COUNT(*) AS total
FROM videogames
WHERE year > 2000         -- Primero filtra filas
GROUP BY developer        -- Luego agrupa
HAVING COUNT(*) > 1;      -- Finalmente filtra grupos

-- Agrupar por múltiples columnas:
-- Puedes agrupar por más de una columna para obtener combinaciones más específicas
SELECT developer, year, COUNT(*) AS total
FROM videogames
GROUP BY developer, year;

-- ===== Ejercicio =====
-- 1. Cuenta cuántos videojuegos ha desarrollado cada developer. Muestra developer y el total
-- (alias 'total')
SELECT developer, COUNT(*) as 'total'
FROM videogames
GROUP BY developer

-- 2. Calcula el promedio de horas de juego por desarrollador. Muestra developer y el promedio
-- (alias 'promedio').
SELECT developer, AVG(playtime_hours) as 'promedio'
FROM videogames
GROUP BY developer

-- 3. Muestra solo los desarrolladores que tienen más de 1 videojuego. Muestra developer
-- y el total (alias 'total').
SELECT developer, COUNT(*) AS 'total'
FROM videogames
GROUP BY developer
HAVING total > 1

-- 4. Muestra los años en que se publicaron 2 o más videojuegos, ordenados por año.
--  Muestra year y el total (alias 'total').
SELECT year, COUNT(*) as 'total'
FROM videogames
GROUP BY year
HAVING total >= 2
