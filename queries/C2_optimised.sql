-- Case C2 (Optimised): Range predicate (sargable / index-friendly)

EXPLAIN (ANALYZE, BUFFERS)
SELECT DATE_TRUNC('month', s.salesdate) AS month,
       COUNT(*) AS transactions
FROM sales s
WHERE s.salesdate >= TIMESTAMP '2018-01-01'
  AND s.salesdate <  TIMESTAMP '2018-02-01'
GROUP BY month
ORDER BY month;
