-- Увеличение цены вещей, категирия вещей = 'Зимняя'
WITH upd AS (
	-- Заркытие текущей цены
	UPDATE Prices
	SET data_to = now()
	WHERE price_id IN (
		SELECT pr.price_id
		FROM Products prd
		JOIN Pull_classes pc ON prd.product_id = pc.product_id
		JOIN Classes cl ON pc.class_id = cl.class_id
		JOIN Prices pr ON pr.product_id = prd.product_id
		WHERE cl.title = 'Зимняя' AND
			  pr.data_to IS NULL
	)
	RETURNING price_id
), upd1 AS (
	SELECT prd.product_id, pr.price
	from upd
	JOIN Prices pr ON upd.price_id = pr.price_id
	JOIN Products prd ON prd.product_id = pr.product_id
) --выставление новой
INSERT INTO Prices (
	product_id,
	price
)
SELECT upd1.product_id, upd1.price * 1.1 FROM upd1
RETURNING Prices.product_id, Prices.price