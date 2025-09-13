INSERT INTO product (id, name, picture_url, price) VALUES
(1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320),
(2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 179),
(3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 225),
(4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315),
(5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 330),
(6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 189);

INSERT INTO orders (id, status, date_created)
SELECT 
    i,
    (ARRAY['pending', 'shipped', 'cancelled'])[FLOOR(RANDOM() * 3 + 1)],
    CURRENT_DATE - (RANDOM() * INTERVAL '90 days')
FROM generate_series(1, 10000000) AS s(i)
ON CONFLICT (id) DO NOTHING;

INSERT INTO order_product (order_id, product_id, quantity)
SELECT 
    i,
    1 + FLOOR(RANDOM() * 6)::INT,
    FLOOR(1 + RANDOM() * 50)::INT
FROM generate_series(1, 10000000) AS s(i);