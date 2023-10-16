Partie 1 a ajouter au tp1:

SELECT * FROM louer;
SELECT * FROM cours;
SELECT * FROM adherent;
SELECT * FROM moniteur;
SELECT * FROM specialite ;
SELECT * FROM materiel;
SELECT * FROM suivre;

DELETE FROM materiel WHERE materiel.CODEM = 4;
SELECT * FROM materiel;

DELETE FROM suivre WHERE codec =3 AND noa= 1 ;
DELETE FROM suivre WHERE codec =2 ;
SELECT * FROM suivre;

DELETE FROM cours WHERE CODEC= 2;
SELECT * FROM cours;

UPDATE adherent SET adressea= '23 route de Toulouse, Saint-Gaudens'
WHERE prenoma = 'Julien';

SELECT * FROM adherent;

UPDATE materiel SET prix = prix + prix*10/100;

UPDATE materiel SET qtedispo = qtedispo + 2 
WHERE typem = 'ski';
SELECT * FROM materiel;


Partie 2:
SELECT * from ALL_TABLES WHERE OWNER='GILLES_HUBERT' and TABLE_NAME like 'TP2_%' ;
SELECT * from ALL_CONSTRAINTS WHERE OWNER='GILLES_HUBERT' and TABLE_NAME like 'TP2_%' ;
SELECT * from ALL_CONS_COLUMNS WHERE OWNER='GILLES_HUBERT' and TABLE_NAME like 'TP2_%' ;
SELECT * from GILLES_HUBERT.TP2_PILOTE ;
DESC GILLES_HUBERT.TP2_APPARTENIR;
DESC GILLES_HUBERT.TP2_CIRCUIT;
DESC GILLES_HUBERT.TP2_COURSE;
DESC GILLES_HUBERT.TP2_ECURIE;
DESC GILLES_HUBERT.TP2_EFFECTUER;
DESC GILLES_HUBERT.TP2_EFFECTUERQUALIFICATION;
DESC GILLES_HUBERT.TP2_PILOTE;