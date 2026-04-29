#Andmebaas Sales
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


```
--2 brands
create table brands(
brandID int primary key identity(1,1),
brand_name varchar(20) unique);

insert into brands(brand_name)
values('Samsung')
```

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


--Checking all tables:
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


<img width="809" height="675" alt="{CAF81404-4AC7-41C8-A470-1AE0984A5C55}" src="https://github.com/user-attachments/assets/753e60ef-f434-43a3-9a0b-bac6164aca71" />
