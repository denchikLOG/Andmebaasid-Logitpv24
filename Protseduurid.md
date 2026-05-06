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

