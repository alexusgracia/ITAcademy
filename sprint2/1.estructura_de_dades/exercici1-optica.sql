
CREATE DATABASE optica;
use optica;
/*
DROP TABLE IF EXISTS venta;
DROP TABLE IF EXISTS ulleres;
DROP TABLE IF EXISTS muntura;
DROP TABLE IF EXISTS proveidors;
DROP TABLE IF EXISTS clients;
DROP TABLE IF EXISTS empleats;
*/
CREATE TABLE proveidors(
    nom VARCHAR(64) NOT NULL,
    direccio VARCHAR(64) NOT NULL,
    telefon INT NOT NULL,
    fax INT NOT NULL,
    nif VARCHAR(16) NOT NULL,
    PRIMARY KEY (nom)
    );
    
INSERT INTO proveidors(nom, direccio, telefon, fax, nif) VALUES('FabricantA', 'Carrer A 12 BAIXOS-1 Barcelona 08008 ES', '934176000', '934176001', 'A80907390');
INSERT INTO proveidors(nom, direccio, telefon, fax, nif) VALUES('FabricantB', 'Carrer B 12 BAIXOS-2 Barcelona 08008 ES', '934176010', '934176011', 'A80907391');
INSERT INTO proveidors(nom, direccio, telefon, fax, nif) VALUES('FabricantC', 'Carrer C 12 BAIXOS-3 Barcelona 08008 ES', '934176020', '934176021', 'A80907392');
INSERT INTO proveidors(nom, direccio, telefon, fax, nif) VALUES('FabricantD', 'Carrer D 12 BAIXOS-4 Barcelona 08008 ES', '934176030', '934176022', 'A80907393');


CREATE TABLE muntura(
    tipus VARCHAR(32) NOT NULL,
    PRIMARY KEY (tipus)
    );
    
INSERT INTO muntura VALUES('flotant');
INSERT INTO muntura VALUES('pasta');
INSERT INTO muntura VALUES('metàl·lica');


CREATE TABLE ulleres(
	id INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(64) NOT NULL,
    proveidor VARCHAR(64) NOT NULL,
    graduacioDreta FLOAT(2) NOT NULL,
    graduacioEsquerra FLOAT(2) NOT NULL,
    tipusMuntura VARCHAR(32) NOT NULL,
    colorMuntura VARCHAR(32) NOT NULL,
    colorVidreDret VARCHAR(32) NOT NULL,
    colorVidreEsquerra VARCHAR(32) NOT NULL,
    preu FLOAT(2) NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (proveidor) REFERENCES proveidors(nom),
	FOREIGN KEY (tipusMuntura) REFERENCES muntura(tipus)
	);
    
INSERT INTO ulleres(marca, proveidor, graduacioDreta, graduacioEsquerra, tipusmuntura, colorMuntura, colorVidreDret, colorVidreEsquerra, preu) 
			VALUES('Marca1', 'FabricantA', '1.25', '1.75', 'flotant', 'negra', 'transparent', 'transparent', 100);
INSERT INTO ulleres(marca, proveidor, graduacioDreta, graduacioEsquerra, tipusmuntura, colorMuntura, colorVidreDret, colorVidreEsquerra, preu) 
			VALUES('Marca2', 'FabricantB', '1.25', '1.75', 'flotant', 'negra', 'transparent', 'transparent', 100);
INSERT INTO ulleres(marca, proveidor, graduacioDreta, graduacioEsquerra, tipusmuntura, colorMuntura, colorVidreDret, colorVidreEsquerra, preu) 
			VALUES('Marca3', 'FabricantC', '3', '1.25', 'flotant', 'negra', 'transparent', 'transparent', 100);

    
CREATE TABLE clients(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(64) NOT NULL,
    direccio VARCHAR(64) NOT NULL,
    telefon INT NOT NULL,
    email VARCHAR(64) NOT NULL,
    data_registre VARCHAR(16) NOT NULL,
    recomanador INT, 
    PRIMARY KEY(id),
    FOREIGN KEY (recomanador) REFERENCES clients(id)
	);

INSERT INTO clients(nom, direccio, telefon, email, data_registre) VALUES('Alexandre', 'Carrer Client1 1 BAIXOS-1 Barcelona 08008 ES', '934176000', 'client1@mail.com', '21-02-2021');
INSERT INTO clients(nom, direccio, telefon, email, data_registre, recomanador) VALUES('Sara', 'Carrer Client2 1 BAIXOS-2 Barcelona 08008 ES', '934176001', 'client2@mail.com', '22-02-2021', 1);


CREATE TABLE empleats(
	id INT NOT NULL AUTO_INCREMENT,
	nom VARCHAR(64) NOT NULL,
    PRIMARY KEY(id)
	);

INSERT INTO empleats(nom) VALUES('Treballador1');
INSERT INTO empleats(nom) VALUES('Treballador2');
INSERT INTO empleats(nom) VALUES('Treballador3');


CREATE TABLE venta(
	id INT NOT NULL AUTO_INCREMENT,
    customer INT NOT NULL,
    id_empleat INT NOT NULL,
    ullera INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (customer) REFERENCES clients(id),
    FOREIGN KEY (id_empleat) REFERENCES empleats(id),
    FOREIGN KEY (ullera) REFERENCES ulleres(id)
	);

INSERT INTO venta(customer, id_empleat, ullera) VALUES(1, 1, 1);
INSERT INTO venta(customer, id_empleat, ullera) VALUES(1, 2, 2);
INSERT INTO venta(customer, id_empleat, ullera) VALUES(2, 3, 3);

