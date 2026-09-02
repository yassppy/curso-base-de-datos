-- DROP TABLE elimina una tabla completa de la base de datos, incluyendo toda su estructura y datos.

DROP TABLE nombre_tabla;

-- DROP TABLE IF EXISTS: Para evitar errores si la tabla no existe
DROP TABLE IF EXISTS nombre_tabla;

-- DIFERENCIAS:
-- DELETE: Elimina filas de una tabla, pero no la tabla en sí.
-- DROP TABLE: Elimina una tabla completa, incluyendo su estructura y datos.
-- TRUNCATE TABLE: Elimina todas las filas de una tabla, pero no la tabla en sí.

--- === Ejercicios ===
-- 1. Elimina la tabla 'temp_data'.
DROP TABLE temp_data;

-- 2. Elimina la tabla 'old_games' usando IF EXISTS.
DROP TABLE IF EXISTS old_games;

-- 3. Elimina la tabla 'videogames' y luego crea una nueva tabla 'videogames' con solo dos columnas:
-- id (INTEGER, PRIMARY KEY) y title (TEXT, NOT NULL).
DROP TABLE videogames;

CREATE TABLE videogames(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL
);
