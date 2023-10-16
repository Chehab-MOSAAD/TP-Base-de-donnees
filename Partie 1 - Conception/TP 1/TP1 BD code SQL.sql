-- Code LDD
DROP TABLE Suivre;
DROP TABLE Louer ;
DROP TABLE Materiel ;
DROP TABLE Cours ;
DROP TABLE Specialite;
DROP TABLE Moniteur;
DROP TABLE Adherent ;

-- Création de la table MONITEUR
CREATE TABLE MONITEUR (
  noM NUMBER(1),
  nomM VARCHAR2(30),
  prenomM VARCHAR2(30),
  adresse VARCHAR2(100),
  dateNaiss DATE,
  CONSTRAINT pk_nom PRIMARY KEY (noM)
);

-- Création de la table SPECIALITE
CREATE TABLE SPECIALITE (
  idSpecialite NUMBER(1),
  nomS VARCHAR2(30),
  CONSTRAINT pk_idsepecialite PRIMARY KEY (idSpecialite),
  CONSTRAINT ck_noms CHECK (nomS IN ('ski','snowboard','monoski','raquette'))
);

-- Création de la table COURS
CREATE TABLE COURS (
  codeC NUMBER(1),
  niveau VARCHAR2(50),
  nbPlaces NUMBER(1),
  dateCours DATE,
  noM NUMBER(1),
  idSpecialite NUMBER(1),
  CONSTRAINT pk_codec PRIMARY KEY (codeC),
  CONSTRAINT fk_moniteur FOREIGN KEY (noM) REFERENCES MONITEUR(noM),
  CONSTRAINT fk_specialite FOREIGN KEY (idSpecialite) REFERENCES SPECIALITE(idSpecialite),
  CONSTRAINT nb_places_positive CHECK (nbPlaces > 0),
  CONSTRAINT ck_niveau CHECK (NIVEAU IN ('debutant','moyen','confirme','competition'))
);

-- Création de la table ADHERENT
CREATE TABLE ADHERENT (
  noA NUMBER(1),
  nomA VARCHAR2(50),
  prenomA VARCHAR2(50),
  adresseA VARCHAR2(100),
  telA NUMBER(20),
  ageA NUMBER(2),
  CONSTRAINT pk_noa_A PRIMARY KEY (noA),
  CONSTRAINT age_adherent CHECK (ageA >= 12 AND ageA <= 100)
);

-- Création de la table MATERIEL
CREATE TABLE MATERIEL (
  codeM NUMBER(1),
  type VARCHAR2(50),
  marque VARCHAR2(50),
  prix NUMBER(2),
  qteDispo NUMBER(2),
  CONSTRAINT pk_codeM_M PRIMARY KEY (codeM),
  CONSTRAINT ck_prix CHECK (PRIX > 0),
  CONSTRAINT qte_positive CHECK (qteDispo > 0)
);

-- Création de la table SUIVRE
CREATE TABLE SUIVRE (
  noA NUMBER(1),
  codeC NUMBER(1),
  CONSTRAINT pk_prim PRIMARY KEY(noA,codeC),
  CONSTRAINT fk_adherent FOREIGN KEY (noA) REFERENCES ADHERENT(noA),
  CONSTRAINT fk_cours FOREIGN KEY (codeC) REFERENCES COURS(codeC)
);

-- Création de la table LOUER
CREATE TABLE LOUER (
  noA NUMBER(1),
  codeM NUMBER(1),
  quantite NUMBER(1),
  CONSTRAINT pk_prim2 PRIMARY KEY (codeM,noA),
  CONSTRAINT fk_adherent2 FOREIGN KEY (noA) REFERENCES ADHERENT(noA),
  CONSTRAINT fk_materiel FOREIGN KEY (codeM) REFERENCES MATERIEL(codeM),
  CONSTRAINT qte_louee_positive CHECK (quantite > 0)
);

-- Code d'insertion LMD
-- Insertion des données dans la table Moniteur
INSERT INTO Moniteur (nom, nomM, prenomM, adresse, datenaiss) VALUES (1, 'Dupond', 'Jean', '12 route du col, Germ', '01/Jan/1980'); 

INSERT INTO Moniteur (nom, nomM, prenomM, adresse, datenaiss) VALUES (2, 'Martin', 'Sophie', 'Route du Lac, Loudenvielle', '13/May/1988');

-- Insertion des données dans la table Specialite
INSERT INTO Specialite (idspecialite, nomS) VALUES (1, 'ski');

INSERT INTO Specialite (idspecialite, nomS) VALUES (2, 'snowboard');

INSERT INTO Specialite (idspecialite, nomS) VALUES (3, 'raquette');

-- Insertion des données dans la table Cours
INSERT INTO Cours (codeC, niveau, nbplaces, datecours, nom, idspecialite) VALUES (1, 'debutant', 1, '01/Feb/2013', '1', 2);

INSERT INTO Cours (codeC, niveau, nbplaces, datecours, nom, idspecialite) VALUES (2, 'moyen', 1, '02/Feb/2013', '1', 2);

INSERT INTO Cours (codeC, niveau, nbplaces, datecours, nom, idspecialite) VALUES (3, 'debutant', 5, '01/Feb/2013', '2', 1);

-- Insertion des données dans la table Adherent
INSERT INTO Adherent (noA, nomA, prenomA, adresseA, telA, ageA) VALUES (1, 'Lars', 'Julien', '12 rue principale, Muret', '0666666666', 13);

INSERT INTO Adherent (noA, nomA, prenomA, adresseA, telA, ageA) VALUES (2, 'Salma', 'Louise', '23 route de Tarbes, Pau', '0777777777', 26);

INSERT INTO Adherent (noA, nomA, prenomA, adresseA, telA, ageA) VALUES (3, 'Jardin', 'Lucien', 'route d''Espagne, Tarbes', NULL, 52);

-- Insertion des données dans la table Materiel
INSERT INTO Materiel (codeM, type, marque, prix, qtedispo) VALUES (1, 'Ski', 'HyperGliss', 10, 2);

INSERT INTO Materiel (codeM, type, marque, prix, qtedispo) VALUES (2, 'Snowboard', 'HyperGliss', 11, 3);

INSERT INTO Materiel (codeM, type, marque, prix, qtedispo) VALUES (4, 'Raquette', 'Smash', 8, 2);

-- Insertion des données dans la table Suivre
INSERT INTO Suivre (codeC, noA) VALUES (1,1);

INSERT INTO Suivre (codeC, noA) VALUES (1,2);

INSERT INTO Suivre (codeC, noA) VALUES (3,1);

INSERT INTO Suivre (codeC, noA) VALUES (2,3);

-- Insertion des données dans la table Louer
INSERT INTO Louer (noA, codeM, quantite) VALUES (3, 1, 1);

INSERT INTO Louer (noA, codeM, quantite) VALUES (2, 1, 2);