USE telovendo;
-- ingresar 5 vendedores mas
SELECT * FROM vendedor;
INSERT INTO vendedor (run, nombres, apellidos, fecha_nacimiento, seccion, salario) VALUES
('14362304-8', 'Solange', 'Quinteros', '1969-02-11', 'Electrónica', 815000),
('6676102-k,', 'Rumilio', 'Riffo', '1950-09-16', 'Hogar', 436000),
('19663789-5', 'Romina', 'Belucci', '2000-01-28', 'Moda', 730000),
('15361302-7', 'Elizabeth', 'Ortega', '1992-05-05', 'Moda', 730000),
('18451551-0', 'Julio', 'Morales', '1994-11-28', 'Hogar', 436000);

-- ingresar 5 nuevos clientes
SELECT * FROM cliente;
INSERT INTO cliente (nombres, apellidos, telefono, direccion, comuna, correo_electronico, fecha_registro, total_pagado) VALUES
('Carolina', 'Soto', '+56987654321', 'Av. Libertad 123', 'Providencia', 'carolina.soto@example.com', '2024-04-05', 18000),
('Manuel', 'Torres', '+56901234567', 'Calle Estrella 456', 'Villarrica', 'manuel.torres@example.com', '2024-04-05', 72000),
('Gabriela', 'Rojas', '+56998765432', 'Av. Principal 789', 'La Union', 'gabriela.rojas@example.com', '2024-04-05', 939900),
('Javier', 'Moya', '+56987654321', 'Calle Central 456', 'Valparaiso', 'javier.moya@example.com', '2024-04-05', 19990),
('Camila', 'Herrera', '+56901234567', 'Av. Independencia 789', 'Recoleta', 'camila.herrera@example.com', '2024-04-05', 39990);

-- ingresar 5 productos
SELECT * FROM producto;
INSERT INTO producto (nombre, categoria, productor, cantidad_stock, precio) VALUES
('Set periféricos pc', 'Electrónica', 'DivDevs',  10, 45990),
('Consola videojuegos VR pro', 'Electrónica', 'Noentiendo', 3, 267000),
('Cortavientos outdoor', 'Moda', 'Flippi', 24, 23990),
('Comedor madera 6 sillas', 'Hogar', 'Fernández Muebles', 1, 310000),
('Alfombra merino mix 200x160', 'Hogar', 'Luxe Textile', 7, 189990);

-- Identifique cual es el salario mínimo entre vendedores.
SELECT * FROM vendedor WHERE salario = (SELECT MIN(salario) FROM vendedor);

-- Identifique cual es el salario máximo entre vendedores.
SELECT * FROM vendedor WHERE salario = (SELECT MAX(salario) FROM vendedor);

-- Súmele el salario mínimo identificado al salario de todos los vendedores.
SELECT MIN(salario) + SUM(salario) AS salario_minimo_y_total_sumados FROM vendedor;

-- Elimine el producto más caro del inventario.
DELETE FROM producto WHERE precio = (SELECT * FROM (SELECT MAX(precio) FROM producto));

-- Cree una tabla que contenga solo los clientes que han pagado más que el promedio.
CREATE TABLE clientes_que_mas_han_pagado AS SELECT * FROM cliente WHERE total_pagado > (SELECT AVG(total_pagado) FROM cliente);

-- Actualice los datos de tres productos.
UPDATE producto SET precio = 21990 WHERE sku = 1;
UPDATE producto SET nombre = 'Jeans 100% mezclilla' WHERE sku = 4;
UPDATE producto SET categoria = 'Deportes' WHERE sku = 13;

-- Actualice los datos de tres vendedores.
UPDATE vendedor SET nombres = 'Tomás' WHERE run = '23456789-0';
UPDATE vendedor SET salario = 462000 WHERE seccion = 'Hogar';
UPDATE vendedor SET run =  '6676102-k' WHERE run = '6676102-k,';

-- Actualice los datos de 1 cliente.
UPDATE cliente SET correo_electronico = 'jaime_jose_vicent@imperya.cl' WHERE codigo = 13;

-- Seleccione el nombre y el apellido de los vendedores que tienen un salario superior al promedio.
SELECT nombres, apellidos FROM vendedor WHERE salario > (SELECT AVG(salario) FROM vendedor);

-- Indique cuál es el cliente con mayor gasto.
SELECT * FROM cliente ORDER BY total_pagado DESC LIMIT 1; 

