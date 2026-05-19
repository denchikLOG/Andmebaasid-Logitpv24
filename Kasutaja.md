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

