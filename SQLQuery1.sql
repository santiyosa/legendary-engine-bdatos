drop database tucasaya

CREATE DATABASE tucasaya2

USE tucasaya2


CREATE TABLE rol (
idrol INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL UNIQUE
); 

CREATE TABLE comision (
idcomision INT PRIMARY KEY IDENTITY(1,1),
porcentaje DECIMAL(4,2) NOT NULL UNIQUE CHECK (porcentaje > 0)
); 

CREATE TABLE estado (
idestado INT PRIMARY KEY IDENTITY(1,1),
estado VARCHAR(50) NOT NULL UNIQUE CHECK (estado IN ('arrendada', 'inactiva', 'disponible', 'reparaciones', 'venta', 'vendida')),
); 


CREATE TABLE propiedad (
idpropiedad INT PRIMARY KEY IDENTITY(1,1),
direccion VARCHAR(50) NOT NULL,
municipio VARCHAR(50) NOT NULL,
barrio VARCHAR(50) NOT NULL,
idestado INT FOREIGN KEY REFERENCES estado(idestado),
valorArriendo INT NOT NULL CHECK (valorArriendo >= 0),
idcomision INT FOREIGN KEY REFERENCES comision(idcomision), 
);

CREATE TABLE persona (
idpersona INT PRIMARY KEY IDENTITY(1,1),
nombre VARCHAR(50) NOT NULL,
direccion VARCHAR(50) NOT NULL,
telefono VARCHAR(50) NOT NULL,
cuenta VARCHAR(50) NOT NULL,
idrol INT FOREIGN KEY REFERENCES rol(idrol)
);

CREATE TABLE propiedadpersona (
idpropiedad INT FOREIGN KEY REFERENCES propiedad(idpropiedad),
idpersona INT FOREIGN KEY REFERENCES persona(idpersona),
);

INSERT INTO rol (nombre) VALUES
('arrendatario'),
('propietario'),
('agente'),
('administrador');

INSERT INTO comision (porcentaje) VALUES
(2.50),
(5.00),
(10.00);

INSERT INTO estado (estado) VALUES
('disponible'),
('arrendada'),
('venta'),
('vendida'),
('reparaciones'),
('inactiva');



INSERT INTO propiedad (direccion, municipio, barrio, idestado, valorArriendo, idcomision) VALUES
('Carrera 50 # 5-15', 'Medellín', 'Laureles', 1, 1800000, 2),
('Calle 7 # 30-45', 'Envigado', 'El Poblado', 2, 2500000, 2),
('Avenida 80 # 2-8', 'Sabaneta', 'La Doctora', 3, 0, 3),
('Calle 12 Sur # 43A-65', 'Medellín', 'El Poblado', 4, 0, 3),
('Diagonal 75B # 3B-20', 'Envigado', 'Las Vegas', 5, 1200000, 1),
('Calle 100 # 25-10', 'Medellín', 'Belen', 6, 0, 1);

INSERT INTO persona (nombre, direccion, telefono, cuenta, idrol) VALUES
('Carlos Orozco', 'Carrera 45 # 10-20', '3001234567', 'Bancolombia', 2),
('Ana García', 'Calle 80 # 50-10', '3119876543', 'Davivienda', 1),
('Pedro Restrepo', 'Diagonal 65 # 2-30', '3203456789', 'BBVA', 3),
('Sofía López', 'Transversal 3 # 7-15', '3157654321', 'Nequi', 4),
('Luis Gómez', 'Avenida 30 # 4-50', '3015558899', 'Banco Agrario', 1),
('María Fernández', 'Calle 55 # 6-70', '3052223344', 'Banco de Bogotá', 2);

INSERT INTO propiedadpersona (idpropiedad, idpersona) VALUES
(1, 1), -- Carlos es propietario de la propiedad 1
(2, 6), -- María es arrendataria de la propiedad 2
(3, 1), -- Carlos es propietario de la propiedad 3
(4, 6), -- María es arrendataria de la propiedad 4
(5, 1), -- Carlos es propietario de la propiedad 5
(6, 6); -- María es arrendataria de la propiedad 6