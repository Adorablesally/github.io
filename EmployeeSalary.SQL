--DATA MANIPULATION LANGUAGE

--SELECT STATEMENT

-- Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT EMPID,FULLNAME FROM [dbo].[New_EMPLOYEE]
WHERE Managerid = 986;
--	Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT Project FROM [dbo].[Employee_Salary]
--	Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT project,
COUNT(*) AS P1_COUNT FROM [dbo].[Employee_Salary]
GROUP BY project 
HAVING project = 'p1';
--	Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MAX(Salary) AS max_salary
	,MIN(Salary) AS Min_Salary
	,AVG(Salary) AS Average_salary
	FROM  [dbo].[Employee_Salary];
	--Employee id whose salary lies in the range of 9000 and 15000.
	SELECT empid, salary FROM [dbo].[Employee_Salary]
	WHERE salary BETWEEN 9000 AND 15000;
--	Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT DISTINCT * FROM [dbo].[New_EMPLOYEE]
WHERE city = 'Toronto' AND Managerid = 321;
--	Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT DISTINCT * FROM [dbo].[New_EMPLOYEE]
WHERE city = 'California' OR Managerid = 321;
--	Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT DISTINCT * FROM [dbo].[Employee_Salary]
WHERE project <> 'p1';
--	Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT
SUM(salary) AS total_salary, empid FROM [dbo].[Employee_Salary]
GROUP BY empid;
--	Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of character
SELECT DISTINCT * FROM [dbo].[New_EMPLOYEE]
WHERE fullname LIKE '%HN%';
--	Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.
 SELECT DISTINCT N.Empid
      ,n.[FullName]
      ,n.[Managerid]
	  ,n.city
	  ,e.project
      ,ne.salary
      ,n.[City]
  FROM new_employee AS N

JOIN
employee_salary AS E

JOIN 

new_employee_salary AS NE

ON

NE.Empid = E.Empid

ON

N.Empid = NE.Empid;
