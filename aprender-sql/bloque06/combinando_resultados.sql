-- Combinando resultados: UNION, INTERSECT y EXCEPT

-- SQL permite combinar los resultados de dos o más consultas SELECT en uno solo

-- UNION: Combina los resultados de dos o más consultas SELECT, eliminando duplicados automáticamente
SELECT developer FROM videogames WHERE year < 2000
UNION
SELECT developer FROM videogames WHERE playtime_hours > 50;

-- UNION ALL funciona igual pero conserva los duplicados. Es más rápido porque no necesita comparar filas:
SELECT developer FROM videogames WHERE year < 2000
UNION ALL
SELECT developer FROM videogames WHERE playtime_hours > 50;

-- INTERSECT: devuelve solo las filas que aparecen en ambos resultados
SELECT developer FROM videogames WHERE year < 2015
INTERSECT
SELECT developer FROM videogames WHERE playtime_hours > 50;

-- EXCEPT: Devuelve las filas del primer SELECT que no están en el segundo
SELECT developer FROM videogames WHERE year < 2015
EXCEPT
SELECT developer FROM videogames WHERE playtime_hours > 50;

-- Si quieres ordenar el resultado combinado, coloca ORDER BY al final
SELECT title, year FROM videogames WHERE year < 2000
UNION
SELECT title, year FROM videogames WHERE year > 2015
ORDER BY year;

-- Reglas:
-- 1. Todos los SELECT deben tener el mismo número de columnas.
-- 2. Los tipos de datos deben ser compatibles entre sí.
-- 3. Los nombres de columna se toman del primer SELECT


-- ==== Ejercicios ====
-- 1. Usa UNION para obtener una lista sin duplicados de todos los años anteriores a 2000
-- y posteriores a 2015. Muestra solo la columna year.
SELECT year
FROM videogames
WHERE year < 2000
UNION
SELECT year
FROM videogames
WHERE year > 2015

-- 2. Usa UNION ALL para combinar los títulos de juegos con más de 50 horas y los títulos de
-- juegos publicados antes del 2000. ¿Hay duplicados?
SELECT title
FROM videogames
WHERE playtime_hours > 50
UNION ALL
SELECT title
FROM videogames
WHERE year < 2000

-- 3. Usa INTERSECT para encontrar los desarrolladores que tienen juegos publicados entre 2010
-- y 2015 Y también juegos publicados después de 2015.
SELECT developer
FROM videogames
WHERE year BETWEEN 2010 AND 2015
INTERSECT
SELECT developer
FROM videogames
WHERE year > 2015

-- 4. Usa EXCEPT para encontrar los desarrolladores con juegos anteriores a 2015 que NO tengan
-- juegos con más de 60 horas de juego.
SELECT developer
FROM videogames
WHERE year < 2015
EXCEPT
SELECT developer
FROM videogames
WHERE playtime_hours > 60
