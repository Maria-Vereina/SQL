-- ПРАКТИЧЕСКОЕ ЗАДАНИЕ №1

-- извлечь все электронные письма для клиентов Zoom в штате Флорида по алфавиту

select * from emails e where customer_id in (
select customer_id from customers c where state = 'FL'
order by first_name
)

-- извлечь все имена, фамилии и данные электронной почты для клиентов Zoom в Нью-Йорке в штате Нью-Йорк. 
-- Они должны располагаться в алфавитном порядке: фамилия следует за именем.
select first_name, last_name, email from customers c
where city = 'New York City'
order by first_name

-- Напишите запрос, который возвращает всех клиентов с заказанным номером телефона на дату добавления клиента в базу данных.
select * from customers c where phone is not null and date_added is not null
order by date_added

-- ПРАКТИЧЕСКОЕ ЗАДАНИЕ №1.2

-- Создайте новую таблицу с именем customers_nyc, которая извлечет все строки из таблицы клиентов, 
--в которой клиент проживает в городе Нью-Йорк в штате Нью-Йорк

SELECT *
INTO customers_nyc
FROM customers c
WHERE c.state ='NY'

-- Удаление id 10014 из новой таблицы

DELETE FROM customers_nyc
WHERE postal_code = '10014'

-- Добавить колонку с названием "событие"

ALTER TABLE customers_nyc
ADD COLUMN event TEXT

-- Установите значение события на вечеринку благодарности

UPDATE customers_nyc
SET "event" = 'thank-you party'

