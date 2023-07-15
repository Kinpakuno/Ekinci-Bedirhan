\c postgres

DROP DATABASE IF EXISTS bd_velib;

CREATE DATABASE bd_velib;

\c bd_velib

CREATE TABLE station (
    station_id BIGINT,
    nom VARCHAR (90),
    latitude FLOAT,
    longitude FLOAT,

    PRIMARY KEY (station_id)
);

CREATE TABLE utilisateur (
    identifiant VARCHAR(30),
    mdp VARCHAR(50),

    PRIMARY KEY (identifiant)
);

CREATE TABLE station_fav (
    id SERIAL,
    id_station BIGINT,
    utilisateur VARCHAR(30),
    
    PRIMARY KEY (id),
    FOREIGN KEY (utilisateur) REFERENCES utilisateur(identifiant),
    FOREIGN KEY (id_station) REFERENCES station (station_id)
);



DROP USER IF EXISTS uti_bd_velib;

CREATE USER uti_bd_velib LOGIN PASSWORD 'slam';


GRANT ALL ON station TO uti_bd_velib;
GRANT ALL ON station_fav TO uti_bd_velib;
GRANT ALL ON utilisateur TO uti_bd_velib;
GRANT USAGE, SELECT ON SEQUENCE station_fav_id_seq TO uti_bd_velib;

insert into utilisateur values ('admin', 'slam');
