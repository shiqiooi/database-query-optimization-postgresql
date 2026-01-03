-- Case C1 (Baseline): Function-based month predicate (not index-friendly)

EXPLAIN (ANALYZE, BUFFERS)
SELECT DATE_TRUNC('month', s.salesdate) AS month,
       COUNT(*) AS transactions
FROM sales s
WHERE DATE_TRUNC('month', s.salesdate) = TIMESTAMP '2018-01-01'
GROUP BY month
ORDER BY month;
