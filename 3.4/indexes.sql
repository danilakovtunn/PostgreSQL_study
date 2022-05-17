SET enable_seqscan TO on;

-- ARRAY 

DROP INDEX IF EXISTS gin_array;

EXPLAIN ANALYZE
SELECT * FROM interactions
WHERE table_used = '{"Sizes", "Orders", "Products", "Customers", "Prices"}';
/*
 Gather  (cost=1000.00..4550705.33 rows=11600 width=287) (actual time=40.947..378602.506 rows=3040 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on interactions  (cost=0.00..4548545.33 rows=4833 width=287) (actual time=515.483..378456.573 rows=1013 loops=3)
         Filter: (table_used = '{Sizes,Orders,Products,Customers,Prices}'::character varying[])
         Rows Removed by Filter: 33332320
 Planning Time: 55.450 ms
 Execution Time: 378603.469 ms
*/

CREATE INDEX gin_array ON interactions USING GIN(table_used);
--Query returned successfully in 21 min 25 secs.

EXPLAIN ANALYZE
SELECT * FROM interactions
WHERE table_used = '{"Sizes", "Orders", "Products", "Customers", "Prices"}';
/*
 Bitmap Heap Scan on interactions  (cost=2089.90..46707.18 rows=11600 width=287) (actual time=17607.444..1202260 rows=3040 loops=1)
   Recheck Cond: (table_used = '{Sizes,Orders,Products,Customers,Prices}'::character varying[])
   Rows Removed by Index Recheck: 11848
   Heap Blocks: exact=14868
   ->  Bitmap Index Scan on gin_array  (cost=0.00..2087.00 rows=11600 width=0) (actual time=17510.054..17510.054 rows=14888 loops=1)
         Index Cond: (table_used = '{Sizes,Orders,Products,Customers,Prices}'::character varying[])
 Planning Time: 63.095 ms
 Execution Time: 1200262.689 ms
*/

-- FULL TEXT

DROP IF EXISTS full_text_index;

EXPLAIN ANALYZE
SELECT * FROM interactions 
WHERE to_tsvector('english', user_comment) @@ to_tsquery('english', 'stupid');
/*
 Gather  (cost=1000.00..15016212.00 rows=500000 width=287) (actual time=1.327..1167261.671 rows=9177744 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on interactions  (cost=0.00..14965212.00 rows=208333 width=287) (actual time=8.091..1163668.742 rows=3059248 loops=3)
         Filter: (to_tsvector('english'::regconfig, user_comment) @@ '''stupid'''::tsquery)
         Rows Removed by Filter: 30274085
 Planning Time: 253.360 ms
 Execution Time: 1168315.966 ms
*/

CREATE INDEX full_text_index ON interactions USING GIN(to_tsvector('english', user_comment));
--Query returned successfully in 19 min 2 secs.

EXPLAIN ANALYZE
SELECT * FROM interactions 
WHERE to_tsvector('english', user_comment) @@ to_tsquery('english', 'stupid');
/*
 Gather  (cost=5615.00..11635889.64 rows=500000 width=287) (actual time=1835.906..601087.015 rows=9177744 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Bitmap Heap Scan on interactions  (cost=4615.00..11584889.64 rows=208333 width=287) (actual time=1679.960..598702.923 rows=3059248 loops=3)
         Recheck Cond: (to_tsvector('english'::regconfig, user_comment) @@ '''stupid'''::tsquery)
         Rows Removed by Index Recheck: 26930552
         Heap Blocks: exact=13737 lossy=1202569
         ->  Bitmap Index Scan on full_text_index  (cost=0.00..4490.00 rows=500000 width=0) (actual time=1820.995..1820.995 rows=9177744 loops=1)
               Index Cond: (to_tsvector('english'::regconfig, user_comment) @@ '''stupid'''::tsquery)
 Planning Time: 28.572 ms
 Execution Time: 601867.874 ms
*/

-- JSON

DROP IF EXISTS json_index;

EXPLAIN ANALYZE 
SELECT * FROM sessions
WHERE (user_info->>'full_name' = 'Jones Gordon') AND (user_info->>'position' = 'Cashier');
/*
 Gather  (cost=1000.00..342368.79 rows=254 width=168) (actual time=1.022..10233.885 rows=126 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Parallel Seq Scan on sessions  (cost=0.00..341343.39 rows=106 width=168) (actual time=138.840..10136.990 rows=42 loops=3)
         Filter: (((user_info ->> 'full_name'::text) = 'Jones Gordon'::text) AND ((user_info ->> 'position'::text) = 'Cashier'::text))
         Rows Removed by Filter: 3333291
 Planning Time: 25.894 ms
 Execution Time: 10233.988 ms
*/

CREATE INDEX json_index ON sessions((user_info->>'full_name'), (user_info->>'position'));
-- Query returned successfully in 1 min 58 secs

EXPLAIN ANALYZE 
SELECT * FROM sessions
WHERE (user_info->>'full_name' = 'Jones Gordon') AND (user_info->>'position' = 'Cashier');
/*
 Bitmap Heap Scan on sessions  (cost=11.12..992.72 rows=250 width=168) (actual time=0.111..0.648 rows=126 loops=1)
   Recheck Cond: (((user_info ->> 'full_name'::text) = 'Jones Gordon'::text) AND ((user_info ->> 'position'::text) = 'Cashier'::text))
   Heap Blocks: exact=126
   ->  Bitmap Index Scan on json_index  (cost=0.00..11.06 rows=250 width=0) (actual time=0.090..0.090 rows=126 loops=1)
         Index Cond: (((user_info ->> 'full_name'::text) = 'Jones Gordon'::text) AND ((user_info ->> 'position'::text) = 'Cashier'::text))
 Planning Time: 1.680 ms
 Execution Time: 0.692 ms
*/

SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
ORDER BY
    tablename,
    indexname;	