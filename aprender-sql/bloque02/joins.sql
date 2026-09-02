-- Uniendo tablas con JOINs: LEFT, RIGHT y FULL OUTER JOINs

-- Los joins permite combinar datos de 2 o más tablas usando una columna común que siempre
-- es el ID.

-- INNER JOIN: Es la intersección entre 2 tablas, devuelve solo las filas que tienen coincidencias
-- en ambas tablas. cláusula ON define la condición de unión para saber que columna se relaciona
-- en ambas tablas.

SELECT videogames.title, developers.name
FROM videogames
INNER JOIN developers ON videogames.developer_id = developers.id;

-- Alias: Se pueden usar alias para simplificar el nombre de las tablas en las consultas.
SELECT v.title, d.name
FROM videogames v
INNER JOIN developers d ON v.developer_id = d.id;

-- SELF JOIN: Una tabla se une consigo misma, útil para comparar filas dentro de la misma tabla.
SELECT v1.title AS juego_1, v2.title AS juego_2, v1.developer_id
FROM videogames v1
INNER JOIN videogames v2
  ON v1.developer_id = v2.developer_id
  AND v1.id < v2.id;

-- CROSS JOIN: Combina cada fila de una tabla con cada fila de otra tabla. Se usa poco a menudo.
-- Se usa para crear un calendario cruzando años con meses
SELECT v.title, d.name
FROM videogames v
CROSS JOIN developers d;

-- ===== EJERCICIO =====

-- 1. Muestra el título del juego y el nombre del desarrollador uniendo ambas tablas con INNER JOIN.
SELECT v.title, d.name
FROM videogames v
INNER JOIN developers d ON v.developer_id = d.id;

-- 2.Muestra el título del juego, el nombre del desarrollador y el país del desarrollador.
SELECT v.title, d.name, d.country
FROM videogames v
INNER JOIN developers d ON (v.developer_id = d.id)

-- 3. Muestra el título y el nombre del desarrollador solo de los juegos publicados después de 2010.
SELECT v.title, d.name
FROM videogames v
INNER JOIN developers d ON (v.developer_id = d.id)
WHERE v.year > "2010"

-- 4. Muestra el título del juego y el año de fundación del desarrollador, solo para juegos
-- con más de 50 horas de juego.
SELECT v.title, d.name
FROM videogames v
INNER JOIN developers d ON (v.developer_id = d.id)
WHERE v.year > "2010"

-- 5. Usa un Self JOIN para encontrar pares de juegos del mismo desarrollador.
-- Muestra juego_1, juego_2 y developer_id. Evita pares duplicados con v1.id < v2.id.
SELECT v1.title AS juego_1, v2.title AS juego_2, v1.developer_id
FROM videogames v1
INNER JOIN videogames v2
 ON (v1.developer_id = v2.developer_id)
 AND v1.id < v2.id -- El id debe ser menor al otro

 SELECT v1.id, v1.title AS juego_1, v2.id, v2.title AS juego_2, v1.developer_id
 FROM videogames v1
 INNER JOIN videogames v2
  ON (v1.developer_id = v2.developer_id)
 AND v1.id < v2.id


-- LEFT JOIN: Devuelve todas las filas de la tabla izquierda (A),
-- y las coincidencias de la derecha (B). Si no hay coincidencia, muestra NULL

SELECT columnas
FROM tabla_izquierda
LEFT JOIN tabla_derecha ON condición;

-- RIGHT JOIN: Lo opuesto: devuelve todas las filas de la tabla derecha (B)
SELECT columnas
FROM tabla_izquierda
RIGHT JOIN tabla_derecha ON condición;

-- FULL OUTER JOIN: Devuelve todas las filas de ambas tablas, con NULL donde no haya coincidencia
SELECT columnas
FROM tabla1
FULL OUTER JOIN tabla2 ON condición;


-- ¿Cuándo usar cada tipo de JOIN?
-- INNER JOIN: cuando solo necesitas datos que tengan coincidencia en ambas tablas. Es el más común
-- LEFT JOIN: cuando necesitas todas las filas de la tabla principal, aunque no tengan
-- coincidencia en la otra tabla. Ejemplo: “todos los usuarios y sus pedidos, incluso los usuarios que nunca compraron nada”.
--
-- RIGHT JOIN: hace lo mismo que LEFT JOIN pero al revés. En la práctica se usa muy poco
-- FULL OUTER JOIN:  cuando necesitas todo de ambos lados, con o sin coincidencia. Es bastante raro en aplicaciones reales.

-- El patrón anti-join: es combinar LEFT JOIN con WHERE ... IS NULL para encontrar registros sin coincidencia
SELECT v.title
FROM videogames v
LEFT JOIN developers d ON v.developer_id = d.id
WHERE d.id IS NULL;

-- ===== Ejercicio =====
-- 1.Usa LEFT JOIN para mostrar el título de todos los videojuegos y el nombre de su
-- desarrollador. Incluye también los juegos sin desarrollador asignado (mostrarán NULL en el nombre).
SELECT v.title, d.name
FROM videogames as v
LEFT JOIN developers as d ON v.developer_id = d.id

-- 2. Encuentra los videojuegos que NO tienen desarrollador asignado. Muestra solo el título.
SELECT v.title
FROM videogames as v
LEFT JOIN developers as d ON v.developer_id = d.id
WHERE d.id IS NULL;

-- 3. Usa RIGHT JOIN para mostrar todos los desarrolladores y los títulos de sus juegos
-- (incluyendo desarrolladores sin juegos).
SELECT d.name, v.title
FROM videogames as v
RIGHT JOIN developers as d
ON v.developer_id = d.id

-- 4. Usa FULL OUTER JOIN para mostrar el título de los juegos y el nombre de los desarrolladores,
-- incluyendo los que no tienen coincidencias.

SELECT d.name, v.title
FROM videogames as v
FULL OUTER JOIN developers as d
ON v.developer_id = d.id
