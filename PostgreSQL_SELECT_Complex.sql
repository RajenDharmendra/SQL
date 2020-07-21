--Write a query that displays only the state and total fruit for the state with the largest amount of fruit supply
select state, sum(supply)
from fruit_imports
group by state
order by 2 desc
limit 1;

--Write a query that displays only the state with the largest amount of fruit supply.
select state
from fruit_imports
group by state
order by sum(supply) desc
limit 1;

-- Write a query that returns the most expensive cost_per_unit of every season
-- The query should display 2 columns, the season and the cost_per_unit
select season, max(cost_per_unit)
from fruit_imports
group by season;

-- Write a query that returns the state that has more than 1 import of the same fruit.
select state
from fruit_imports
group by state
order by count(name) desc
limit 1;

-- Write a query that returns the seasons that produce either 3 fruits or 4 fruits.
select season
from fruit_imports
group by season
having count(name) = 3 or count(name) = 4;

--Write a query that takes into consideration the supply and cost_per_unit columns for determining the
--total cost and returns the most expensive state with the total cost.
select state, (sum(supply) * sum(cost_per_unit)) total_cost
from fruit_imports
group by state
order by 2 desc
limit 1;

/*
CREATE table fruits (fruit_name varchar(10));
INSERT INTO fruits VALUES ('Orange');
INSERT INTO fruits VALUES ('Apple');
INSERT INTO fruits VALUES (NULL);
INSERT INTO fruits VALUES (NULL);
Write a query that returns the count of 4. You'll need to count on the column fruit_name and not use COUNT(*)
*/
select count(fruit_name is not null or fruit_name is null) from fruits;