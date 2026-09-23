-- indice para reporte de fechas
CREATE INDEX idx_pedido_fecha ON pedido(fecha);

-- descarte: CREATE INDEX idx_producto_activo ON producto(activo);
-- motivo: sobreindexacion, la columna tiene baja cardinalidad (solo true/false) y haria mas lentos los inserts