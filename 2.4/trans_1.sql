-- READ UNCOMMITTED (COMMITTED)
-- Потерянное изменение
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--BEGIN;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
--COMMIT;

-- Грязное чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
--ROLLBACK;

-- Неповторяющееся чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
--SELECT heigh_to FROM Sizes WHERE size_id = 1
--SELECT heigh_to FROM Sizes WHERE size_id = 1
--COMMIT;


-- REPEATABLE READ
-- Неповторяющееся чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--SELECT heigh_to FROM Sizes WHERE size_id = 1
--SELECT heigh_to FROM Sizes WHERE size_id = 1
--COMMIT;

-- Фантомное чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--SELECT COUNT(*) FROM Sizes
--SELECT COUNT(*) FROM Sizes
--COMMIT;

--SERIALIZABLE
-- Фантомное чтение
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--SELECT COUNT(*) FROM Sizes
--SELECT COUNT(*) FROM Sizes
--COMMIT;


--Ошибка сериализации
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--UPDATE Sizes SET heigh_from = (SELECT SUM(heigh_from) FROM Sizes WHERE heigh_to < 100) WHERE size_id = 11
--COMMIT;



--ДЕДЛОК
--BEGIN;
--SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 1;
--UPDATE Sizes SET heigh_to = heigh_to + 5 WHERE size_id = 2;
--COMMIT;