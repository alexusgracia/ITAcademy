

SHOW DATABASES;

CREATE DATABASE clientes;

USE clientes;

SHOW TABLES;
/*Ejemplo de tabla*/

CREATE TABLE clientes(
    id INT(11) NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    apellido VARCHAR(60) NOT NULL,
    direccion VARCHAR(60),
    PRIMARY KEY (id)
    );

DESCRIBE clientes;

/*Crud -> CREATE*/
INSERT INTO clientes(nombre, apellido, direccion) VALUES('Alexandre', 'Gràcia', 'Av. SQL 2-1 08008');
INSERT INTO clientes(nombre, apellido, direccion) VALUES('Sara', 'Garcia', NULL);

/*cRud -> READ*/
SELECT * FROM clientes;
SELECT nombre, apellido FROM clientes;
SELECT nombre, apellido FROM clientes WHERE id=2;
SELECT * FROM clientes LIMIT 1;

/*crUd -> UPDATE*/

UPDATE clientes SET nombre = 'Alex', direccion = 'Av SQL 1-2 08008' WHERE id = 1;

/*cruD -> DELETE*/
DELETE FROM clientes WHERE id = 1;

/*Añadir/eliminar campo a la tabla existente*/
ALTER TABLE clientes ADD email VARCHAR(30);
ALTER TABLE clientes DROP COLUMN email;

/*En workbench*/
SELECT * FROM baseDeDatos.tabla;

/*ORDER BY*/
SELECT * FROM restaurant.platillos ORDER BY precio DESC;

/*Funciones de agregación*/

SELECT COUNT(id), fecha
FROM reservaciones
GROUP BY fecha
ORDER BY COUNT(id) DESC;

SELECT * FROM platillos
INNER JOIN categoria
ON categoria.id = platillos.categoriaId;

SELECT COUNT(id), fecha
FROM reservaciones
GROUP BY fecha
ORDER BY COUNT(id) DESC;


SELECT COUNT(platillos.id), categoria.nombre
FROM platillos
INNER JOIN categoria
ON platillos.categoriaID = categoria.id
GROUP BY categoria.nombre

/*Sin repeticiones*/
SELECT distinct precio 
FROM platillos
ORDER BY precio DESC;

SELECT distinct precio 
FROM platillos
BETWEEN 100
AND 200;

SELECT * FROM platillos 
WHERE nombre
LIKE '%Cafe%'
/*La % significa que cualquier que contenga Cafe*/

SELECT * FROM reservaciones
WHERE concat(nombre, ' ', apellido)
LIKE '%Alexandre%'

SELECT * FROM reservaciones
WHERE cantidadmesa
IN (2,3)
