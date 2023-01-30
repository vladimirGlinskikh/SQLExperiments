SELECT title, author, amount,
       ROUND((price*(1 - 30/100)), 2) AS new_price from book;

SELECT author, title,
       ROUND(IF(author = 'Булгаков М.А.', (10*price)/100+price,
                IF(author = 'Есенин С.А.', (5*price)/100+price, price)), 2)
           AS new_price FROM book;

SELECT author, title, price from book where amount < 10;

SELECT title, author, price, amount
from book
where price < 500 AND price > 600 OR price * amount >= 5000;

SELECT title, author
FROM book
WHERE price BETWEEN 540.50 AND 800 AND
    (amount = 2 OR amount = 3 OR amount = 5 OR amount = 7);

SELECT author, title FROM book WHERE amount BETWEEN 2 AND 14
ORDER BY author DESC , title ASC;

