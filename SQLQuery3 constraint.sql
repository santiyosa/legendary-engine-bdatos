CREATE DATABASE ferreteria

DROP DATABASE ferreteria

USE ferreteria

CREATE TABLE empleados ( 
id_empleados INT PRIMARY KEY IDENTITY(1,1),
documento_identificacion VARCHAR(20) UNIQUE,
nombre VARCHAR(50) NOT NULL,
correo VARCHAR(20) NOT NULL,
fecha_nacimiento DATE,
fecha_ingreso DATE DEFAULT GETDATE(),
telefono VARCHAR(13) DEFAULT '000000000', 
);

ALTER TABLE empleados
ADD estado_empleado VARCHAR(10) DEFAULT 'Activo'

ALTER TABLE empleados 
ALTER COLUMN correo VARCHAR(100) NOT NULL;

	
SELECT *
FROM empleados

INSERT INTO empleados (documento_identificacion, nombre, correo, fecha_nacimiento, fecha_ingreso, telefono)
VALUES 
('1001001001', 'Juan Pérez', 'juanperez@example.com', '1985-03-15', '2020-01-10', '3101234567'),
('1002002002', 'María García', 'maria.garcia@example.com', '1990-07-22', '2019-05-20', '3112345678'),
('1003003003', 'Carlos Rodríguez', 'carlos.rodriguez@example.com', '1982-11-01', '2021-03-01', '3123456789'),
('1004004004', 'Ana Martínez', 'ana.martinez@example.com', '1993-01-28', '2022-02-15', '3134567890'),
('1005005005', 'Luis Fernández', 'luis.fernandez@example.com', '1988-09-05', '2018-09-01', '3145678901'),
('1006006006', 'Sofía González', 'sofia.gonzalez@example.com', '1995-04-12', '2023-01-05', '3156789012'),
('1007007007', 'Pedro Sánchez', 'pedro.sanchez@example.com', '1980-06-30', '2017-07-18', '3167890123'),
('1008008008', 'Laura Díaz', 'laura.diaz@example.com', '1991-10-19', '2020-11-01', '3178901234'),
('1009009009', 'Diego Ramírez', 'diego.ramirez@example.com', '1987-02-08', '2021-06-25', '3189012345'),
('1010101010', 'Elena López', 'elena.lopez@example.com', '1992-12-03', '2022-09-10', '3190123456');



CREATE TABLE productos(
id_producto INT PRIMARY KEY IDENTITY (1,1),
nombre_producto VARCHAR (40) NOT NULL,
precio DECIMAL (10,2) NOT NULL,
descripcion VARCHAR (100)NOT NULL,
id_proveedor INT NOT NULL,
id_marca INT NOT NULL, 
);

INSERT INTO productos (nombre_producto, precio, descripcion, id_proveedor, id_marca)
VALUES
('Martillo de carpintero', 15.99, 'Martillo robusto para trabajos de carpintería', 101, 201),
('Destornillador Phillips #2', 5.50, 'Destornillador de punta Phillips, tamaño #2', 102, 202),
('Juego de llaves combinadas', 49.99, 'Juego de 10 llaves fijas y de estrella', 103, 203),
('Cinta métrica 5m', 8.75, 'Cinta métrica retráctil de 5 metros con bloqueo', 101, 204),
('Taladro percutor 800W', 89.90, 'Taladro eléctrico potente para perforar mampostería', 104, 205),
('Caja de herramientas vacía', 29.00, 'Caja de metal resistente para organizar herramientas', 102, 206),
('Set de brocas HSS', 22.45, 'Juego de 15 brocas de acero de alta velocidad', 103, 201),
('Alicate universal 7"', 12.00, 'Alicate multiuso con mango ergonómico', 101, 202),
('Nivel de burbuja 60cm', 18.50, 'Nivel de aluminio con tres burbujas para precisión', 104, 204),
('Guantes de trabajo reforzados', 9.95, 'Guantes de alta resistencia para protección manual', 102, 206);

INSERT INTO productos (nombre_producto, precio, descripcion, id_proveedor, id_marca)
VALUES
('Cinta métrica 5m', 8.75, 'Cinta métrica retráctil de 5 metros con bloqueo', 101, 204);

SELECT * 
FROM productos

SELECT nombre_producto AS NombreProductos
FROM productos

CREATE TABLE ventas(
id_ventas INT PRIMARY KEY IDENTITY(1,1),
id_producto INT NOT NULL FOREIGN KEY REFERENCES productos(id_producto),
id_empleado INT ,
fecha_venta DATE DEFAULT GETDATE(),
valor_venta DECIMAL(20,2),
);

ALTER TABLE ventas
ADD CONSTRAINT ventas_foraneas  FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleados) 

-- Sentencia INSERT con múltiples filas para la tabla ventas
INSERT INTO ventas (id_producto, id_empleado, fecha_venta, valor_venta)
VALUES
(1, 10, '2024-06-01', 15.99), -- Martillo (id_producto 1), Juan Pérez (id_empleado 1)
(2, 9, '2024-06-01', 5.50),  -- Destornillador (id_producto 2), María García (id_empleado 2)
(3, 3, '2024-06-02', 49.99), -- Juego de llaves (id_producto 3), Carlos Rodríguez (id_empleado 3)
(4, 12, '2024-06-02', 8.75),  -- Cinta métrica (id_producto 4), Juan Pérez (id_empleado 1)
(5, 4, '2024-06-03', 89.90), -- Taladro (id_producto 5), Ana Martínez (id_empleado 4)
(6, 5, '2024-06-03', 29.00), -- Caja de herramientas (id_producto 6), Luis Fernández (id_empleado 5)
(7, 11, '2024-06-04', 22.45), -- Set de brocas (id_producto 7), María García (id_empleado 2)
(8, 6, '2024-06-04', 12.00), -- Alicate (id_producto 8), Sofía González (id_empleado 6)
(9, 7, '2024-06-05', 18.50), -- Nivel de burbuja (id_producto 9), Pedro Sánchez (id_empleado 7)
(10, 8, '2024-06-05', 9.95); -- Guantes (id_producto 10), Laura Díaz (id_empleado 8)

UPDATE productos
SET nombre_producto='Cinta metríca 10M'


SELECT *
FROM productos


SELECT *
FROM productos	
WHERE nombre_producto='Cinta metríca 10M'

SELECT*  
FROM empleados	


