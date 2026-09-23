-- Consultas de negocio heredadas de las Semanas 3 y 4

-- 1. Búsqueda de historial de pedidos por fecha (Consulta a optimizar)
SELECT id_usuario, fecha, estado 
FROM pedido 
WHERE fecha BETWEEN '2023-01-01' AND '2023-12-31';

-- 2. Facturación total por categoría
SELECT c.nombre, SUM(dp.cantidad * dp.precio_unitario) as total
FROM pedido p
JOIN detalle_pedido dp ON p.nro_pedido = dp.nro_pedido
JOIN producto prod ON dp.id_producto = prod.id_producto
JOIN categoria c ON prod.id_categoria = c.id_categoria
GROUP BY c.nombre;