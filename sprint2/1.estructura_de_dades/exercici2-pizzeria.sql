CREATE DATABASE pizzeria;
use pizzeria;
/*
DROP TABLE IF EXISTS comanda_producte;
DROP TABLE IF EXISTS productes;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS comandes;
DROP TABLE IF EXISTS empleats;
DROP TABLE IF EXISTS tipus_empleat;
DROP TABLE IF EXISTS botigues;
DROP TABLE IF EXISTS tipus;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS localitats;
DROP TABLE IF EXISTS provincies;
*/

CREATE TABLE provincies(
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(64) NOT NULL UNIQUE,
    PRIMARY KEY (id)
	);

CREATE TABLE localitats(
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(64) UNIQUE NOT NULL,
    provincia VARCHAR(64) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (provincia) REFERENCES provincies(nom)
);

CREATE TABLE clients(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(64) NOT NULL,
    cognoms VARCHAR(64) NOT NULL,
    adreca VARCHAR(64),
    codi_postal VARCHAR(5),
    localitat VARCHAR(64),
    provincia VARCHAR(64),
    telefon INT,
    PRIMARY KEY(id),
    FOREIGN KEY (localitat) REFERENCES localitats(nom),
    FOREIGN KEY (provincia) REFERENCES provincies(nom)
);
    
CREATE TABLE tipus(
    nom VARCHAR(32) NOT NULL,
    PRIMARY KEY (nom)
);

CREATE TABLE categories(
	categoria VARCHAR(32)  UNIQUE NOT NULL,
    PRIMARY KEY(categoria)
);

CREATE TABLE productes(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(32)  UNIQUE NOT NULL,
    descripcio VARCHAR(64),
    url_imatge VARCHAR(64), 
    preu FLOAT,
    categoria VARCHAR(32),
    PRIMARY KEY(id),
    FOREIGN KEY (categoria) REFERENCES categories(categoria)
);

CREATE TABLE botigues(
	id INT NOT NULL AUTO_INCREMENT,
	adreca VARCHAR(64),
    codi_postal VARCHAR(5),
    localitat VARCHAR(64),
    provincia VARCHAR(64),
    PRIMARY KEY(id),
	FOREIGN KEY (localitat) REFERENCES localitats(nom),
    FOREIGN KEY (provincia) REFERENCES provincies(nom)
);

CREATE TABLE tipus_empleat(
	tipus VARCHAR(16),
    PRIMARY KEY (tipus)
);

CREATE TABLE empleats(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(64) NOT NULL,
    cognoms VARCHAR(64),
    nif VARCHAR(10),
	telefon VARCHAR(10),
    tipus_emp VARCHAR(16),
    botiga INT,
    PRIMARY KEY(id),
	FOREIGN KEY (tipus_emp) REFERENCES tipus_empleat(tipus),
	FOREIGN KEY (botiga) REFERENCES botigues(id)
);

 CREATE TABLE comandes(
	id INT NOT NULL AUTO_INCREMENT,
    customer INT,
    data_i_hora VARCHAR(16),
    tipus VARCHAR(32),
    nPizzes INT,
	nBegudes INT, 
    nHamburgueses INT,
    botiga_gestora INT,
    repartidor INT,
	data_i_hora_entrega VARCHAR(16),
    PRIMARY KEY(id),
    FOREIGN KEY (customer) REFERENCES clients(id),
    FOREIGN KEY (tipus) REFERENCES tipus(nom),
    FOREIGN KEY (botiga_gestora) REFERENCES botigues(id)
);

 CREATE TABLE comanda_producte(
	comanda INT NOT NULL,
    producte VARCHAR(32),
    PRIMARY KEY(comanda, producte),
    FOREIGN KEY (comanda) REFERENCES comandes(id),
    FOREIGN KEY (producte) REFERENCES productes(nom)
);

INSERT INTO provincies(nom) VALUES('BARCELONA');
INSERT INTO provincies(nom) VALUES('GIRONA');
INSERT INTO provincies(nom) VALUES('LLEIDA');
INSERT INTO provincies(nom) VALUES('TARRAGONA');

INSERT INTO localitats(nom, provincia) VALUES('Hospitalet de Llobregat', 'BARCELONA');
INSERT INTO localitats(nom, provincia) VALUES('Figueres','GIRONA');
INSERT INTO localitats(nom, provincia) VALUES('LLeida','LLEIDA');
INSERT INTO localitats(nom, provincia) VALUES('Torredembarra', 'TARRAGONA');

INSERT INTO clients(nom, cognoms, adreca, codi_postal, localitat, provincia, telefon) VALUES('Alexandre', 'Cognom1 Cognom2', 'Carrer A', '08901', 'Hospitalet de Llobregat', 'BARCELONA', '934012534');
INSERT INTO clients(nom, cognoms, adreca, codi_postal, localitat, provincia, telefon) VALUES('Sara', 'Cognom1 Cognom2', 'Carrer B', '17600', 'Figueres', 'GIRONA', '972501413');

INSERT INTO tipus VALUES('recollida');
INSERT INTO tipus VALUES('a domicili');

INSERT INTO categories VALUES('hivern');
INSERT INTO categories VALUES('tardor');
INSERT INTO categories VALUES('estiu');
INSERT INTO categories VALUES('primavera');

INSERT INTO productes(nom, descripcio, url_imatge, preu, categoria) VALUES('Pizza 4 formatges', 'Una pizza de 4 formatges', 'http://www.pizzes.com/pizza4formatges', 10.25, 'hivern');
INSERT INTO productes(nom, descripcio, url_imatge, preu, categoria) VALUES('Pizza 4 estacions', 'Una pizza amb carxofa, olives, pernil dolç i xampinyons', 'http://www.pizzes.com/pizza4estacions', 11.25, 'estiu');
INSERT INTO productes(nom, descripcio, url_imatge, preu, categoria) VALUES('Pizza Carbonara', 'Una pizza amb nata, bacó, mozzarella i xampinyons', 'http://www.pizzes.com/pizzacarbonara', 10.35, 'tardor');
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('Barbacoa', 'Una hamburguesa de carn i salsa barbacoa', 'http://www.hamburgueses.com/hamburguesabarbacoa', 10.25);
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('Simple', 'Una hamburguesa simple', 'http://www.hamburgueses.com/hamburguesasimple', 11.25);
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('La triple', 'Una hamburguesa triple amb complements', 'http://www.hamburgueses.com/hamburguesatriple', 10.35);
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('Cola', 'Refresc amb sabor a cola', 'http://www.refrescs.com/cola', 2.5);
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('Taronjada', 'Refresc amb sabor a taronjada', 'http://www.refrescs.com/taronjada', 2.25);
INSERT INTO productes(nom, descripcio, url_imatge, preu) VALUES('Llimonada', 'Refresc amb sabor a llimonada', 'http://www.refrescs.com/llimonada', 2.25);

INSERT INTO botigues(adreca, codi_postal, localitat, provincia) VALUES('Carrer Botiga 1', '08901', 'Hospitalet de Llobregat', 'BARCELONA');
INSERT INTO botigues(adreca, codi_postal, localitat, provincia) VALUES('Carrer Botiga 2', '17600', 'Figueres', 'GIRONA');

INSERT INTO tipus_empleat VALUES ('Cuiner');
INSERT INTO tipus_empleat VALUES ('Repartidor');

INSERT INTO empleats(nom, cognoms, nif, telefon, tipus_emp, botiga) VALUES('Clara', 'Batuda Fogons', '75481449N', '610784965', 'Cuiner', 1);
INSERT INTO empleats(nom, cognoms, nif, telefon, tipus_emp, botiga) VALUES('Flash', 'Furiós Veloç', '77442633E', '643849624', 'Repartidor', 1);
INSERT INTO empleats(nom, cognoms, nif, telefon, tipus_emp, botiga) VALUES('Bernat', 'Pescaire Forn', '40496776T', '682497584', 'Cuiner', 2);
INSERT INTO empleats(nom, cognoms, nif, telefon, tipus_emp, botiga) VALUES('Instantania', 'Entregada Total', '24854779F', '630214985', 'Repartidor', 2);

INSERT INTO comandes(customer, data_i_hora, tipus, nPizzes, nBegudes, NHamburgueses, botiga_gestora) VALUES(1, '21/02/2021 14:50', 'recollida', 1, 3, 2, 1);
INSERT INTO comandes(customer, data_i_hora, tipus, nPizzes, nBegudes, NHamburgueses, botiga_gestora) VALUES(2, '21/02/2021 17:50', 'a domicili', 0, 3, 3, 2);
/*Per a modificar hora d'entrega un cop realitzada la comanda, altrament seria impossible establir hora d'entrega a la comanda*/
UPDATE comandes
SET repartidor = 4, data_i_hora_entrega= '21/02/2021 19:30'
WHERE id = 2;

INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'Pizza 4 formatges');
INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'Cola');
INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'Taronjada');
INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'Llimonada');
INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'Barbacoa');
INSERT INTO comanda_producte(comanda, producte) VALUES(1, 'La triple');

INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Pizza 4 formatges');
INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Pizza 4 estacions');
INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Pizza Carbonara');
INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Cola');
INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Taronjada');
INSERT INTO comanda_producte(comanda, producte) VALUES(2, 'Llimonada');
