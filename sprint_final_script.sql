CREATE DATABASE soporte;
USE soporte;

-- Creación de la tabla Usuario
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(50),
    total_usos_app INT DEFAULT 1
);

-- Trigger para actualizar total_usos_app en la tabla Usuario
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

-- Creación de la tabla Operario
CREATE TABLE operario (
    id_operario VARCHAR(30) PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    correo_electronico VARCHAR(50),
    soportes_atendidos INT DEFAULT 1
);

-- Creación de la tabla Atenciones
CREATE TABLE atenciones (
    id_atencion INT AUTO_INCREMENT PRIMARY KEY,
    id_operario VARCHAR(30),
    id_usuario INT,
    fecha DATE,
    evaluacion INT,
    FOREIGN KEY (id_operario) REFERENCES operario(id_operario),
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
);

-- Creación del trigger para actualizar soportes_atendidos en la tabla Operario
DELIMITER //
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

-- Creación del trigger para establecer la fecha actual antes de insertar en Atenciones
DELIMITER //
CREATE TRIGGER before_insert_atenciones
BEFORE INSERT ON atenciones
FOR EACH ROW
BEGIN
    SET NEW.fecha = CURRENT_DATE;
END;
//
DELIMITER ;

-- Agregar 5 usuarios
INSERT INTO usuario (nombre, apellido, edad, correo_electronico, total_usos_app) 
VALUES
('Juan', 'González', 30, 'juan@example.com', 1),
('María', 'López', 25, 'maria@example.com', 1),
('Pedro', 'Martínez', 35, 'pedro@example.com', 1),
('Ana', 'Sánchez', 28, 'ana@example.com', 1),
('Luis', 'Rodríguez', 40, 'luis@example.com', 1);

-- Agregar 5 operarios
INSERT INTO operario (id_operario, nombre, apellido, edad, correo_electronico, soportes_atendidos) 
VALUES
('amunoz', 'Alan', 'Muñoz', 49, 'alanmunoz72@telovendo.cl', 1),
('dbernales', 'Daniela', 'Bernales', 18, 'dpaz@telovendo.cl', 1),
('tgalleguillos', 'Tomas', 'Galleguillos', 32, 'tomasin@telovendo.cl', 1),
('jcid', 'Johanna', 'Cid', 30, 'johanna_cid@telovendo.cl', 1),
('hcaballero', 'Hugo', 'Caballero', 19, 'hugohugoc@telovendo.cl', 1);

-- Insertar datos de atenciones
INSERT INTO atenciones (id_operario, id_usuario, fecha, evaluacion) 
VALUES
('amunoz', 1, '2024-01-01', 5),
('dbernales', 2, '2024-01-02', 4),
('tgalleguillos', 3, '2024-01-03', 3),
('hcaballero', 4, '2024-01-04', 5),
('hcaballero', 5, '2024-01-05', 2),
('tgalleguillos', 2, '2024-01-06', 4),
('dbernales', 2, '2024-01-07', 3),
('tgalleguillos', 5, '2024-01-08', 5),
('hcaballero', 4, '2024-01-09', 2),
('hcaballero', 5, '2024-01-10', 4);

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
