--найти класс наиболее покупаемых товаров
SELECT cl.title, COUNT(*)
FROM Classes cl
INNER JOIN Pull_classes pc ON pc.class_id = cl.class_id
INNER JOIN Products pr ON pr.product_id = pc.product_id
INNER JOIN Orders ord ON ord.product_id = pr.product_id
GROUP BY cl.title
ORDER BY count DESC