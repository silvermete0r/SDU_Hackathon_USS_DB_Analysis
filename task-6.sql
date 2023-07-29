-- Решение №6 --
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
