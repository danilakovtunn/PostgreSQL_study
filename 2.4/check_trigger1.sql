begin;
WITH upd AS (
	INSERT INTO Purchases (
		employee_id,
		customer_id,
		order_time
		)
	VALUES 
		(3, 5, '15.10.21 15:55')
	RETURNING purchase_id
)
INSERT INTO Orders (
	purchase_id,
	product_id,
	amount
	)
SELECT upd.purchase_id, 1, 1
FROM upd;
end;
/*begin;
	INSERT INTO Purchases (
		employee_id,
		customer_id,
		order_time
		)
	VALUES 
		(3, 5, '13.09.2021 15:55');
commit;*/