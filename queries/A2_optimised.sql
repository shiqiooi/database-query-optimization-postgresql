-- Case A2 (Optimised): Pre-aggregate first, then join to dimensions

EXPLAIN (ANALYZE, BUFFERS)
SELECT c.cityname,
       SUM(t.tx_count) AS total_transactions
FROM (
    SELECT customerid, COUNT(*) AS tx_count
    FROM sales
    GROUP BY customerid
) t
JOIN customers cu ON t.customerid = cu.customerid
JOIN cities c     ON cu.cityid = c.cityid
GROUP BY c.cityname
ORDER BY total_transactions DESC
LIMIT 10;
