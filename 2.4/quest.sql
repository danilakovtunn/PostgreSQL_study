CREATE OR REPLACE FUNCTION show_products() RETURNS TRIGGER AS $show_products$
	DECLARE product text[];
	BEGIN
		SELECT array_agg(prd.description)
		FROM Orders ord, Products prd
		INTO product
		WHERE ord.purchase_id = NEW.purchase_id AND
			  prd.product_id = ord.product_id;
		RAISE INFO 'Продукты: %', product;
		RETURN NEW;
	END;
$show_products$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS show_products on Purchases;

CREATE CONSTRAINT TRIGGER show_products 
AFTER INSERT OR UPDATE ON Purchases
	DEFERRABLE INITIALLY DEFERRED
	FOR EACH ROW EXECUTE FUNCTION show_products();
