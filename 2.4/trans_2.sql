-- READ UNCOMMITTED (COMMITTED)
-- Потерянное изменение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--SELECT heigh_to FROM Sizes WHERE size_id = 1; 
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
--COMMIT;

-- Грязное чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--SELECT heigh_to FROM Sizes WHERE size_id = 1;
--COMMIT;

-- Неповторяющееся чтение

/*BEGIN;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
*/--COMMIT;


-- REPEATABLE READ
-- Неповторяющееся чтение
/*
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
COMMIT;
*/

-- Фантомное чтение
/*
BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
INSERT INTO Sizes (age_from, age_to, heigh_from, heigh_to) VALUES ('12-0', '14-0', 158, 166);
COMMIT;
*/

-- SERIALIZABLE
-- Фантомное чтение
/*
BEGIN;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
INSERT INTO Sizes (age_from, age_to, heigh_from, heigh_to) VALUES ('12-0', '14-0', 158, 166);
COMMIT;
*/

--Ошибка сериализации
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--UPDATE Sizes SET heigh_from = (SELECT SUM(heigh_from) FROM Sizes WHERE heigh_to >= 100) WHERE size_id = 1
--COMMIT;



--ДЕДЛОК
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 2;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
--COMMIT;