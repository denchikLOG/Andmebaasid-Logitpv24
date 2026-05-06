## SQL protseduur -
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

##Kustutamis kategooria

--proseduur, mis kustutab kategooria id järgi
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

##Procedure otsingitaht

CREATE PROCEDURE otsingitaht
@taht char(1)
AS BEGIN
       SELECT * FROM categories
  WHERE category_name LIKE @taht + '%';
END;


EXEC lisaKategooria 'Auto2'



--2.brands
CREATE TABLE brands(
brand_id int PRIMARY KEY identity(1,1),
brand_name varchar(15) UNIQUE);

INSERT INTO brands(brand_name)
VALUES ('Nokia');

SELECT * FROM brands;


--3.products
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





##Procedure muudatus

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

<img width="500" height="187" alt="{CBA1BBA2-A66B-4FE5-A37A-B48C2F4BEFEB}" src="https://github.com/user-attachments/assets/52754515-8332-4f50-b3c9-514a5fe519fd" />



