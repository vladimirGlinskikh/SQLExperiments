DROP DATABASE IF EXISTS task_6;

CREATE DATABASE IF NOT EXISTS task_6;

USE task_6;

DROP TABLE IF EXISTS cities;

CREATE TABLE cities
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(50),
    population INT,
    founded    INT,
    country_id INT
);

DROP TABLE IF EXISTS countries;

CREATE TABLE countries
(
    id         INT PRIMARY KEY AUTO_INCREMENT,
    `name`     VARCHAR(50),
    population INT,
    gdp        BIGINT
);

DROP TABLE IF EXISTS companies;

CREATE TABLE companies
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    `name`  VARCHAR(50),
    city_id INT,
    revenue BIGINT,
    labors  INT
);

INSERT INTO cities(cities.name, population, founded, country_id)
VALUES ('Москва', 13097539, 1147, 1),
       ('Санкт-Петербург', 5598486, 1703, 1),
       ('Волгоград', 1001183, 1589, 1),
       ('Алматы', 2001059, 1854, 2),
       ('Костанай', 224522, 1879, 2),
       ('Пекин', 21705000, 1360, 3),
       ('Шанхай', 24152700, 1291, 3);

INSERT INTO countries(countries.name, population, gdp)
VALUES ('Россия', 146424729, 2000000000000),
       ('Казахстан', 19000000, 197000000000),
       ('Китай', 1412778724, 17000000000000);

INSERT INTO companies(companies.name, city_id, revenue, labors)
VALUES ('Яндекс', 1, 14000000000, 18000),
       ('JetBrains', 2, 4000000000, 1900),
       ('Красный Октябрь', 3, 100000000, 3600),
       ('Эйр Астана', 4, 33000000, 5000),
       ('Баян Сулу', 5, 6684993, 2200),
       ('Alibaba', 6, 20802696200, 252000),
       ('Baidu', 7, 3000000000, 46000);

