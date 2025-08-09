Use organisation;

CREATE TABLE Employers_new_data
LIKE Employers_data;

INSERT INTO Employers_new_data;

SELECT * FROM Employers_new_data;

SELECT Name,Salary,(SELECT (Salary-Average) FROM Employers_new_data),
(SELECT (SELECT AVG(Salary) FROM Employers_new_data) AS Average
From Employers_new_data) 
FROM Employers_new_data;

SELECT SUM(Salary)/1000000 AS `Total_Salary(in_milions)` FROM Employers_data;

-- Employees Earning more than AVG salary
SELECT Name,Salary 
FROM Employers_new_data
WHERE Salary>(SELECT AVG(Salary) FROM Employers_new_data);

-- Which employees work in the same department as the youngest employee?
SELECT Name,Department 
FROM Employers_new_data
WHERE Department IN
(SELECT Department
FROM Employers_new_data
	WHERE Age = (SELECT MIN(Age) 
    FROM Employers_new_data)
);


-- Which employees have the same job title as the person with the highest salary?
SELECT 
    Name, Job_title,Salary
FROM
    Employers_new_data
WHERE
    Job_title IN (SELECT 
            Job_title
        FROM
            Employers_new_data
        WHERE
            Salary = (SELECT 
                    MAX(Salary)
                FROM
                    Employers_new_data));




-- What is the name and salary of the employee with the second-highest salary?

SELECT Name,Salary FROM Employers_new_data
WHERE Salary < (SELECT MAX(Salary) FROM Employers_new_data)
ORDER BY Salary DESC,Name ASC
LIMIT 1
;

-- List the employees who earn more than anyone in the 'HR' department.
SELECT Name,Salary FROM Employers_new_data
WHERE Salary >(
SELECT MAX(Salary)
FROM Employers_new_data
WHERE Department = "HR");








-- Which departments have more employees than the 'Finance' department?

SELECT Department,COUNT(Name) FROM Employers_new_Data
GROUP BY Department
HAVING COUNT(Name)>
(SELECT COUNT(Name) FROM Employers_new_data
WHERE Department = 'Finance');







-- Find employees whose age is above the average age within their department.
SELECT Name,Department,Age FROM Employers_new_data AS E
WHERE Age>
(SELECT AVG(Age) FROM Employers_new_data 
WHERE Department=E.Department
)
;



-- List all employees whose salary is above the average salary of all employees who have the same education level.
SELECT Name ,Salary FROM EmpLoyers_new_data AS E
WHERE Salary > (
SELECT AVG(Salary) FROM Employers_new_data
WHERE Education_level = E.Education_level
 );







-- List all employees whose years of experience is above the department average.
SELECT Name,Experience_years FROM Employers_new_data AS E
WHERE Experience_years >
(SELECT AVG(Experience_years) FROM Employers_new_data
WHERE Department=E.Department);





-- 🚀Advanced Thinking with Correlated Subqueries
-- For each employee, find their rank in terms of salary within their department.






-- List all employees who are the highest paid in their department.
SELECT Name,Salary,Department FROM Employers_new_data
WHERE Salary IN (
SELECT MAX(Salary) FROM Employers_new_data
GROUP BY Department)
ORDER BY Salary;






-- Which employees are the only ones in their department with their job title?





-- Find the name of the employee with the maximum experience in each location.
SELECT Name,Experience_years,Age FROM Employers_new_data AS E
WHERE Experience_years =
(SELECT MAX(Experience_years) FROM Employers_new_data
WHERE Location=E.Location)
;






SELECT Name,Salary
FROM Employers_data
WHERE Salary=(SELECT MAX(Salary) FROM Employers_data);

UPDATE Employers_data
SET Salary = 500000
WHERE  Age=(SELECT MAX(Age) FROM Employers_data) AND 
Experience_years=(SELECT MAX(Experience_years) FROM Employers_data);

(SELECT DISTINCT Name,Age,Experience_years,Salary
FROM Employers_data
WHERE Age=(SELECT MAX(Age) FROM Employers_data) AND 
Experience_years=(SELECT MAX(Experience_Years) FROM Employers_data));

SELECT Education_level, SUM(Salary)
FROM Employers_data
GROUP BY Education_level;