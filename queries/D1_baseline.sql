-- Case D1 (Baseline): EXTRACT(YEAR) predicate (function-based)

EXPLAIN (ANALYZE, BUFFERS)
SELECT COUNT(*)
FROM sales
WHERE EXTRACT(YEAR FROM salesdate) = 2018;
