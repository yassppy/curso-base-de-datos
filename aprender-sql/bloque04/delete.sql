-- Eliminando registros: DELETE
-- La sentencia DELETE te permite eliminar filas de una tabla. Al igual que con UPDATE,
--  siempre debes usar WHERE para especificar qué filas eliminar.

DELETE FROM tabla
WHERE condición;

-- Eliminar con condiciones
DELETE FROM videogames WHERE year < 1990;
DELETE FROM videogames WHERE developer = 'Valve';
DELETE FROM videogames WHERE playtime_hours > 1000;

-- Buenas practicas SELECT antes que DELETE
-- Al igual que con UPDATE, antes de eliminar registros conviene ejecutar un SELECT con
-- la misma condición WHERE para verificar exactamente qué filas se van a borrar:

-- Primero revisa qué vas a eliminar
SELECT * FROM videogames WHERE year < 1990;

-- Si estás conforme, ejecuta el DELETE
DELETE FROM videogames WHERE year < 1990;

-- DELETE FROM tabla elimina filas de la tabla, pero la tabla sigue existiendo con su
-- estructura (columnas, tipos, restricciones).
-- Puedes usar WHERE para borrar solo algunas filas.

-- Elimina todas las filas, pero la tabla sigue existiendo
DELETE FROM videogames;

-- DROP TABLE tabla elimina la tabla por completo: estructura, datos y todo. La tabla
-- deja de existir en la base de datos.
DROP TABLE videogames;

-- TRUNCATE TABLE tabla elimina todas las filas de la tabla, pero la estructura de la tabla
-- sigue existiendo. Se puede poner para que reinicie el contador de autoincremento a 1
TRUNCATE TABLE videogames RESTART IDENTITY;


-- ==== Ejercicios ====
-- 1. Elimina el videojuego con id 8 (Portal 2).
DELETE FROM videogames
WHERE id = 8

-- 2. Elimina todos los videojuegos publicados antes de 1990.
DELETE FROM videogames
WHERE year < 1990

-- 3. Elimina todos los videojuegos del desarrollador 'Rockstar Games'.
DELETE FROM videogames
WHERE developer = "Rockstar Games"
