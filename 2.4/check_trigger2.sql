--UPDATE Prices SET price = price * 1.1 WHERE price_id = 5
/*WITH upd AS (
	SELECT prch.purchase_id, prch.total_price 
	FROM Products prd, Orders ord, Purchases prch, Prices pr
	WHERE pr.price_id = 5 AND
		  prd.product_id = pr.product_id AND
		  prd.product_id = ord.product_id AND
		  prch.purchase_id = ord.purchase_id AND
		  ((prch.order_time BETWEEN pr.data_from AND pr.data_to) OR (prch.order_time >= pr.data_from AND pr.data_to IS NULL))
)
select * from upd;*/
select * from Purchases