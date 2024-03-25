/*Task 1. Database Design:
1. Create the database named "SISDB"*/
CREATE DATABASE SISDB;
USE SISDB;

/*2. Define the schema for the Students, Courses, Enrollments, Teacher, and Payments tables based
on the provided schema. Write SQL scripts to create the mentioned tables with appropriate data
types, constraints, and relationships.
a. Students
b. Courses
c. Enrollments
d. Teacher
e. Payments*/

--4. Create appropriate Primary Key and Foreign Key constraints for referential integrity.
CREATE TABLE Students (
student_id int primary key,
first_name varchar(50),
last_name varchar(50),
date_of_birth date,
email varchar(50),
phone_number varchar(50));

CREATE TABLE Teacher(
teacher_id int primary key,
first_name varchar(50),
last_name varchar(50),
email varchar(50));

CREATE TABLE Courses(
course_id int primary key,
course_name varchar(50),
credits int,
teacher_id int,
Foreign key(teacher_id) REFERENCES Teacher(teacher_id));

CREATE TABLE Enrollments(
enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date,
FOREIGN KEY(student_id) REFERENCES Students(student_id),
FOREIGN KEY(course_id) REFERENCES Courses(course_id));

CREATE TABLE Payments(
payment_id int primary key,
student_id int,
amount decimal(10,2),
payment_date date,
FOREIGN KEY(student_id) REFERENCES Students(student_id));


/*5. Insert at least 10 sample records into each of the following tables.
i. Students
ii. Courses
iii. Enrollments
iv. Teacher
v. Payments*/
INSERT INTO Students VALUES 
(1,'Swetha','Sundar','2002-12-15','swethasundar@gmail.com','1234567890'),
(2,'Raga','Priya','2001-01-09','ragapriya@gmail.com','9345678910'),
(3,'Sharmila','Sundar','1999-02-23','sharmilasundar@gmail.com','8983798739'),
(4,'Sundar','Nagaraj','1976-08-21','sundarnagaraj@gmail.com','7624905413'),
(5,'Sumathi','Sundar','1987-05-23','sumathisundar@gmail.com','8432187608'),
(6,'Sam','Gopal','2002-12-03','samgopal@gmail.com','9624154276'),
(7,'Shree','Nandha','2003-01-01','shreenandha@gmail.com','9012437629'),
(8,'Swathi','Ravi','2002-04-01','swathiravi@gmail.com','9087954920'),
(9,'Tamil','Bharathi','2002-12-05','tamilbharathi@gmail.com','9098909786'),
(10,'Varsha','Vetrivel','2002-11-01','varshavetrivel@gmail.com','9888900998');


INSERT INTO Teacher VALUES
(1,'Suganya','Sekar','suganyasekar@gmail.com'),
(2,'Bala','Krishnan','balakrishnan@gmail.com'),
(3,'Kannan','Manikkam','kannanmanikkam@gmail.com'),
(4,'Venkat','Ram','venkatram@gmail.com'),
(5,'Gowsic','Kelvin','gowsickelvin@gmail.com'),
(6,'Sowmya','Sekaran','sowmyasekaran@gmail.com'),
(7,'Santhosh','Kumar','santhoshkumar@gmail.com'),
(8,'Sathish','Selvaraj','sathishselvaraj@gmail.com'),
(9,'Mohan','Selvaraj','mohanselvaraj@gmail.com'),
(10,'Sowndarya','Kannan','sowndaryakannan@gmail.com');

INSERT INTO Courses VALUES
(1,'Tamil',2,1),
(2,'English',3,2),
(3,'Maths',2,3),
(4,'Botany',2,4),
(5,'Zoology',3,5),
(6,'Chemistry',3,6),
(7,'Physics',2,7),
(8,'Computer',3,8),
(9,'Data Structures',3,9),
(10,'Iot',3,10);

INSERT INTO Enrollments VALUES 
(1,1,1,'2023-12-10'),
(2,2,6,'2023-12-10'),
(3,3,9,'2023-12-10'),
(4,4,2,'2023-12-10'),
(5,5,5,'2023-12-11'),
(6,6,8,'2023-12-11'),
(7,7,4,'2023-12-11'),
(8,8,2,'2023-12-11'),
(9,9,3,'2023-12-11'),
(10,10,6,'2023-12-11');

INSERT INTO Payments VALUES 
(1,1,150,'2023-12-23'),
(2,2,100,'2023-12-23'),
(3,3,150,'2023-12-27'),
(4,4,100,'2023-12-27'),
(5,5,150,'2023-12-23'),
(6,6,150,'2023-12-23'),
(7,7,100,'2023-12-29'),
(8,8,150,'2023-12-23'),
(9,9,100,'2023-12-29'),
(10,10,150,'2023-12-23');


/*Tasks 2: Select, Where, Between, AND, LIKE:
1. Write an SQL query to insert a new student into the "Students" table with the following details:
a. First Name: John
b. Last Name: Doe
c. Date of Birth: 1995-08-15
d. Email: john.doe@example.com
e. Phone Number: 1234567890*/
INSERT INTO Students VALUES(11,'John','Doe','1995-08-15','john.doe@example.com','1234567890');

/*2. Write an SQL query to enroll a student in a course. Choose an existing student and course and
insert a record into the "Enrollments" table with the enrollment date.*/
INSERT INTO Enrollments VALUES(11,2,3,'2024-01-01');

/*3. Update the email address of a specific teacher in the "Teacher" table. Choose any teacher and
modify their email address.*/
UPDATE Teacher set email='balakumar@gmail.com' where teacher_id=2; 

/*4. Write an SQL query to delete a specific enrollment record from the "Enrollments" table. Select
an enrollment record based on the student and course.*/
DELETE FROM Enrollments where student_id=1 and course_id=1;

/*5. Update the "Courses" table to assign a specific teacher to a course. Choose any course and
teacher from the respective tables.*/
UPDATE Courses set teacher_id=1 where course_id=2;

/*6. Delete a specific student from the "Students" table and remove all their enrollment records
from the "Enrollments" table. Be sure to maintain referential integrity.*/
ALTER TABLE Enrollments DROP CONSTRAINT [FK__Enrollmen__stude__3D5E1FD2];
Alter Table Enrollments
ADD CONSTRAINT FK_STUDENT_ID
FOREIGN KEY(student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE;
ALTER TABLE Payments DROP CONSTRAINT [FK__Payments__studen__412EB0B6];
Alter Table Payments
ADD CONSTRAINT FK_STUDENT_ID1
FOREIGN KEY(student_id)
REFERENCES Students(student_id)
ON DELETE CASCADE;
DELETE FROM Students where student_id=2;

/*7. Update the payment amount for a specific payment record in the "Payments" table. Choose any
payment record and modify the payment amount.*/
UPDATE Payments set amount=250 where payment_id=3;

/*Task 3. Aggregate functions, Having, Order By, GroupBy and Joins:
1. Write an SQL query to calculate the total payments made by a specific student. You will need to
join the "Payments" table with the "Students" table based on the student's ID.*/
SELECT s.student_id, count(payment_id) Total_payments from Payments p 
RIGHT JOIN Students s 
ON p.student_id=s.student_id 
group by s.student_id;

/*2. Write an SQL query to retrieve a list of courses along with the count of students enrolled in each
course. Use a JOIN operation between the "Courses" table and the "Enrollments" table.*/
SELECT course_name ,count(student_id) Total_Students from Courses s 
INNER JOIN Enrollments e 
ON e.course_id=s.course_id 
group by course_name;

/*3. Write an SQL query to find the names of students who have not enrolled in any course. Use a
LEFT JOIN between the "Students" table and the "Enrollments" table to identify students
without enrollments.*/
SELECT first_name, course_id from Students s
LEFT JOIN Enrollments e
ON s.student_id=e.student_id
WHERE e.enrollment_id is null;

/*4. Write an SQL query to retrieve the first name, last name of students, and the names of the
courses they are enrolled in. Use JOIN operations between the "Students" table and the
"Enrollments" and "Courses" tables.*/
SELECT first_name,last_name,course_name from Students s 
INNER JOIN Enrollments e ON s.student_id=e.student_id
INNER JOIN Courses c on c.course_id=e.course_id;

/*5. Create a query to list the names of teachers and the courses they are assigned to. Join the
"Teacher" table with the "Courses" table.*/
SELECT concat(first_name,' ',last_name) Teachers, course_name from Teacher t
INNER JOIN Courses c
ON c.teacher_id=t.teacher_id;

/*6. Retrieve a list of students and their enrollment dates for a specific course. You'll need to join the
"Students" table with the "Enrollments" and "Courses" tables.*/
SELECT  course_name ,concat(first_name,' ',last_name) Students, enrollment_date
FROM Students S INNER JOIN Enrollments E 
ON S.student_id=E.student_id
INNER JOIN Courses C
ON E.course_id=C.course_id;

/*7. Find the names of students who have not made any payments. Use a LEFT JOIN between the
"Students" table and the "Payments" table and filter for students with NULL payment records.*/
SELECT first_name,payment_id from Students s
LEFT JOIN Payments p
ON s.student_id=p.student_id 
where p.amount is null;

/*8. Write a query to identify courses that have no enrollments. You'll need to use a LEFT JOIN
between the "Courses" table and the "Enrollments" table and filter for courses with NULL
enrollment records.*/
SELECT C.course_name,count(enrollment_id ) NO_OF_ENROLL
from Courses C 
LEFT JOIN Enrollments E
ON C.course_id=E.course_id
group by course_name
HAVING count(enrollment_id )=0;

/*9. Identify students who are enrolled in more than one course. Use a self-join on the "Enrollments"
table to find students with multiple enrollment records.*/
SELECT E.student_id, count(distinct E.course_id) No_of_Enrollments from Enrollments E INNER JOIN Enrollments F 
ON E.student_id=F.student_id 
group by E.student_id 
having count(distinct E.course_id)>1;

/*10. Find teachers who are not assigned to any courses. Use a LEFT JOIN between the "Teacher"
table and the "Courses" table and filter for teachers with NULL course assignments.*/
SELECT first_name+' '+ last_name Teachers from Teacher T
LEFT JOIN Courses C 
ON T.teacher_id=C.teacher_id
WHERE C.teacher_id is null;

/*Task 4. Subquery and its type:
1. Write an SQL query to calculate the average number of students enrolled in each course. Use
aggregate functions and subqueries to achieve this.*/
SELECT C.course_name , avg(student_count) AVG_NO_OF_STUDENTS from 
(select E.course_id, count(student_id) student_count from Enrollments  E
GROUP BY course_id)
AS subquery 
INNER JOIN Courses C
ON C.course_id=subquery.course_id
GROUP BY C.course_name;

/*2. Identify the student(s) who made the highest payment. Use a subquery to find the maximum
payment amount and then retrieve the student(s) associated with that amount.*/
SELECT concat(first_name,' ',last_name) Students ,p.amount from Students S
INNER JOIN Payments P
ON P.student_id=S.student_id
WHERE P.amount=
(SELECT max(amount) FROM Payments);

/*3. Retrieve a list of courses with the highest number of enrollments. Use subqueries to find the
course(s) with the maximum enrollment count.*/
SELECT course_name, max(no_of_enrollment) highest_number_of_enrollments from 
(SELECT course_id, COUNT(enrollment_id) no_of_enrollment from Enrollments 
group by course_id) 
as subquery
INNER JOIN Courses C ON C.course_id=subquery.course_id
INNER JOIN Enrollments E ON C.course_id=E.course_id
group by course_name
having COUNT(enrollment_id)>=
(SELECT max(no_of_enrollment) highest_number_of_enrollments from 
(SELECT  COUNT(enrollment_id) no_of_enrollment from Enrollments 
group by course_id) 
as subquery);

/*4. Calculate the total payments made to courses taught by each teacher. Use subqueries to sum
payments for each teacher's courses.*/
SELECT concat(first_name,' ',last_name) Teacher, 
(SELECT COUNT(payment_id)  from Payments P
INNER JOIN Enrollments E ON E.student_id=P.payment_id
INNER JOIN Courses C ON C.course_id=E.course_id
WHERE C.teacher_id = T.teacher_id
) total_payment from Teacher T;

/*5. Identify students who are enrolled in all available courses. Use subqueries to compare a
student's enrollments with the total number of courses.*/
SELECT first_name+' '+last_name Students from Students 
INNER JOIN Enrollments E ON E.student_id=Students.student_id
GROUP BY first_name+' '+last_name
HAVING COUNT(E.course_id)=
(SELECT COUNT(Courses.course_id) from Courses);

/*6. Retrieve the names of teachers who have not been assigned to any courses. Use subqueries to
find teachers with no course assignments*/
SELECT first_name+' '+last_name Teachers FROM Teacher T
WHERE T.teacher_id NOT IN(SELECT teacher_id from Courses);

/*7. Calculate the average age of all students. Use subqueries to calculate the age of each student
based on their date of birth*/
SELECT AVG(AGE) average_age FROM (SELECT Datediff(YEAR,date_of_birth,getdate()) AS AGE from Students)
as subquery;

/*8. Identify courses with no enrollments. Use subqueries to find courses without enrollment
records.*/
SELECT course_name from Courses C
LEFT JOIN Enrollments E ON E.course_id=C.course_id
WHERE C.course_id NOT IN (SELECT course_id from Enrollments);

/*9. Calculate the total payments made by each student for each course they are enrolled in. Use
subqueries and aggregate functions to sum payments.*/
SELECT concat(first_name,' ',last_name) Students,course_name,
(SELECT COUNT(payment_id) from Payments P
WHERE S.student_id=P.student_id
AND E.course_id=C.course_id) AS  total_payments
from Students S
INNER JOIN Payments P ON P.student_id=S.student_id
INNER JOIN Enrollments E ON P.student_id=E.student_id
INNER JOIN Courses C ON C.course_id=E.course_id;

/*10. Identify students who have made more than one payment. Use subqueries and aggregate
functions to count payments per student and filter for those with counts greater than one.*/
SELECT Student_Name,More_than_one_payment 
from
	(SELECT concat(first_name,' ',last_name) Student_Name, 
		(SELECT count(payment_id) from Payments P
		WHERE P.student_id=S.student_id ) as More_than_one_payment
	from Students S) as total_payment
WHERE More_than_one_payment>1;

/*11. Write an SQL query to calculate the total payments made by each student. Join the "Students"
table with the "Payments" table and use GROUP BY to calculate the sum of payments for each
student.*/
SELECT concat(first_name,' ',last_name) Student_Name ,COUNT(payment_id) Total_Payments FROM Students S
LEFT JOIN Payments P ON P.student_id=S.student_id
GROUP BY concat(first_name,' ',last_name);

/*12. Retrieve a list of course names along with the count of students enrolled in each course. Use
JOIN operations between the "Courses" table and the "Enrollments" table and GROUP BY to
count enrollments.*/
SELECT course_name,count(student_id) count_of_students_enrolled from Courses C
LEFT JOIN Enrollments E ON C.course_id=E.course_id
GROUP BY course_name;

/*13. Calculate the average payment amount made by students. Use JOIN operations between the
"Students" table and the "Payments" table and GROUP BY to calculate the average.*/
SELECT concat(first_name,' ',last_name) Student_Name, AVG(amount) average_payment_amount from Students S
LEFT JOIN Payments P ON P.student_id=S.student_id
GROUP BY concat(first_name,' ',last_name);



SELECT * FROM Payments;
select * from Enrollments;
select * from Courses;
select * from Students;
SELECT * FROM Teacher;
 


