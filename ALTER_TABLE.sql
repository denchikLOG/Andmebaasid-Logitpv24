--tabelit struktuur muutmine
--1 Uue verg lisamine
ALTER TABLE tootaja ADD testVeerg INT

--2 Uue verg kustutamine
ALTER TABLE tootaja DROP COLUMN testVeerg

--3 Andmetüüpi muutmine veerus
ALTER TABLE tootaja ALTER COLUMN testVeerg Varchar (5)

--Strukturi kontrollimiseks kasutame protseduur sp_help
SP_help tootaja

select * from tootaja

--Piirangute liisamine
create table ryhm(
ryhmID int not null,
ryhmNimi char(10));


--muudame tabeli ja lisame piirang -primary key
ALTER TABLE ryhm ADD CONSTRAINT pk_ryhm PRIMARY KEY (ryhmID)

INSERT INTO ryhm 
VALUES (2, 'Logitpv24Baas');

select * from ryhm

--Lisame piirang UNIQUE
ALTER TABLE ryhm ADD CONSTRAINT un_ryhm UNIQUE (ryhmNimi)

--Liisame uus veerg
ALTER TABLE ryhm ADD ryhmjuhataja INT;

--lsame piirang Foreign key
ALTER TABLE ryhm ADD CONSTRAINT FK_ryhm 
FOREIGN KEY (ryhmjuhataja) REFERENCES tootaja(tootajaID);

--Kontrolimiseks
SELECT * FROM tootaja;
SELECT * FROM ryhm;
UPDATE ryhm SET ryhmjuhataja=3 WHERE ryhmNimi='Logitpv24';
