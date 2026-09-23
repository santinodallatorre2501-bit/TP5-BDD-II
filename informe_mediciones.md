# Informe de Mediciones - Food Store

## Parte A: Índices
* **Consulta a optimizar:** Búsqueda del historial de pedidos filtrados por rango de fechas.
* **Tiempo antes:** Seq Scan (680 ms).
* **Índice aplicado:** CREATE INDEX idx_pedido_fecha ON pedido(fecha);
* **Tiempo después:** Bitmap Index Scan (45 ms).

* **Índice descartado por sobreindexación:** Se propuso crear CREATE INDEX idx_producto_activo ON producto(activo);.
* **Justificación:** Se descartó porque la columna `activo` es booleana (solo true/false), teniendo muy baja cardinalidad. El motor seguiría haciendo un Seq Scan, y el índice solo penalizaría el rendimiento de las escrituras (INSERT/UPDATE) sin aportar ningún beneficio en la lectura.