## Andmebaaside konspektid
[Create_insert](Create_insert.md) | [Kasutaja](Kasutaja.md) | [triger](triger.md) | [trigeridXAMPP](trigeridXAMPP.md) | [Keys](Keys.md)

# Primary Key (Primaarvõti)
## Definitsioon

Primary Key on väli või väljade kombinatsioon, mis identifitseerib iga tabeli rea üheselt.

Milleks kasutatakse?
Andmete unikaalseks tuvastamiseks.

Ei tohi sisaldada NULL väärtusi.
Tabelis saab olla ainult üks Primary Key.
Erinevus teistest võtmetest
Primary Key on tabeli peamine identifikaator.
Kõik väärtused peavad olema unikaalsed ja mitte NULL.
Näide:
````

CREATE TABLE Opilane (
    opilane_id INT PRIMARY KEY,
    eesnimi VARCHAR(50),
    perenimi VARCHAR(50)
);
````

# Foreign Key (Võõrvõti)
## Definitsioon

Foreign Key on väli, mis viitab teise tabeli Primary Key-le.
Milleks kasutatakse?
Tabelite omavaheliseks sidumiseks.
Andmete tervikluse tagamiseks.
Erinevus teistest võtmetest
Ei identifitseeri kirjet iseseisvalt.
Viitab teise tabeli võtmele.
Näide:

````

CREATE TABLE Klass (
    klass_id INT PRIMARY KEY,
    nimetus VARCHAR(20)
);


CREATE TABLE Opilane (
    opilane_id INT PRIMARY KEY,
    nimi VARCHAR(50),
    klass_id INT,
    FOREIGN KEY (klass_id) REFERENCES Klass(klass_id)
);
````

<img width="239" height="312" alt="{19635BF3-26CA-428B-9EA9-AA05BD2CBAC5}" src="https://github.com/user-attachments/assets/e6323701-9169-4e5f-9dcb-6b6728dd81ff" />


# Unique Key
## Definitsioon

Unique Key tagab, et kõik väärtused veerus on unikaalsed.
Milleks kasutatakse?
Korduvate väärtuste vältimiseks.
Erinevus teistest võtmetest
Võib lubada ühe NULL väärtuse (sõltub andmebaasist).
Tabelis võib olla mitu Unique Key-d.
Näide:

````
CREATE TABLE Kasutaja (
    kasutaja_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

````

# Simple Key
## Definitsioon

Simple Key koosneb ainult ühest atribuudist.
Milleks kasutatakse?
Kirjete üheseks tuvastamiseks ühe välja abil.
Erinevus teistest võtmetest
Koosneb ainult ühest veerust.
Näide:

````
CREATE TABLE Raamat (
    isbn VARCHAR(20) PRIMARY KEY,
    pealkiri VARCHAR(100)
);
````

# Composite Key
## Definitsioon

Composite Key koosneb kahest või enamast väljast, mis koos tagavad unikaalsuse.
Milleks kasutatakse?
Kui ühest väljast ei piisa kirje üheseks tuvastamiseks.
Erinevus teistest võtmetest
Võti koosneb mitmest veerust.
Näide:

````
CREATE TABLE Hinne (
    opilane_id INT,
    aine_id INT,
    hinne INT,
    PRIMARY KEY (opilane_id, aine_id));
````
# Compound Key

## Definitsioon

Compound Key on Composite Key erijuht, kus võtme moodustavad mitu atribuuti ja vähemalt üks neist võib olla Foreign Key.
Milleks kasutatakse?
Seostabelites (many-to-many seosed).
Erinevus teistest võtmetest
Sageli sisaldab Foreign Key välju.
Näide:

````
CREATE TABLE Opilane (opilane_id INT PRIMARY KEY);

CREATE TABLE Kursus (kursus_id INT PRIMARY KEY);
CREATE TABLE Registreerimine(
    opilane_id INT,
    kursus_id INT,
    PRIMARY KEY (opilane_id, kursus_id),
    FOREIGN KEY (opilane_id) REFERENCES Opilane(opilane_id),
    FOREIGN KEY (kursus_id) REFERENCES Kursus(kursus_id));
````

# Superkey

## Definitsioon
Superkey on üks või mitu atribuuti, mis võimaldavad kirje üheselt tuvastada.
Milleks kasutatakse?
Võimalike kandidaatvõtmete leidmiseks.
Erinevus teistest võtmetest
Võib sisaldada liigseid atribuute.
Näide

````
CREATE TABLE Tootaja (
    tootaja_id INT PRIMARY KEY,
    isikukood VARCHAR(11) UNIQUE,
    nimi VARCHAR(50));

--Superkey näited:
--tootaja_id
--isikukood
--(tootaja_id, nimi)
--(isikukood, nimi)
--Kõik need tuvastavad rea üheselt.

````
# Candidate Key (Kandidaatvõti)

## Definitsioon

Candidate Key on minimaalne superkey.
Milleks kasutatakse?
Primary Key valimiseks.
Erinevus teistest võtmetest
Ei sisalda liigseid atribuute.
Näide:

````
CREATE TABLE Tootaja (
    tootaja_id INT,
    isikukood VARCHAR(11),
    nimi VARCHAR(50),
    PRIMARY KEY (tootaja_id),
    UNIQUE (isikukood));

--Kandidaatvõtmed:
tootaja_id
isikukood
--Mõlemad identifitseerivad töötaja üheselt.
````

# Alternate Key (Alternatiivvõti)

## Definitsioon
Alternate Key on kandidaatvõti, mida ei valitud Primary Key-ks.
Milleks kasutatakse?
Alternatiivseks unikaalseks identifitseerimiseks.
Erinevus teistest võtmetest
On Candidate Key, kuid mitte Primary Key.
Näide:

````
CREATE TABLE Tootaja (
    tootaja_id INT PRIMARY KEY,
    isikukood VARCHAR(11) UNIQUE,
    nimi VARCHAR(50));

--Siin:
--tootaja_id = Primary Key
--isikukood = Alternate Key
--Ekraanipiltide tegemine

````
Kasutatud allikad:

1. Table constraints https://www.postgresql.org/docs/current/ddl-constraints.html
