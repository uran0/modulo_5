CREATE DATABASE creditos;
USE creditos;
CREATE TABLE cuentas (
id VARCHAR(1),
cuenta  VARCHAR(12) PRIMARY KEY,
saldo_TLVcoins INT CHECK(saldo_TLVcoins >= 0),
nombre VARCHAR(20)
);
CREATE TABLE usuarios (
run VARCHAR(10) PRIMARY KEY,
nombre VARCHAR(20),
apellido VARCHAR(20),
cuenta VARCHAR(12),
FOREIGN KEY (cuenta) REFERENCES cuentas(cuenta)
);
CREATE TABLE contacto (
id VARCHAR(1) PRIMARY KEY,
nombre VARCHAR(20),
correo_e VARCHAR(40),
telefono VARCHAR(15),
cuenta VARCHAR(12),
FOREIGN KEY (cuenta) REFERENCES cuentas(cuenta)
);
INSERT INTO cuentas (id, cuenta, saldo_TLVcoins, nombre)
VALUES
('A', '777183393960', 260, 'Margarita'),
('B', '777143613038', 100, 'Ramón'),
('C', '777176212108', 500, 'Sussy'),
('D', '777225028819', 80, 'David');
INSERT INTO usuarios (run, nombre, apellido, cuenta)
VALUES
('18339396-0', 'Margarita', 'Flores', '777183393960'),
('14361303-8', 'Ramón', 'Nieto', '777143613038'),
('17621210-8', 'Sussy', 'Montenegro', '777176212108'),
('22502881-9', 'David', 'Hernandez', '777225028819');
INSERT INTO contacto (id, nombre, correo_e, telefono)
VALUES
('A', 'Margarita', 'margarita@mail.com', '123456878'),
('B', 'Ramón', 'ramoncete@miemail.com', '213458769'),
('C', 'Sussy', 'sussy_monte@imeil.com', '987543622'),
('D', 'David', 'david.david@divad.cl', '879558797');
-- Transfiera 200 TLV Coins desde un usuario A a un usuario B.
START TRANSACTION;
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins - 200 WHERE id = 'A';
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins + 200 WHERE id = 'B';
-- para verificar manualmente luego de cada actualizacion
SELECT * FROM cuentas;
SELECT * FROM usuarios;
-- deshacer transferencia de usuario A a B
ROLLBACK;
-- Transfiera 150 TLV Coins desde un usuario B a un usuario C.
START TRANSACTION;
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins - 150 WHERE id = 'B';
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins + 150 WHERE id = 'C';
-- deshacer transferencia de usuario B a C, B no tiene saldo suficiente (debe alertar el check)
ROLLBACK;
-- Transfiera 500 TLV Coins desde un usuario C a un usuario D.
START TRANSACTION;
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins - 500 WHERE id = 'C';
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins + 500 WHERE id = 'D';
-- confirmar transferencia de usuario C a D
COMMIT;
-- Transfiera 200 TLV Coins desde un usuario D a un usuario A.
START TRANSACTION;
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins - 200 WHERE id = 'D';
UPDATE cuentas SET saldo_TLVcoins = saldo_TLVcoins + 200 WHERE id = 'A';
-- confirmar transferencia de usuario D a A
COMMIT;







