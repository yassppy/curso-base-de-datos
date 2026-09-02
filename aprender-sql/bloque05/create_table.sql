-- Creando tablas: CREATE TABLE
-- defines la estructura de una nueva tabla, especificando sus columnas, tipos de datos y restricciones.

-- Sintaxis básica
CREATE TABLE nombre_tabla (
  columna1 tipo restricciones,
  columna2 tipo restricciones,
  ...
);

-- IF NOT EXISTS:  Si intentas crear una tabla que ya existe, SQL dará un error.
-- Para evitarlo, usa IF NOT EXISTS
CREATE TABLE IF NOT EXISTS players (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  level INTEGER NOT NULL DEFAULT 1
);

-- Autoincremento:
-- En SQLite, cuando defines una columna como INTEGER PRIMARY KEY, automáticamente
-- se convierte en un campo auto-incrementable. Si no especificas un valor al insertar,
-- SQLite asigna el siguiente número disponible: En SQL Server, usa IDENTITY(1,1). En PostgreSQL,
-- usa GENERATED ALWAYS AS IDENTITY PRIMARY KEY.


-- Claves foraneas: Hace referencia a la clave primary de otra tabla para relacionarlo.
CREATE TABLE scores (
  id INTEGER PRIMARY KEY,
  player_id INTEGER NOT NULL,
  game_id INTEGER NOT NULL,
  points INTEGER NOT NULL,
  FOREIGN KEY (player_id) REFERENCES players(id)
);

-- ==== Ejercicio ====
-- 1. Crea una tabla 'players' con: id (INTEGER, PRIMARY KEY), name (TEXT, NOT NULL) y level
-- (INTEGER, NOT NULL).
CREATE TABLE players(
id INTEGER PRIMARY KEY,
name TEXT NOT NULL,
level INTEGER NOT NULL
);

-- 2. Crea una tabla 'games' con: id (INTEGER, PRIMARY KEY), title (TEXT, NOT NULL), genre (TEXT)
--  y release_year (INTEGER).
CREATE TABLE games (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  genre TEXT,
  release_year INTEGER
);

-- 3. Crea una tabla 'scores' con: id (INTEGER, PRIMARY KEY), player_id (INTEGER, NOT NULL),
--game_id (INTEGER, NOT NULL) y score (INTEGER, NOT NULL).
CREATE TABLE scores (
  id INTEGER PRIMARY KEY,
  player_id INTEGER NOT NULL,
  game_id INTEGER NOT NULL,
  score INTEGER NOT NULL
);
