-- Case A1 (Baseline): Direct aggregation after joins (city transaction counts)

EXPLAIN (ANALYZE, BUFFERS)
SELECT c.cityname,
       COUNT(s.salesid) AS total_transactions
FROM sales s
JOIN customers cu ON s.customerid = cu.customerid
JOIN cities c     ON cu.cityid = c.cityid
GROUP BY c.cityname
ORDER BY total_transactions DESC
LIMIT 10;
