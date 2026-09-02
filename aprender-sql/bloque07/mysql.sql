-- 1.Muestra el nombre y el precio de todos los productos que cuestan
-- menos de 100, ordenados de más barato a más caro.
SELECT name, price
FROM products
WHERE price < 100
ORDER BY price ASC

-- 2. ¿Qué productos están agotados (stock = 0)? Muestra solo su nombre.
SELECT name
FROM products
WHERE stock = 0

-- 3. Calcula cuántos productos hay en cada categoría y su precio medio.
-- Muestra la categoría, el total de productos (alias 'total') y el precio medio (alias 'precio_medio').
SELECT category, COUNT(*) as 'total', AVG(price) as 'precio_medio'
FROM products
GROUP BY category

-- 4. Calcula el valor total del inventario de cada producto (precio × stock).
-- Muestra el nombre y el valor (alias 'valor_inventario'), ordenado de mayor a menor.
SELECT name, SUM(price * stock) as 'valor_inventario'
FROM products
GROUP BY name
ORDER BY valor_inventario DESC
