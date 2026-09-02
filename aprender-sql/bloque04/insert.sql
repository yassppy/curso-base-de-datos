-- INSERT INTO
-- Inserta un nuevo registro en la tabla

-- Sintaxis
INSERT INTO tabla (columna1, columna2, ...)
VALUES (valor1, valor2, ...);

-- Insertar en orden (No recomendable es mejor definir los campos)
INSERT INTO tabla
VALUES (valor1, valor2, valor3, ...);

-- Insertar múltiples registros (No recomendable es mejor definir los campos)
INSERT INTO tabla VALUES
(valor1a, valor2a, ...),
(valor1b, valor2b, ...);

-- Otra forma de insertar múltiples registros
INSERT INTO tabla (columna1, columna2, ...)
VALUES
(valor1, valor2, ...),
(valor1b, valor2b, ...);


-- Consejo: Al omitir el id, SQLite asigna automáticamente el siguiente valor disponible
-- Esto evita conflictos con ids duplicados y simplifica las inserciones.

-- INSERT OR IGNORE simplemente ignora la fila que causa el conflicto, sin generar error:
INSERT OR IGNORE INTO videogames
  (id, title, developer, year, playtime_hours)
VALUES (1, 'Otro juego', 'Otro dev', 2020, 50);
-- No hace nada porque ya existe id = 1

-- En PostgreSQL ignorando duplicados si los hay con ON CONFLICT DO NOTHING
INSERT INTO EMPLOYEE VALUES (0001, 'Clark', 'Sales') ON CONFLICT (empId) DO NOTHING;


-- INSERT OR REPLACE reemplaza la fila existente con los nuevos datos:
INSERT OR REPLACE INTO videogames
  (id, title, developer, year, playtime_hours)
VALUES (1, 'Zelda Remaster', 'Nintendo', 2024, 30);
-- Sustituye el registro con id = 1

-- En PostgreSQL reemplazando duplicados si los hay con ON CONFLICT DO UPDATE
INSERT INTO EMPLOYEE VALUES (0001, 'Clark Kent', 'Marketing')
ON CONFLICT (empId) DO UPDATE SET
  name = EXCLUDED.name,
  dept = EXCLUDED.dept;


-- ==== Ejercicio ====
-- 1.Inserta un nuevo videojuego: id 13, título 'Elden Ring', desarrollador
-- 'FromSoftware', año 2022, 150 horas de juego.
INSERT INTO videogames (id, title, developer, year, playtime_hours)
VALUES (13, 'Elden Ring', 'FromSoftware', 2022, 150);

-- 2. Inserta un nuevo videojuego especificando los nombres de las columnas: id 14, título 'Hollow Knight',
--  desarrollador 'Team Cherry', año 2017, 40 horas.
INSERT INTO videogames (id, title, developer, year, playtime_hours)
VALUES (14, 'Hollow Knight', 'Team Cherry', 2017, 40);

-- 3. Inserta dos videojuegos a la vez: (15, 'Celeste', 'Matt Makes Games', 2018, 12) y
--  (16, 'Stardew Valley', 'ConcernedApe', 2016, 200).
INSERT INTO videogames (id, title, developer, year, playtime_hours)
VALUES
  (15, 'Celeste', 'Matt Makes Games', 2018, 12),
  (16, 'Stardew Valley', 'ConcernedApe', 2016, 200);
