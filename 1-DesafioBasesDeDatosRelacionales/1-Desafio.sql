-- PASO 1
CREATE DATABASE bbdd_gimnasios;

-- PASO 2
USE bbdd_gimnasios;

-- PASO 3
CREATE TABLE clientes(
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    rut INT NOT NULL,
    email VARCHAR(100)
);

-- PASO 4
ALTER TABLE clientes ADD PRIMARY KEY (rut);

-- PASO 5
CREATE TABLE matriculas(
    monto VARCHAR(50),
    estado BOOLEAN,
    cliente_rut INT references clientes(rut)
);

-- PASO 6
INSERT INTO clientes(nombre, apellido, rut, email) VALUES
    ('Cliente 1', 'Apellido cliente 1', '999999999', 'cliente1@email.com'),
    ('Cliente 2', 'Apellido cliente 2', '888888888', 'cliente2@email.com'),
    ('Cliente 3', 'Apellido cliente 3', '777777777', 'cliente3@email.com'),
    ('Cliente 4', 'Apellido cliente 4', '666666666', 'cliente4@email.com'),
    ('Cliente 5', 'Apellido cliente 5', '555555555', 'cliente5@email.com');

-- PASO 7
INSERT INTO matriculas(monto, estado, cliente_rut) VALUES
    ('40000', TRUE, '999999999'),
    ('40000', FALSE, '888888888'),
    ('55000', TRUE, '555555555'),
    ('35000', TRUE, '777777777'),
    ('60000', FALSE, '666666666');


-- PASO 8
SELECT email, rut, monto, estado
    FROM clientes
    INNER JOIN matriculas
    ON clientes.rut = cliente_rut;


-- PASO 9
SELECT email, rut, monto, estado
    FROM clientes
    INNER JOIN matriculas
    ON clientes.rut = cliente_rut
    ORDER BY monto;

-- PASO 10
SELECT monto, COUNT(monto)
    FROM matriculas
    GROUP BY monto
    HAVING COUNT(monto) >= 2;

-- PASO 11
INSERT INTO matriculas VALUES
    ('35000', TRUE, '777777777');

SELECT email, rut, SUM(monto) as montoTotal, estado, COUNT(matriculas.cliente_rut) as CantidadDeMatriculas
    FROM clientes
    INNER JOIN matriculas ON clientes.rut = matriculas.cliente_rut
    GROUP BY email, rut, monto, estado;

-- PASO 12
SELECT email, rut, SUM(monto) as montoTotal, estado, COUNT(matriculas.cliente_rut) as CantidadDeMatriculas
    FROM clientes
    INNER JOIN matriculas ON clientes.rut = cliente_rut
    GROUP BY email, rut, monto, estado
    HAVING COUNT(matriculas.cliente_rut) >=2;

-- MANOS A LA OBRA

-- BORRAR DATOS DE TABLAS PREVIAS
DELETE FROM clientes WHERE rut IN('999999999', '888888888', '777777777', '666666666', '555555555');
DELETE FROM matriculas WHERE matriculas.cliente_rut IN('999999999', '888888888', '777777777', '666666666', '555555555');

-- BORRAR PRIMARY KEY(rut) DE CLIENTES
ALTER TABLE clientes DROP PRIMARY KEY;
-- BORRAR cliente_rut DE MATRICULAS
ALTER TABLE matriculas DROP COLUMN cliente_rut;

-- CREAR COLUMNA id PARA clientes
ALTER TABLE clientes ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY FIRST;
-- CREAR COLUMNA cliente_id PARA MATRICULAS
ALTER TABLE matriculas ADD COLUMN cliente_id INT REFERENCES clientes(id);

-- INSERTAR CLIENTES
INSERT INTO clientes(nombre, apellido, rut, email) VALUES
    ('Cliente 1', 'Apellido cliente 1', '999999999', 'cliente1@email.com'),
    ('Cliente 2', 'Apellido cliente 2', '888888888', 'cliente2@email.com');

-- INSERTAR MATRICULAS
INSERT INTO matriculas(monto, estado, cliente_id) VALUES
    ('40000', TRUE, '1'),
    ('40000', FALSE, '2'),
    ('55000', TRUE, '1'),
    ('35000', TRUE, '1');

-- PASO 12 NUEVAMENTE
SELECT id, nombre, apellido, rut, email, COUNT(matriculas.cliente_id) AS CantidadDeMatriculas
    FROM clientes
    INNER JOIN matriculas ON clientes.id = matriculas.cliente_id
    GROUP BY id, nombre, apellido, rut, email
    HAVING COUNT(clientes.id) >= 2;

SELECT * FROM clientes;
SELECT * FROM matriculas;