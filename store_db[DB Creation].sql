-- 1) Создаем таблицу клиентов --
CREATE TABLE CLIENTS (
    CustomerID SERIAL PRIMARY KEY,
    NameCustomer VARCHAR(255),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255)
);

-- 2) Создаем таблицу поставщиков --
CREATE TABLE SUPPLIERS (
    SupplierID SERIAL PRIMARY KEY,
    SupplierName VARCHAR(255),
    SupplierContact VARCHAR(255)
);

-- 3) Создаем таблицу дат покупок --
CREATE TABLE DATES (
    PurchaseDate DATE PRIMARY KEY,
    PurchaseYear INTEGER,
    PurchaseQuarter INTEGER,
    PurchaseMonth INTEGER
);

-- 4) Создаем таблицу продуктов с отсылкой на поставщика --
CREATE TABLE PRODUCTS (
	ProductID SERIAL PRIMARY KEY,
	ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price NUMERIC(10, 2),
    QuantityInStock INTEGER,
    SupplierID INTEGER REFERENCES SUPPLIERS(SupplierID)
);

-- 5) Создаем таблицу магазинов --
CREATE TABLE STORES (
    StoreID SERIAL PRIMARY KEY,
    StoreCity VARCHAR(100),
    StoreAddress VARCHAR(255)
);

-- 6) Создаем таблицу статуса заказов --
CREATE TABLE ORDER_STATUS (
    OrderStatusID SERIAL PRIMARY KEY,
    OrderStatusName VARCHAR(100)
);

-- 7) Создаем таблицу заказов (связующий элемент USS) --
CREATE TABLE ORDERS (
    OrderID SERIAL PRIMARY KEY,
    OrderDate DATE,
    CustomerID INTEGER REFERENCES CLIENTS(CustomerID),
    ProductID INTEGER REFERENCES PRODUCTS(ProductID),
    PurchaseAmount INTEGER,
    StoreID INTEGER REFERENCES STORES(StoreID),
    OrderStatusID INTEGER REFERENCES ORDER_STATUS(OrderStatusID)
);
