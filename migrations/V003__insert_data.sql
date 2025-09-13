INSERT INTO product (id, name, picture_url, price) VALUES
(1, 'Сливочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/6.jpg', 320),
(2, 'Особая', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/1.jpg', 179),
(3, 'Молочная', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/2.jpg', 225),
(4, 'Нюренбергская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/3.jpg', 315),
(5, 'Мюнхенская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/4.jpg', 330),
(6, 'Русская', 'https://res.cloudinary.com/sugrobov/image/upload/v1623323635/repos/sausages/5.jpg', 189);

INSERT INTO orders (id, status, date_created) VALUES
(1, 'cancelled', '2025-08-21'),
(2, 'shipped', '2025-08-22'),
(3, 'shipped', '2025-08-23'),
(4, 'shipped', '2025-08-24'),
(5, 'shipped', '2025-08-25'),
(6, 'shipped', '2025-08-26'),
(7, 'shipped', '2025-08-27');

INSERT INTO order_product (order_id, product_id, quantity) VALUES
(1, 4, 33),
(2, 1, 10),
(2, 2, 5),
(3, 3, 20),
(4, 5, 15),
(5, 6, 25),
(6, 1, 12),
(7, 4, 18);