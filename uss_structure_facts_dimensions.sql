-- Создаем факт таблицу для заказов --
CREATE TABLE IF NOT EXISTS public.orders_fact
(
    orderid serial PRIMARY KEY,
    orderdate date,
    purchaseamount numeric(10, 2),
    quantity integer,
    customerid integer,
    storeid integer,
    dateid integer,
    CONSTRAINT fk_customer FOREIGN KEY (customerid) REFERENCES public.customers_dim (customerid),
    CONSTRAINT fk_store FOREIGN KEY (storeid) REFERENCES public.stores_dim (storeid),
    CONSTRAINT fk_time FOREIGN KEY (dateid) REFERENCES public.time_dim (dateid)
);

-- Создаем таблицу измерения клиентов --
CREATE TABLE IF NOT EXISTS public.customers_dim
(
    customerid serial PRIMARY KEY,
    namecustomer character varying(255),
    email character varying(100),
    phone character varying(20),
    address character varying(255)
);

-- Создаем таблицу измерения поставщиков --
CREATE TABLE IF NOT EXISTS public.stores_dim
(
    storeid serial PRIMARY KEY,
    storecity character varying(100),
    storeaddress character varying(255)
);


-- Создаем таблицу измерения даты и времени --
CREATE TABLE IF NOT EXISTS public.time_dim
(
    dateid serial PRIMARY KEY,
    purchasedate date,
    purchaseyear integer,
    purchasequarter character varying COLLATE pg_catalog."default",
    purchasemonth character varying COLLATE pg_catalog."default"
);


