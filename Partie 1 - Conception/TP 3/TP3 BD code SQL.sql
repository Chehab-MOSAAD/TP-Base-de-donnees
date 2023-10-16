SELECT * FROM GILLES_HUBERT.SRC1_MAGASINS;

SELECT * FROM GILLES_HUBERT.SRC1_MAGASINS WHERE adrville = 'Toulouse';

SELECT * FROM GILLES_HUBERT.SRC1_MAGASINS WHERE adrcp = 33000;

SELECT * FROM GILLES_HUBERT.src1_produits WHERE prixU = 1990;

SELECT * FROM GILLES_HUBERT.src1_produits WHERE prixU >= 2000;

SELECT * FROM GILLES_HUBERT.src1_produits WHERE prixU < 2000 and prixU > 1000;

SELECT * FROM GILLES_HUBERT.src1_produits WHERE codeC = 2;

SELECT * FROM GILLES_HUBERT.src1_produits WHERE codeC = 4; 

SELECT * FROM GILLES_HUBERT.src1_vendre WHERE dateV < DATE'2000-03-01';

SELECT * FROM GILLES_HUBERT.src1_vendre WHERE  EXTRACT(MONTH FROM dateV )= 5 AND  EXTRACT(YEAR FROM dateV )= 2000;

SELECT codeP, DESIGP ,DESIGM FROM GILLES_HUBERT.src1_produits , GILLES_HUBERT.src1_marques
WHERE GILLES_HUBERT.src1_produits.codem = gilles_hubert.src1_marques.codem;

SELECT DISTINCT desigP FROM GILLES_HUBERT.src1_vendre , GILLES_HUBERT.src1_produits 
WHERE GILLES_HUBERT.src1_vendre.dateV >  DATE'2000-06-01' and gilles_hubert.src1_produits.codep = GILLES_HUBERT.src1_vendre.codeP;

SELECT DISTINCT desigm  FROM GILLES_HUBERT.src1_vendre , GILLES_HUBERT.src1_produits ,GILLES_HUBERT.src1_marques
WHERE GILLES_HUBERT.src1_vendre.raisonsoc = 'But Pamiers' 
and gilles_hubert.src1_produits.codep = GILLES_HUBERT.src1_vendre.codeP
and gilles_hubert.src1_produits.codeM = gilles_hubert.src1_marques.codem ;


SELECT DISTINCT gilles_hubert.src1_magasins.raisonsoc FROM GILLES_HUBERT.SRC1_MAGASINS , GILLES_HUBERT.src1_vendre , GILLES_HUBERT.src1_produits, GILLES_HUBERT.src1_categories, GILLES_HUBERT.src1_marques
WHERE gilles_hubert.src1_marques.desigm = 'Sony' 
AND GILLES_HUBERT.src1_produits.codeM = GILLES_HUBERT.src1_marques.codeM
AND gilles_hubert.src1_categories.desigc = 'téléviseur' 
AND GILLES_HUBERT.src1_produits.codec = gilles_hubert.src1_categories.codec
AND GILLES_HUBERT.src1_vendre.codep = gilles_hubert.src1_produits.codep
AND gilles_hubert.src1_magasins.raisonsoc = GILLES_HUBERT.src1_vendre.raisonsoc;