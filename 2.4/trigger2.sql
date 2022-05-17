-- При изменении цены, меняется общая цена
CREATE OR REPLACE FUNCTION check_total_sum() RETURNS TRIGGER AS $check_total_sum$
	BEGIN
		WITH upd AS (
			SELECT prch.purchase_id, prch.total_price, ord.amount
			FROM Products prd, Orders ord, Purchases prch, Prices pr
			WHERE prd.product_id = NEW.product_id AND
				  prd.product_id = ord.product_id AND
				  prch.purchase_id = ord.purchase_id AND
				  ((prch.order_time BETWEEN NEW.data_from AND NEW.data_to) OR (prch.order_time >= NEW.data_from AND NEW.data_to IS NULL))
		)
		UPDATE Purchases SET total_price = upd.total_price - upd.amount * OLD.price + upd.amount * NEW.price
		FROM upd
		WHERE Purchases.purchase_id = upd.purchase_id;
		RETURN NEW;
	END;
$check_total_sum$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_total_sum on Prices;

CREATE CONSTRAINT TRIGGER check_total_sum
AFTER UPDATE ON Prices
	DEFERRABLE INITIALLY DEFERRED
	FOR EACH ROW EXECUTE FUNCTION check_total_sum();
