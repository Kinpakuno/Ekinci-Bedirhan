\c postgres

DROP DATABASE IF EXISTS bd_magasin_0_8;
CREATE DATABASE bd_magasin_0_8;


\c bd_magasin_0_8

/************************/
DROP TABLE IF EXISTS client;
CREATE TABLE client (
    id INT,
    nom VARCHAR(30) NOT NULL,
    prenom VARCHAR(30) NOT NULL,
    date_naissance DATE,
    genre CHAR(1), -- h pour homme et f pour femme
    parrain INT,

    PRIMARY KEY(id),
    FOREIGN KEY(parrain) REFERENCES client(id)
);


/************************/
DROP TABLE IF EXISTS adresse;
CREATE TABLE adresse (
    id INT,
    id_client INT,
    numero INT,
    voie VARCHAR(10) NOT NULL,
    libelle_voie VARCHAR(30) NOT NULL,
    code_postal VARCHAR(5) NOT NULL,
    ville VARCHAR(30) NOT NULL,


    PRIMARY KEY(id, id_client),
    FOREIGN KEY(id_client) REFERENCES client(id)
);

/************************/
DROP TABLE IF EXISTS paiement;
CREATE TABLE paiement (
    id INT,
    libelle VARCHAR(20) NOT NULL,

    PRIMARY KEY(id)
);


/************************/
DROP TABLE IF EXISTS commande;
CREATE TABLE commande (
    id INT,
    id_client INT,
    la_date DATE NOT NULL,
    id_adr_livraison INT,
    id_paiement INT,


    PRIMARY KEY(id),
    FOREIGN KEY(id_client) REFERENCES client(id),
    FOREIGN KEY(id_adr_livraison, id_client) REFERENCES adresse(id, id_client),
    FOREIGN KEY(id_paiement) REFERENCES paiement(id)
);


/************************/
DROP TABLE IF EXISTS categorie;
CREATE TABLE categorie (
    id INT,
    libelle VARCHAR(30) NOT NULL,

    PRIMARY KEY(id)
);


/************************/
DROP TABLE IF EXISTS produit;
CREATE TABLE produit (
    ref INT, -- référence du produit
    nom VARCHAR(30),
    prix FLOAT,
    id_categorie INT,

    PRIMARY KEY(ref),
    FOREIGN KEY(id_categorie) REFERENCES categorie(id)
);



/************************/
DROP TABLE IF EXISTS porter;
CREATE TABLE porter(
    id_commande INT,
    ref_produit INT,
    quantite INT,

    PRIMARY KEY(id_commande, ref_produit),
    FOREIGN KEY(id_commande) REFERENCES commande(id),
    FOREIGN KEY(ref_produit) REFERENCES produit(ref)
);


-- ajout de l'utilisateur "uti_gerant" (mot de passe "T5s3Re")
DROP USER IF EXISTS uti_gerant;
CREATE USER uti_gerant LOGIN PASSWORD 'T5s3Re';
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLE client, adresse, paiement, commande, categorie, produit, porter TO uti_gerant;
