-- READ UNCOMMITTED (COMMITTED)
-- Потерянное изменение НЕТ
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
																	UPDATE Sizes SET heigh_to = heigh_to + 7 WHERE size_id = 1;
																	COMMIT;
COMMIT;

/* Потерянное изменение: 
 * целевые строки могут быть уже изменены (а также удалены или заблокированы) 
 * другой параллельной транзакцией. В этом случае запланированное изменение 
 * будет отложено до фиксирования или отката первой изменяющей данные транзакции (если она ещё выполняется) */
 
---------------------------------------------------------------------------------------------------------------------------------------
-- Грязное чтение НЕТ
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
																	SELECT heigh_to FROM Sizes WHERE size_id = 1;
																	COMMIT;
ROLLBACK;
/* Грязное чтение:
 * В транзакции, работающей на этом уровне, запрос SELECT видит только те данные, 
 * которые были зафиксированы до начала запроса; он никогда не увидит незафиксированных данных или изменений, 
 * внесённых в процессе выполнения запроса параллельными транзакциями.*/
 
---------------------------------------------------------------------------------------------------------------------------------------
-- Неповторяющееся чтение ДА
BEGIN;
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
SELECT heigh_to FROM Sizes WHERE size_id = 1
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
																	UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
																	COMMIT;
SELECT heigh_to FROM Sizes WHERE size_id = 1 -- Данные зафиксированны до начала SELECT-запроса 
COMMIT;

/************************************************************************************************************************************/
-- REPEATABLE READ
-- Неповторяющееся чтение НЕТ
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT heigh_to FROM Sizes WHERE size_id = 1
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
																	UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
																	COMMIT;
SELECT heigh_to FROM Sizes WHERE size_id = 1
COMMIT;
/* Отличается от Read Committed тем, что запрос в транзакции данного уровня видит снимок
 * данных на момент начала первого оператора в транзакции , а не начала текущего оператора. */ 
 
---------------------------------------------------------------------------------------------------------------------------------------
-- Фантомное чтение НЕТ
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT COUNT(*) FROM Sizes
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
																	INSERT INTO Sizes (age_from, age_to, heigh_from, heigh_to) VALUES
																		('12-0', '14-0', 158, 166);
																	COMMIT;
SELECT COUNT(*) FROM Sizes
COMMIT;

/************************************************************************************************************************************/
-- SERIALIZABLE
-- Фантомы НЕТ
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
SELECT COUNT(*) FROM Sizes
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
																	INSERT INTO Sizes (age_from, age_to, heigh_from, heigh_to) VALUES
																		('12-0', '14-0', 158, 166);
																	COMMIT;
SELECT COUNT(*) FROM Sizes
COMMIT;

---------------------------------------------------------------------------------------------------------------------------------------
-- Сериализация 
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
UPDATE Sizes SET heigh_from = (
	SELECT SUM(heigh_from) FROM Sizes WHERE heigh_to < 100
) WHERE size_id = 11
																	BEGIN;
																	SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
																	UPDATE Sizes SET heigh_from = (
																		SELECT SUM(heigh_from) FROM Sizes WHERE heigh_to >= 100
																	) WHERE size_id = 1
																	COMMIT;
COMMIT;