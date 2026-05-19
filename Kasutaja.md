## SQL sever - Kasutajate autemine ja õiguste haldamine
1. Windows Authentication
2. SQL server Authentication
# Kasutaja loomine SQL serveris 
  1. serveritaseme kasutaja loomine (Login) Sammud Ava:

Security -> Login; Tee paremklikk ja vali:

New Login... 

  <img width="705" height="651" alt="{B0F8ABD3-933A-451C-8536-F1DBC3136D74}" src="https://github.com/user-attachments/assets/4c1ea62c-2090-4c18-b429-20963272eeed" />

 2. Avame Server Roles:

   Valime Public:

   <img width="388" height="321" alt="{8454669B-5C65-4D61-A9BA-6A9EEB3A44D8}" src="https://github.com/user-attachments/assets/15f24699-d11e-4468-b584-176e358439d5" />


 3. Pärast avame User Mapping:

  <img width="702" height="658" alt="{0BC5089E-7ABE-4E6D-8A45-7D9E9A602A47}" src="https://github.com/user-attachments/assets/375dbe8b-22d4-4992-aa02-012e1eff61aa" />

  4. SQL commands

Grant <- õiguste määramine

Deny <- õiguste keelamine

anname kasutajale õigus vaadata tabelit (SELECT), lisada andmed (INSERT )ning uuendada need(UPDATE)

  ```
  GRANT

  grant select on opilane_table to Director
  grant insert on opilane_table to Director
  grant update on opilane_table to Director

  DENY

  deny delete on opilane_table to Director
  deny create on opilane_table to Director
  ```
  5. Kasutaja õiguste kontrol
     
<img width="479" height="515" alt="{D0796A9E-7BEA-4D68-9CD4-015C152C86D8}" src="https://github.com/user-attachments/assets/c08a9b8e-54e8-4d1a-b4a3-22fc62707184" />

  Kasutaja Director ei saa kasutada Delete:

<img width="1151" height="307" alt="{BB9280B7-1557-4FA6-9456-0DC7492DF374}" src="https://github.com/user-attachments/assets/3a8a972f-b9b8-44c1-821f-3586edf232ef" />


## Ülesanne 1
   on vaja:
Luua andmebaas: MovieBase
Luua tabelid: 
movies (id, moviesNimi, moviesYear, movieDir, movieCost).
guest (id, name)
Lisada vähemalt 7 kirjet.

1. Luua tabliet, andmebaas:
````
CREATE DATABASE MovieBaseLogitpv24;

USE MovieBaseLogitpv24;

CREATE TABLE movies (
moviesid INT PRIMARY KEY IDENTITY(1,1),
moviesNimi VARCHAR(100),
moviesYear INT,
movieDir VARCHAR(100),
movieCost MONEY
);

CREATE TABLE guest (
guestid INT PRIMARY KEY IDENTITY(1,1),
name VARCHAR(100)
);

INSERT INTO movies (moviesNimi, moviesYear, movieDir, movieCost)
VALUES('The Matrix', 1999, 'Wachowski Sisters', 63000000);

INSERT INTO guest (name)
VALUES('Laura');

select * from guest
select * from movies
````

<img width="443" height="372" alt="{81F7DACB-1B95-47C4-8544-A6939C7A2B95}" src="https://github.com/user-attachments/assets/a8ec77e5-32e6-4f44-bf1a-bae46f674700" />

2. Lisame uus kasutaja:
nimetasin kasutaja - Produss

<img width="218" height="232" alt="{AFD835F7-786D-4588-BCD9-9A544CA1F151}" src="https://github.com/user-attachments/assets/ee7b4d16-fafb-43af-bd5e-b06ec52c7569" />


3. Õigused:
````
GRANT SELECT ON movies TO Produss;

GRANT UPDATE (movieDir, movieCost)
ON movies TO Produss;

GRANT SELECT, INSERT
ON guest TO Produss;

DENY DELETE ON movies TO Produss;

DENY DELETE ON guest TO Produss;
````

4. Logime sisse nagu Produss ja proovime näiteks kasutada delete:

<img width="1124" height="208" alt="{A8F88BF7-3412-420B-BDA5-A941B5814D0B}" src="https://github.com/user-attachments/assets/b9186118-7899-4ff0-9ebb-72ef76998657" />










   
