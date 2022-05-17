-- Иерархия сотрудников в определнном магазине
WITH RECURSIVE r AS (
	SELECT em.employee_id, em.chief_id, em.full_name, em.position
	FROM Employees em
	WHERE em.store_id = 1 AND chief_id IS NULL
	UNION 
	SELECT em.employee_id, em.chief_id, em.full_name, em.position
	FROM Employees em
	JOIN r ON em.chief_id = r.employee_id
)
SELECT * FROM r