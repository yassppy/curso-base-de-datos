-- Expresiones de tabla comunes: CTEs
-- Es una consulta temporal con nombre que puedes definir antes de tu consulta principal
-- usando la palabra clave WITH, Piensa en ella como una variable que almacena un resultado
-- intermedio para usarlo después.

-- Sintaxis:
WITH nombre_cte AS (
  SELECT ...
)
SELECT * FROM nombre_cte;


-- Subconsulta anidada
-- Es una consulta que se ejecuta dentro de otra consulta, como una subconsulta.
SELECT developer, total
FROM (
  SELECT developer, COUNT(*) AS total
  FROM videogames
  GROUP BY developer
)
WHERE total > 1;

-- Con CTEs
WITH conteo AS (
  SELECT developer, COUNT(*) AS total
  FROM videogames
  GROUP BY developer
)
SELECT developer, total
FROM conteo
WHERE total > 1;

-- Puedes definir varias CTEs separadas por comas
WITH
juegos_largos AS (
  SELECT title, developer, playtime_hours
  FROM videogames
  WHERE playtime_hours > 50
),
conteo_devs AS (
  SELECT developer, COUNT(*) AS total
  FROM videogames
  GROUP BY developer
)
SELECT j.title, j.playtime_hours, c.total
FROM juegos_largos j
JOIN conteo_devs c ON j.developer = c.developer;


-- Tip: Usa CTEs cuando la subconsulta sea compleja
-- o cuando necesites reutilizar el mismo resultado intermedio en varias partes de la consulta.

-- ==== Ejercicios ====
-- 1. Crea una CTE llamada 'clasicos' que seleccione title y year de los juegos anteriores al año 2000.
-- Luego selecciona todo de esa CTE.
WITH clasicos AS (
  SELECT title, year
  FROM videogames
  WHERE year < 2000
)

SELECT * FROM clasicos

-- 2. Crea una CTE 'stats_dev' que cuente juegos por desarrollador (columnas: developer, total).
-- Luego muestra solo los desarrolladores con más de 1 juego.
WITH stats_dev AS (
  SELECT developer, COUNT(*) AS 'total'
  FROM videogames
  GROUP BY developer
)

SELECT * FROM stats_dev
  WHERE total > 1

-- 3. Crea dos CTEs: 'promedio' con el AVG de playtime_hours (alias 'avg_hours'), y 'por_encima'
-- con los juegos cuyas horas superan ese promedio. Muestra title y playtime_hours de 'por_encima'.
WITH promedio AS (
  SELECT AVG(playtime_hours) AS 'avg_hours'
  FROM videogames
),
por_encima AS (
  SELECT title, playtime_hours
  FROM videogames
  WHERE playtime_hours > (SELECT avg_hours FROM promedio )
)

SELECT * FROM por_encima

-- 4. Crea una CTE 'juegos_por_anio' que cuente juegos por año (columnas: year, total).
-- Luego muestra year y total de los años con más de 1 juego, ordenados por total descendente.
WITH juegos_por_anio AS (
  SELECT year, COUNT(*) AS 'total'
  FROM videogames
  GROUP BY year
)

SELECT * FROM juegos_por_anio
WHERE total > 1
ORDER BY total DESC
