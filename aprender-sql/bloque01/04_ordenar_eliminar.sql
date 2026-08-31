-- Ordenando y eliminando duplicados
--
-- ORDER BY: Ordena los resultados por una o más columnas.
-- ASC (ascendente): De menor a mayor. Es el valor por defecto.
-- DESC (descendente): De mayor a menor.

SELECT columnas
FROM tabla
ORDER BY columna ASC|DESC;

-- DISTINCT: elimina las filas duplicadas del resultado, devolviendo solo valores únicos.
SELECT DISTINCT columna
FROM tabla;

-- LIMIT y OFFSET Paginación: permite dividir los resultados en páginas.
-- LIMIT: Número máximo de filas a devolver (Cantidad filas).
-- OFFSET: Te permite navegar entre páginas (El salto a la siguiente página).
SELECT * FROM videogames
LIMIT 10 OFFSET 20;

-- Obtener el Top N: devuelve las N filas más altas o más bajas según el orden especificado.
SELECT title, playtime_hours FROM videogames
ORDER BY playtime_hours DESC
LIMIT 3;

-- Ordenar por múltiples columnas: ordena los resultados por varias columnas en orden ascendente o descendente.
SELECT title, year, playtime_hours FROM videogames
ORDER BY year DESC, playtime_hours ASC;


-- ===== Ejercicios =====
-- 1. Selecciona todos los videojuegos ordenados por año de publicación de forma ascendente.
SELECT * FROM videogames ORDER BY year ASC;

-- 2. Selecciona el título y las horas de juego, ordenados por horas de juego de mayor a menor.
SELECT title, playtime_hours
FROM videogames
ORDER BY playtime_hours DESC

-- 3. Selecciona los desarrolladores únicos (sin repetir) de la tabla videogames.
SELECT DISTINCT developer
FROM videogames

-- 4. Selecciona los años únicos en los que se publicaron videojuegos, ordenados de más antiguo a más reciente.
SELECT DISTINCT year
FROM videogames
ORDER BY year ASC

-- 5. Muestra el título y las horas de los 3 videojuegos con más horas de juego (un top 3). Usa ORDER BY y LIMIT.
--
SELECT title, playtime_hours
FROM videogames
ORDER BY playtime_hours DESC
LIMIT 3

-- 6. Pagina los resultados: muestra el título y el año ordenados por año ascendente, saltando los 3 primeros y devolviendo los 3 siguientes. Usa LIMIT y OFFSET.

SELECT title, year
FROM videogames
ORDER BY year ASC
LIMIT 3 OFFSET 3
