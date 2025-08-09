USE joins;

-- LEARNING ALL TYPES OF JOINS IN SQL

-- LEARNING SOURCE IS ALEX THE ANALYST ON YOUTUBE

-- CREATE TABLES FOR PRACTISING JOINS
CREATE TABLE Employees(
		Employee_id INT AUTO_INCREMENT PRIMARY KEY,
        Employee_Name TEXT,
        Department_id INT,
        Salary INT );
        
CREATE TABLE Department(
		Department_id INT AUTO_INCREMENT PRIMARY KEY,
        Department_Name TEXT,
        Location TEXT );
        
        
-- INSERT DATA INTO THE TABLES
INSERT INTO Employees (Employee_Name,Department_id,Salary) VALUES
('Employee1', 1, 30000),('Employee2', 2, 32000),('Employee3', 3, 34000),('Employee4', 4, 36000),
('Employee5', 5, 38000),('Employee6', 1, 40000),('Employee7', 2, 42000),('Employee8', 3, 44000),
('Employee9', 4, 46000),('Employee10', 5, 48000),('Employee11', 1, 50000),('Employee12', 2, 52000),
('Employee13', 3, 54000),('Employee14', 4, 56000),('Employee15', 5, 58000),('Employee16', 1, 60000),
('Employee17', 2, 62000),('Employee18', 3, 64000),('Employee19', 4, 66000),('Employee20', 5, 68000),
('Employee21', 1, 70000),('Employee22', 2, 72000),('Employee23', 3, 74000),('Employee24', 4, 76000),
('Employee25', 5, 78000),('Employee26', 1, 80000),('Employee27', 2, 82000),('Employee28', 3, 84000),
('Employee29', 4, 86000),('Employee30', 5, 88000),('Employee31', 1, 90000),('Employee32', 2, 92000),
('Employee33', 3, 94000),('Employee34', 4, 96000),('Employee35', 5, 98000),('Employee36', 1, 100000),
('Employee37', 2, 102000),('Employee38', 3, 104000),('Employee39', 4, 106000),('Employee40', 5, 108000),
('Employee41', 1, 110000),('Employee42', 2, 112000),('Employee43', 3, 114000),('Employee44', 4, 116000),
('Employee45', 5, 118000),('Employee46', 1, 120000),('Employee47', 2, 122000),('Employee48', 3, 124000),
('Employee49', 4, 126000),('Employee50', 5, 128000);

-- INSERTING DATA INTO THE DEPATMENTS TABLE
INSERT INTO Department (Department_Name,Location) VALUES
('Human Resources', 'New York'),('Finance', 'Chicago'),('Engineering', 'San Francisco'),
('Marketing', 'Los Angeles'),('Sales', 'Houston'),('Legal', NULL),(NULL, 'Boston'),
('Customer Support', 'Miami'),('Research', 'Seattle'),('Data Analytics', NULL),(NULL, NULL),                 
('Operations', 'Dallas'),('Procurement', NULL),('Security', 'Phoenix'),('Training', 'Denver');

-- INNER JOIN
SELECT E.Employee_Name,D.Department_Name,D.Location 
FROM Employees AS E INNER JOIN Department AS D
ON E.Department_id = D.Department_id;


-- LEFT JOINS
SELECT E.Employee_Name,D.Department_Name,E.Salary,D.Location
FROM Employees AS E LEFT JOIN Department AS D
ON E.Department_id = D.Department_id;

-- RIGHT JOINS
SELECT *
FROM Employees AS E RIGHT JOIN Department AS D
ON E.Department_id = D.Department_id;

SELECT * FROM Employees;

-- SELF JOINS
-- ASSIGNING EMPLOYEE 1 TO BE THE SANTA OF THE NEXT PERSON
SELECT E1.Employee_Name AS SANTA_NAME,E1.Salary AS SANTA_Salary,E2.*
FROM Employees E1 JOIN Employees E2
ON E1.Employee_id + 1 = E2.Employee_id
ORDER BY E1.Employee_id;



-- JOINING MULTIPLE TABLE TOGETHER
