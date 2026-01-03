-- Case D2 (Optimised): Range predicate (sargable)

EXPLAIN (ANALYZE, BUFFERS)
SELECT COUNT(*)
FROM sales
WHERE salesdate >= TIMESTAMP '2018-01-01 00:00:00'
  AND salesdate <  TIMESTAMP '2019-01-01 00:00:00';
