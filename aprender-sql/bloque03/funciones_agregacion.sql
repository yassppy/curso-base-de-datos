-- Funciones de agregación: COUNT, SUM, AVG, MIN y MAX
-- COUNT(*) cuenta todas las filas, sin importar si tienen valores NULL o no.
-- COUNT(columna) cuenta solo las filas donde esa columna no es NULL.

SELECT COUNT(*) AS total_filas, COUNT(developer) AS con_developer
FROM videogames;

-- Combinar funciones: Puedes usar varias funciones de agregación en una misma consulta

SELECT
  COUNT(*) AS total,
  MIN(year) AS primer_anio,
  MAX(year) AS ultimo_anio
FROM videogames;

-- Agregar con filtros: Puedes combinar funciones de agregación con WHERE para calcular sobre un
-- subconjunto
SELECT AVG(playtime_hours) AS avg_hours
FROM videogames
WHERE year > 2010;

-- GROUP_CONCAT: es una función de agregación que une los valores de una columna en una sola
-- cadena separada por comas, un vistazo todos los elementos de un grupo. Puedes
-- Cambiarlo GROUP_CONCAT(title, ' | ')
SELECT developer, GROUP_CONCAT(title) AS juegos
FROM videogames
GROUP BY developer;

-- NULL y las funciones de agregación:
-- Un dato importante: las funciones SUM, AVG, MIN y MAX ignoran los valores NULL automáticamente.
--  Si tienes 10 filas pero 3 tienen NULL en playtime_hours, AVG(playtime_hours) calculará el promedio
--  solo con las 7 filas que sí tienen valor.

-- ======= Ejercicios =======
-- 1.Cuenta el número total de videojuegos en la tabla. Usa el alias 'total'.
SELECT COUNT(*) AS 'total'
FROM videogames

-- 2.Calcula la suma total de horas de juego de todos los videojuegos. Usa el alias 'total_horas'.
SELECT SUM(playtime_hours) AS 'total_horas'
FROM videogames

-- 3.Calcula el promedio de horas de juego. Usa el alias 'promedio'.
SELECT AVG(playtime_hours) AS 'promedio'
FROM videogames

-- 4. Encuentra el año del videojuego más antiguo (alias 'mas_antiguo') y el del más reciente
-- (alias 'mas_reciente').
SELECT MIN(year) AS 'mas_antiguo', MAX(year) AS 'mas_reciente'
FROM videogames
