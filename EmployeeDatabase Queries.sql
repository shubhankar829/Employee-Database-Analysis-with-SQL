
-- Creating the EmployeeDetails table
CREATE TABLE EmployeeDetails (
    EmpId INT PRIMARY KEY,
    FullName VARCHAR(50),
    ManagerId INT,
    DateOfJoining DATE,
    City VARCHAR(50)
);

-- Inserting data into EmployeeDetails
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES
(121, 'John Snow', 321, '2019-01-31', 'Toronto'),
(321, 'Walter White', 986, '2020-01-30', 'California'),
(421, 'Kuldeep Rana', 876, '2021-11-27', 'New Delhi');

-- Adding 30 more rows to EmployeeDetails
INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES
(122, 'Emily Clark', 321, '2018-07-15', 'Chicago'),
(123, 'Robert Brown', 876, '2019-05-20', 'Austin'),
(124, 'Sophia Moore', 986, '2018-10-10', 'Seattle'),
(125, 'David Miller', 876, '2019-03-18', 'Boston'),
(126, 'Lisa Davis', 321, '2020-12-05', 'San Francisco'),
(127, 'Chris Johnson', 986, '2021-02-14', 'Miami'),
(128, 'Megan Lewis', 321, '2021-07-22', 'Houston'),
(129, 'Luke Martinez', 876, '2021-09-08', 'Dallas'),
(130, 'Amelia Taylor', 321, '2022-01-17', 'Phoenix'),
-- Add more rows similarly
(131, 'Nathan Clark', 321, '2021-04-30', 'San Diego'),
(132, 'Olivia Walker', 986, '2021-06-19', 'Denver'),
(133, 'Liam Young', 876, '2019-11-25', 'Las Vegas'),
(134, 'Ava Allen', 321, '2020-03-14', 'Atlanta'),
(135, 'Mason King', 986, '2021-10-11', 'Detroit'),
(136, 'Evelyn Hall', 321, '2022-08-05', 'Orlando'),
(137, 'James Scott', 876, '2020-04-24', 'Baltimore'),
(138, 'Ella Adams', 321, '2019-07-30', 'Cincinnati'),
(139, 'Benjamin Baker', 876, '2020-05-16', 'Columbus'),
(140, 'Henry Mitchell', 321, '2021-08-29', 'Charlotte');

-- Creating the EmployeeSalary table
CREATE TABLE EmployeeSalary (
    EmpId INT,
    Project VARCHAR(10),
    Salary DECIMAL(10, 2),
    Variable DECIMAL(10, 2),
    FOREIGN KEY (EmpId) REFERENCES EmployeeDetails(EmpId)
);

-- Inserting data into EmployeeSalary
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES
(121, 'P1', 8000, 500),
(321, 'P2', 10000, 1000),
(421, 'P1', 12000, 0);

-- Adding 30 more rows to EmployeeSalary
INSERT INTO EmployeeSalary (EmpId, Project, Salary, Variable) VALUES
(122, 'P2', 8500, 700),
(123, 'P1', 9500, 800),
(124, 'P3', 7800, 400),
(125, 'P1', 9000, 600),
(126, 'P2', 8200, 300),
(127, 'P3', 10000, 1200),
(128, 'P1', 7700, 500),
(129, 'P2', 8800, 450),
(130, 'P1', 9800, 700),
-- Add more rows similarly
(131, 'P2', 7900, 600),
(132, 'P3', 8200, 350),
(133, 'P1', 9000, 550),
(134, 'P2', 8700, 300),
(135, 'P1', 7800, 500),
(136, 'P3', 9200, 400),
(137, 'P2', 10000, 1500),
(138, 'P1', 7600, 600),
(139, 'P3', 8100, 500),
(140, 'P2', 8600, 400);

INSERT INTO EmployeeDetails (EmpId, FullName, ManagerId, DateOfJoining, City) VALUES
(777, 'Cena John', 872, '2013-05-31', 'Los Angeles');

select * from EmployeeDetails;
select * from EmployeeSalary;


/*
Q1)SQL Query to fetch records that are present in one 
table but not in another table. */

select * from EmployeeDetails ed left join EmployeeSalary es
on ed.EmpId = es.EmpId
where es.EmpId is Null	

/*
Q2)SQL query to fetch all the employees who are not 
working on any project. */

select * from EmployeeDetails ed left join EmployeeSalary es 
on ed.EmpId = es.EmpId
where es.Project is null

/*
Q3)SQL query to fetch all the Employees from 
EmployeeDetails who joined in the Year 2020. */

select * from EmployeeDetails where Year(DateOfJoining ) = '2020'

/*Q4)Fetch all employees from EmployeeDetails who 
have a salary record in EmployeeSalary. */

select * from EmployeeDetails ed inner join EmployeeSalary es 
on ed.EmpId = es.EmpId

/*
Q5)Write an SQL query to fetch a project-wise count of 
employees. */

select Project, count(empid) as CountofEmployees from EmployeeSalary
group by Project

/*Q6)Fetch employee names and salaries even if the 
salary value is not present for the employee.*/

select ed.FullName, COALESCE(es.salary,0) from EmployeeDetails ed left join EmployeeSalary es
on ed.EmpId = es.EmpId

/*
Q7)Write an SQL query to fetch all the Employees who 
are also managers. */

-- using joins
select distinct  ed.* from EmployeeDetails ed inner join EmployeeDetails em
on ed.EmpId = em.ManagerId;

-- using subquery
select * from EmployeeDetails where EmpId IN ( select distinct managerid from EmployeeDetails)

/*Q8)Write an SQL query to fetch duplicate records from 
EmployeeDetails. */

SELECT FullName, ManagerId, DateOfJoining, City, COUNT(*)
FROM EmployeeDetails
GROUP BY FullName, ManagerId, DateOfJoining, City
HAVING COUNT(*) > 1;

/*
Q9)Write an SQL query to fetch only odd rows from the 
table.*/
select * from (
select *, ROW_NUMBER() over ( order by empid) as row_num from EmployeeDetails 
) as temp where (row_num % 2 ) = 1

/*
Q10)Write a query to find the 3rd highest salary from a 
table without top or limit keyword. */
select * from (
select empid,salary, dense_rank() over (order by salary desc) as rnk from EmployeeSalary) as temp
where rnk = 3

-- PART- 2 

/*Ques.1. Write an SQL query to fetch the EmpId and FullName of 
all the employees working under the Manager with id – „986‟. */

select empid,fullname from EmployeeDetails where managerid = '986'

/*Ques.2. Write an SQL query to fetch the different projects 
available from the EmployeeSalary table. */

select distinct project from employeesalary 

/*Ques.3. Write an SQL query to fetch the count of employees 
working in project „P1‟. */

select project, count(empid) as TotalEmployee  from EmployeeSalary 
where project = 'P1'
group by project


/*Ques.4. Write an SQL query to find the maximum, minimum, and 
average salary of the employees. */

select max(salary) as MaximumSalary, min(salary) as MinimumSalary, avg(salary) as AvgSalary from  EmployeeSalary


/*Ques.5. Write an SQL query to find the employee id whose salary 
lies in the range of 9000 and 15000. */

select EmpId,Salary from EmployeeSalary where Salary between '9000' and '15000'

/*Ques.6. Write an SQL query to fetch those employees who live in 
Toronto and work under the manager with ManagerId – 321. */
select empid, fullname, managerid, DateOfJoining, City from EmployeeDetails
where lower(city) = 'toronto' and ManagerId = '321'


/*Ques.7. Write an SQL query to fetch all the employees who either 
live in California or work under a manager with ManagerId – 321. */

select empid, fullname, managerid, DateOfJoining, City from EmployeeDetails
where lower(city) = 'california' or ManagerId = '321'


/*Ques.8. Write an SQL query to fetch all those employees who 
work on Projects other than P1. */
select ed.*,es.Project from EmployeeDetails ed left join EmployeeSalary es
on ed.EmpId = es.EmpId
where es.Project NOT IN ('P1')


/*Ques.9. Write an SQL query to display the total salary of each 
employee adding the Salary with Variable value. */
select empid, (Salary + Variable)  as TotalSalary from EmployeeSalary

/*
Ques.10. Write an SQL query to fetch the employees whose name 
begins with any two characters, followed by a text “hn” and ends 
with any sequence of characters.*/

SELECT EmpId, FullName
FROM EmployeeDetails
WHERE FullName LIKE '__hn%';


-- PART - 3 

/*

select * from EmployeeDetails;
select * from EmployeeSalary;

*/

/*Ques.1 Write an SQL query to fetch all the EmpIds which are 
present in either of the tables – „EmployeeDetails‟ and 
„EmployeeSalary‟. */

select EmpId from EmployeeDetails
union 
select EmpId from EmployeeSalary

/*Ques.2 Write an SQL query to fetch common records between 
two tables. */

select * from EmployeeDetails ed inner join EmployeeSalary es 
on ed.EmpId =  es.EmpId

/*Ques.3. Write an SQL query to fetch records that are present in 
one table but not in another table. */

select * from EmployeeDetails ed left join EmployeeSalary es 
on ed.EmpId =  es.EmpId
where es.EmpId	 is NULL;

select * from EmployeeSalary es left join EmployeeDetails ed
on es.EmpId =  ed.EmpId
where ed.EmpId is NULL


/*Ques.4. Write an SQL query to fetch the EmpIds that are present 
in both the tables –  „EmployeeDetails‟ and „EmployeeSalary. */

select EmpId from EmployeeDetails
intersect 
select EmpId from EmployeeSalary

/*Ques.5. Write an SQL query to fetch the EmpIds that are present 
in EmployeeDetails but not in EmployeeSalary. */

select EmpId from EmployeeDetails where EmpId NOT IN (select EmpId from EmployeeSalary)


/*Ques.6. Write an SQL query to fetch the employee‟s full names 
and replace the space */

select REPLACE(fullname,' ', '_')  from EmployeeDetails
select REPLACE(fullname,' ', '') from EmployeeDetails

/*Ques.7. Write an SQL query to fetch the position of a given 
character(s) in a field. */

select fullname,CHARINDEX('s', fullname) as PositionofS from EmployeeDetails


/*Ques.8. Write an SQL query to display both the EmpId and 
ManagerId together. */

-- select EmpId || '-' ||  ManagerId from EmployeeDetails not working in SQL Server
select CONCAT(empid, '-', managerid) as EmpId_ManagerId from EmployeeDetails

/*Ques.9. Write a query to fetch only the first name(string before 
space) from the FullName column of the EmployeeDetails table. */

select SUBSTRING( fullname, 1, CHARINDEX(' ', fullname) ) from EmployeeDetails 


/*Ques.10. Write an SQL query to uppercase the name of the 
employee and lowercase the city values.*/

select upper(fullname) as FullName, lower(city)  as City from EmployeeDetails

/*PART - 4 */


/*Ques.1. Write an SQL query to find the count of the total 
occurrences of a particular character – „n‟ in the FullName field. */

select FullName,( len(fullname) - len(REPLACE(FullName, 'n', '')) ) as OccurenceofN
 from EmployeeDetails

/*Ques.2. Write an SQL query to update the employee names by 
removing leading and trailing spaces. */

select LTRIM(fullname)  , RTRIM(fullname), TRIM(fullname) from EmployeeDetails
update EmployeeDetails set FullName = TRIM(fullname)
select * from EmployeeDetails

/*Ques.3. Fetch all the employees who are not working on any 
project. */

SELECT * 
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
WHERE es.Project IS NULL;


/*Ques.4. Write an SQL query to fetch employee names having a 
salary greater than or equal to 5000 and less than or equal to 
10000. */

select ed.FullName  from  EmployeeDetails ed left join EmployeeSalary es
on ed.EmpId = es.EmpId
where es.Salary >= 5000 and es.Salary <= 10000


/*Ques.5. Write an SQL query to find the current date-time. */

select GETDATE() as CurrentDateandtime

/*Ques.6. Write an SQL query to fetch all the Employee details from 
the EmployeeDetails table who joined in the Year 2020. */

select * from EmployeeDetails where YEAR(dateofjoining) = '2020'


/*Ques.7. Write an SQL query to fetch all employee records from 
the EmployeeDetails table who have a salary record in the 
EmployeeSalary table. */

select ed.* from EmployeeDetails ed 
inner join EmployeeSalary es on 
ed.EmpId = es.EmpId


/*Ques.8. Write an SQL query to fetch the project-wise count of 
employees sorted by project‟s count in descending order. */

select Project, count(empid) as  EmployeeCount from EmployeeSalary
group by Project
order by EmployeeCount desc

/*Ques.9. Write a query to fetch employee names and salary 
records. Display the employee details even if the salary record is 
not present for the employee. */

SELECT ed.FullName, COALESCE(es.Salary, 0) AS Salary
FROM EmployeeDetails ed
LEFT JOIN EmployeeSalary es ON ed.EmpId = es.EmpId;


/*Ques.10. Write an SQL query to join 3 tables.*/

SELECT ed.EmpId, ed.FullName, es.Salary, ep.City, ep.DateOfJoining
FROM EmployeeDetails ed
JOIN EmployeeSalary es ON ed.EmpId = es.EmpId
JOIN EmployeeDetails ep ON ed.EmpId = ep.EmpId;

