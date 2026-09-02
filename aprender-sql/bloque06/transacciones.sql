-- Transacciones: BEGIN, COMMIT y ROLLBACK
-- Las transacciones son un grupo de operaciones SQL que se ejecutan como una sola unidad:
-- o se aplican todas (COMMIT) o no se aplica ninguna (ROLLBACK). Esto garantiza la atomicidad
-- (la "A" de ACID) para la fiabilidad de la base de datos.

-- Sintaxis básica
BEGIN TRANSACTION;
-- Operaciones que forman la transacción en espera
UPDATE cuentas SET saldo = saldo - 100 WHERE id = 1;
UPDATE cuentas SET saldo = saldo + 100 WHERE id = 2;
COMMIT; -- Confirma la transacción

-- COMMIT: confirmar los cambios
-- COMMIT guarda permanentemente todos los cambios realizados desde el BEGIN.
-- Una vez ejecutado, no hay vuelta atrás
BEGIN TRANSACTION;
INSERT INTO pedidos (cliente_id, total) VALUES (5, 59.99);
UPDATE clientes SET total_compras = total_compras + 59.99 WHERE id = 5;
COMMIT;

-- ROLLBACK: deshacer los cambios
-- ROLLBACK deshace todos los cambios realizados desde el BEGIN.
-- La base de datos vuelve exactamente al estado anterior a la transacción
BEGIN TRANSACTION;
DELETE FROM videogames WHERE developer = 'Valve';
-- ¡Ups! No queríamos borrar todos los juegos de Valve
ROLLBACK;
-- La tabla queda como estaba antes del DELETE

-- Comportamiento por defecto: autocommit
-- Cuando usas BEGIN, desactivas el autocommit hasta que ejecutes COMMIT o ROLLBACK.
-- Esto se confirma automáticamente
DELETE FROM videogames WHERE id = 1;
-- El registro ya se borró permanentemente, no hay ROLLBACK posible

-- Ejemplo:
BEGIN TRANSACTION;

-- Paso 1: Restar de la cuenta origen
UPDATE cuentas SET saldo = saldo - 500
WHERE id = 1 AND saldo >= 500;

-- Paso 2: Sumar a la cuenta destino
UPDATE cuentas SET saldo = saldo + 500
WHERE id = 2;

COMMIT;

-- Cuándo usar transacciones
-- Varias operaciones deben ser atómicas: transferencias, creación de entidades con relaciones, etc.
-- Necesitas una red de seguridad: antes de ejecutar un UPDATE o DELETE masivo, envuélvelo en una
-- transacción para poder hacer ROLLBACK si el resultado no es el esperado.
-- Rendimiento en inserciones masivas: envolver muchos INSERT en una sola transacción es mucho más
-- rápido que ejecutarlos individualmente

-- Lento: cada INSERT es una transacción independiente
INSERT INTO logs VALUES (1, 'evento1');
INSERT INTO logs VALUES (2, 'evento2');
INSERT INTO logs VALUES (3, 'evento3');
-- ...miles más

-- Rápido: una sola transacción para todos
BEGIN TRANSACTION;
INSERT INTO logs VALUES (1, 'evento1');
INSERT INTO logs VALUES (2, 'evento2');
INSERT INTO logs VALUES (3, 'evento3');
-- ...miles más
COMMIT;

-- === Ejercicios ===
-- 1. Realiza una transferencia de 200€ de Ana (id=1) a Luis (id=2). Usa una transacción:
-- resta de Ana, suma a Luis, y registra ambos moviminetos.

BEGIN TRANSACTION;
UPDATE cuentas SET saldo = saldo - 200 WHERE id=1;
UPDATE cuentas SET saldo = saldo + 200 WHERE id=2;
INSERT INTO movimientos VALUES (4, 1, 'retiro', 200);
INSERT INTO movimientos VALUES (5, 2, 'ingreso', 200);
COMMIT;

-- 2. Inserta un nuevo cliente 'Carlos Ruiz' con saldo inicial de 1000€ y registra ese ingreso de 1000€
-- en la tabla movimientos, todo dentro de una transacción.
BEGIN TRANSACTION;
INSERT INTO cuentas VALUES(4, 'Carlos Ruiz', 1000);
INSERT INTO movimientos VALUES(4, 4, "ingreso", 1000);
COMMIT;

-- 3. Ejecuta un BEGIN, borra todos los movimientos de tipo 'ingreso', y luego haz ROLLBACK para
-- deshacer la operación. Verifica que los datos siguen intactos consultando la tabla movimientos.
BEGIN TRANSACTION;
DELETE FROM movimientos WHERE tipo = "ingreso";

ROLLBACK;

-- 4. Consulta el titular y el saldo de todas las cuentas junto con la suma total de
--  sus movimientos (alias 'total_movimientos'). Usa un JOIN entre cuentas y
--  movimientos agrupando por cuenta.
SELECT c.titular, c.saldo, SUM(m.cantidad) AS 'total_movimientos'
FROM movimientos as m
INNER JOIN cuentas as c
ON (m.cuenta_id = c.id)
GROUP BY c.titular
