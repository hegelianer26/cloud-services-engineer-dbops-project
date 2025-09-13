# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"


-- Создание пользователя
CREATE USER store_user WITH PASSWORD 'secure_password';

-- Выдача прав на подключение к базе данных
GRANT CONNECT ON DATABASE store TO store_user;

-- Выдача прав на схему public
GRANT USAGE ON SCHEMA public TO store_user;
GRANT CREATE ON SCHEMA public TO store_user;

-- Выдача прав на все таблицы в схеме public
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO store_user;

-- Выдача прав на все последующие таблицы (на случай будущих миграций)
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO store_user;