# Food Store - Práctico Unidad 3 (Índices y Vistas)

## Cómo reproducir las pruebas de este trabajo
1. Ejecutar primero `schema.sql` para levantar la estructura base.
2. Ejecutar `data.sql` para la carga masiva de datos (pedidos, usuarios, productos).
3. Ejecutar `indices.sql` para aplicar el plan de indexado.
4. Para comprobar la mejora de tiempos detallada en `informe_mediciones.md`, correr las consultas de `queries.sql` con `EXPLAIN ANALYZE` antes y después de aplicar los índices.
5. Ejecutar `views.sql` para crear las vistas de seguridad y la vista materializada.