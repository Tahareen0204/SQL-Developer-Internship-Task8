# Task 8: Stored Procedures and Functions

## 🎯 Objective
Learned how to create and use **stored procedures** and **functions** to modularize and reuse SQL logic effectively.

---

## 🛠 Tools Used
- MySQL Workbench 

---

## 🧩 Description

This task demonstrates the creation and use of:
- A **stored procedure** to retrieve employee records by department.
- A **function** to calculate the annual salary from monthly salary.

---

## 🗃️ Database Schema

### Table: `Employee`

| Column      | Data Type     | Description             |
|-------------|---------------|-------------------------|
| emp_id      | INT           | Primary Key             |
| name        | VARCHAR(100)  | Employee Name           |
| salary      | DECIMAL(10,2) | Monthly Salary          |
| department  | VARCHAR(50)   | Department Name         |

### Sample Data:

```sql
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
