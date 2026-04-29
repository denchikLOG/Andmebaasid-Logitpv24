##Andmebaas Sales
```
create database Sales_Melnikov;
use Sales_Melnikov;
```

```
--1 categories
create table categories(
categoryID int primary key identity(1,1),
category_name varchar(25) Unique);

insert into categories(category_name)
values('Arvuti')
```
<img width="191" height="84" alt="{0F1FDD68-1A34-49C7-ADA3-80FC9B3F87CA}" src="https://github.com/user-attachments/assets/2e926bec-7880-4426-9035-00ec8b5b6a2d" />

```
--2 brands
create table brands(
brandID int primary key identity(1,1),
brand_name varchar(20) unique);

insert into brands(brand_name)
values('Samsung')
```
<img width="181" height="75" alt="{A4594809-A9B2-4EB2-B9C2-A31F0138A81B}" src="https://github.com/user-attachments/assets/9446e6b8-e5e5-4b7d-8879-e833efda7e45" />

```
--3 products 
create table products(
productsID int primary key identity(1,1),
product_name varchar(50) not null,
brandID int, 
foreign key (brandID) references brands(brandID),
categoryID int,
foreign key (categoryID) references categories(categoryID),
model_year int,
list_price money);

insert into products
values ('Samsung A55', 1, 1, 2025, 500)
```
<img width="180" height="151" alt="{5416EDEB-9D58-4F27-80C3-E319C3FA6FAE}" src="https://github.com/user-attachments/assets/8c76d986-1f7e-46e3-88b0-6b1761eee201" />

````
--4 stores
create table stores(
storeID int primary key identity(1,1),
store_name varchar(35) not null,
phone varchar(13),
email varchar(20),
street varchar(20),
city varchar(20),
state varchar(20),
zip_code char(7))

insert into stores
values ('Bad_shop', '866656752', 'bad_shop@gmail.com', 'Ülemiste tee', 'Tallinn', 'Harjumaa', '12911' )
````
<img width="177" height="193" alt="{6211D244-1DB3-412D-BC01-4502AC123ADC}" src="https://github.com/user-attachments/assets/01b6e342-ab6f-47d1-b7ac-ea867bbbf72f" />

````
--5 stocks
create table stocks(
storeID int,
productID int,
primary key (storeID, productID),
foreign key(storeID) references stores(storeID),
foreign key(productID) references products(productsID),
quantity int);

insert into stocks
values(2,1, 41)
````
<img width="180" height="96" alt="{9F62233B-F6C6-4C5A-BB84-FDE721A664F1}" src="https://github.com/user-attachments/assets/90a7c534-9f9c-4680-aa62-492de03a091d" />

````
--6 customers
create table customers(
customerID int primary key identity(1,1),
first_name varchar(15) not null,
last_name varchar(15) not null,
phone varchar(13), 
email varchar(25),
street varchar(15),
city varchar(15) check (city='Tallinn' or city='Narva'),
state varchar(15),
zip_code char(5)
);

insert into customers
values('Irina', 'Irha', '5242234', 'II@gmail.com', 'Narva tn', 'Narva', 'Harjumaa', '16612')
````
<img width="184" height="214" alt="{18ED5008-9AB6-4C1F-985C-1956F8C3BEF0}" src="https://github.com/user-attachments/assets/af10a461-723e-49ce-8d93-abb2f0e42507" />

````
--7 staff
create table staff(
staffID int primary key identity(1,1),
first_name varchar(15) not null,
last_name varchar(15) not null,
email varchar(25),
phone varchar(13), 
active bit,
storeID int,
foreign key (storeID) references stores(storeID),
manager bit
);

insert into staff
values('Andrei', 'Romanov', 'AndreiR@gmail.com', '52625222', 1, 2, 0)
````
<img width="180" height="197" alt="{B777CA37-59CF-41B0-A4B5-EAD8EDB551E4}" src="https://github.com/user-attachments/assets/4b2aed82-e793-4e98-999b-9ef786f09b34" />

``
--8 orders
create table orders(
orderID int primary key identity(1,1),
customerID int,
foreign key(customerID) references customers(customerID),
order_status varchar(15) check(order_status='complete' or order_status='incomplete'),
order_date Date,
required_date date,
shipped_date date,
storeID int,
staffID int,
foreign key(storeID) references stores(storeID),
foreign key(staffID) references staff(staffID)
);

insert into orders
values(1,'complete', '2026-04-02', '2026-04-06', '2026-04-12', 1, 1)
``
<img width="177" height="193" alt="{BDE1886F-6A23-483C-8EDC-576045FE3E67}" src="https://github.com/user-attachments/assets/0828cccf-bac0-4254-a71c-fc95c8ca7450" />

``
--9 order_items
drop table order_items
create table order_items(
orderID int,
itemID int,
primary key (orderID, itemID),
productID int,
quantity int,
list_price money, 
discount int
foreign key(orderID) references orders(orderID),
foreign key(productID) references products(productsID))

insert into order_items
values(2, 2, 1, 12, 67, 25)
``
<img width="181" height="157" alt="{4AD5250E-81E4-431C-A3F0-A51573757F33}" src="https://github.com/user-attachments/assets/ca40ea2d-510d-4c5e-a774-03836dea223c" />


##Checking all tables
```
select * from categories
select * from brands
select * from products
select * from stores
select * from stocks
select * from customers
select * from staff
select * from orders
select * fromt order_items
```

<img width="1059" height="818" alt="{A2AEA5F7-D030-4108-8FE6-2962FC2BCE25}" src="https://github.com/user-attachments/assets/0861fc0a-da55-4f43-9065-eb1001746a4f" />


