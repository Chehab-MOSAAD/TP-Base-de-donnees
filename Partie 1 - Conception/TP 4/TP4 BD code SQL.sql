DROP TABLE FOURNIR;
DROP TABLE TRAVAILLER;
DROP TABLE FOURNISSEUR ;
DROP TABLE MATCHS;
DROP TABLE BUVETTE ;
DROP TABLE STADE;
DROP TABLE PRODUIT ;
DROP TABLE EMPLOYE;

CREATE TABLE EMPLOYE 
(NOE NUMBER(3),
 Nom VARCHAR2(20),
 Prenom VARCHAR2(20),
 DateNaissance DATE,
 CONSTRAINT pk_nume PRIMARY KEY(NOE)
);

CREATE TABLE PRODUIT
(NOP NUMBER(3),
 DESCRIPTIONP VARCHAR2(40),
 TYPEP VARCHAR2(40),
 CATEGORIE VARCHAR2(40),
 CONSTRAINT pk_nOp PRIMARY KEY(NOP)
);

CREATE TABLE STADE
(NOS   NUMBER(3),
 NOMS   VARCHAR2(20),
 VILLES  VARCHAR2(20),
 CONSTRAINT pk_nOs PRIMARY KEY(NOS)
);

CREATE TABLE BUVETTE
(NOB NUMBER(3),
 EMPLACEMENT VARCHAR2(20),
 NOS NUMBER(3),
 CONSTRAINT pk_NOb PRIMARY KEY(NOB),
 CONSTRAINT fk_nos_b FOREIGN KEY(NOS) REFERENCES Stade(NOS)
);

CREATE TABLE MATCHS
(NUMM NUMBER(3),
 Equipe1 VARCHAR2(20),
 Equipe2 VARCHAR2(20),
 DateM DATE,
 HeureM VARCHAR2(10),
 NOS NUMBER(3),
 CONSTRAINT pk_numm PRIMARY KEY(NUMM),
 CONSTRAINT fk_nos_M FOREIGN KEY(NOS)REFERENCES STADE(NOS) 
);

CREATE TABLE FOURNISSEUR
(NOF   NUMBER(3),
 NomF   VARCHAR2(20),
 LigneAdresse VARCHAR2(40),
 CodePostal NUMBER(5),
 VilleF VARCHAR2(40),
 CONSTRAINT pk_nof PRIMARY KEY(NOF)
);

CREATE TABLE TRAVAILLER
(NOE NUMBER(3),
 NUMM NUMBER(3),
 NOB NUMBER(3),  
 HEUREDEBUT VARCHAR2(10),
 HEUREFIN VARCHAR2(10),
 CONSTRAINT pk_prim1 PRIMARY KEY(NOE,NUMM,NOB),
 CONSTRAINT fk_noe_t FOREIGN KEY(NOE)REFERENCES EMPLOYE(NOE) ,
 CONSTRAINT fk_nomM_t FOREIGN KEY(NUMM) REFERENCES MATCHS(NUMM), 
 CONSTRAINT fk_noB_t FOREIGN KEY(NOB) REFERENCES BUVETTE(NOB) 
);

CREATE TABLE FOURNIR
(DATEL DATE,
 NOF NUMBER(3),
 NOP NUMBER(3),
 NOS NUMBER(3),
 QUANTITE NUMBER(4),
 PRIXUNITAIRE VARCHAR2(40),
 CONSTRAINT pk_fournir PRIMARY KEY(DATEL,NOF,NOP,NOS),
 CONSTRAINT fk_f1 FOREIGN KEY(NOF)REFERENCES FOURNISSEUR(NOF) ,
 CONSTRAINT fk_p1 FOREIGN KEY(NOP)REFERENCES PRODUIT(NOP), 
 CONSTRAINT fk_s1 FOREIGN KEY(NOS)REFERENCES STADE(NOS) 
);
