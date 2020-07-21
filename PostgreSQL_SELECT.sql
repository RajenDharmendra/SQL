--Write a query to display the names of those students that are between the ages of 18 and 20.
select student_name
from students
where age between 18 and 20;

--Write a query to display all of those students that contain the letters "ch" in their name or their name ends with the letters  "nd".
select *
from students
where student_name like '%ch%'
or student_name like '%nd';

--Write a query to display the name of those students that have the letters "ae" or "ph" in their name and are NOT 19 years old.
select *
from students
where age != 19
and (student_name like '%ae%' or student_name like '%ph%');

--Write a query that lists the names of students sorted by their age from largest to smallest.
select student_name
from students
order by age desc;

--Write a query that displays the names and ages of the top 4 oldest students.
select student_name, age
from students
order by age desc
limit 4;

/*
The student must not be older than age 20
if their student_no is either between 3 and 5
or their student_no is 7.
Your query should also return students older than age 20
but in that case they must have a student_no that is at least 4.
*/
select *
from students
where
(age <= 20 and (student_no between 3 and 5 or student_no = 7))
 or
(age > 20 and student_no >= 4);