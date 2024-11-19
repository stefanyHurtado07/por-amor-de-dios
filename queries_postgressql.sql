
-- consulta PostgreSQL

-- Listar cómics por menos de $20
SELECT FORM Comics WHERE precio < 20 ORDER BY titulo;

--Clientes que han comprado más de 5 veces

SELET C.nombre, COUNT(T.id_transaccion) AS total_compras, SUM(T.total) AS gasto_total
FROM Clientes C
JOIN Transacciones T ON C.id_cliente= T.id_cliente
GROUP BY C.id_cliente, C.nombre
HAVING COUNT(T.id_transaccion) > 5;

- Categorías de cómics más populares

SELECT categoria, COUNT(T.id_transaccion) AS total_compras
FROM Comics C
JOIN Transacciones T ON C.id_comic = T.id_comic
GROUP BY categoria
ORDER BY total_compras DESC
LIMIT 1;
