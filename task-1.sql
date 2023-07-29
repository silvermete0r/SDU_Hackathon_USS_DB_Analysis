-- Анализ самых популярных продуктов в каждом магазине: --
SELECT
    s.StoreID,
    s.StoreCity,
    p.ProductID,
    p.ProductName,
    COUNT(o.ProductID) AS Popularity
FROM
    STORES s
INNER JOIN
    ORDERS o ON s.StoreID = o.StoreID
INNER JOIN
    PRODUCTS p ON o.ProductID = p.ProductID
GROUP BY
    s.StoreID, s.StoreCity, p.ProductID, p.ProductName
ORDER BY
    s.StoreID, Popularity DESC;
