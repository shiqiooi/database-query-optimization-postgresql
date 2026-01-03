-- Case B1 (Baseline): Aggregate units sold after join

EXPLAIN (ANALYZE, BUFFERS)
SELECT p.productname,
       SUM(s.quantity) AS total_units_sold
FROM sales s
JOIN products p ON s.productid = p.productid
GROUP BY p.productname
ORDER BY total_units_sold DESC
LIMIT 10;
