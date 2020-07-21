-- Write a query against the professors table that can output the following in the result: "Chong works in the Science department"
select last_name || ' works in the ' ||  department || ' department'
from professors;

/*
Write a SQL query against the professors table that would return the following result:
"It is false that professor Chong is highly paid"
"It is true that professor Brown is highly paid"
"It is false that professor Jones is highly paid"
"It is true that professor Wilson is highly paid"
"It is false that professor Miller is highly paid"
"It is true that professor Williams is highly paid"
NOTE: A professor is highly paid if they make greater than 95000.
*/
select 'It is ' || (salary > 95000) || ' that professor ' || last_name || ' is highly paid'
from professors;

-- Write a query that returns all of the records and columns from the professors table
-- but shortens the department names to only the first three characters in upper case.
select last_name, salary, hire_date, upper(substring(department from 1 for 3)) as short_dept
from professors;

-- Write a query that returns the highest and lowest salary from the professors table excluding the professor named 'Wilson'.
select max(salary), min(salary)
from professors
where last_name != 'Wilson';

-- Write a query that will display the hire date of the professor that has been teaching the longest.
select min(hire_date) from professors;