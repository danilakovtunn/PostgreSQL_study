/*
SET session_replication_role = replica; --но если добавить, то отключатются все триггеры => ограничения внешних ключей не проверяются
-- Так не получится, нарушается ограничение ON DELETE RESTRICT у таблицы Purchases по отношению к Customers
DELETE 
FROM Customers
WHERE Customers.customer_id in (
	SELECT cst.customer_id
	FROM Customers cst
	JOIN Purchases prch ON prch.customer_id = cst.customer_id
	WHERE prch.order_time < '13.08.2021'::date
);
SELECT * FROM Customers;
--SET session_replication_role = DEFAULT;
*/
-- Удалить покупателей, которые последней раз покупали раньше 13.08.2021





WITH upd AS (
	DELETE FROM Purchases
	WHERE purchases.customer_id IN (
		SELECT cst.customer_id
		FROM Customers cst
		JOIN Purchases prch ON prch.customer_id = cst.customer_id
		WHERE prch.order_time < '13.08.2021'::date AND
		cst.full_name IS NOT NULL
	)
	RETURNING customer_id
)
DELETE FROM Customers
USING upd
WHERE customers.customer_id = upd.customer_id
RETURNING Customers.full_name 