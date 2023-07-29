-- Решение №7 --
SELECT
    s.StoreID,
    s.StoreCity,
    ROUND(AVG(o.PurchaseAmount),2) AS AverageOrderReceipt
FROM
    STORES s
LEFT JOIN
    ORDERS o ON s.StoreID = o.StoreID
GROUP BY
    s.StoreID, s.StoreCity
ORDER BY
    s.StoreID;
