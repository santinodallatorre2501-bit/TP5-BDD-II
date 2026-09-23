-- Script de carga masiva heredado (Simulación de volumen)
-- Nota: En el entorno real este script inserta los 200.000 pedidos.

INSERT INTO categoria (nombre) VALUES ('Bebidas'), ('Comidas'), ('Postres');
INSERT INTO usuario (nombre, email, contrasena) VALUES ('Juan Perez', 'juan@test.com', 'hash123');

-- Generación de miles de pedidos para pruebas de rendimiento
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..5000 LOOP
        INSERT INTO pedido (fecha, id_usuario, estado) 
        VALUES (NOW() - (random() * interval '30 days'), 1, 'CONFIRMADO');
    END LOOP;
END $$;