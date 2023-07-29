-- Решение №8 --
WITH TopProducts AS (
    SELECT
        o.ProductID,
        p.ProductName,
        SUM(o.PurchaseAmount) AS TotalSales
    FROM
        ORDERS o
    JOIN
        PRODUCTS p ON o.ProductID = p.ProductID
    WHERE
        o.OrderDate >= NOW() - INTERVAL '7 months' -- Не было данных на более ранние месяца!
    GROUP BY
        o.ProductID, p.ProductName
    ORDER BY
        TotalSales DESC
    LIMIT 5
)

SELECT
    tp.ProductID,
    tp.ProductName,
    tp.TotalSales,
    c.CustomerID,
    c.NameCustomer
FROM
    TopProducts tp
JOIN
    ORDERS o ON tp.ProductID = o.ProductID
JOIN
    CLIENTS c ON o.CustomerID = c.CustomerID
ORDER BY
    tp.TotalSales DESC, tp.ProductID, c.CustomerID;
