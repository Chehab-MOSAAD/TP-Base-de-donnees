drop table chercheur_2400;
drop table chercheur_eq1;
CREATE VIEW CHERCHEUR_2400 
AS SELECT codech, NomCh, Salaire from Chercheur where salaire >2400;

insert into CHERCHEUR (CODECH,NOMCH,CODEEQ,salaire) 
Values
(15,'Thierry',2,2600);

select * from CHERCHEUR;
select * from CHERCHEUR_2400;

create view chercheur_eq1
as  select codech, nomch from CHERCHEUR where CODEEQ =1; 

insert into CHERCHEUR (CODECH,NOMCH,CODEEQ,salaire) 
Values(14,'Renaud',1,2500);

select * from CHERCHEUR;
select * from  chercheur_eq1;

update Chercheur set
NOMCH = 'RENAUDIN' 
where CODECH=14;

insert into CHERCHEUR_EQ1 values (18, 'LALANDE');

select * from  chercheur_eq1;
select * from CHERCHEUR;
DELETE FROM CHERCHEUR WHERE CODECH=18;
select * from CHERCHEUR;


SELECT * FROM CHERCHEUR order BY NOMCH; 
select nomch, NomEq from CHERCHEUR , EQUIPE
where CHERCHEUR.CODEEQ=EQUIPE.CODEEQ;

select nomch from chercheur , equipe where 
 CHERCHEUR.CODEEQ=EQUIPE.CODEEQ
 and equipe.NOMEQ = 'PSA';

SELECT COUNT (*) FROM chercheur , equipe where 
 CHERCHEUR.CODEEQ=EQUIPE.CODEEQ
 and equipe.NOMEQ = 'FIRM';
 
 SELECT LABORATOIRE.CODELABO, LABORATOIRE.NOMLABO , COUNT(CHERCHEUR.CODECH) FROM LABORATOIRE ,EQUIPE, CHERCHEUR 
 WHERE EQUIPE.CODELABO = LABORATOIRE.CODELABO
 AND  CHERCHEUR.CODEEQ = EQUIPE.CODEEQ 
 GROUP BY  LABORATOIRE.CODELABO, LABORATOIRE.NOMLABO ;
 
 SELECT CODEEQ, NOMEQ from equipe eq 
 where (SELECT COUNT(CHERCHEUR.CODECH) FROM LABORATOIRE , CHERCHEUR 
 WHERE eq.CODELABO = LABORATOIRE.CODELABO
 AND  CHERCHEUR.CODEEQ = eq.CODEEQ 
 GROUP BY  LABORATOIRE.nomLABO)>3;
 
 
 select codech , nomch from chercheur , equipe 
 where  CHERCHEUR.CODEEQ=EQUIPE.CODEEQ and 
 equipe.BUDGET = (select MAX(equipe.BUDGET) from equipe);
 
select DISTINCT NOMEQ from equipe eq  , CHERCHEUR CH WHERE CH.CODEEQ=EQ.CODEEQ 
GROUP BY NOMEQ HAVING COUNT(CODECH) = (select MIN(COUNT(*)) FROM CHERCHEUR
GROUP BY CODEEQ);
 