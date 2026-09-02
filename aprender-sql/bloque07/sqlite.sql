-- Ejercicio
-- 1.Inserta un nuevo libro: 'Rebelión en la granja' de 'Orwell', del año 1945, sin leer (read = 0).
INSERT INTO books VALUES (7, 'Rebelión en la granja', 'Orwell', 1945, 0)

-- 2. Muestra el título y el año de todos los libros publicados después de 1950,
-- ordenados del más reciente al más antiguo.
SELECT title, year
FROM books
WHERE year > 1950
ORDER BY year DESC

-- 3. Cuenta cuántos libros ha escrito cada autor. Muestra el autor y el total (alias 'total'),
-- ordenados de más a menos libros.
SELECT author, COUNT(id) as 'total'
FROM books
GROUP BY author
ORDER BY total DESC

-- 4. Marca como leídos (read = 1) todos los libros de 'Orwell'.
UPDATE books
SET read = 1
WHERE author = 'Orwell'
