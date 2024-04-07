CREATE DATABASE telovendo;
CREATE TABLE cliente (
codigo INT AUTO_INCREMENT PRIMARY KEY,
nombres VARCHAR(50),
apellidos VARCHAR(50),
telefono VARCHAR(15),
direccion VARCHAR(100),
comuna VARCHAR(50),
correo_electronico VARCHAR(100),
fecha_registro DATE,
total_pagado INT
);
CREATE TABLE producto (
sku INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100),
categoria VARCHAR(50),
productor VARCHAR(100),
cantidad_stock INT,
precio INT
);
CREATE TABLE vendedor (
run VARCHAR(12),
nombres VARCHAR(50),
apellidos VARCHAR(50),
fecha_nacimiento DATE,
seccion VARCHAR(50),
salario INT
);
INSERT INTO vendedor (run, nombres, apellidos, fecha_nacimiento, seccion, salario) VALUES
('12345678-9', 'Daniela', 'Bernales', '1990-05-15', 'Electrónica', 815000),
('98765432-1', 'Johanna', 'Cid', '1985-08-20', 'Moda', 730000),
('23456789-0', 'Tomas', 'Galleguillos', '1992-11-10', 'Hogar', 436000),
('34567890-1', 'Laura', 'Rodríguez', '1993-07-25', 'Electrónica', 815000),
('45678901-2', 'Carlos', 'López', '1988-04-12', 'Electrónica', 815000),
('56789012-3', 'Ana', 'Sánchez', '1991-09-30', 'Moda', 730000),
('67890123-4', 'Sergio', 'Díaz', '1987-02-18', 'Hogar', 436000),
('78901234-5', 'Carmen', 'Fernández', '1994-06-05', 'Hogar', 436000),
('89012345-6', 'Mario', 'Ruiz', '1990-10-22', 'Hogar', 436000),
('90123456-7', 'Luisa', 'Gómez', '1986-12-08', 'Moda', 730000);
SELECT * FROM vendedor;
INSERT INTO cliente (nombres, apellidos, telefono, direccion, comuna, correo_electronico, fecha_registro, total_pagado) VALUES
('Daniela', 'Vega', '+56912345678', 'Calle 123', 'Santiago', 'daniela@example.com', '2024-04-05', 865000),
('Gael', 'García Bernal', '+56987654321', 'Avenida 456', 'Providencia', 'gael@example.com', '2024-04-05', 10000),
('Paulina', 'García', '+56913579246', 'Calle 789', 'La Florida', 'paulina@example.com', '2024-04-05', 64000),
('Alfredo', 'Castro', '+56924681357', 'Calle 321', 'Las Condes', 'alfredo@example.com', '2024-04-05', 305000),
('Antonia', 'Zegers', '+56957924683', 'Avenida 987', 'Ñuñoa', 'antonia@example.com', '2024-04-05', 482000),
('Diego', 'Muñoz', '+56936925814', 'Calle 456', 'Santiago', 'diego@example.com', '2024-04-05', 1500000),
('Amparo', 'Noguera', '+56914725836', 'Avenida 741', 'Maipú', 'amparo@example.com', '2024-04-05', 1620000),
('Marcelo', 'Alonso', '+56985214736', 'Calle 852', 'Huechuraba', 'marcelo@example.com', '2024-04-05', 1080000),
('Luis', 'Gnecco', '+56936985274', 'Calle 369', 'Renca', 'luis@example.com', '2024-04-05', 38000),
('Catalina', 'Saavedra', '+56974125836', 'Avenida 852', 'Lo Prado', 'catalina@example.com', '2024-04-05', 2554000),
('Alejandro', 'Goic', '+56996325874', 'Calle 741', 'Santiago', 'alejandro@example.com', '2024-04-05', 1970000),
('Claudia', 'Di Girólamo', '+56985236974', 'Avenida 963', 'Cerrillos', 'claudia@example.com', '2024-04-05', 525600),
('Jaime', 'Vicent', '+56936985274', 'Calle 147', 'Hualpén', 'jaime@example.com', '2024-04-05', 8000),
('Nathalia', 'Aragonese', '+56974185236', 'Calle 369', 'Los Ángeles', 'nathalia@example.com', '2024-04-05', 769990),
('Marcela', 'Said', '+56996385214', 'Avenida 852', 'Santiago', 'marcela@example.com', '2024-04-05', 128700);
SELECT * FROM cliente;
INSERT INTO producto (nombre, categoria, productor, cantidad_stock, precio) VALUES
('Camisa de algodón', 'Moda', 'Fabricante de Ropa S.A.', 50, 19990.00),
('Smart TV 50 pulgadas', 'Electrónica', 'Electronics Inc.', 3, 1349990.00),
('Sofá modular', 'Hogar', 'Mueblería El Descanso', 10, 259990.00),
('Jeans de mezclilla', 'Moda', 'Fabricante de Ropa S.A.', 30, 39990.00),
('Lavadora automática', 'Electrónica', 'Electronics Inc.', 4, 419990.00),
('Set de sábanas de algodón', 'Hogar', 'Textiles del Sur', 40, 49990.00),
('Zapatillas deportivas', 'Moda', 'Calzados Deportivos S.A.', 25, 79990.00),
('Refrigerador de dos puertas', 'Electrónica', 'Electronics Inc.', 5, 679990.00),
('Mesa de centro', 'Hogar', 'Mueblería El Descanso', 8, 89990.00),
('Abrigo de invierno', 'Moda', 'Fabricante de Ropa S.A.', 20, 79990.00);
SELECT * FROM producto;

-- mostrar vendedores con salario superior al promedio
SELECT * FROM vendedor
WHERE salario > (SELECT AVG(salario) FROM vendedor);

-- mostrar los productos con precio mayor al promedio
SELECT * FROM producto
WHERE precio > (SELECT AVG(precio) FROM producto);

-- mostrar clientes que han pagado mas que el promedio
SELECT * FROM cliente
WHERE total_pagado > (SELECT AVG(total_pagado) FROM cliente);

-- empleados con salario inferior al promedio
SELECT * FROM vendedor
WHERE salario < (SELECT AVG(salario) FROM vendedor);

-- productos que son mas baratos que el promedio
SELECT * FROM producto
WHERE precio < (SELECT AVG(precio) FROM producto);

-- nombre y apellido de vendedores con salario > al promedio
SELECT nombres, apellidos FROM vendedor
WHERE salario > (SELECT AVG(salario) FROM vendedor);

-- producto mas caro y mas barato del inventario
SELECT * FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);
SELECT * FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- costo de comprar uno de cada producto
SELECT SUM(precio) AS costo_total FROM producto;

-- comuna con mas clientes registrados
SELECT comuna, COUNT(*) AS cant_clientes_registrados FROM cliente
GROUP BY comuna ORDER BY cant_clientes_registrados DESC
LIMIT 1;

-- productos con > 5 unidades en stock
SELECT * FROM producto
WHERE cantidad_stock > 5;

/* utilidad de usar AUTO INCREMENT: permite otorgar un valor único al campo de una columna a elección, 
ya que cada valor asignado será diferente del anterior (porque irá sumando 1 a cada fila), 
lo que resulta útil sobretodo a la hora de crear claves primarias */







