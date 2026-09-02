-- Una vista es una consulta SELECT guardada con un nombre. Funciona como una tabla virtual:
-- no almacena datos por sí misma, sino que ejecuta la consulta cada vez que la usas.

-- Crear una vista
CREATE VIEW nombre_vista AS
SELECT columnas
FROM tabla
WHERE condición;

-- Vista con join
CREATE VIEW catalogo AS
SELECT v.title, d.name AS developer, d.country, v.year
FROM videogames v
JOIN developers d ON v.developer_id = d.id;

-- Usar la vista como si fuera una tabla
SELECT * FROM catalogo WHERE country = 'Japón';

-- Eliminar una vista no afecta a las tablas originales
DROP VIEW IF EXISTS nombre_vista;

-- Para evitar errores si la vista ya existe IF NOT EXISTS
CREATE VIEW IF NOT EXISTS nombre_vista AS
SELECT ...;

--- === Ejercicios === ---
-- 1. Crea una vista llamada 'juegos_largos' con el title y
-- playtime_hours de juegos con más de 50 horas. Luego consulta toda la vista.
CREATE VIEW juegos_largos AS
SELECT title, playtime_hours
FROM videogames
WHERE playtime_hours > 50;

SELECT * FROM juegos_largos;

-- 2. Crea una vista 'catalogo' que une videogames con developers. La vista debe contener
-- title, name (del developer), country y year. Después, consulta title, name y year únicamente
-- de los juegos cuyos desarrolladores tengan country = 'Japón'.
CREATE VIEW catalogo AS
SELECT v.title, d.name, d.country, v.year
FROM videogames v
JOIN developers d ON v.developer_id = d.id;

SELECT title, name, year
FROM catalogo
WHERE country = 'Japón';

-- 3. Crea una vista 'stats_por_dev' con el nombre del desarrollador, el número de juegos (total)
-- y el promedio de horas (avg_horas). Luego muestra solo los que tienen más de 1 juego.
CREATE VIEW stats_por_dev AS
SELECT d.name, COUNT(v.id) as 'total', AVG(v.playtime_hours) as 'avg_horas'
FROM videogames v
JOIN developers d ON v.developer_id = d.id
GROUP BY d.name;

SELECT name, total, avg_horas FROM stats_por_dev
WHERE total > 1;

-- 4. Elimina la vista 'stats_por_dev' de forma segura usando IF EXISTS.
DROP VIEW IF EXISTS stats_por_dev;
