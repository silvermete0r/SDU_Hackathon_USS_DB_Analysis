-- Общее количество клиентов в базе --
SELECT COUNT(CustomerID) AS TotalCustomers
FROM CLIENTS;

-- Среднее количество покупок на клиента --
SELECT
    AVG(PurchaseAmount) AS AveragePurchaseAmount
FROM ORDERS;

-- Топ 5 самых лояльных клиентов --
SELECT
    c.CustomerID,
    c.NameCustomer,
    COUNT(o.OrderID) AS TotalOrders
FROM
    CLIENTS c
LEFT JOIN
    ORDERS o ON c.CustomerID = o.CustomerID
GROUP BY
    c.CustomerID, c.NameCustomer
ORDER BY
    TotalOrders DESC
LIMIT 5;


-- Среднее количество заказов на клиента --
SELECT
    COUNT(OrderID) / COUNT(DISTINCT CustomerID) AS AverageOrdersPerCustomer
FROM
    ORDERS;

-- Анализ покупок по категориям --
SELECT
    p.Category,
    COUNT(o.OrderID) AS PurchaseCount
FROM
    PRODUCTS p
LEFT JOIN
    ORDERS o ON p.ProductID = o.ProductID
GROUP BY
    p.Category
ORDER BY
    PurchaseCount DESC;

-- Процент клиентов, совершивших повторные покупки: --
SELECT
    COUNT(DISTINCT CustomerID) AS TotalCustomers,
    COUNT(DISTINCT CASE WHEN PurchaseAmount > 0 THEN CustomerID END) AS ReturningCustomers,
    (COUNT(DISTINCT CASE WHEN PurchaseAmount > 0 THEN CustomerID END) * 100.0) / COUNT(DISTINCT CustomerID) AS ReturningCustomerPercentage
FROM
    ORDERS;
