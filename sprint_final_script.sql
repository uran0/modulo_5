CREATE DATABASE soporte;
USE soporte;
CREATE TABLE usuario (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
edad INT,
correo_electronico VARCHAR(50),
total_usos_app INT DEFAULT 1
);
DELIMITER //
CREATE TRIGGER after_insert_atenciones_usuario
AFTER INSERT ON atenciones
FOR EACH ROW
BEGIN
    UPDATE usuario
    SET total_usos_app = total_usos_app + 1
    WHERE id_usuario = NEW.id_usuario;
END;
//
DELIMITER ;
CREATE TABLE operario (
id_operario VARCHAR(30) PRIMARY KEY,
nombre VARCHAR(50),
apellido VARCHAR(50),
edad INT,
correo_electronico VARCHAR(50),
soportes_atendidos INT DEFAULT 1
);
CREATE TABLE atenciones (
id_atencion INT AUTO_INCREMENT PRIMARY KEY,
id_operario VARCHAR(30),
id_usuario INT,
fecha DATE,
evaluacion INT,
FOREIGN KEY (id_operario) REFERENCES operario(id_operario),
FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);
DELIMITER //
CREATE TRIGGER before_insert_atenciones
BEFORE INSERT ON atenciones
FOR EACH ROW
BEGIN
    SET NEW.fecha = CURRENT_DATE;
END;
//
CREATE TRIGGER after_insert_atenciones
AFTER INSERT ON atenciones
FOR EACH ROW
BEGIN
    UPDATE operario
    SET soportes_atendidos = soportes_atendidos + 1
    WHERE id_operario = NEW.id_operario;
END;
//
DELIMITER ;
INSERT INTO usuario (nombre, apellido, edad, correo_electronico)
VALUES
('Alexandra', 'Drewchin', 35, 'eartheater@phoenix.com'),
('Claire', 'Boucher', 36, 'grimes@harmony.com'),
('Salvador', 'Navarrete', 32, 'segabodega@dennis.com'),
('Nat', 'Cmiel', 26, 'yeule@theproject.com'),
('Alejandra', 'Ghersi', 34, 'arca10000000@kick.com');
INSERT INTO operario (id_operario, nombre, apellido, edad, correo_electronico)
VALUES
('amunoz', 'Alan', 'Muñoz', 49, 'alanmunoz72@telovendo.cl'),
('dbernales', 'Daniela', 'Bernales', 18, 'dpaz@telovendo.cl'),
('tgalleguillos', 'Tomas', 'Galleguillos', 32, 'tomasin@telovendo.cl'),
('jcid', 'Johanna', 'Cid', 30, 'johanna_cid@telovendo.cl'),
('hcaballero', 'Hugo', 'Caballero', 19, 'hugohugoc@telovendo.cl');
INSERT INTO atenciones (id_operario, id_usuario, evaluacion)
VALUES
('amunoz', 1, 5),
('dbernales', 2, 4),
('tgalleguillos', 3, 3),
('hcaballero', 4, 7),
('hcaballero', 5, 1),
('tgalleguillos', 2, 6),
('dbernales', 2, 2),
('tgalleguillos', 5, 4),
('hcaballero', 4, 7),
('hcaballero', 5, 3);
-- Seleccione las 3 operaciones con mejor evaluación.
SELECT id_atencion, id_operario, id_usuario, fecha, evaluacion FROM atenciones
ORDER BY evaluacion DESC
LIMIT 3;
-- Seleccione las 3 operaciones con menos evaluación.
SELECT id_atencion, id_operario, id_usuario, fecha, evaluacion FROM atenciones
ORDER BY evaluacion ASC
LIMIT 3;
-- Seleccione al operario que más soportes ha realizado.
SELECT * FROM operario
ORDER BY soportes_atendidos DESC
LIMIT 1;
-- Seleccione al cliente que menos veces ha utilizado la aplicación.
SELECT * FROM usuario
WHERE total_usos_app = (SELECT MIN(total_usos_app) FROM usuario);
-- Agregue 10 años a los tres primeros usuarios registrados.
UPDATE usuario SET edad = edad + 10
ORDER BY id_usuario 
LIMIT 3;
-- Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
ALTER TABLE usuario
CHANGE COLUMN correo_electronico email VARCHAR(50);
ALTER TABLE operario
CHANGE COLUMN correo_electronico email VARCHAR(50);
-- Seleccione solo los operarios mayores de 20 años.
SELECT * FROM operario
WHERE edad > 20;

SELECT * FROM usuario;
SELECT * FROM operario;
SELECT * FROM atenciones;
