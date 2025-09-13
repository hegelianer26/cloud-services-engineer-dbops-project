ALTER TABLE product ADD COLUMN IF NOT EXISTS price DOUBLE PRECISION;

UPDATE product 
SET price = pi.price 
FROM product_info pi 
WHERE product.id = pi.product_id;

ALTER TABLE orders ADD COLUMN IF NOT EXISTS date_created DATE;

UPDATE orders 
SET date_created = od.date_created, 
    status = od.status 
FROM orders_date od 
WHERE orders.id = od.order_id;

DROP TABLE IF EXISTS product_info;
DROP TABLE IF EXISTS orders_date;