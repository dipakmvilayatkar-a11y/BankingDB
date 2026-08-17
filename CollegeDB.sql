create database CollegeDB;
Create table Students (
StudentID int primary key,
FirstName varchar(50),
LastName varchar(50),
DateOfBirth date, );
desc students;
insert into students
values(1,'Rahul','Sathe','2004-06-26','BSc');
select * from students;
insert into students
values 
(2,'Ganesh','Nage','2003-12-23','BCom'),
(3,'Mukul','Dev','2003-04-18','BSc'),
(4,'Sakshi','Tanwar','2003-06-21','BCom'),
(5,'Sudhir','Phadke','2004-01-09','BA'),
(6,'Rani','Sonar','2003-11-03','BSc'),
(7,'Bhushan','Bhosle','2004-05-19','BA'),
(8,'Akshay','Kondhe','2004-09-26','BCom'),
(9,'Ajay','Hinge','2004-08-10','BA'),
(10,'Himani','Rokde','2004-04-30','BSc'),
(11,'Ankita','Patil','2003-12-31','BCom');
truncate Database CollegeDB;


