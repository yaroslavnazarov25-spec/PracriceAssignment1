Використані таблиці:

CREATE TABLE Clients (
    clientid INT primary key,
    clientname VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    shopid INT
);

CREATE TABLE Products (
    productid INT primary key,
    productname VARCHAR(100),
    price DECIMAL(10, 2),
    warehouseid INT
);

CREATE TABLE Orders (
    orderid INT primary key,
    clientID INT,
    OrderDate DATE,
    Quantity INT
);

CREATE TABLE Shops (
    shopid INT primary key,
    clientid INT,
    country VARCHAR(100),
    city VARCHAR(100),
    address VARCHAR(20),
    warehouseid INT
);

CREATE TABLE Shops (
    warehouseid INT primary key,
    shopid INT,
    capacity INT,
    warehouse_address VARCHAR(20)
);
