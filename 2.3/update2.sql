UPDATE Employees SET position = 'Старший консультант', chief_id = (
	SELECT chief_id FROM Employees em
	WHERE em.position = 'Старший консультант' AND
		  em.store_id = (SELECT store_id FROM Employees WHERE full_name = 'Анна Воробьева')
	LIMIT 1
)
WHERE full_name = 'Анна Воробьева' AND position = 'Продавец-консультант'
RETURNING Employees.full_name, Employees.position