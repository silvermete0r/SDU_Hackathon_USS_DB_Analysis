-- Общее количество покупок, совершенных каждым клиентом --
SELECT
    c.NameCustomer,
    COUNT(o.OrderID) AS TotalPurchases
FROM
    CLIENTS c
LEFT JOIN
    ORDERS o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.NameCustomer
ORDER BY
    TotalPurchases DESC;

-- Топ-5 самых покупаемых товаров, с количеством их покупок --
SELECT
    p.ProductName,
    COUNT(o.ProductID) AS TotalPurchases
FROM
    PRODUCTS p
LEFT JOIN
    ORDERS o ON p.ProductID = o.ProductID
GROUP BY
    p.ProductID, p.ProductName
ORDER BY
    TotalPurchases DESC
LIMIT 5;

-- Анализ предпочтительных магазинов для каждого клиента на --
-- основе количества покупок, совершенных в каждом магазине: --
SELECT
    c.NameCustomer,
    s.StoreCity,
    COUNT(o.OrderID) AS TotalPurchases
FROM
    CLIENTS c
LEFT JOIN
    ORDERS o ON c.CustomerID = o.CustomerID
LEFT JOIN
    STORES s ON o.StoreID = s.StoreID
GROUP BY
    c.CustomerID, c.NameCustomer, s.StoreCity
ORDER BY
    c.NameCustomer, TotalPurchases DESC;

-- Среднее количество покупок каждого клиента --
SELECT
    c.NameCustomer,
    AVG(o.PurchaseAmount) AS AveragePurchaseAmount
FROM
    CLIENTS c
LEFT JOIN
    ORDERS o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.NameCustomer
ORDER BY
    AveragePurchaseAmount DESC;
