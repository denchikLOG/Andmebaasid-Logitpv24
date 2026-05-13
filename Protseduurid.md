## Sissukord
-[Hindeline_Ülesanne](#Hindeline_Ülesanne)
-[SQL_protseduur](#SQL_protseduur)
-[HINDELINE_ÜLESANNE_XAMPP](#HINDELINE_ÜLESANNE_XAMPP)


## SQL_protseduur -
store procedure - salvestatud protseduurid - sama mis on funktsioonid programmeerimises, mingi tegevus, mis on salvestatud andmebaasi, ja mida saab automaatselt teha (INSERT, UPDATE, SELECT, UPDATE).

```
CREATE Procedure lisaKategooria
--parameetrid @...
@uusKategooria varchar(30)
AS
BEGIN
--kirjeldus
	INSERT INTO categories(category_name)
	VALUES (@uusKategooria);
	SELECT * FROM categories;
END;
```
 <img width="321" height="378" alt="{2A4BC396-DF8E-4398-BD06-B42876938C7D}" src="https://github.com/user-attachments/assets/bc0d95c1-54b3-4571-8a82-ce0357a09736" />

<img width="230" height="107" alt="{1BAB41B9-119C-4ACB-B350-B3C0CD7F816B}" src="https://github.com/user-attachments/assets/81a658f0-5719-407e-a581-95587c9a6e11" />

## Kustutamis kategooria

--proseduur, mis kustutab kategooria id järgi
```
CREATE procedure kustutaKategooria
@kustutaId int
AS
BEGIN
    SELECT * FROM categories;
DELETE FROM categories WHERE category_id=@kustutaId;
SELECT * FROM categories;
END;
--kutse
EXEC kustutaKategooria 1
```

## Procedure otsingitaht
```
CREATE PROCEDURE otsingitaht
@taht char(1)
AS BEGIN
       SELECT * FROM categories
  WHERE category_name LIKE @taht + '%';
END;

EXEC lisaKategooria 'Auto2'
```

## table brands
```
CREATE TABLE brands(
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(15) UNIQUE);

INSERT INTO brands(brand_name)
VALUES ('Nokia');

SELECT * FROM brands;
```
<img width="193" height="64" alt="{6BA496D9-A1A5-4CAB-A100-2829C56C4556}" src="https://github.com/user-attachments/assets/f017cd92-e36d-4de5-8ddc-f159ccde346a" />

## table products
```
Create TABLE products(
product_id int PRIMARY KEY identity(1,1),
product_name varchar(50) not null,
brand_id int,
FOREIGN KEY (brand_id) references brands(brand_id),
category_id int,
FOREIGN KEY (category_id) references categories(category_id),
model_year int,
list_ürice money);

INSERT INTO products
VALUES ('nutitelefon 10',1,3,  2025, 500);

select * from products;

INSERT INTO products
VALUES ('nutitelefon 03',1, 2, 2021, 20022);
```
<img width="481" height="71" alt="{A769F54E-4EA6-480A-BF61-180B3712A6AF}" src="https://github.com/user-attachments/assets/46b5fca6-67e7-4ba0-a3e4-25c73d7bb3f7" />

## Procedure muudatus
```
CREATE PROCEDURE muudatus
    @tegevus varchar(10),
    @tabelinimi varchar(25),
    @veerunimi varchar(25),
    @tyyp varchar(25) = NULL
AS
BEGIN
    DECLARE @sqltegevus varchar(max);

    SET @sqltegevus = CASE 
        WHEN @tegevus = 'add' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' ADD ', @veerunimi, ' ', @tyyp)

        WHEN @tegevus = 'drop' THEN 
            CONCAT('ALTER TABLE ', @tabelinimi, ' DROP COLUMN ', @veerunimi)
    END;

    PRINT @sqltegevus;
    EXEC (@sqltegevus);
END;
EXEC muudatus 'add', 'categories', 'TestVeerg', 'int'

Select * from categories

exec muudatus 'drop', 'categories', 'TestVeerg'
```

<img width="500" height="187" alt="{CBA1BBA2-A66B-4FE5-A37A-B48C2F4BEFEB}" src="https://github.com/user-attachments/assets/52754515-8332-4f50-b3c9-514a5fe519fd" />




## HINDELINE_ÜLESANNE

## Sisukord
-[Algus](#Algus)
-[Procedurid](#Procedurid)


## Algus

Alustame

Lisame database: 
 
 ```
create database ProtseduriMelnikov;
use ProtseduriMelnikov
 ```

Seal me lisame table: 
 ```
CREATE TABLE klient (
    id INT PRIMARY KEY IDENTITY(1,1),
    nimi VARCHAR(25) NOT NULL,
    linn VARCHAR(20),
    vanus INT,
    saldo MONEY
);
INSERT INTO klient (nimi, linn, vanus, saldo)
VALUES ('Ada Vong ', 'Tartu', 55, 14.8);
 ```

Et vaadata mis on tabelis kasutame select * from klient
 <img width="483" height="155" alt="image" src="https://github.com/user-attachments/assets/8641fe54-4acd-49c0-a4d1-870867dd8c7f" />




 ## Procedurid

Teeme esimene procedure:
 ```
 CREATE PROCEDURE KuvaKliendid
AS
BEGIN
    SELECT nimi, linn FROM klient;
END;
 ```
Et vaadata kas töötab kasutame (EXEC sp_KuvaKliendid;)
 <img width="275" height="184" alt="image" src="https://github.com/user-attachments/assets/03b68af4-9804-423e-8342-69b8e32ff200" />

 

Teeme teine procedure:
 ```
CREATE PROCEDURE LisaKlient
@nimi VARCHAR(23),
@linn VARCHAR(20),
@vanus INT,
@saldo MONEY
AS
BEGIN
    INSERT INTO klient (nimi, linn, vanus, saldo)
    VALUES (@nimi, @linn, @vanus, @saldo);
END;

EXEC LisaKlient 
@nimi = 'Peeter Põld',
@linn = 'Narva',
@vanus = 40,
@saldo = 120.00;
 ```


Teeme kolmas procedure:
 ```
CREATE PROCEDURE MuudaKlient
@id INT,
@linn NVARCHAR(100)
AS
BEGIN
    UPDATE klient
    SET linn = @linn
    WHERE id = @id;
END;

EXEC MuudaKlient 
@id = 5,
@linn = 'Maardu'
 ```

Vaatame kas midagi muutunud:
 <img width="613" height="470" alt="image" src="https://github.com/user-attachments/assets/4380e317-5587-4bd9-8f16-04a21e9e9348" />

 

Teeme neljas procedure:
 ```
CREATE PROCEDURE KustutaKlient
@id INT
AS
BEGIN
    DELETE FROM klient
    WHERE id = @id;
END;

EXEC KustutaKlient @id = 4;
 ```

Vaatame kas klient ideega 4 kustunud:
ENNE:
<img width="445" height="170" alt="image" src="https://github.com/user-attachments/assets/19547f6e-1165-4fd7-9288-da18a8df5ffd" />
 
PÄRAST:
 <img width="522" height="233" alt="image" src="https://github.com/user-attachments/assets/45c7f2f6-627b-4507-b3b6-167c9f0f68d9" />


 
Teeme viies procedure:
 ```
CREATE PROCEDURE OtsiKlient
@nimi VARCHAR(10)
AS
BEGIN
	SELECT *
    FROM klient
    WHERE nimi LIKE @nimi + '%';
END;

EXEC OtsiKlient @nimi = 'J';
 ```

Result:
 <img width="473" height="127" alt="image" src="https://github.com/user-attachments/assets/9c44a0bd-e7a1-4e71-8234-32a7cbf42803" />

Või ainult üks täht:
 <img width="708" height="263" alt="image" src="https://github.com/user-attachments/assets/fc66961e-7196-4eeb-8d39-f312b7395a50" />


 
Teeme kuues procedure:
 ```
CREATE PROCEDURE KuvaKliendiTyyp
AS
BEGIN
    SELECT 
        id,
        nimi,
        saldo,
        CASE
            WHEN saldo > 100 THEN 'Hea klient'
            ELSE 'Tavaklient'
        END AS kliendi_tyyp
    FROM klient;
END;

EXEC KuvaKliendiTyyp;
 ```
## HINDELINE_ÜLESANNE_XAMPP
 
 Teeme esimene procedure:
  ```
 CREATE TABLE klient (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nimi VARCHAR(25) NOT NULL,
    linn VARCHAR(20),
    vanus INT,
    saldo DECIMAL(10,2)
);

INSERT INTO klient (nimi, linn, vanus, saldo)
VALUES ('Ada Vong', 'Tartu', 55, 14.80);
 ```
<img width="867" height="114" alt="{BE23ACB1-5FCE-46B0-AC6B-D62BEF11C31F}" src="https://github.com/user-attachments/assets/b38b4c24-9268-4895-b504-b20bc6ef4c3a" />

 Teeme teine procedure:
