DROP DATABASE IF EXISTS stepik;

CREATE DATABASE IF NOT EXISTS stepik;

USE stepik;

DROP TABLE IF EXISTS book;

CREATE TABLE book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   DECIMAL(8, 2),
    amount  INT
);

INSERT INTO book(title, author, price, amount)
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3),
       ('Белая гвардия>', 'Булгаков М.А.', 540.50, 5),
       ('Идиот', 'Достоевский Ф.М.', 460.00, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15),
       ('Дети полуночи', 'Рушди Салман', 950.00, 5),
       ('Лирика', 'Гумилев Н.С.', 460.00, 10),
       ('Поэмы', 'Бехтерев С.С.', 460.00, 10),
       ('Капитанская дочка', 'Пушкин А.С.', 520.50, 7);

SELECT *
FROM book;

SELECT title,
       author,
       amount,
       FLOOR((SELECT AVG(amount)
              FROM book)) AS Среднее_количество
FROM book
WHERE abs(amount - (SELECT AVG(amount) FROM book)) > 3;


SELECT title,
       author,
       amount,
       (SELECT MAX(amount)
        FROM book) - amount AS Заказ
FROM book
WHERE ABS(amount - (SELECT MAX(amount) FROM book)) > 0
HAVING Заказ > 0;








