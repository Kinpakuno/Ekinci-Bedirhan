-- ceci est le script de départ de la base de donnée du QCM --

--connexion à la base 'postgres'
\c postgres

--détruit la base 'bd_projet' si elle existe
DROP DATABASE IF EXISTS bd_projet ;

--création d'une base nommée 'bd_projet'
CREATE DATABASE bd_projet;

--conexion à la base nouvellement créée
\c bd_projet

-- suppression de la table utilisateur
DROP TABLE IF EXISTS utilisateur;

--création d'une table nommée utilsateur
CREATE TABLE utilisateur (
    profil VARCHAR(10) NOT NULL,
    identifiant VARCHAR(30) NOT NULL,
    mot_de_passe VARCHAR(200) NOT NULL,
    
    PRIMARY KEY (identifiant)
);

--- suppression de la table qcm
DROP TABLE IF EXISTS qcm;

-- création d'une table nommée qcm
CREATE TABLE qcm (
    titre VARCHAR(30) NOT NULL,
    créer_le DATE,
    
    PRIMARY KEY (titre)
);

-- suppression de la table question
DROP TABLE IF EXISTS question;

-- création d'une table nommée question
CREATE TABLE question (
    numero SERIAL,
    libellé VARCHAR(150),
    image VARCHAR(40),
    réponse1 VARCHAR(100),
    réponse2 VARCHAR(100),
    réponse3 VARCHAR(100),
    réponse4 VARCHAR(100),
    nombre_point INT,
    titre_qcm VARCHAR(30) NOT NULL,
    
    PRIMARY KEY(numero)
);

--suppression de la table reponse
DROP TABLE IF EXISTS reponse;

-- création d'une table nommée réponse
CREATE TABLE reponse (
    numero SERIAL,
    correcte VARCHAR(100),
    libellé VARCHAR(150),
    titre_qcm VARCHAR(30),

    PRIMARY KEY(numero)
);

--suppression de la table resultat
DROP TABLE IF EXISTS resultat;

-- création d'une table nommée resultat
CREATE TABLE resultat (
    numero SERIAL,
    date DATE,
    heure TIME,
    titre_qcm VARCHAR(30),
    nombres_points INT,
    utilisateur VARCHAR(100),

    PRIMARY KEY(numero)
);

DROP USER IF EXISTS uti_projet;
CREATE USER uti_projet LOGIN PASSWORD 'slam';
GRANT ALL ON utilisateur, qcm, question, question_numero_seq, reponse, reponse_numero_seq, resultat, resultat_numero_seq TO uti_projet;


-- ceci est le script d'essaie de la base de donnée du QCM --

INSERT INTO utilisateur VALUES ('Formateur', 'Kiara', 'eqEsEVTNLldNhXeFqWECGWBYVcwCfXlS'); -- mot de passe : slam --
INSERT INTO utilisateur VALUES ('Formateur', 'Maureen', 'eqEsEVTNLldNhXeFqWECGWBYVcwCfXlS'); -- mot de passe : slam --
INSERT INTO utilisateur VALUES ('Stagiaire', 'Théo', 'eqEsEVTNLldNhXeFqWECGWBYVcwCfXlS'); -- mot de passe : slam --

INSERT INTO qcm VALUES ('patisserie', '2022/04/12');

INSERT INTO question VALUES (default, 'quel ingrédient ne fais pas parti du tiramitsu ?', NULL, 'mascarpone', 'café', 'rhum', 'farine', '3', 'patisserie');
INSERT INTO question VALUES (default, 'quel est le poids d une tablette de chocolat noir patissière ?', NULL, '175gr', '205gr', '1kg', '100gr', '2', 'patisserie');
INSERT INTO question VALUES (default, 'que devient le sucre lorsqu on le fait cuire ?', NULL, 'il ne change pas', 'il disparait', 'du caramel', 'du miel', '1', 'patisserie');

INSERT INTO reponse VALUES (default, '2', 'quel ingrédient ne fais pas parti du tiramitsu ?','patisserie');
INSERT INTO reponse VALUES (default, '3', 'quel est le poids d une tablette de chocolat noir patissière ?', 'patisserie');
INSERT INTO reponse VALUES (default, '4', 'que devient le sucre lorsqu on le fait cuire ?', 'patisserie');








