-- Case B2 (Optimised): Pre-aggregate by productid, then join to products

EXPLAIN (ANALYZE, BUFFERS)
SELECT p.productname,
       t.total_units_sold
FROM (
    SELECT productid,
           SUM(quantity) AS total_units_sold
    FROM sales
    GROUP BY productid
) t
JOIN products p ON t.productid = p.productid
ORDER BY t.total_units_sold DESC
LIMIT 10;
