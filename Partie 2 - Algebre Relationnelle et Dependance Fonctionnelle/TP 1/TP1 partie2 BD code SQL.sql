INSERT INTO PILOTE VALUES (8, 'TRULLI', 'Jarno','Italie');
INSERT INTO ECURIE values (6, 'Lotus');
INSERT INTO CIRCUIT values (4, 'Albert Park','Australie');
INSERT INTO APPARTENIR values (8,6,2010);
INSERT INTO COURSE values (13, 2010, 'sec', 4);
INSERT INTO EFFECTUER values (13,8,24);

CREATE TABLE Circuit_distance(
AS SELECT * From Circuit);

ALTER TABLE Circuit_distance 
ADD Distance Number(4);

UPDATE Circuit_distance SET Distance = 5303
WHERE nuCi = 4;

DELETE FROM Circuit_distance WHERE nuCi = 4;
DELETE FROM Circuit WHERE nuCi = 4;

DROP Circuit_distance;

SELECT * FROM Course;
SELECT Table_names FROM user_tables;

INSERT INTO PILOTE VALUES (8, 'Dupond', 'Fabrice','France');

INSERT INTO EFFECTUER values (14,7,2);

UPDATE PILOTE SET nuPilote number(6);

ALTER TABLE CIRCUIT
MODIFY check paysCI not NULL;

ALTER TABLE APPARTENIR
MODIFY (annee Default 2010);

ALTER TABLE APPARTENIR
MODIFY check (annee > 2010);

SELECT * from ALL_CONSTRAINTS;

