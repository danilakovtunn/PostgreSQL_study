-- Проверка, что при добавлении заказа, у всех вещей в заказе есть цена на момент покупки
CREATE OR REPLACE FUNCTION check_correct_time() RETURNS TRIGGER AS $check_correct_time$
	DECLARE counter int;
	DECLARE time_counter int;
	BEGIN
		-- Различных вещей в заказе - 
		SELECT COUNT(*) FROM Orders INTO counter WHERE orders.purchase_id = NEW.purchase_id;
		IF 
			counter = 0
		THEN 
			RAISE EXCEPTION 'Необходимо добавить таблицу Orders к Purchases';
		END IF;
		SELECT count(*) 
		FROM Orders ord, Products prd, Prices pr
		INTO time_counter
		WHERE ord.purchase_id = NEW.purchase_id AND
      		  ord.product_id = prd.product_id AND
			  prd.product_id = pr.product_id AND
			  ((NEW.order_time BETWEEN pr.data_from AND pr.data_to) OR (NEW.order_time >= pr.data_from AND pr.data_to IS NULL));
		IF
			time_counter != counter
		THEN 
			RAISE EXCEPTION 'Нет цены товара, которая бы относилась к дате покупки (%)', counter - time_counter;
		END IF;
		RETURN NEW; 
	END;
$check_correct_time$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS check_correct_time on Purchases;

CREATE CONSTRAINT TRIGGER check_correct_time 
AFTER INSERT OR UPDATE OF order_time ON Purchases
	DEFERRABLE INITIALLY DEFERRED
	FOR EACH ROW EXECUTE FUNCTION check_correct_time();
