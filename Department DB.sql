-- Create database
create database department;

-- Use Database
use department;

-- Create tables
create table job (id int(10) primary key, name varchar(35), min_salary decimal(10, 3), max_salary decimal(10, 3));
create table country (id int(10) primary key, name varchar(35));
create table department (id int(10) primary key, name varchar(35), fk_country_id int(10), foreign key(fk_country_id) references country(id));
create table employee (id int(10) primary key, firstname varchar(35), lastname varchar(35), email varchar(30), salary decimal(10, 3), 
fk_department_id int(10), fk_job_id int(10), foreign key(fk_department_id) references department(id), foreign key(fk_job_id) references job(id));

-- Drop table
drop table job;
drop table country;
drop table department;
drop table employee;

-- Delete table data
truncate table job;
truncate table country;
truncate table department;
truncate table employee;

-- Insert data into table
insert into job values 
(1, 'Sales Manager', 5000.10, 25000.10),
(2, 'Manager', 15000.20, 40000.20),
(3, 'Accountant', 25000.30, 60000.30),
(4, 'Research Officer', 15000.40, 35000.40),
(5, 'Finance Manager', 10000.50, 30000.50);

insert into country values 
(101, 'India'), (102, 'Canada'), (103, 'USA'), (104, 'UK'), (105, 'Australia');

insert into department values 
(401, 'Marketing and Sales', 101), (402, 'Administration', 102), (403, 'Accounting and Finance', 103),
(404, 'Research and Development', 104), (405, 'Accounting and Finance', 105);

insert into employee values 
(501, 'Parth', 'Patel', 'parthP@gmail.com', 10000.10, 401, 1),
(502, 'Arpit', 'Jain', 'AJain@gmail.com', 20000.10, 402, 2),
(503, 'Vipul', 'Shah', 'VipulS@gmail.com', 40000.10, 403, 3),
(504, 'Jay', 'Sharma', 'jaySharma@gmail.com', 30000.10, 404, 4),
(505, 'Ashish', 'Verma', 'AVerma@gmail.com', 30000.10, 405, 5);

-- Show table data
select * from job;
select * from country;
select * from department;
select * from employee;

-- 1. get name (firstname + lastname) with department name, country name, job name 
select concat(e.firstname, ' ', e.lastname) as employee_name, 
	d.name as department_name, c.name as country_name,
	j.name as job_name 
from country c, job j, employee e, department d 
where j.id = e.fk_job_id and c.id = d.fk_country_id and d.id = e.fk_department_id;

-- 2. Get 2nd highest salary of the employee
select * from employee order by salary desc
limit 1, 2;

-- 3. Get all job name and department name in single query
select name from job union select name from department;