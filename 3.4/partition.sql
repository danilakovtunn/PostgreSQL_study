CREATE TABLE sessions_section (
    session_id int,
    user_id int,
    user_info json,
    time_start timestamp,
    duration interval,
    session_os varchar(30),
    display_resolution varchar(11),
	PRIMARY KEY (session_id, time_start)
) PARTITION BY RANGE (time_start);

CREATE TABLE ses_2015_1 
PARTITION OF sessions_section FOR VALUES FROM ('2015-01-01') TO ('2015-06-01');

CREATE TABLE ses_2015_2 
PARTITION OF sessions_section FOR VALUES FROM ('2015-06-01') TO ('2016-01-01');

CREATE TABLE ses_2016_1 
PARTITION OF sessions_section FOR VALUES FROM ('2016-01-01') TO ('2016-06-01');

CREATE TABLE ses_2016_2 
PARTITION OF sessions_section FOR VALUES FROM ('2016-06-01') TO ('2017-01-01');

CREATE TABLE ses_2017_1 
PARTITION OF sessions_section FOR VALUES FROM ('2017-01-01') TO ('2017-06-01');

CREATE TABLE ses_2017_2 
PARTITION OF sessions_section FOR VALUES FROM ('2017-06-01') TO ('2018-01-01');

CREATE TABLE ses_2018_1 
PARTITION OF sessions_section FOR VALUES FROM ('2018-01-01') TO ('2018-06-01');

CREATE TABLE ses_2018_2 
PARTITION OF sessions_section FOR VALUES FROM ('2018-06-01') TO ('2019-01-01');

CREATE TABLE ses_2019_1 
PARTITION OF sessions_section FOR VALUES FROM ('2019-01-01') TO ('2019-06-01');

CREATE TABLE ses_2019_2 
PARTITION OF sessions_section FOR VALUES FROM ('2019-06-01') TO ('2020-01-01');

CREATE TABLE ses_2020_1 
PARTITION OF sessions_section FOR VALUES FROM ('2020-01-01') TO ('2020-06-01');

CREATE TABLE ses_2020_2 
PARTITION OF sessions_section FOR VALUES FROM ('2020-06-01') TO ('2021-01-01');

INSERT INTO sessions_section (session_id,
							  user_id,
							  user_info,
							  time_start,
							  duration,
							  session_os,
							  display_resolution
)
	SELECT * FROM sessions;
	
EXPLAIN ANALYZE 
SELECT * FROM sessions 
WHERE time_start < '2016-01-01'::timestamp AND time_start > '2015-06-01'::timestamp;
/*
 Seq Scan on sessions  (cost=0.00..406773.98 rows=975721 width=168) (actual time=51.029..25633.060 rows=971607 loops=1)
   Filter: ((time_start < '2016-01-01 00:00:00'::timestamp without time zone) AND (time_start > '2015-06-01 00:00:00'::timestamp without time zone))
   Rows Removed by Filter: 9028392
 Planning Time: 0.155 ms
 Execution Time: 25694.834 ms
*/

EXPLAIN ANALYZE 
SELECT * FROM sessions_section
WHERE time_start < '2016-01-01'::timestamp AND time_start > '2015-06-01'::timestamp;
/*
 Append  (cost=0.00..44013.17 rows=971413 width=167) (actual time=0.087..409.594 rows=971607 loops=1)
   ->  Seq Scan on ses_2015_2  (cost=0.00..39156.10 rows=971413 width=167) (actual time=0.085..348.697 rows=971607 loops=1)
         Filter: ((time_start < '2016-01-01 00:00:00'::timestamp without time zone) AND (time_start > '2015-06-01 00:00:00'::timestamp without time zone))
 Planning Time: 0.931 ms
 Execution Time: 442.080 ms
*/