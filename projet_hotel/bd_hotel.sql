\c postgres

DROP DATABASE IF EXISTS bd_hotel;

CREATE DATABASE bd_hotel;

\c bd_hotel

CREATE TABLE reservation (
    numero_chambre INT,
    nom_client VARCHAR(50),
    date_louer DATE,

    PRIMARY KEY (numero_chambre, date_louer)
);

DROP USER IF EXISTS uti_bd_hotel;

CREATE USER uti_bd_hotel LOGIN PASSWORD 'slam';

GRANT ALL ON reservation TO uti_bd_hotel;

INSERT INTO reservation VALUES (1, 'MARTIN', '2022-09-15');

