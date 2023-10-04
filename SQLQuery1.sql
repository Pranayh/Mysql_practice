
/* Database is collection related information eg: Facebook Users List 

DBMS( Datatbase Manangemnet System) is an software to create and maintain database. Here we can do CRUD(Create,Read,Update,Delate) 
operations and Admistrative tasks -> it can done by single user at a time. Data is in form of files.

Two types of DBMS:
1) Relational DBMS:  It's a program that allows you to create, delete, and update a relational database. A relational database
 is a database system that stores and retrieves data in a tabular format organized in the form of rows and columns
 Ex: RDBMS is the basis for all modern database systems such as: 
MySQL
Microsoft SQL Server
Oracle
Microsoft Access


->It store data in form of tables. It can handle by multiple users ata time.
-> IT USes SQL lang for CRUD operation



2) Non Relational DBMS(Nosql): It uses other data Stuctures to store data like. Graph
-> A non-relational database management system (NoSQL) stores data in a non-tabular form. It doesn't use the rows and columns 
table format of traditional relational databases. Instead,

-> it uses a storage model that's optimized for the specific requirements of the type of data being stored. 
-> NoSQL databases are made up of files in various folders rather than tables. They can store any type of data, including JSON, XML, and others. 
-> NoSQL databases are frequently used to organize large amounts of complex and diverse data. 

*/

/* Create Database */

create database employee

use employee   

/* Create table in employee database */

drop table employe_tb1
create table employe_tb1
(
Employ_ID int primary key,
First_name varchar(50),
Last_name varchar(50),
Mobile varchar(50),
Salary float

);

/* Inserting rows in the table */

insert into employe_tb1 values(1,'Pranay','Haramwar','9876543210',20000)
insert into employe_tb1 values(2,'Deepak','Vaidya','8887654321',30000)
insert into employe_tb1 values(3,'Pranit','gplipl','9876543210',50000)

select * from employe_tb1

select employe_tb1.First_name, employe_tb1.Last_name from employe_tb1      /* only select : print selected rows AND COLM */
where employe_tb1.Salary >=25000


drop table student_tb
create table student_tb(
student_id int primary key,
school_class int,
stu_name varchar(20)

);

insert into student_tb values(1,5,'kalpak')
insert into student_tb values(2,10,'kalia')
insert into student_tb values(3,12,'Bheem')
insert into student_tb values(4,4,'Raju')

select* from student_tb         /* select* : it prints all rows in the table */
drop table student_tb          /* Delete whole table */


alter table student_tb add CGPA decimal(3,2);      /* add column in the table , 

In decimal 3 is for  total no of digits eg: 3.85 and 2 is for no of digits after decimal point */


alter table student_tb drop column CGPA        /* remove that addded column from the table */


insert into student_tb(student_id, stu_name) values(5,'Bholu')    /* When we dont wann to store all column values */

select* from student_tb





/* 
Constraints are used to limit the type of data that can go into a table. This ensures the accuracy and reliability of the data in the table.

The following constraints are commonly used in SQL:

NOT NULL - Ensures that a column cannot have a NULL value
UNIQUE - Ensures that all values in a column are different
PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
FOREIGN KEY - Prevents actions that would destroy links between tables
CHECK - Ensures that the values in a column satisfies a specific condition
DEFAULT - Sets a default value for a column if no value is specified
CREATE INDEX - Used to create and retrieve data from the database very quickly

# diff:

only mysql:  Auto-increment: allows a unique number to be generated automatically when a new record is inserted into a table
only ms sql: he MS SQL Server uses the IDENTITY keyword to perform an auto-increment feature.
In the example above, the starting value for IDENTITY is 1, and it will increment by 1 for each new record.
 */

 drop table student_tb
 create table student_tb(

student_id int identity(1,1),      				

/*student_id int auto_increment,  */

school_class int unique,
major varchar(20) default 'General',
stu_name varchar(20) not null,
primary key(student_id)
);

insert into student_tb values(5,'Histry','kalpak')
insert into student_tb values(10,'Maths','kalia')
insert into student_tb values(12,'Biology','Bheem')
insert into student_tb values(7,'Geography','Yogya')

select* from student_tb




/* 
Delete and Update : 

The UPDATE statement is used to modify the existing records in a table.

The DELETE statement is used to delete existing records in a table.
Be careful when deleting records in a table! Notice the WHERE clause in the DELETE statement. 
WHERE clause specifies which record(s) should be deleted. If you omit the WHERE clause, all records in 
the table will be deleted!

*/



drop table student_tb
create table student_tb(
student_id int identity(1,1),
school_class int unique,
major varchar(20),
stu_name varchar(20),
primary key(student_id)
);

insert into student_tb values(5,'Histry','kalpak')
insert into student_tb values(9,'Maths','kalia')
insert into student_tb values(12,'Biology','Bheem')
insert into student_tb values(11,'Biology','Chutki')

select* from student_tb;

/* 1) Update Student major as Bio from Biology:
*/
update student_tb
set major='Bio'
where major='Biology';     


/* 2) Update particular Student school_class when he has histry as a major:
*/

update student_tb
set school_class = 10
where major='Histry';


/* 3) Change the major of given student_id = 4 as CS
*/

update student_tb
set major='CS'
where student_id=4;




insert into student_tb values(6,'Chemistry','Dholu')
insert into student_tb values(4,'Chemistry','Kichak')

/* 4) Delete a row which having student_id as 5,6
*/

delete student_tb
where student_id=6;
delete student_tb
where student_id=5;


delete from student_tb
where stu_name='kalpak';

/* 
5) Update major of students who having major as Bio and Chemistry
*/

update student_tb 
set major='BioChemestry'
where major='Bio' or major='Chemistry';



/* The ORDER :
  
  BY keyword is used to sort the result-set in ascending or descending order.

The ORDER BY keyword sorts the records in ascending order by default. 
To sort the records in descending order, use the DESC keyword.

1)Ascending
2)Descending
*/

select student_tb.stu_name, student_tb.major    /* Select particular columns */
from student_tb

order by stu_name asc;



select student_tb.stu_name, student_tb.major
from student_tb

order by stu_name desc;




/*  # diffe:

limit : it gives particular no. of rows from the table => mY sql

top :it gives particular no. of rows from the table => ms sql*/

select student_tb.stu_name, student_tb.major    /* Select particular columns */
from student_tb
order by stu_name asc
limit 2;



select top 3 student_tb.stu_name, student_tb.major  /* Select particular columns */
from student_tb
order by stu_name asc;





/* Operators:
<> and !=: not equal to

The AND operator displays a record if all the conditions separated by AND are TRUE.
The OR operator displays a record if any of the conditions separated by OR is TRUE.
The NOT operator displays a record if the condition(s) is NOT TRUE.

*/

select student_tb.stu_name, student_tb.major    
from student_tb
where major <> 'BioChemestry';     




/* 
IN : operator allows you to specify multiple values in a WHERE clause.

*/

select*from student_tb
where student_id in (2,3,4);     

select*from student_tb
where school_class not in (2,3,4,9,5);


drop table student_tb;
drop table employe_tb1;






/* Company Database Creation for practice:

1)Employee table
2) Branch Table
3) Client Table
4) Sales table
5)Brach Supplier Table

*/
/*
drop table employee_tb
create table employee_tb(
empl_id int primary key,
empl_name varchar(30),
empl_birtt_date date,
empl_sex varchar(1),
salery int,
supervizer_id int,
branch_id int
);

drop table branch
create table branch(
branch_id int primary key,
branch_name varchar(50),
mgr_id int foreign key references employee_tb(empl_id),
mgr_start_date date
);

alter table employee_tb
add foreign key(branch_id)
references branch(branch_id)
on delete set null;

alter table employee_tb
add foreign key(supervizer_id)
references employee_tb(empl_id)
on delete set null;

drop table client
create table client(
client_id int primary key,
client_name varchar(40),
branch_id int foreign key references branch(branch_id)
);


drop table works_with
create table works_with(
empl_id int,
client_id int,
total_sales int,

primary key(empl_id,client_id),
foreign key(empl_id) references employee_tb(empl_id),
foreign key(client_id) references client(client_id)
);

drop table suppier
create table suppier(
branch_id int,
suppier_name varchar(50),
suppy_type varchar,

primary key(branch_id,suppier_name),
foreign key(branch_id) references branch(branch_id),

);




insert into employee_tb values(100,'david','2000-10-11','M',20000,null,null)

select* from employee_tb

insert into branch values(1,'corporate',100,'2006-02-09')

update employee_tb
set branch_id=1
where empl_id=1;


insert into employee_tb values(101,'stev','2003-10-11','M',23000,100,1)

*/

CREATE TABLE employee (
  emp_id INT PRIMARY KEY,
  first_name VARCHAR(40),
  last_name VARCHAR(40),
  birth_day DATE,
  sex VARCHAR(1),
  salary INT,
  super_id INT,
  branch_id INT
);

CREATE TABLE branch (
  branch_id INT PRIMARY KEY,
  branch_name VARCHAR(40),
  mgr_id INT,
  mgr_start_date DATE,
  FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee
ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
  client_id INT PRIMARY KEY,
  client_name VARCHAR(40),
  branch_id INT,
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
  emp_id INT,
  client_id INT,
  total_sales INT,
  PRIMARY KEY(emp_id, client_id),
  FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
  FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
  branch_id INT,
  supplier_name VARCHAR(40),
  supply_type VARCHAR(40),
  PRIMARY KEY(branch_id, supplier_name),
  FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);


-- -----------------------------------------------------------------------------

-- Corporate
INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

-- Scranton
INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);


-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);





