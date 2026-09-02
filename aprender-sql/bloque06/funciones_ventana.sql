-- Funciones de ventana
-- Las funciones de ventana (window functions) realizan cálculos sobre un conjunto de filas relacionadas
-- con la fila actual, sin colapsar el resultado como hacen GROUP BY y las funciones de agregación
-- Cada fila mantiene su identidad y además obtiene un valor calculado.

-- La cláusula OVER()
-- Toda función de ventana usa OVER() para definir la “ventana” de filas sobre la que opera:
-- Con OVER() vacío, la ventana es toda la tabla. Cada fila muestra sus propias horas y además
-- el total global
SELECT title, playtime_hours,
  SUM(playtime_hours) OVER() AS total_horas
FROM videogames;

-- PARTITION BY: dividir en grupos
-- divide las filas en particiones (grupos) y aplica la función dentro de cada grupo
SELECT title, developer, playtime_hours,
  SUM(playtime_hours) OVER(PARTITION BY developer) AS horas_del_dev
FROM videogames;

-- ORDER BY dentro de OVER: funciones de ranking
-- Cuando añades ORDER BY dentro de OVER(), puedes usar funciones que asignan un número a
-- cada fila según su posición:


-- ROW_NUMBER(): Asigna un número secuencial único a cada fila
SELECT title, playtime_hours,
  ROW_NUMBER() OVER(ORDER BY playtime_hours DESC) AS posicion
FROM videogames;

-- RANK() y DENSE_RANK(): Cuando hay empates, RANK() deja huecos en la numeración y DENSE_RANK() no
SELECT title, year,
  RANK() OVER(ORDER BY year) AS rank,
  DENSE_RANK() OVER(ORDER BY year) AS dense_rank
FROM videogames;

-- Ranking por grupos:
-- Combinando PARTITION BY con ORDER BY puedes crear rankings dentro de cada grupo
SELECT title, developer, playtime_hours,
  ROW_NUMBER() OVER(
    PARTITION BY developer
    ORDER BY playtime_hours DESC
  ) AS rank_en_dev
FROM videogames;


-- LAG() y LEAD(): acceder a filas vecinas
-- LAG() accede a la fila anterior y LEAD() a la siguiente
SELECT title, year,
  LAG(title) OVER(ORDER BY year) AS juego_anterior,
  LEAD(title) OVER(ORDER BY year) AS juego_siguiente
FROM videogames;

SELECT title, year,
  year - LAG(year) OVER(ORDER BY year) AS anos_desde_anterior
FROM videogames;

-- Agregaciones como funciones de ventana
-- Todas las funciones de agregación que ya conoces (SUM, AVG, COUNT, MIN, MAX)
-- pueden usarse como funciones de ventana
SELECT title, playtime_hours,
  AVG(playtime_hours) OVER() AS promedio_global,
  playtime_hours - AVG(playtime_hours) OVER() AS diferencia
FROM videogames;


--- ==== Ejercicios ====
-- 1. Muestra title, playtime_hours y una columna 'posicion' con ROW_NUMBER() ordenando
-- por playtime_hours de mayor a menor.
SELECT
  title,
  playtime_hours,
  ROW_NUMBER() OVER(ORDER BY playtime_hours DESC) AS 'posicion'
FROM videogames;


-- 2. Muestra title, developer, playtime_hours y el total de horas por desarrollador
-- (alias 'horas_del_dev') usando SUM como función de ventana con PARTITION BY.
SELECT
  title,
  developer,
  playtime_hours,
    SUM(playtime_hours) OVER(PARTITION BY developer) AS 'horas_del_dev'
FROM videogames

-- 3. Muestra title, year y el título del juego publicado justo antes (alias 'anterior')
-- usando LAG(), ordenando por year.
SELECT
  title,
  LAG(title) OVER(ORDER BY year) AS 'anterior',
  year
FROM videogames

-- 4. Muestra title, developer, playtime_hours y un ranking por horas dentro de cada desarrollador
-- (alias 'rank_en_dev') usando ROW_NUMBER() con PARTITION BY developer ORDER BY playtime_hours DESC.
SELECT
  title,
  developer,
  playtime_hours,
  ROW_NUMBER() OVER(
  PARTITION BY developer
  ORDER BY playtime_hours DESC) AS 'rank_en_dev'
FROM videogames

-- Ranking global
SELECT title, developer, playtime_hours,
ROW_NUMBER() OVER(ORDER BY playtime_hours DESC) AS rank_global
FROM videogames;
