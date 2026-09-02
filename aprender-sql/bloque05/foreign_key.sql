-- Claves foráneas: FOREIGN KEY
-- Es una columna que hace referencia a la clave primaria de otra tabla
-- no puedes insertar un valor que no exista en la tabla referenciada.

-- Sintaxis básica
CREATE TABLE videogames (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  developer_id INTEGER NOT NULL,
  FOREIGN KEY (developer_id) REFERENCES developers(id)
  -- Indica que developer_id hace referencia a la columna id de la tabla developers.
);

-- Activar en SQLite al inicio de cada conexión ya que esta desactivada por defecto.
PRAGMA foreign_keys = ON;

-- Crear la tabla padre (la que será referenciada):
CREATE TABLE developers (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL
);

INSERT INTO developers VALUES (1, 'Nintendo'), (2, 'Valve');

-- Crear la tabla hija (la que tiene la clave foránea)
CREATE TABLE videogames (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  developer_id INTEGER NOT NULL,
  FOREIGN KEY (developer_id) REFERENCES developers(id)
);

-- Borrar un registro referenciado
-- ON DELETE CASCADE: elimina automáticamente los registros hijos cuando se elimina el padre.
-- Si borras un desarrollador, se borran automáticamente todos sus juegos
CREATE TABLE videogames (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  developer_id INTEGER,
  FOREIGN KEY (developer_id) REFERENCES developers(id)
    ON DELETE CASCADE
);

-- ON DELETE SET NULL: Pone a NULL la clave foránea de los registros hijos
-- Si borras un desarrollador, se establece developer_id a NULL en los juegos asociados.
CREATE TABLE videogames (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  developer_id INTEGER,
  FOREIGN KEY (developer_id) REFERENCES developers(id)
    ON DELETE SET NULL
);


-- CASCADE es útil cuando los hijos no tienen sentido sin el padre (ej: comentarios de un post).
-- SET NULL es mejor cuando los hijos pueden existir sin la relación
-- (ej: un empleado cuyo departamento se disuelve).

-- === Ejercicio ===
-- 1. Muestra el título de cada videojuego junto al nombre de su desarrollador usando JOIN.
SELECT v.title, d.name
FROM videogames as v
INNER JOIN developers as d
ON (v.developer_id = d.id)

-- 2. Inserta un nuevo desarrollador (6, 'FromSoftware') y luego un videojuego
-- (7, 'Dark Souls', 6, 2011) vinculado a él.
INSERT INTO developers (id, name) VALUES (6, 'FromSoftware');
INSERT INTO videogames (id, title, developer_id, year)
  VALUES (7, 'Dark Souls', 6, 2011);

-- 3. Cuenta cuántos videojuegos tiene cada desarrollador. Muestra el nombre
-- del desarrollador y la cantidad (alias 'total').
SELECT d.name, COUNT(*) as 'total'
FROM videogames as v
INNER JOIN developers as d
ON v.developer_id = d.id
GROUP BY d.name

-- 4. Crea una tabla 'reviews' con: id (INTEGER PRIMARY KEY), videogame_id
-- (INTEGER NOT NULL, FK → videogames), rating (INTEGER NOT NULL) y comment (TEXT).
CREATE TABLE reviews (
  id INTEGER PRIMARY KEY,
  videogame_id INTEGER NOT NULL,
  rating INTEGER NOT NULL,
  comment TEXT
  FOREIGN KEY (videogame_id) REFERENCES videogames(id)
)

-- 5. Inserta dos reviews: (1, 1, 10, 'Obra maestra') para Zelda y
-- (2, 4, 9, 'Increíble mundo abierto') para The Witcher 3.
INSERT INTO reviews (videogame_id, rating, comment)
VALUES
 (1, 10, 'Obra maestra'),
 (4, 9, 'Increíble mundo abierto')
