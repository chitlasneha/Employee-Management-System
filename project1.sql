CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;
-- Creating Departments Table
CREATE TABLE Departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100)
);
-- Creating Employee Table
CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    hire_date DATE NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);
-- Creating Salaries Table
CREATE TABLE Salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    salary DECIMAL(10,2) NOT NULL,
    pay_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
-- Creating Attendance Table
CREATE TABLE Attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Leave') NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);
-- Stored Procedure to Insert Data into Employee Table
DELIMITER $$
CREATE PROCEDURE insert_employee(
    IN first_name VARCHAR(50),
    IN last_name VARCHAR(50),
    IN email VARCHAR(100),
    IN phone VARCHAR(15),
    IN hire_date DATE,
    IN department_id INT
)
BEGIN
    INSERT INTO Employee (first_name, last_name, email, phone, hire_date, department_id)
    VALUES (first_name, last_name, email, phone, hire_date, department_id);
END $$
DELIMITER ;
-- Stored Procedure to Insert Data into Departments Table
DELIMITER $$
CREATE PROCEDURE insert_department(
    IN department_name VARCHAR(100),
    IN location VARCHAR(100)
)
BEGIN
    INSERT INTO Departments (department_name, location)
    VALUES (department_name, location);
END $$
DELIMITER ;
-- Stored Procedure to Insert Data into Salaries Table
DELIMITER $$
CREATE PROCEDURE insert_salary(
    IN employee_id INT,
    IN salary DECIMAL(10,2),
    IN pay_date DATE
)
BEGIN
    INSERT INTO Salaries (employee_id, salary, pay_date)
    VALUES (employee_id, salary, pay_date);
END $$
DELIMITER ;
-- Stored Procedure to Insert Data into Attendance Table
DELIMITER $$
CREATE PROCEDURE insert_attendance(
    IN employee_id INT,
    IN attendance_date DATE,
    IN status ENUM('Present', 'Absent', 'Leave')
)
BEGIN
    INSERT INTO Attendance (employee_id, attendance_date, status)
    VALUES (employee_id, attendance_date, status);
END $$
DELIMITER ;
-- Calling Stored Procedures with Example Data
CALL insert_department('HR', 'New York');
CALL insert_department('IT', 'San Francisco');
CALL insert_employee('John', 'Doe', 'john.doe@email.com', '1234567890', '2023-01-15', 1);
CALL insert_employee('Jane', 'Smith', 'jane.smith@email.com', '9876543210', '2022-07-10', 2);
CALL insert_salary(1, 5000.00, '2024-02-28');
CALL insert_salary(2, 7000.00, '2024-02-28');
CALL insert_attendance(1, '2024-02-01', 'Present');
CALL insert_attendance(2, '2024-02-01', 'Absent');
-- Querying Data
SELECT * FROM Employee;
SELECT * FROM Departments;
SELECT * FROM Salaries;
SELECT * FROM Attendance;
-- CRUD Operations
INSERT INTO employee (first_name, last_name, email, phone, hire_date, department_id)
VALUES ('Emily', 'Clark', 'emily.clark@example.com', '2345678901', '2023-05-01', 4);
UPDATE salaries
SET salary = 80000.00
WHERE employee_id = 1;


