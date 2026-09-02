-- Un índice es una estructura que la base de datos crea para encontrar filas más rápido.
-- Funciona como el índice de un libro: en vez de leer página por página, vas directamente
-- al tema que buscas. Se debe usar únicamente en las columnas que consultes con mucha
-- frecuencia y con miles de datos para mantener un buen rendimiento y ver la diferencia.
-- (Acelera las búsquedas y filtros)

-- Crear un índice
CREATE INDEX nombre_indice ON tabla(columna);
CREATE INDEX idx_videogames_year ON videogames(year);

-- Índices en múltiples columnas
CREATE INDEX idx_videogames_dev_year ON videogames(developer, year);

-- Índices únicos
CREATE UNIQUE INDEX idx_videogames_title ON videogames(title);

-- Eliminar un índice
DROP INDEX IF EXISTS nombre_indice;

-- Ver los índices de una tabla
SELECT name, tbl_name
FROM sqlite_master
WHERE type = 'index';


-- === Ejercicio ===
-- 1. Crea un índice llamado 'idx_videogames_year' en la columna year de la tabla videogames.
CREATE INDEX idx_videogames_year ON videogames(year);

-- 2. Crea un índice compuesto llamado 'idx_videogames_dev_year' en las columnas developer y year.
CREATE INDEX idx_videogames_dev_year ON videogames(developer, year)

-- 3. Crea un índice único llamado 'idx_videogames_title' en la columna title para evitar
-- títulos duplicados.
CREATE UNIQUE INDEX idx_videogames_title ON videogames(title)

-- 4. Consulta todos los índices de la base de datos usando la tabla sqlite_master.
-- Muestra las columnas name y tbl_name.
SELECT name, tbl_name
FROM sqlite_master
WHERE type = 'index'
