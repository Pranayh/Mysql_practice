create database company

use company


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
INSERT INTO branch_supplier VALUES(3, 'Stamford Labeles', 'Custom Forms');

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

--------------------------------------------------*****************--------------------------------------------------------

-- Basic Queries:

--1) find all employees
select* from employee;

--2) find all employees ordered by salery
select* from employee
order by salary asc;

--3) find all employees ordered by sex then name
select* from employee
order by sex, first_name, last_name asc;

-- 4) find first five employees in the table:
select top 5* from employee        -- here, * with top is use for selecting all columns in the table
order by birth_day;

--5) Find the first and last names of all employees
SELECT first_name, employee.last_name
FROM employee;


--### diff:

--6)Find out all the different genders
SELECT DISTINCT sex   
FROM employee;


--7)Find all male employees
SELECT *
FROM employee
WHERE sex = 'M';

--8) Find all employees at branch 2

select* from employee
where branch_id=2;


-- 9) Find all employee's id's and names who were born after 1969

SELECT emp_id, first_name, last_name
FROM employee
WHERE birth_day >= '1970-01-01';

--10) Find all female employees at branch 2

select* from employee
where branch_id=2 and sex='F';


--11)Find all employees who are female & born after 1969 or who make over 80000

select* from employee
where (sex='F' and birth_day >='1969-01-01') or (salary > 80000);

-- 12) Find all employees born between 1970 and 1975
select* from employee
where birth_day between '1970-01-01' and '1975-12-31';

-- 13) Find all employees named Jim, Michael, Johnny or David

select* from employee
where first_name in ('Jim', 'Michael', 'Johnny','David')



-----------------------------------------*****************------------------------------------------------------------------------


-- Functions:

--1)Find the number of employees

select count(emp_id) from employee;

--2) find the average of all male employee's salaries:

select AVG(salary) from employee
where sex='M';

-- 3)Find the sum of all employee's salaries
SELECT SUM(salary)
FROM employee;

--4)Find out how many males and females there are
select COUNT(sex) , sex
from employee
group by sex;


--5) Find the total sales of each salesman

select emp_id,sum(total_sales) 
from works_with
group by emp_id;


/*
link: https://www.w3schools.com/sql/sql_wildcards.asp

The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

 The percent sign (%) represents zero, one, or multiple characters
 The underscore sign (_) represents one, single character


 */

 --Wildcards:

 -- % = any # characters, _ = one character

 --1)Find any client's who are an LLC
 
 select* from client
 where client_name like '%LLC%'

 --2)Find any branch suppliers who are in the label business

 select* from branch_supplier
 where supplier_name like '%lable%'

 --3) Find any employee born on the 10th day of the month

 select* from employee
 where birth_day like '____-10%'

 --4) Find any clients who are schools

 select* from client
 where client_name like '%school%'



/* Union:

The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order

*/

--1)Find a list of employee and branch names


SELECT employee.first_name AS Employee_Branch_Names
FROM employee
UNION
SELECT branch.branch_name
FROM branch;

--2) Find a list of all clients & branch suppliers' names
SELECT client.client_name AS Non_Employee_Entities, client.branch_id AS Branch_ID
FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM branch_supplier;



------------------------------------------*****************-------------------------------------------------------------------------------



-- JOINS in sql: A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

--- link:https://www.w3schools.com/sql/sql_join.asp

/* 

(INNER) JOIN: Returns records that have matching values in both tables

LEFT (OUTER) JOIN: Returns all records from the left table, and the matched records from the right table

RIGHT (OUTER) JOIN: Returns all records from the right table, and the matched records from the left table

FULL (OUTER) JOIN: Returns all records when there is a match in either left or right table

*/


INSERT INTO branch VALUES(4,'Buffalo', NULL, NULL);


-- 1) find managers name in compony

select employee.emp_id , employee.first_name ,branch.branch_name
from employee
inner join branch
on employee.emp_id=branch.mgr_id;


---other joins:

--2) Left Join

select employee.emp_id , employee.first_name ,branch.branch_name
from employee
left join branch
on employee.emp_id=branch.mgr_id;


--3) Right Join

select employee.emp_id , employee.first_name ,branch.branch_name
from employee
right join branch
on employee.emp_id=branch.mgr_id;


--4) full outer Join

select employee.emp_id , employee.first_name ,branch.branch_name
from employee
full outer join branch
on employee.emp_id=branch.mgr_id;



---------------------------***************************-----------------------------------------------------------------------------------------




--Nested Queries

--:   1) Find names of all employees who have sold over 50,000


select employee.first_name ,employee.last_name
from employee
where employee.emp_id  in (                                    -- when nested query return more than one value then we use ## in:

	select works_with.emp_id                           
	from works_with
	where works_with.total_sales >= 50000
);



/* 
2)Find all clients who are handles by the branch that Michael Scott manages
Assume you know Michael's ID i.e 102
*/

select client.client_id, client.client_name
from client
where client.branch_id = (                        -- it should returns only one value so that we use TOP 1:
		
		select top 1 branch.branch_id 
		from branch
		where branch.mgr_id= 102);






--3) Find all clients who are handles by the branch that Michael Scott manages
 -- Assume you DONT'T know Michael's ID

 select client.client_id, client.client_name
from client
where client.branch_id = (                        
		
							select top 1 branch.branch_id               
							from branch
							where branch.mgr_id=( 

														select top 1 employee.emp_id 
														from employee
														where employee.first_name='Michael' and employee.last_name='Scott'

														));




-- 4) Find the names of employees who work with clients handled by the scranton branch

select employee.first_name,employee.last_name
from employee
where employee.emp_id in (

							select works_with.emp_id
							from works_with
							where works_with.emp_id in ( 
															select employee.emp_id
															from employee
															where employee.branch_id in (	select branch.branch_id
																						from branch
																						where branch_name='scranton'
															)
														)

							);




  ----- or


SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.emp_id IN (
                         SELECT works_with.emp_id
                         FROM works_with
                         )
AND employee.branch_id = 2;







-- Find the names of all clients who have spent more than 100,000 dollars
SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(works_with.total_sales) AS totals, client_id
                                FROM works_with
                                GROUP BY client_id) AS total_client_sales
                          WHERE totals > 100000
);
