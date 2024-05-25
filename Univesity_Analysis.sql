## Analysis  Qustion---

 /* 1. Display average salary given by each department. */
 
 Select dept_name, avg(Salary) as 'Average Salary' from instructor 
 group by dept_name ; 
 
/* 2. Display the name of students and their corresponding course IDs. */
 
 select name, course_id from student, takes where student.id = takes.id ; 
 
 
/* 3. Display number of courses taken by each student. */ 

select name, count(course_id) as 'number of courses' from student, takes 
where student.id = takes.id 
group by name ; 
 
/* 4. Get the prerequisites courses for courses in the Spring semester. */

select semester, takes.course_id, prereq_id from takes, prereq 
where takes.course_id = prereq.course_id and semester = 'Spring' ;

/* 5. Display the instructor name who teaches student with highest credits. 5 */ 

SELECT student.name AS `student name`, instructor.name AS `instructor name`, tot_cred
FROM student
INNER JOIN instructor ON student.dept_name = instructor.dept_name
ORDER BY tot_cred DESC
LIMIT 5; 

/* 6. Which semester and department offers maximum number of
courses. */ 
 
 select top 1  semester, dept_name, max(coun) as 'max' from 
 ( 
 select semester, dept_name, count(c.course_id) as coun from section as s
 join course c
 on s.course_id = c.course_id
 group by semesterr, dept_name
 order by max desc ; 
 
 
/* 7. Display course and department whose time starts at 8. */ 

select section.course_id, start_hr
from time_slot, section
where time_slot.time_slot_id = section.time_slot_id and start_hr = '8'
group by section. course_id, start_hr ; 


/* 8. Display the salary of instructors from Watson building. */ 
 
select name, salary, dept_name from instructor where dept_name in 
( select dept_name from departmen where building = 'Watson') ; 

/* 9. Show the title of courses available on Monday. */

select title, day
from time_slot, course, section
where time_slot.time_slot_id = section.time_slot_id and course.course_id =
section.course_id and day = 'M' ;

/* 10. Find the number of courses that start at 8 and end at 8. */ 

select start_hr, end_hr, count(course_id) as 'member of courses' from section,
time_slot
where section.time_slot_id = time_slot.time_slot_id and start_hr = 8 and 
end_hr = 8 group by start_hr, end_hr ;


/* 11. Find instructors having salary more than 90000. */

select name
from instructor
where salary > 90000 ;

/* 12. Find student records taking courses before 2018. */ 
 
select * 
from takes 
where year < 2018 ;

/* 13. Find student records taking courses in the fall semester and
coming under first section. */

select * from takes 
where semester = 'Fall' and sec_id = 1 ; 

/* 14. Find student records taking courses in the fall semester and
coming under second section. */ 

select * from takes 
where semester = 'Fall' and sec_id = 2 ; 

/* 15. Find student records taking courses in the summer semester,
coming under first section in the year 2017.
Output: */ 

select * from takes
where semester = 'Summer' and sec_id = 1 and year = 2017 ;


/* 16. Find student records taking courses in the fall semester and
having A grade. */

select * from takes 
where semester = 'Fall' and grade = 'A' ; 

/* 17. Find student records taking courses in the summer semester and
having A grade. */ 


select * from takes 
where semester = 'summer' and grade = 'A' ; 

/* 18. Display section details with B time slot, room number 514 and in
the Painter building. */ 

select * from section 
where time_slot_id = 'B' and room_number = 514 and building = 'Painter' ; 

/* 19. Find all course titles which have a string "Intro.". */

 select title from course where title like '%intro%' ; 
 
/* 20. Find the titles of courses in the Computer Science department
that have 3 credits. */ 

select title from course where dept_name = 'Comp. Sci.' and credit = 3 ; 

/* 21. Find IDs and titles of all the courses which were taught by an
instructor named Einstein. Make sure there are no duplicates in the
result. */ 

select course.course_id, title from Course , instructor, teaches
where course.course_id = teaches.course_id and instuctor.dept_name = 
course.dept_name and insturctor.name = 'Einstein' ;
 
/* 22. Find all course IDs which start with CS */

 select course_id from course where course_id like 'Cs%' ;
 
/* 23. For each department, find the maximum salary of instructors in
that department. */

select dept_name, max(salary) as 'maximum salary' from instructor 
group by dept_name ;

/* 24. Find the enrollment (number of students) of each section that was
offered in Fall 2017. */

select sec_id, count(id) as 'number of students', semester, year from takes
where semester = 'Fall' and year = '2017' group by sec_id, semester, year ;

/* 25. Increase(update) the salary of each instructor by 10% if their
current salary is between 0 and 90000. */ 

update instructor set salary = salary*1.1 where salary between 0 and 90000 ;
select name, salary from instructor;

/* 26. Find the names of instructors from Biology department having
salary more than 50000. */

select name, salary from instructor where dept_name = 'Biology' and salary > 50000 ;

/* 27. Find the IDs and titles of all courses taken by a student named
Shankar. */

select name, takes.course_id, title from student, takes, course
where student.id = takes.id and takes.course_id = course.course_id and name = 'Shankar' ;

/* 28. For each department, find the total credit hours of courses in that
department. */ 

select dept_name, sum(credits) as total_credits from Course group by dept_name ;

/* 29. Find the number of courses having A grade in each building. */ 

select building, count(takes.course_id) as 'number of courses', grade
from section, takes
where section.course_id = takes.course_id and grade = 'A' 
group by building, grade ; 

 
/* 30. Display number of students in each department having total
credits divisible by course credits. */

select student.dept_name, count(student.id) as 'number of students'
from course, student
where course.dept_name = student.dept_name and tot_cred %credits = 0
group by course.dept_name, student.dept_name ;

/* 31. Display number of courses available in each building. */
 
select building, count(course_id) as 'number of course' from course, department
where course.dept_name = department.dept_name group by building ;

/* 32. Find number of instructors in each department having 'a' and 'e' in
their name. */

select dept_name, count(name) as 'number of insturctions' from instructor 
where name like '%a%e%' group by dept_name ;

/* 33. Display number of courses being taught in classroom having
capacity more than 20. */

select classroom.room_number, capacity, count(course_id) as 'number of courses'
from section, classroom 
where section.room_number = classroom.room_number and capacity > 20 
group by calssroom.room_number, capacity ; 
select * from classroom ;

/* 34. Update the budget of each department by Rs. 1000 */

update department set budget = budget + 1000 ;

/* 35. Find number of students in each room. */

select room_number, count(takes.id) as 'number of students' from takes, section
where section.course_id = takes.course_id
group by room_number ;

/* 36. Give the prerequisite course for each student. */

select name, prereq_id from student, takes, prereq
where student.id = takes.id and takes.course_id = prereq.course_id ;

/* 37. Display number of students attending classes on Wednesday. */

select day, count(takes.id) as 'number of students' from time_slot, takes, section
where time_slot.time_slot_id = section.time_slot_id and takes.course_id = 
section.course_id and day = 'w'
group by time_slot.day ; 

/* 38. Display number of students and instructors in each department */

select student.dept_name, count(student.id) as 'number of students and instructors'
from student group by student.dept_name
union all
select instructor.dept_name, count(instructor.id) as 'number of instructors' 
from instructor
group by instructor.dept_name ;

/* 39. Display number of students in each semester and their sum of
credits. */

select semester, count(takes.id) as 'number of students', sum(tot_cred) as 'sum of credits'
from takes, student
where takes.id = student.id 
group by semester ;

/* 40. Give number of instructors in each building. */

select building, count(instructor.id) as 'number of instructors' 
from instructor, teaches, section
where instructor.id = teaches.id and teaches.course_id = section.course_id 
group by section.building ;

/* 41. Display advisor IDs for instructors in Painter building. */

select building, instructor.name, s_id
from instructor, advisor, teaches, section
where instructor.id = advisor.i_id and teaches.id = instructor.id
and teaches.course_id = section.course_id and building = 'Painter';

/* 42. Find total credits earned by students coming at 9am */

select student.name, start_hr, tot_cred
from student, takes, section, time_slot
where student.id = takes.id and takes.course_id = section.course_id
and section.time_slot_id - time_slot.time_slot_id and start_hr = '9';

/* 43. Display student names ordered by room number */

Select student.name, section.room_number 
from student, takes, section
where student.id = takes.id and takes.course_id = section.course_id
order by room_number ;

/* 44. Find the number of capacity left after occupying all the students. */

Select Classroom.room_number, Classroom_Capacity = Count(takes.id) as 'remaining Capacity'
from takes, section, classroom
where section.course_id = takes.course_id and section.room_number = classroom.room_number
group by section.room_number, classroom.room_number, Classroom.Capacity ;


/* 45. Find the duration for which each student has to attend each
lecture. */

select student.name, takes.course_id, end_hr - start_hr as 'Duration', end_hr - start_min 
as 'Duration in Minutes'
from student, takes, section, time_slot
where student.id = takes.id and takes.course_id = section.course_id and 
section.time_slot_id = time_slot.time_slot_id
group by student.name, takes.course_id, time_slot.start_hr, time_slot.end_hr,
time_slot.start_min, time_slot.end_min ;

/* 46. Create a timetable for the university. */

Select time_slot.day, Section.building, Section.room_number, section.course_id
from time_slot, section
where section.time_slot_id - time_slot.time_slot_id
group by day, room_number, building, course_id ;

/* 47. Find the average salary that's distributed to teachers for each
course and sort them in descending order */

with teacher_course_data as ( 
Select id, title
from teaches as t
join Course as C
on C.course_id = T.Course_id
) 
Select title as Course_name, avg(Salary) as avg_salary
from teacher_course_data as tcd
join instructor as i
on tcd.id = i.id
group by tcd.title
order by avg(salary) desc ;

/* 48. Find the average duration of classes for each course id */

with time_slot_duration as (
Select time_slot.id, (end_min - start_min) as Duration 
From time_slot
)
Select S.course_id, Avg(Duration) as Duration
From Section S 
join time_slot_duration tsd
on s.time_slot_id = tsd.time_slot_id 
group by course_id ;

/* 49 Get the name of the instructor with highest salary from each department.*/

Select dept_name, max(Salary) as highest_Salary 
From instructor
group by dept_name, name ;


/* 50. Get the sum of the total credits of students that is dealt by the
instructors along with their names */

With Student_advisor_data as (
Select * From Student S 
join Advisor as  A 
on S.id = a.s_id
)
Select i.name, tot_Cred_data.Sum_of_Credits
from (
Select i_id, Sum(tot_Cred) as Sum_of_Credtis
From Student_Advisor_Data 
Group by i_id
) as tot_Cred_data
join instructor I
on tot_Cred_Data.i_id = i.id ;


/* 51. Perform division between student credits and department total
credits */

With Dept_Creds as (
Select Dept_name, sum(Credits) as Dept_total_Creds
From Coursse
Group by Dept_name)
Select S.name, S.tot_Cred/dc.dept_total_Creds
From Students S 
join Dept_Creds dc
on S.dept_name = Dc.dept_name ;

/* 52. If the department budget was to be distributed among the
buildings, how much amount can be allocated to each room in a
building */

With Building_room_Data as (
Select Building, Count(room_number) as num_rooms
From Classroom
group by building
)
Select bb.building, bb.building_budget/num_rooms as room_budget
from building_room_datta as brd
join
(
Select Building, sum(budget) as building_budget
from Department
group by Building ) as bb
on bb.building = brd.building ;
