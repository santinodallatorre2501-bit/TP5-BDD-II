CREATE VIEW vw_productos_vigentes AS
SELECT p.id_producto, p.nombre, p.precio_lista, c.nombre AS categoria
FROM producto p
JOIN categoria c ON p.id_categoria = c.id_categoria
WHERE p.activo = TRUE;

-- oculta la contraseña del usuario
CREATE VIEW vw_pedidos_usuario AS
SELECT p.nro_pedido, p.fecha, u.nombre, u.email
FROM pedido p
JOIN usuario u ON p.id_usuario = u.id_usuario;

CREATE VIEW vw_detalle_nombres AS
SELECT dp.nro_pedido, dp.cantidad, dp.precio_unitario, prod.nombre AS producto
FROM detalle_pedido dp
JOIN producto prod ON dp.id_producto = prod.id_producto;


-- vista materializada para el reporte mensual
CREATE MATERIALIZED VIEW mv_facturacion_mensual AS
SELECT 
    EXTRACT(MONTH FROM p.fecha) AS mes, 
    c.nombre AS categoria, 
    SUM(dp.cantidad * dp.precio_unitario) AS total
FROM pedido p
JOIN detalle_pedido dp ON p.nro_pedido = dp.nro_pedido
JOIN producto prod ON dp.id_producto = prod.id_producto
JOIN categoria c ON prod.id_categoria = c.id_categoria
GROUP BY 1, 2
WITH DATA;

CREATE UNIQUE INDEX idx_mv_facturacion ON mv_facturacion_mensual(mes, categoria);