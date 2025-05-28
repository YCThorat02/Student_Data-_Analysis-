create database info;
use info;
create table student_edge(
stud_id int  primary key auto_increment ,
first_name varchar(20),
last_name varchar(20),
class varchar (10),
sub_name varchar(15), 
sub_marks int,
divsion char(5)
);

insert into student_edge (first_name,last_name,class,sub_name,sub_marks,divsion)
values ( "asmita","bagale","1" ,"pyhton","45", "A"),
("rohit" , "kale","2","java","49","B"),
("yamini","gupte","1","JS","35","A"),
("nilesh", "patil", "3", "python", "41", "C"),
("priya", "desai", "2", "java", "53", "B"),
("ankita", "jadhav", "1", "JS", "47", "A"),
("saurabh", "shinde", "3", "python", "39", "B"),
("rahul", "pawar", "2", "java", "44", "C"),
("pooja", "more", "1", "JS", "51", "A"),
("swapnil", "raut", "3", "python", "36", "B"),
("komal", "chavan", "2", "java", "50", "A"),
("shweta", "bhosale", "1", "JS", "42", "B"),
("mahesh", "gavhane", "3", "python", "40", "C"),
("rutuja", "ingale", "2", "java", "46", "A"),
("anil", "ghule", "1", "JS", "38", "C"),
("meera", "thorat", "3", "python", "52", "B"),
("tejas", "karle", "2", "java", "37", "C"),
("neha", "lokhande", "1", "JS", "48", "A"),
("snehal", "raut", "3", "python", "43", "B"),
("amit", "dumbre", "2", "java", "45", "B");

select * from student_edge;
select sub_name,class,first_name
 from student_edge where class = 1 and sub_name = "JS";
 
 update student_edge  set sub_name = "Ruby" where sub_name ="JS";
 

SELECT sub_name,sub_marks,first_name  from student_edge where sub_name = "Ruby"  GROUP BY  sub_marks;

SELECT sub_name, sub_marks, first_name
FROM student_edge
WHERE sub_name = "Ruby"
GROUP BY sub_name, sub_marks, first_name
order by sub_marks desc
limit 5 ;
select * from student_edge;

update student_edge set divsion = "A" where sub_name ="python" ; 

select * from student_edge;

update student_edge set sub_name = "python" where sub_name ="pthon";

            -- 10  ASSIGNMENT QUESTION -- 
 
 -- Q1.  Show all students who scored more than 40 marks.
select first_name,sub_marks from student_edge where sub_marks > 40 ;

-- Q2.  List the names of students who study the subject "Python".
select first_name, sub_name from student_edge where sub_name = "python";

-- Q3. Count how many students are in class 1.
select count(*) as class_count from student_edge where class ="1";

 -- Q4.  Find the names of students who scored exactly 50 marks.
 select first_name,sub_marks from student_edge where sub_marks = "50";
 
 -- Q5.  List all unique subject names.
 select distinct sub_name from student_edge;
 
-- Q6.  how students who are in division 'A'.
 select first_name,divsion  from student_edge where divsion = "A";
 
-- Q7.  Find the total number of students in the table. 
select  count(first_name) as All_student from student_edge;

-- Q8. Show all student names along with their marks, sorted by marks (highest first).
select first_name ,sub_marks from student_edge 
 order by  sub_marks  desc ;
 
-- Q9. List students whose first name starts with the letter 'S'.
select  first_name from student_edge where first_name like 'S%';

-- Q10. Show students who are in class 2 and study "Java".
select first_name,sub_name from student_edge where class ="2" and sub_name = "java";


-- Q11. Find the number of students in each division.

select divsion, count(first_name)  as count_name from student_edge group by divsion  ;

-- Q12. List the average marks for each subject.

select sub_name, avg(sub_marks) as avg_marks from student_edge group by sub_name; 

--Q13. Display the highest marks obtained in each subject.

select sub_name, max(sub_marks) as max_marks from student_edge  group by sub_name;

--Q14. Show class-wise student count, only for classes having more than 2 students.

select class, count(class) as class_count from student_edge group by class  having count(*) >2;

--Q15. Find students who scored below the average marks of their subject.

SELECT s.sub_marks, s.first_name, s.sub_name
FROM student_edge s
WHERE s.sub_marks < (
  SELECT AVG(sub_marks)
  FROM student_edge
  WHERE sub_name = s.sub_name
);

-- Q16. List all subjects where the highest score is greater than 50.
select sub_name , max(sub_marks) as max_marks 
from student_edge
group by sub_name 
having max(sub_marks) > 50 ; 


-- Q17. Find all students whose names end with the letter 'a'.
select * from student_edge where first_name like '%a';
 
 
--Q18.  Show the top 3 scorers in the entire table.
 select first_name , sub_marks 
 from student_edge  
 order by sub_marks desc 
 limit 3 ;
 
--Q19.  Display the total number of students grouped by both class and division.
 
select class,divsion , count(first_name ) as stud_count from student_edge
group by class,divsion ;
 
 
--Q20. Show students who have the -same marks as at least one other student.

select first_name,sub_marks from student_edge
where sub_marks in 
(select sub_marks from student_edge group by sub_marks having count(*) >1 ); 

 
 
 
 
 
 
 



