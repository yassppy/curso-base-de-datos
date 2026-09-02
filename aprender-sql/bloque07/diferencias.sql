-- Autoincremento
-- SQLite
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT
);

-- PostgreSQL
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name TEXT
);
-- O en PostgreSQL moderno:
CREATE TABLE users (
  id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name TEXT
);

-- MySQL / MariaDB
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
);

-- Boleanos
-- SQLite: no tiene tipo BOOLEAN nativo, usa 0 y 1
SELECT * FROM users WHERE active = 1;

-- PostgreSQL: tiene BOOLEAN nativo
SELECT * FROM users WHERE active = TRUE;

-- MySQL: BOOLEAN es un alias de TINYINT(1)
SELECT * FROM users WHERE active = TRUE; -- TRUE es 1


-- Concatenar texto
-- SQLite y PostgreSQL
SELECT name || ' ' || surname FROM users;

-- MySQL / MariaDB
SELECT CONCAT(name, ' ', surname) FROM users;


-- UPSERT (insertar o actualizar)
-- SQLite
INSERT INTO users (id, name) VALUES (1, 'Ana')
ON CONFLICT(id) DO UPDATE SET name = excluded.name;

-- PostgreSQL
INSERT INTO users (id, name) VALUES (1, 'Ana')
ON CONFLICT(id) DO UPDATE SET name = EXCLUDED.name;

-- MySQL / MariaDB
INSERT INTO users (id, name) VALUES (1, 'Ana')
ON DUPLICATE KEY UPDATE name = VALUES(name);

-- Limitar resultados
-- SQLite, PostgreSQL y MySQL
SELECT * FROM users LIMIT 10;

-- PostgreSQL también soporta el estándar SQL:
SELECT * FROM users FETCH FIRST 10 ROWS ONLY;

-- JSON
-- El más potente es PostgreSQL con JSONB  JSONB almacena JSON en formato binario, permite índices sobre
-- campos JSON y tiene operadores específicos (@>, ?, #>) que lo hacen extremadamente potente.
-- SQLite (soporte básico)
SELECT json_extract(data, '$.name') FROM config;

-- PostgreSQL (soporte avanzado con JSONB)
SELECT data->>'name' FROM config;
SELECT * FROM config WHERE data @> '{"active": true}';

-- MySQL (soporte intermedio)
SELECT JSON_EXTRACT(data, '$.name') FROM config;
-- O con el atajo:
SELECT data->>"$.name" FROM config;



-- Cuando utilizar cada Cuando
-- App web moderna: PostgreSQL gran ecosistema
-- App móvil / escritorio: SQLite sin servidor un solo archivo
-- Datos geoespaciales: PostgreSQL + PostGIS es el estándar para datos geoespaciales
-- Analítica / data warehouse: PostgreSQL Funciones de ventana, CTEs recursivos, JSONB
-- Empezar un proyecto nuevo: PostgreSQL La opción más versátil y con mejor futuro


--- === Ejercicio ===
-- 1. Consulta todos los motores de bases de datos ordenados por año de
--  creación (del más antiguo al más reciente).
SELECT *
FROM engines
ORDER BY year ASC

-- 2. ¿Qué motores tienen licencia que NO sea comercial? Muestra solo el nombre y la licencia.
SELECT name, license
FROM engines
WHERE license NOT LIKE '%comercial%'

-- 3. Cuenta cuántas funcionalidades (features) soporta cada motor.
-- Muestra el nombre del motor y el total (alias 'total_features'), ordenados de
-- más a menos (si hay empate, por nombre).
SELECT name, COUNT(f.id) as 'total_features'
FROM engines as e
LEFT JOIN features as f
ON e.id=f.engine_id
GROUP BY name
ORDER BY total_features DESC, name ASC;


-- 4. Usa el operador || para concatenar el nombre del motor con su tipo entre paréntesis.
-- Por ejemplo: 'SQLite (Embebido)'. Llama a la columna 'motor_info'.
SELECT name || ' (' || type || ')'  as 'motor_info'
FROM engines
