-- Практическое задание по теме «Операторы, фильтрация, сортировка и ограничение»
-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
-- Заполните их текущими датой и временем.

UPDATE users SET
	created_at = NOW(), 
	updated_at = NOW() 
	WHERE created_at  is null 
	and updated_at is null;

-- 2. Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались 
-- значения в формате 20.10.2017 8:10. Необходимо преобразовать поля к типу DATETIME, 
-- сохранив введённые ранее значения.

ALTER TABLE users 
	CHANGE COLUMN `created_at` `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
	CHANGE COLUMN `updated_at` `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 
-- 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- Однако нулевые запасы должны выводиться в конце, после всех записей. 

SELECT value FROM storehouses_products
	ORDER BY IF(value > 0, 0, 1), value;
    
-- 4. (по желанию) Из таблицы users необходимо извлечь пользователей, родившихся в августе и мае. 
-- Месяцы заданы в виде списка английских названий (may, august)

SELECT id, name, 
	birthday_at FROM users 
    WHERE MONTHNAME(birthday_at) IN ('may', 'august');
    
-- 5. (по желанию) Из таблицы catalogs извлекаются записи при помощи запроса. SELECT * FROM catalogs WHERE id IN (5, 1, 2); 
-- Отсортируйте записи в порядке, заданном в списке IN.     

SELECT id AS sorted_id, name FROM catalogs 
	WHERE id IN (5, 1, 2)
    ORDER BY CASE
	WHEN id = 5 THEN 0
    WHEN id = 1 THEN 1
    WHEN id = 2 THEN 2
    END;

-- Практическое задание теме «Агрегация данных»
-- 1. Подсчитайте средний возраст пользователей в таблице users.

SELECT ROUND(
	AVG(
		TIMESTAMPDIFF(YEAR, birthday_at, NOW())
    ), 0
) AS average_age FROM users;

-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.

SELECT date_format(
    DATE(CONCAT_WS('-', YEAR(now()), MONTH(birthday_at), DAY(birthday_at))), 
    '%W') AS day_of_week,
	COUNT(*) AS total
FROM users GROUP BY day_of_week;

-- 3. Подсчитайте произведение чисел в столбце таблицы.

DROP TABLE IF EXISTS tbl;

CREATE TABLE tbl(
	value INT UNSIGNED
);

INSERT INTO tbl (value) VALUES(1), (2), (3), (4), (5);

SELECT ROUND(exp(SUM(ln(value))), 0) AS total FROM tbl;
