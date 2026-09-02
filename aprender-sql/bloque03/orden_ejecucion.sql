-- Orden de ejecución
SELECT developer, COUNT(*) AS total    -- 5. Selecciona columnas
FROM videogames                         -- 1. Accede a la tabla
WHERE year > 2000                       -- 2. Filtra filas
GROUP BY developer                      -- 3. Agrupa las filas restantes
HAVING COUNT(*) > 1                     -- 4. Filtra grupos
ORDER BY total DESC                     -- 6. Ordena resultado
LIMIT 5;                                -- 7. Limita filas devueltas

-- SÍ puedes usar alias del SELECT en ORDER BY
SELECT developer, COUNT(*) AS total
FROM videogames
GROUP BY developer
ORDER BY total DESC;

-- Recomendación de buena práctica
-- Para escribir un código SQL portable y compatible con cualquier motor
-- (y evitar fallos si cambias de base de datos), se recomienda usar la función de agregación
-- completa en el HAVING. Algunos motores (como MySQL o SQLite) soportan usar alias en HAVING,
-- pero en PostgreSQL provocará un ERROR DE SINTAXIS.


-- ==== Ejercicio ====
-- 1. Muestra el desarrollador y el número de juegos (alias 'total')
-- , solo para desarrolladores con más de 1 juego, ordenados por total de forma descendente.
SELECT developer, COUNT(*) as 'total'
FROM videogames
GROUP BY developer
HAVING COUNT(*) > 1
ORDER BY total DESC

-- 2. Selecciona el desarrollador y su promedio de horas de juego (alias 'promedio'),
-- pero solo para juegos publicados después de 2000, y muestra solo los que tienen un
-- promedio mayor a 30.
SELECT developer, AVG(playtime_hours) as 'promedio'
FROM videogames
WHERE year > 2000
GROUP BY developer
HAVING AVG(playtime_hours) > 30

-- 3. Muestra el año y la cantidad de juegos (alias 'total') publicados ese año,
-- solo para años después del 2000, con al menos 2 juegos, ordenados por total descendente.
SELECT year, COUNT(*) as 'total'
FROM videogames
WHERE year > 2000
GROUP BY year
HAVING COUNT(*) >= 2
ORDER BY total DESC
