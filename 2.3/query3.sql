--Найти самых "лучших" покупателей (которые оставили в магазине больше всего денег) за август
SELECT SUM(pr.price) AS total, cst.full_name
FROM Purchases prch, Customers cst, Orders ord, Products prd, Prices pr
WHERE prch.customer_id = cst.customer_id AND
	  prch.purchase_id = ord.purchase_id AND
	  ord.product_id = prd.product_id AND
	  prd.product_id = pr.product_id AND
	  cst.full_name IS NOT NULL AND
	  ((prch.order_time between pr.data_from AND pr.data_to) OR (prch.order_time >= pr.data_from AND pr.data_to IS NULL)) AND
	  prch.order_time BETWEEN '01.08.2021'::date AND '31.08.2021'::date
GROUP BY cst.customer_id, cst.full_name
HAVING SUM(pr.price) > 1000::money
ORDER BY total DESC