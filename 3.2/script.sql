SET ROLE postgres;

/****************************************** DELETION ************************************/
/*REASSIGN OWNED BY test TO postgres;
DROP OWNED BY test; */                                                                                     -- либо так
REVOKE USAGE ON SCHEMA public FROM test;                                                                   --
REVOKE ALL ON ALL TABLES IN SCHEMA public FROM test; --отбираем все права на таблицы у польззователя test  -- либо так
REVOKE ALL ON DATABASE test FROM test; --отбираем права на базу данных                                     --
DROP USER IF EXISTS test; --удаляем пользователя
DROP VIEW IF EXISTS last_year_sessions;
DROP VIEW IF EXISTS inters;
REASSIGN OWNED BY standart TO postgres;
DROP OWNED BY standart;
DROP ROLE IF EXISTS standart;

/****************************************** CREATION AND GRAND RULES ************************************/
CREATE USER test WITH PASSWORD 'test'; --создание пользователя
-- GRANT USAGE ON SCHEMA public TO test;
GRANT ALL ON DATABASE test to test; --даем права на базу данных

--Добавляем определенный доступ к таблицам
GRANT SELECT ON users TO test;
GRANT SELECT, UPDATE ON sessions TO test;
GRANT SELECT, UPDATE, INSERT ON interactions TO test;

/*************************************** VIEWS *****************************************/
CREATE MATERIALIZED VIEW last_year_sessions AS
	SELECT session_id, user_id,
		   (user_info->>'full_name') AS full_name,
		   (user_info->>'address') AS store_address,
		   (user_info->>'position') AS position,
		   time_start, duration
	FROM sessions 
	WHERE extract(year from time_start) = extract(year from now()) - 1;

CREATE VIEW inters AS 
	SELECT interaction_id, user_id, session_id, 
		   (user_info->>'full_name') AS full_name,
		   (user_info->>'address') AS store_address,
		   interaction_time, type_of_interaction, table_used
	FROM interactions;


GRANT SELECT ON last_year_sessions to test; 

CREATE ROLE standart;
GRANT UPDATE  (duration) ON last_year_sessions TO standart;
GRANT standart TO test;


--Выполним от имени нового пользователя некоторые действия
SET ROLE test;

--Проверка на права по селектам
SELECT * FROM users LIMIT 10;
SELECT * FROM sessions ORDER BY session_id LIMIT 20;
SELECT * FROM interactions LIMIT 10;
SELECT * FROM last_year_sessions ORDER BY session_id LIMIT 10;
SELECT * FROM inters LIMIT 10; -- нет доступа

--Проверка на права по адейтам
UPDATE users SET city = 'Moscow' WHERE user_id = 1;
UPDATE sessions SET session_os = 'windows 10' WHERE user_id = 1;
UPDATE last_year_sessions SET duration = '1 3:12:32'::interval WHERE session_id = 2;
UPDATE last_year_sessions SET time_start = '2020-05-17 12:15:23'::timestamp WHERE session_id = 2; -- нет доступа
-- аналогично нет доступа к VIEW inters
