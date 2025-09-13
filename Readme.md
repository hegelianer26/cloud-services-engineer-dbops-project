# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"


-- Создание пользователя
CREATE USER store_user WITH PASSWORD 'store_password';

-- Выдача прав на подключение к базе данных
GRANT CONNECT ON DATABASE store TO store_user;

-- Выдача прав на схему public
GRANT USAGE ON SCHEMA public TO store_user;
GRANT CREATE ON SCHEMA public TO store_user;

-- Выдача прав на все таблицы в схеме public
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO store_user;

-- Выдача прав на все последующие таблицы (на случай будущих миграций)
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO store_user;


### Шаг 10: Запрос продаж за предыдущую неделю

Чтобы получить количество проданных сосисок за каждый день предыдущей недели, используется следующий SQL-запрос:

```sql
SELECT 
    o.date_created, 
    SUM(op.quantity) AS total_quantity
FROM 
    orders AS o
    JOIN order_product AS op ON o.id = op.order_id
WHERE 
    o.status = 'shipped'
    AND o.date_created >= CURRENT_DATE - INTERVAL '7 days'
    AND o.date_created < CURRENT_DATE
GROUP BY 
    o.date_created
ORDER BY 
    o.date_created;