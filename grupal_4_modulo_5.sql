-- Parte 1: Crear entorno de trabajo
CREATE DATABASE ingresos;
USE ingresos;
-- Parte 2: Crear dos tablas.
CREATE TABLE usuarios (
id_usuario INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(15),
apellido VARCHAR(15),
contrasena VARCHAR(15),
zona_horaria VARCHAR(10) DEFAULT 'UTC-3',
genero VARCHAR(1),
telefono VARCHAR(15)
);
CREATE TABLE ingresos (
id_ingreso INT PRIMARY KEY,
id_usuario INT,
ultimo_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
-- Parte 3: Modificación de la tabla
ALTER TABLE usuarios
ALTER COLUMN zona_horaria SET DEFAULT 'UTC-2';
-- Parte 4: Creación de registros.
INSERT INTO usuarios (nombre, apellido, contrasena, genero, telefono) 
VALUES
('Juan', 'Pérez', '123456', 'M', '12345678'),
('María', 'González', 'abcdef', 'F', '98765432'),
('Pedro', 'López', 'qwerty', 'M', '45678901'),
('Ana', 'Martínez', 'zxcvbn', 'F', '65432109'),
('Luis', 'Sánchez', '098765', 'M', '78901234'),
('Laura', 'Hernández', 'poiuyt', 'F', '23456789'),
('Carlos', 'Ruiz', '987654', 'M', '89012345'),
('Sofía', 'Díaz', 'mnbvcx', 'F', '56789012');
INSERT INTO ingresos (id_ingreso, id_usuario) 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);
-- Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso?
/* Se utilizan datos de tipo VARCHAR para destinar desde ya la cantidad de memoria que se podría utilizar almacenando estos datos.
Los atributos id se han definido como INT para facilitar la identificación de los registros (este ejercicio es corto, por lo que manejar números del 1 al 8 es sencillo).
Para ultimo_ingreso en la tabla ingresos se eligió TIMESTAMP como el tipo de dato óptimo ya que otorga fecha y hora actual en conjunto. */
-- Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono,correo electronico).
CREATE TABLE contactos (
id_contacto INT PRIMARY KEY,
id_usuario INT,
telefono_contacto VARCHAR(15),
correo_electronico VARCHAR(30)
);
-- Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla Contactos.
ALTER TABLE contactos
ADD CONSTRAINT fk_telefono_contacto FOREIGN KEY (telefono_contacto) REFERENCES usuarios(telefono);
