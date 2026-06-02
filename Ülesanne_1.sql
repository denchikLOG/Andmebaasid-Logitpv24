--ULESANNE 1


--Lisame Category tabelit
CREATE TABLE Category(
categoryID int PRIMARY KEY identity(1,1),
categoryName varchar(50) not null
);

--Lisame Product tabelit
CREATE TABLE Products(
productID int PRIMARY KEY identity(1,1),
product_name varchar(50) not null,
categoryID int,
price INT CHECK (price>0),
FOREIGN KEY (categoryID) REFERENCES Category(categoryID)
);

--Lisame Sale tabelit
CREATE TABLE Sale(
saleID int PRIMARY KEY identity(1,1),
productID int,
Sale_date date,
FOREIGN KEY (productID) REFERENCES Products(productID)
);

--Lisame VALUES category tabelis
INSERT INTO Category(categoryName)
VALUES ('Toit'), ('Mänguasjad');

--Lisame VALUES Product tabelis
INSERT INTO Products(product_name, categoryID, price)
VALUES ('Apelsin', 1, 1.50),
       ('Sulearvuti', 2, 150);

--Lisame VALUES Sale tabelis
INSERT INTO Sale
VALUES ( 2, '2026-01-10'),
(1, '2026-04-22');


select * from Category
select * from Products
select * from Sale


--Lisame Customer tabelit
CREATE TABLE Customers(
CustomerID INT PRIMARY KEY IDENTITY(1,1),
Customer_name varchar(50) not null,
Customer_contact varchar(50));

--Lisame Values Customer tablis
INSERT INTO Customers
VALUES ('Andrei', '582834343')

select * from Customers
