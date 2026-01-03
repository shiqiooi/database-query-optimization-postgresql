-- Extra: Monthly trend for the whole year 2018 (your screenshot "monthly trend")

EXPLAIN (ANALYZE, BUFFERS)
SELECT DATE_TRUNC('month', s.salesdate) AS month,
       COUNT(*) AS transactions
FROM sales s
WHERE s.salesdate >= TIMESTAMP '2018-01-01'
  AND s.salesdate <  TIMESTAMP '2019-01-01'
GROUP BY month
ORDER BY month;
