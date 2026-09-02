-- Modificando estructuras: ALTER TABLE
-- ALTER TABLE te permite cambiar la estructura de una tabla existente sin perder los datos.
-- Es útil cuando necesitas evolucionar tu esquema.
-- Limitaciones en SQLite: No permite cambiar el tipo de una columna existente ni añadir restricciones.

-- Añadir una columna
ALTER TABLE videogames
ADD COLUMN rating REAL;

-- Renombrar una columna
ALTER TABLE videogames
RENAME COLUMN playtime_hours TO hours;

-- Renombrar la tabla
ALTER TABLE videogames
RENAME TO games;

-- Eliminar columnas
ALTER TABLE videogames
DROP COLUMN playtime_hours;

-- Patrón migración seguro:
-- Cuando modificas la estructura de tablas en producción, sigue estos pasos para evitar pérdida de datos:
-- 1. Haz un respaldo de la base de datos antes de cualquier cambio estructural.
-- 2. Usa transacciones para poder revertir si algo sale mal

BEGIN TRANSACTION;
ALTER TABLE videogames ADD COLUMN rating REAL DEFAULT 0;
-- Si todo va bien:
COMMIT;
-- Si algo falla:
-- ROLLBACK; Para revertir los cambios

-- === EJERCICIOS ===
-- 1. Añade una nueva columna 'rating' de tipo REAL a la tabla videogames.
ALTER TABLE videogames
ADD rating REAL

-- 2. Renombra la columna 'playtime_hours' a 'hours' en la tabla videogames.
ALTER TABLE videogames
RENAME COLUMN playtime_hours TO hours;

-- 3. Renombra la tabla 'videogames' a 'games'.
ALTER TABLE videogames
RENAME TO games;
