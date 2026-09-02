-- Subconsultas: consultas dentro de consultas
-- Una subconsulta es una consulta SELECT dentro de otra consulta SQL.
-- Se escribe entre paréntesis y se ejecuta primero
-- Usa subconsultas cuando la lógica sea más clara o necesites un valor agregado para comparar

-- Subconsultas en WHERE
-- El uso más común es dentro de WHERE para comparar con un valor calculado dinámicamente:
SELECT title, year
FROM videogames
WHERE year = (SELECT MAX(year) FROM videogames);

-- Subconsultas con IN
-- Cuando la subconsulta devuelve múltiples filas, usa IN en vez de =
SELECT title, developer
FROM videogames
WHERE developer IN (
  SELECT developer
  FROM videogames
  GROUP BY developer
  HAVING COUNT(*) > 1
);

-- Subconsultas en SELECT
-- Puedes usar una subconsulta como columna calculada en SELECT
SELECT title,
       playtime_hours,
       (SELECT MAX(playtime_hours) FROM videogames) AS max_horas
FROM videogames;

-- EXISTS y NOT EXISTS
-- EXISTS comprueba si una subconsulta devuelve al menos una fila.
-- Es diferente de IN: no compara valores, sino que verifica la existencia de resultados
SELECT title
FROM videogames v
WHERE EXISTS (
  SELECT 1
  FROM videogames v2
  WHERE v2.developer = v.developer
    AND v2.id != v.id
);

-- NOT EXISTS hace lo contrario: devuelve las filas donde la subconsulta no encuentra resultados:
SELECT title, developer
FROM videogames v
WHERE NOT EXISTS (
  SELECT 1
  FROM videogames v2
  WHERE v2.developer = v.developer
    AND v2.id != v.id
);

--- ==== Ejercicios ====
-- 1. Encuentra los videojuegos publicados el mismo año que el juego más reciente. Muestra title y year.
SELECT title, year
FROM videogames
WHERE year = (SELECT MAX(year) FROM videogames)

-- 2. Encuentra los videojuegos de desarrolladores que tienen más de un juego en la tabla.
-- Muestra title y developer.
SELECT title, developer
FROM videogames
WHERE developer IN (
SELECT developer
FROM videogames
GROUP BY developer
HAVING COUNT(*) > 1
);

-- 3. Muestra cada videojuego con su título, horas de juego y el máximo de horas de toda la tabla
-- (alias 'max_horas'). Usa una subconsulta en SELECT.
SELECT
  title,
  playtime_hours,
  (SELECT MAX(playtime_hours)
  FROM videogames) AS 'max_horas'
FROM videogames

-- 4. Encuentra el videojuego con más horas de juego usando una subconsulta.
-- Muestra title y playtime_hours.
SELECT
  title,
  playtime_hours
FROM videogames
WHERE playtime_hours = (SELECT MAX(playtime_hours)
  FROM videogames)

-- 5. Usa EXISTS para encontrar los juegos cuyo desarrollador tiene al menos otro
-- juego en la tabla. Muestra title y developer.
SELECT title, developer
FROM videogames v1
WHERE EXISTS( -- Deja pasar la consulta si existe al menos una fila
  SELECT 1
  FROM videogames v2
  WHERE v2.developer = v1.developer -- Conde coinciden
  AND v2.id != v1.id -- Sea un id diferente
)

-- 6. Usa NOT EXISTS para encontrar los juegos cuyo desarrollador
-- solo tiene ese único juego. Muestra title y developer.
SELECT title, developer
FROM videogames v1
WHERE NOT EXISTS (
  SELECT 1
  FROM videogames v2
  WHERE v1.developer = v2.developer
  AND v1.id != v2.id
)
