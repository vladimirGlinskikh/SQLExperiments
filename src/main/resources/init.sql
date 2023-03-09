DROP DATABASE IF EXISTS stepik;

CREATE DATABASE IF NOT EXISTS stepik;

USE stepik;

DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS supply;
DROP TABLE IF EXISTS trip;

CREATE TABLE book
(
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(50),
    author  VARCHAR(30),
    price   DECIMAL(8, 2),
    amount  INT
);

CREATE TABLE supply
(
    supply_id INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(50),
    author    VARCHAR(30),
    price     DECIMAL(8, 2),
    amount    INT
);

CREATE TABLE trip
(
    trip_id    INT PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(30),
    city       VARCHAR(25),
    per_diem   DECIMAL(8, 2),
    date_first DATE,
    date_last  DATE
);

INSERT INTO book(title, author, price, amount)
VALUES ('Мастер и Маргарита', 'Булгаков М.А.', 670.99, 3),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 5),
       ('Идиот', 'Достоевский Ф.М.', 460.00, 10),
       ('Братья Карамазовы', 'Достоевский Ф.М.', 799.01, 2),
       ('Стихотворения и поэмы', 'Есенин С.А.', 650.00, 15);

INSERT INTO supply(title, author, price, amount)
VALUES ('Лирика', 'Пастернак Б.Л.', 518.99, 2),
       ('Черный человек', 'Есенин С.А.', 570.20, 6),
       ('Белая гвардия', 'Булгаков М.А.', 540.50, 7),
       ('Идиот', 'Достоевский Ф.М.', 360.80, 3);

INSERT INTO trip(trip.name, city, per_diem, date_first, date_last)
VALUES ('Баранов П.Е.', 'Москва', 700, '2020-01-12', '2020-01-17'),
       ('Абрамова К.А.', 'Владивосток', 450, '2020-01-14', '2020-01-27'),
       ('Семенов И.В.', 'Москва', 700, '2020-01-23', '2020-01-31'),
       ('Ильиных Г.Р.', 'Владивосток', 450, '2020-01-12', '2020-02-02'),
       ('Колесов С.П.', 'Москва', 700, '2020-02-01', '2020-02-06'),
       ('Баранов П.Е.', 'Москва', 700, '2020-02-14', '2020-02-22'),
       ('Абрамова К.А.', 'Москва', 700, '2020-02-23', '2020-03-01'),
       ('Лебедев Т.К.', 'Москва', 700, '2020-03-03', '2020-03-06'),
       ('Колесов С.П.', 'Новосибирск', 450, '2020-02-27', '2020-03-12'),
       ('Семенов И.В.', 'Санкт-Петербург', 700, '2020-03-29', '2020-04-05'),
       ('Абрамова К.А.', 'Москва', 700, '2020-04-06', '2020-04-14'),
       ('Баранов П.Е.', 'Новосибирск', 450, '2020-04-18', '2020-05-04'),
       ('Лебедев Т.К.', 'Томск', 450, '2020-05-20', '2020-05-31'),
       ('Семенов И.В.', 'Санкт-Петербург', 700, '2020-06-01', '2020-06-03'),
       ('Абрамова К.А.', 'Санкт-Петербург', 700, '2020-05-28', '2020-06-04'),
       ('Федорова А.Ю.', 'Новосибирск', 450, '2020-05-25', '2020-06-04'),
       ('Колесов С.П.', 'Новосибирск', 450, '2020-06-03', '2020-06-12'),
       ('Федорова А.Ю.', 'Томск', 450, '2020-06-20', '2020-06-26'),
       ('Абрамова К.А.', 'Владивосток', 450, '2020-07-02', '2020-07-13'),
       ('Баранов П.Е.', 'Воронеж', 450, '2020-07-19', '2020-07-25');


SELECT *
FROM book;






