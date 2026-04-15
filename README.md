## AndmebaasidLogitpv24
andmebaaside haldusega seotud sql kood ja konspektid

## Põhimõted
- Andmebaasihaldussüsteemid - tarkvara, millega abi saab luua andmebaas (mariaDB - XAMPP, SQL Server - SQL server Management Studio)
- Andmebaas - struktureeritud andmete kogum
- Tabel - Olem - сущности
- Veerg = väli - поле
- Rida = kirje - запись
- Primaarne võti = Primary key - первичный ключ - PK - veerg, unikaalne identifikaatoriga (id)
- Välisvõti (võõrvõti) - foreign key - FK
  
## SQL - structured query language - struktureeritud päringu keel
Päring - запрос
<img width="483" height="424" alt="{18A9FFDB-3FD7-45A4-9D10-71CF3A24EF39}" src="https://github.com/user-attachments/assets/e47cd002-4094-4e4d-8839-959d462acd7d" />
1. DDL - Data Definition Language
2. DML - Data Manipulation Language
   
   ## Piirangud - ограничения - CONSTRAINT (5)
   1. PRIMARY KEY
   2. NOT NULL
   3. CHECK --valid
   4. UNIQUE
   5. FOREIGN KEY
   Andmetüüpid
   ```
   1. Int, smallint, deicmal(5,2) - numbrilised
   2. varchar(30), char(5), TEXT - tekst/sümbolised
   3. date, time, datetime - kuupäeva
   4. boolean, bit, bool - loogilised
   ```
