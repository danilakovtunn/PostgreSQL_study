DROP FUNCTION IF EXISTS mean_time;
-- Среднее время использования приложения в определенном магазине

CREATE OR REPLACE FUNCTION mean_time(
	IN shop_addr varchar(50), 
	IN time_st timestamp, 
	IN time_f timestamp, 
	IN help bool DEFAULT false,
	OUT average_time interval,
	OUT counter int
) 
RETURNS record AS $$
	DECLARE curs CURSOR IS 
		SELECT * FROM sessions 
		WHERE user_info->>'address' = shop_addr AND
			  sessions.time_start BETWEEN time_st AND time_f;
	my_sum interval = '0:0:0';
BEGIN
	counter = 0;
	IF help 
	THEN
		RAISE NOTICE 'Функция считает среднее время использования приложения в магазине';
	END IF;
	FOR my_user IN curs LOOP
		my_sum = my_sum + my_user.duration;
		counter = counter + 1;
	END LOOP;
	IF counter = 0
	THEN
		RAISE NOTICE 'Записей о данно магазине не найдено';
		average_time = '0:0:0'::interval;
	ELSE
		average_time = my_sum / counter;
	END IF;
	RETURN;
END;
$$
language plpgsql;


-- Частота использования таблиц
DROP FUNCTION IF EXISTS average_count;

CREATE OR REPLACE FUNCTION average_count(
	IN purpose varchar(20),
	IN time_st timestamp, 
	IN time_f timestamp, 
	IN help bool DEFAULT false,
	OUT my_table varchar(30),
	OUT frequency numeric
) 
RETURNS SETOF record AS $$
	DECLARE curs CURSOR IS 
		SELECT * FROM interactions
		WHERE type_of_interaction = purpose AND
			  interaction_time BETWEEN time_st AND time_f
		LIMIT 10000;
        table_names varchar(30)[] = '{"Stores", "Employees", "Purchases", "Orders", "Customers", "Products", "Pull_classes",
						"Classes", "Sizes", "Prices", "tasks"}';
		counters int[] = '{0,0,0,0,0,0,0,0,0,0,0}';
		my_c int = 0;
		i varchar(30);
		counter int = 0;
BEGIN
	IF help 
	THEN
		RAISE NOTICE 'Частота пользований таблицами';
	END IF;
	FOR my_row IN curs LOOP
		my_c = 0;
		counter = counter + 1;
		FOREACH i IN ARRAY(table_names) LOOP
		 	my_c = my_c + 1;
			IF array_position(my_row.table_used , i) IS NOT NULL
			THEN 
				counters[my_c] = counters[my_c] + 1;
			END IF;
		END LOOP;
	END LOOP;
	my_c = 0;
	FOREACH i IN ARRAY(table_names) LOOP
		my_c = my_c + 1;
		my_table = i; 
		frequency = counters[my_c]::numeric / counter;
		RETURN NEXT;
	END LOOP;
END;
$$
language plpgsql;

SELECT * FROM mean_time('Saint-Petersburg, malenkaya street, house 7', '01-01-2020'::timestamp, '18-09-2021'::timestamp);
SELECT * FROM average_count('analysis', '01-01-2020'::timestamp, '18-09-2021'::timestamp, true);

