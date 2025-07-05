CREATE DATABASE Organization;
USE Organization;

CREATE TABLE Employee (emp_id INT PRIMARY KEY,name VARCHAR(100),salary DECIMAL(10,2),department VARCHAR(50));

INSERT INTO Employee VALUES 
(1, 'Alice', 50000, 'HR'),
(2, 'Bob', 60000, 'Finance'),
(3, 'Charlie', 70000, 'IT'),
(4, 'David', 80000, 'HR');


DELIMITER //

CREATE PROCEDURE GetEmployeesByDept(IN dept_name VARCHAR(50))
BEGIN
    SELECT * FROM Employee WHERE department = dept_name;
END //

DELIMITER ;

-- To call the procedure 
CALL GetEmployeesByDept('HR');

DELIMITER //

CREATE FUNCTION GetAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;

-- To use the function
SELECT name, GetAnnualSalary(salary) AS Annual_Salary
FROM Employee;

-- To drop the procedure or funtions 
DROP PROCEDURE IF EXISTS GetEmployeesByDept;
DROP FUNCTION IF EXISTS GetAnnualSalary;


