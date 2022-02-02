create database employee; -- Create database 
show databases; -- Show all databases 

use employee;-- Select database 

CREATE TABLE hobby (
    id INT(10) PRIMARY KEY,
    name VARCHAR(70)
);
CREATE TABLE employee (
    id INT(10) PRIMARY KEY,
    first_name VARCHAR(35),
    last_name VARCHAR(35),
    age TINYINT(3),
    mobile_number BIGINT(17),
    address VARCHAR(80)
);
CREATE TABLE employee_salary (
    id INT(10) PRIMARY KEY,
    salary DECIMAL(10 , 3 ),
    date DATE,
    fk_employee_id INT(10),
    FOREIGN KEY (fk_employee_id)
        REFERENCES employee (id)
);
CREATE TABLE employee_hobby (
    id INT(10) PRIMARY KEY,
    fk_employee_id INT(10),
    fk_hobby_id INT(10),
    FOREIGN KEY (fk_employee_id)
        REFERENCES employee (id),
    FOREIGN KEY (fk_hobby_id)
        REFERENCES hobby (id)
);

-- Show tables
show tables;
desc hobby;
desc employee;
desc employee_salary;
desc employee_hobby;

-- Delete table	
drop table hobby;
drop table employee;
drop table employee_salary;
drop table employee_hobby;

-- Insert data in table
insert into hobby value 
(1, 'Reading'), (2, 'Travelling'), 
(3, 'Writing'), (4, 'Painting'), (5, 'Playing chess'), 
(6, 'Travelling'), (7, 'Swimming'), (8, 'Cooking'), 
(9, 'Swimming'), (10, 'Playing cricket'), 
(11, 'Drawing'), (12, 'Dancing'), (13, 'Puzzle solving'), (14, 'Playing football');

insert into employee value 
(101, 'Parth', 'Patel', 20, 9876543210, 'Ahmedabad - 300001'), 
(102, 'Arpit', 'Jain', 27, 9876549510, 'Bhuj - 300009'), 
(103, 'Ashish', 'Verma', 25, 9876223210, 'Ahmedabad - 300008'), 
(104, 'Anant', 'Kumar', 21, 9876543000, 'Surat - 300004'),
(105, 'Vipul', 'Shah', 30, 9806543210, 'Anand - 300002');

insert into employee_salary value 
(1, 12000.50, '2021-12-20', 101),
(2, 10000.50, '2021-11-20', 101),
(3, 15000.70, '2021-10-21', 102),
(4, 12000.60, '2021-09-21', 102),
(5, 10000.60, '2021-08-21', 102),
(6, 14000.70, '2021-08-19', 103),
(7, 12000.50, '2021-07-19', 103),
(8, 10000.50, '2021-06-20', 104),
(9, 8000.50, '2021-05-20', 104),
(10, 5000.70, '2021-04-21', 104),
(11, 10000.60, '2020-12-10', 105),
(12, 9000.70, '2020-11-10', 105),
(13, 7000.50, '2020-10-19', 105);

insert into employee_hobby values 
(501, 101, 1), (502, 101, 2), 
(503, 102, 3), (504, 102, 4), (505, 102, 5), 
(506, 103, 6), (507, 103, 7), (508, 103, 8),
(509, 104, 9), (510, 104, 10),
(511, 105, 11), (512, 105, 12), (513, 105, 13), (514, 105, 14);

-- Update table records
UPDATE hobby 
SET 
    name = 'Walking'
WHERE
    id = 1;
UPDATE employee 
SET 
    first_name = 'Rajveer',
    last_name = 'Singh'
WHERE
    id = 105;
UPDATE employee_salary 
SET 
    salary = 5000.50
WHERE
    id = 13;

-- Delete table records
DELETE FROM employee_hobby 
WHERE
    fk_hobby_id = 13
    AND fk_employee_id = 105;
DELETE FROM employee_salary 
WHERE
    fk_employee_id = 101;
SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM employee 
WHERE
    id = 104;
DELETE FROM hobby 
WHERE
    id IN (12 , 14);
SET FOREIGN_KEY_CHECKS = 1;

-- Delete table data
truncate table hobby;
truncate table employee;
truncate table employee_salary;
truncate table employee_hobby;

-- Show table data
SELECT 
    *
FROM
    hobby;
SELECT 
    *
FROM
    employee;
SELECT 
    *
FROM
    employee_salary;
SELECT 
    *
FROM
    employee_hobby;

-- Create a select single query to get all employee name, hobby_name in single column
SELECT 
    CONCAT(first_name, ' ', last_name) AS employee_name
FROM
    employee 
UNION SELECT 
    name
FROM
    hobby;

-- Create a select query to get employee name, his/her employee_salary
SELECT 
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    s.salary AS employee_salary
FROM
    employee e,
    employee_salary s
WHERE
    e.id = s.fk_employee_id;

-- Create a select query to get employee name, total salary of employee, hobby name(comma-separated - you need to use subquery for hobby name).
SELECT CONCAT(e.first_name, ' ', e.last_name) As employee_name, SUM(es.salary) AS employee_salary      
FROM employee e, employee_salary es
WHERE e.id = es.fk_employee_id    
GROUP BY e.id;

select first_name, group_concat(distinct h.name separator', ') as hobby 
from employee e 
inner join employee_hobby eh on e.id = eh.fk_employee_id 
inner join hobby h on h.id = eh.fk_hobby_id 
group by e.id;