-- Operaciones aritméticas:
-- í strftime('%Y', 'now') devuelve el año actual como texto y
-- CAST(... AS INTEGER) lo convierte a número para poder restarlo.

SELECT title,
  CAST(strftime('%Y', 'now') AS INTEGER) - year AS antiguedad
FROM videogames;

-- Concatenación de texto: Se usa || para unir cadenas de texto

SELECT title || ' (' || year || ')' AS info
FROM videogames;

-- CASE WHEN: Lógica condicional
-- CASE WHEN permite crear columnas con valores basados en condiciones, similar a un if/else

SELECT title,
  CASE
    WHEN year < 2000 THEN 'Clásico'
    WHEN year < 2015 THEN 'Moderno'
    ELSE 'Reciente'
  END AS categoria
FROM videogames;


-- ====== Ejercicio ======
-- 1.Selecciona el título y una columna llamada 'antiguedad'
-- que muestre cuántos años tiene el juego (año actual menos year). Usa strftime para obtener el año actual.

SELECT title, CAST(strftime('%Y', 'now') AS INTEGER) - year as 'Antiguedad'
FROM videogames

-- 2.Usa la concatenación para mostrar una columna llamada 'info' con el formato: 'título
-- (año)'. Por ejemplo: 'Minecraft (2011)'.
SELECT title || ' ('|| year ||')' as info
FROM videogames

-- 3. Usa CASE WHEN para crear una columna 'categoria' que clasifique: 'Clásico' si year < 2000, 'Moderno'
-- si year < 2015, 'Reciente' en otro caso. Muestra title y categoria.
SELECT
  title,
  CASE
   WHEN year < 2000 THEN 'Clásico'
   WHEN year < 2015 THEN 'Moderno'
   ELSE 'Reciente'
  END AS 'categoria'
FROM videogames

-- 4. Selecciona el título, las horas de juego, y una columna 'dedicacion' que muestre 'Casual'
-- si playtime_hours < 20, 'Normal' si es entre 20 y 60 (incluidos), o 'Hardcore' si es mayor que 60.
SELECT
  title,
  playtime_hours,
  CASE
   WHEN playtime_hours < 20 THEN 'Casual'
   WHEN playtime_hours BETWEEN 20 AND 60 THEN 'Normal'
   ELSE 'Hardcore'
  END AS 'dedicacion'
FROM videogames
