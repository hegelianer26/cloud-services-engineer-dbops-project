# dbops-project
Репозиторий для выполнения проекта дисциплины "DBOps"

### Шаг 3: Создайте нового пользователя PostgreSQL и выдайте ему права на все таблицы в базе store

```sql
CREATE USER store_user WITH PASSWORD 'store_password';
GRANT CONNECT ON DATABASE store TO store_user;
GRANT USAGE ON SCHEMA public TO store_user;
GRANT CREATE ON SCHEMA public TO store_user;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO store_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO store_user;
```


### Шаг 10: Напишите запрос, который покажет, какое количество сосисок было продано за каждый день предыдущей недели

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
```
