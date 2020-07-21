-- Write a query that shows the student's name, the courses the student is taking, and the professors that teach that course.
select student_name, course_title, last_name as prof_last_name
from students s join student_enrollment se on s.student_no = se.student_no
join courses c on c.course_no = se.course_no
join teach t on t.course_no = c.course_no;

-- Let's say we only care to see a single professor teaching a course and we don't care for all the other professors
-- that teach the particular course. Write a query that will accomplish this so that every record is distinct.
select student_name, se.course_no, min(last_name) as prof_last_name
from students s join student_enrollment se on s.student_no = se.student_no
join courses c on c.course_no = se.course_no
join teach t on t.course_no = c.course_no
group by student_name, se.course_no
order by student_name, se.course_no;

-- Write a query that returns employees whose salary is above average for their given department.
select employee_id, department, salary
from employees e1
where salary > (select avg(salary) from employees e2 where e1.department = e2.department);

-- Write a query that returns ALL of the students as well as any courses they may or may not be taking.
select s.student_no, student_name, course_no
from students s left join student_enrollment se
on s.student_no = se.student_no;
--Write a query that finds students who do not take CS180.
select * from students
where student_no not in
(select student_no
from student_enrollment
where course_no = 'CS180');

--Write a query to find students who take CS110 or CS107 but not both.
select s.student_no, s.student_name, s.age
from students s, student_enrollment se
where s.student_no = se.student_no
group by s.student_no, s.student_name, s.age
having sum(case when se.course_no in ('CS110', 'CS107') then 1 else 0 end) = 1;

--Write a query to find students who take CS220 and no other courses.
select s.*
from students s, student_enrollment se
where s.student_no = se.student_no
and s.student_no not in
(select student_no from student_enrollment where course_no != 'CS220');

--Write a query that finds those students who take at most 2 courses.
--Your query should exclude students that don't take any courses as well as those  that take more than 2 course.
select s.student_no, s.student_name, s.age
from students s, student_enrollment se
where s.student_no = se.student_no
group by s.student_no, s.student_name, s.age
having count(*) <= 2;

--Write a query to find students who are older than at most two other students.
select s1.*
from students s1
where 2 >= (select count(*) from students s2 where s2.age < s1.age);