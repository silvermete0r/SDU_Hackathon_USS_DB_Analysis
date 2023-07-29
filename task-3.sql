-- Анализ эффективности работы каждого магазина --
SELECT
    s.StoreID,
    s.StoreCity,
    COUNT(DISTINCT o.CustomerID) AS TotalCustomers,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.PurchaseAmount) AS TotalSales,
    ROUND(AVG(o.PurchaseAmount), 2) AS AveragePurchaseAmount
FROM
    STORES s
LEFT JOIN
    ORDERS o ON s.StoreID = o.StoreID
GROUP BY
    s.StoreID, s.StoreCity
ORDER BY
    s.StoreID;
