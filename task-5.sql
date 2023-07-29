-- Решение №5 --
SELECT
    DATE_TRUNC('month', o.OrderDate) AS SalesMonth,
    SUM(o.PurchaseAmount) AS TotalSales
FROM
    ORDERS o
WHERE
    o.OrderDate >= '<START_DATE>' AND o.OrderDate <= '<END_DATE>' -- !FORMAT: YYYY-MM-DD --
GROUP BY
    SalesMonth
ORDER BY
    SalesMonth;
