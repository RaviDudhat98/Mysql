create database employee; -- Create database 
show databases; -- Show all databases 

use employee; -- Select database 

-- Create tables
create table hobby (id int(10) primary key, name varchar(70)); 
create table employee (id int(10) primary key, first_name varchar(35), last_name varchar(35), age tinyint(3), mobile_number bigint(17), address varchar(80));
create table employee_salary (id int(10) primary key, salary decimal(10, 3), date date, fk_employee_id int(10), foreign key(fk_employee_id) references employee(id));
create table employee_hobby (id int(10) primary key, fk_employee_id int(10), fk_hobby_id int(10), foreign key(fk_employee_id) references employee(id), foreign key(fk_hobby_id) references hobby(id));

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
update hobby set name = 'Walking' where id = 1;
update employee set first_name = 'Rajveer', last_name = 'Singh' where id = 105;
update employee_salary set salary = 5000.50 where id = 13;

-- Delete table records
Delete from employee_hobby where fk_hobby_id = 13 and fk_employee_id = 105;
Delete from employee_salary where fk_employee_id = 101;
SET FOREIGN_KEY_CHECKS = 0;
Delete from employee where id = 104;
Delete from hobby where id in (12, 14);
SET FOREIGN_KEY_CHECKS = 1;

-- Delete table data
truncate table hobby;
truncate table employee;
truncate table employee_salary;
truncate table employee_hobby;

-- Show table data
select * from hobby;
select * from employee;
select * from employee_salary;
select * from employee_hobby;

-- Create a select single query to get all employee name, hobby_name in single column
select concat(e.first_name,' ', e.last_name) as employee_name_and_hobbies from employee e union select h.name from hobby h; 

-- Create a select query to get employee name, his/her employee_salary
select concat(e.first_name,' ', e.last_name) as employee_name, s.salary as employee_Salary from employee e, employee_salary s;