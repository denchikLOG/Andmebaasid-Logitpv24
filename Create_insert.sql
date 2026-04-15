Create Database Logitpv24Baas;

--ab kustutamine
DROP database LOGITpe24baas1;

USE Logitpv24Baas;
CREATE TABLE tootaja(
tootajaID int PRIMARY KEY identity(1,1), --identity - automaatselt kasvab argb +1
eesnimi varchar(15) not null,
perenimi varchar(30) not null,
synniaeg date,
aadress TEXT,
koormus int CHECK (koormus>0), -- piirang, et koormus >0
aktiivne bit);

--tabeli kuvamine
SELECT * FROM tootaja;

--andmete lisamine tabelisse
INSERT INTO tootaja(perenimi, eesnimi, synniaeg)
VALUES ('Ilus', 'Liis', '2002-12-4')

INSERT INTO tootaja
VALUES ('Prin', 'Liis', '2012-12-4', 'Tallinn', 120, 1),
('Peja', 'Punane', '2002-10-4', 'Narva', 200, 0);

--andmete uuendamine tabelis
UPDATE tootaja SET aadress='Tallinn', koormus=10, aktiivne=1
WHERE tootajaID=1

CREATE TABLE toovahetus(
tootavahetusID int PRIMARY KEY identity(1,1),
kuupaev date,
tundidearv int,
tootajaID int,
FOREIGN KEY (tootajaID) REFERENCES tootaja(tootajaID))

Select * from toovahetus;
Select * from tootaja;

--täidame tabeli
INSERT INTO toovahetus
VALUES ('2026-01-15', 2, 7)




--Koolitus


CREATE TABLE opetaja(
opetajaID int PRIMARY KEY identity(1,1), --identity - automaatselt kasvab argb +1
eesnimi varchar(15) not null,
perenimi varchar(30) not null,
aktiivne bit);
 
CREATE TABLE Koolitus(
koolitusID int PRIMARY KEY identity(1,1),
nimetus varchar(50),
kestus int,
algus date,
lopp date,
opetajaID int,
FOREIGN KEY (opetajaID) REFERENCES opetaja(opetajaID)
);


INSERT INTO koolitus
VALUES ('IT andmebaasid', 12, '2026-1-1', '2026-1-12', 1)

INSERT INTO opetaja(perenimi, eesnimi, aktiivne)
VALUES ('Pirno', 'Andre', 1)

Select * from Koolitus;
Select * from opetaja;
