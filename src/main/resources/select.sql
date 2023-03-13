SELECT title,
       author,
       amount,
       ROUND((price * (1 - 30 / 100)), 2) AS new_price
from book;

SELECT author,
       title,
       ROUND(IF(author = 'Булгаков М.А.', (10 * price) / 100 + price,
                IF(author = 'Есенин С.А.', (5 * price) / 100 + price, price)), 2)
           AS new_price
FROM book;

SELECT author, title, price
from book
where amount < 10;

SELECT title, author, price, amount
from book
where price < 500 AND price > 600
   OR price * amount >= 5000;

SELECT title, author
FROM book
WHERE price BETWEEN 540.50 AND 800
  AND (amount = 2 OR amount = 3 OR amount = 5 OR amount = 7);

SELECT author, title
FROM book
WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC, title ASC;

SELECT title, author
FROM book
WHERE title LIKE '_% _%'
  AND author LIKE '%С.%'
ORDER BY title ASC;

SELECT amount
FROM book
GROUP BY amount;

SELECT author as 'Автор', COUNT(title) as 'Различных_книг', SUM(amount) as 'Количество_экземпляров'
FROM book
GROUP BY author;

SELECT author, MIN(price) AS 'Минимальная_цена', MAX(price) AS 'Максимальная_цена', AVG(price) AS 'Средняя_цена'
FROM book
GROUP BY author;

SELECT author,
       ROUND(SUM(price * book.amount), 2)                       AS 'Стоимость',
       ROUND(SUM((price * book.amount) * 0.18 / (1 + 0.18)), 2) AS 'НДС',
       ROUND(SUM((price * book.amount) / (1 + 0.18)), 2)        AS 'Стоимость_без_НДС'
FROM book
GROUP BY author;

SELECT MIN(price)           AS 'Минимальная_цена',
       MAX(price)           AS 'Максимальная_цена',
       ROUND(AVG(price), 2) AS 'Средняя_цена'
FROM book;

SELECT ROUND(AVG(price), 2)          AS Средняя_цена,
       ROUND(SUM(price * amount), 2) AS Стоимость
FROM book
WHERE amount
          BETWEEN 5 AND 14;

SELECT author,
       ROUND(SUM(price * book.amount), 2) AS Стоимость
FROM book
WHERE title <> 'Идиот'
  AND title <> 'Белая гвардия'
GROUP BY author
HAVING SUM(price * amount) > 5000
ORDER BY SUM(price * amount) DESC;

SELECT author, title, price
FROM book
WHERE price <= (SELECT AVG(price)
                FROM book)
ORDER BY price DESC;

SELECT author, title, price
FROM book
WHERE price <= (SELECT MIN(price) + 150 FROM book)
ORDER BY price ASC;

SELECT author, title, amount
FROM book
WHERE amount IN
      (SELECT amount
       FROM book
       GROUP BY amount
       HAVING COUNT(amount) = 1);

SELECT author, title, price
FROM book
WHERE price < ANY (SELECT MIN(price) FROM book GROUP BY author);

SELECT title,
       author,
       amount,
       (SELECT MAX(amount)
        FROM book) - amount AS Заказ
FROM book
WHERE ABS(amount - (SELECT MAX(amount) FROM book)) > 0
HAVING Заказ > 0;

INSERT INTO book (title, author, price, amount)
SELECT title,
       author,
       price,
       amount
FROM supply
WHERE author <> 'Булгаков М.А.'
  AND author <> 'Достоевский Ф.М.';

INSERT INTO book (title, author, price, amount)
SELECT title, author, price, amount
FROM supply
WHERE author NOT IN (SELECT author
                     FROM book);

UPDATE book
SET price = 0.9 * price
WHERE amount BETWEEN 5 AND 10;

UPDATE book
SET buy   = IF(buy > amount, amount, buy),
    price = IF(buy = 0, 0.9 * price, price);

UPDATE book, supply
SET book.amount = book.amount + supply.amount,
    book.price  = ((book.price + supply.price) / 2)
WHERE book.title = supply.title
  AND book.author = supply.author;

DELETE
FROM supply
WHERE author IN
      (SELECT author
       FROM book
       GROUP BY author
       HAVING SUM(amount) >= 10);

CREATE TABLE ordering AS
SELECT author,
       title,
       (SELECT ROUND(AVG(amount)) FROM book) AS amount
FROM book
WHERE amount < (SELECT ROUND(AVG(amount)) FROM book);

SELECT name, city, per_diem, date_first, date_last
FROM trip
WHERE trip.name LIKE '_%а _%'
ORDER BY date_last DESC;

SELECT DISTINCT trip.name
FROM trip
WHERE city = 'Москва'
ORDER BY trip.name ASC;
# ____________________________________________________________________________________
# Для каждого города посчитать, сколько раз сотрудники в нем были.
# Информацию вывести в отсортированном в алфавитном порядке по названию городов.
# Вычисляемый столбец назвать Количество.

SELECT city, count(date_last - date_first) AS 'Количество'
FROM trip
GROUP BY city
ORDER BY city ASC;
# _____________________________________________________________________________________
# Вывести два города, в которых чаще всего были в командировках сотрудники.
# Вычисляемый столбец назвать Количество.

SELECT city, count(date_last - date_first) AS 'Количество'
FROM trip
GROUP BY city
HAVING Количество >= 4
ORDER BY city ASC
LIMIT 2;
# ________________________________________________________________________________________
# Вывести информацию о командировках во все города кроме Москвы и Санкт-Петербурга
# (фамилии и инициалы сотрудников, город ,  длительность командировки в днях,
# при этом первый и последний день относится к периоду командировки).
# Последний столбец назвать Длительность.
# Информацию вывести в упорядоченном по убыванию длительности поездки,
# а потом по убыванию названий городов (в обратном алфавитном порядке).

SELECT `name`,
       city,
       DATEDIFF(date_last, date_first) + 1 AS 'Длительность'
FROM trip
WHERE city <> 'Москва'
  AND city <> 'Санкт-Петербург'
ORDER BY Длительность DESC;
# _______________________________________________________________________________________
# Вывести информацию о командировках сотрудника(ов), которые были самыми короткими по времени.
# В результат включить столбцы name, city, date_first, date_last.

SELECT `name`,
       city,
       date_first,
       date_last
FROM trip
WHERE ABS(DATEDIFF(date_last, date_first)) <= 2;
# _________________________________________________________________________________________
# Вывести информацию о командировках, начало и конец которых относятся к одному месяцу
# (год может быть любой). В результат включить столбцы name, city, date_first, date_last.
# Строки отсортировать сначала  в алфавитном порядке по названию города, а затем по фамилии сотрудника.

SELECT `name`, city, date_first, date_last
FROM trip
WHERE MONTH(date_first) =
      MONTH(date_last)
ORDER BY city, `name` ASC;
# ______________________________________________________________________________________
# Вывести название месяца и количество командировок для каждого месяца.
# Считаем, что командировка относится к некоторому месяцу, если она началась в этом месяце.
# Информацию вывести сначала в отсортированном по убыванию количества,
# а потом в алфавитном порядке по названию месяца виде. Название столбцов – Месяц и Количество.

SELECT MONTHNAME(date_first) AS 'Месяц', COUNT(*) AS 'Количество'
FROM trip
GROUP BY Месяц
ORDER BY Количество DESC, Месяц;
# ______________________________________________________________________________________________________
# Вывести сумму суточных (произведение количества дней командировки и размера суточных) для командировок,
# первый день которых пришелся на февраль или март 2020 года.
# Значение суточных для каждой командировки занесено в столбец per_diem.
# Вывести фамилию и инициалы сотрудника, город, первый день командировки и сумму суточных.
# Последний столбец назвать Сумма.
# Информацию отсортировать сначала  в алфавитном порядке по фамилиям сотрудников,
# а затем по убыванию суммы суточных.

SELECT `name`, city, date_first, (SELECT DATEDIFF(date_last, date_first) + 1) * per_diem AS 'Сумма'
FROM trip
WHERE MONTH(date_first) BETWEEN 2 AND 3
ORDER BY `name` ASC, Сумма DESC;
# _______________________________________________________________________________________________________
# Вывести фамилию с инициалами и общую сумму суточных, полученных за все командировки для тех сотрудников,
# которые были в командировках больше чем 3 раза, в отсортированном по убыванию сумм суточных виде.
# Последний столбец назвать Сумма.

SELECT `name`, SUM((DATEDIFF(date_last, date_first) + 1) * per_diem) AS 'Сумма'
FROM trip
GROUP BY `name`
HAVING COUNT(`name`) > 3
ORDER BY Сумма DESC;
# _________________________________________________________________________________________________