--Закрытие магазина и увольнение всех сотрудников в это магазине
--Происхожит каскадное удаление
DELETE 
FROM Stores
WHERE store_id = 1;

SELECT * 
FROM Employees, Stores
WHERE Employees.store_id = Stores.store_id