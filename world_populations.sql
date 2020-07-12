-- select * from countries;

-- SELECT * FROM population_years;

-- 1.How many entries in the countries table are from Africa?

SELECT COUNT(DISTINCT name) AS 'countries from africa'
FROM countries
WHERE continent = 'Africa';

-- 2.What was the total population of the continent of Oceania in 2005?

WITH Population as
(SELECT country_id, population 
from population_years
WHERE year=2005)

SELECT SUM(Population.population) as 'Total Population', 
countries.continent as 'Continent'
from Population JOIN countries
on Population.country_id= countries.id
WHERE countries.continent='Oceania'
GROUP BY countries.continent;

-- 3.What is the average population of countries in South America in 2003?
WITH Population as
(SELECT country_id, population 
from population_years
WHERE year=2003)

SELECT AVG(Population.population) as 'Total Population', 
countries.continent as 'Continent'
from Population JOIN countries
on Population.country_id= countries.id
WHERE countries.continent='South America'
GROUP BY countries.continent;

--4. What country had the smallest population in 2007?
WITH Population as
(SELECT country_id, population 
from population_years
WHERE year=2007)

SELECT MIN(Population.population) as 'Minumum Population', 
countries.name as 'Country Name'
from Population JOIN countries
on Population.country_id= countries.id;

-- 5. What is the average population of Poland during the time period covered by this dataset?

WITH Population as
(SELECT country_id, population 
from population_years)

SELECT AVG(Population.population) as 'AVG Population', 
countries.name as 'Country Name'
from Population JOIN countries
on Population.country_id= countries.id
WHERE countries.name='Poland';

--6. How many countries have the word “The” in their name?

SELECT COUNT(*) as 'Total Countries with The'
FROM countries WHERE name LIKE '%The%';

--7. What was the total population of each continent in 2010?

WITH Population as
(SELECT country_id, population 
from population_years
WHERE year=2005)

SELECT SUM(Population.population) as 'Total Population', 
countries.continent as 'Continent'
from Population JOIN countries
on Population.country_id= countries.id
GROUP BY countries.continent;
