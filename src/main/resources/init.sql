DROP DATABASE IF EXISTS stepik;

CREATE DATABASE IF NOT EXISTS stepik;

USE stepik;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS supply;

CREATE TABLE book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   DECIMAL(8, 2),
    amount  INT,
    buy     INT
);

CREATE TABLE supply
(
    supply_id INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(50),
    author    VARCHAR(30),
    price     DECIMAL(8, 2),
    amount    INT
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

INSERT INTO supply(title, author, price, amount)
VALUES ('Лирика', 'Пастернак Б.Л.', 518.99, 2),
       ('Черный человек', 'Есенин С.А.', 570.20, 6),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
       ('Идиот', 'Достоевский Ф.М.', 360.80, 3);

SELECT *
FROM book;

SELECT *
FROM supply;






