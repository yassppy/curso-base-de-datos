-- Modificando datos: UPDATE

-- La sentencia UPDATE te permite modificar datos existentes en una tabla.
-- Es fundamental combinarla con WHERE para actualizar solo las filas deseadas y no todos.
UPDATE tabla
SET columna1 = valor1, columna2 = valor2
WHERE condición;

-- Actualizar múltiples columnas
UPDATE videogames
SET developer = 'CD Projekt', year = 2016
WHERE title = 'The Witcher 3';

-- Buenas prácticas: SELECT antes de UPDATE
-- Antes de ejecutar un UPDATE, es muy recomendable ejecutar primero un
-- SELECT con la misma cláusula WHERE para verificar qué filas se van a modificar:

-- Primero comprueba qué filas se van a ver afectadas
SELECT * FROM videogames WHERE developer = 'Nintendo';

-- Si el resultado es el esperado, ejecuta el UPDATE
UPDATE videogames
SET playtime_hours = playtime_hours + 10
WHERE developer = 'Nintendo';

-- ==== Ejercicio ====
-- 1. Actualiza las horas de juego de 'Minecraft' (id 5) a 10000.
UPDATE videogames
SET
 playtime_hours = 10000
WHERE id = 5;

-- 2.Cambia el nombre del desarrollador de 'The Witcher 3' a 'CD Projekt'.
UPDATE videogames
SET
 developer = 'CD Projekt'
WHERE id = 4;

-- 3.Aumenta en 10 las horas de juego de todos los videojuegos de 'Rockstar Games'.
UPDATE videogames
SET
 playtime_hours = playtime_hours + 10
WHERE developer = 'Rockstar Games'
