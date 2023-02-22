SELECT left(name, 10), continent
FROM country;

SELECT Code, left(name, 10), Population
FROM country
WHERE Population >= 1000;

SELECT name, population
FROM city
WHERE name LIKE '_al_';

SELECT name, population
FROM city
WHERE name LIKE 'Pr%a';

SELECT name, population
FROM city
WHERE name IN ('Praha', 'Moscow', 'Oslo');

SELECT continent, SUM(population)
FROM country
GROUP BY 1
HAVING SUM(population) > 400000000;

SELECT AVG(LifeExpectancy)
FROM country
WHERE code = 'KZ';