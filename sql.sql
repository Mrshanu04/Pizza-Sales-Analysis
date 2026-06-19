create database Student;
use student;

create table employees(
  emp_id INT,
    emp_name VARCHAR(50),
    department_id INT,
    salary INT,
    joining_date DATE,
    manager_id INT
);

CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(50)
);


insert into employees values
(1, 'Ajay', 101, 50000, '2022-01-10', NULL),
(2, 'Neha', 102, 60000, '2021-03-15', 1),
(3, 'Rahul', 101, 55000, '2023-06-01', 1),
(4, 'Priya', 103, 70000, '2020-07-20', 2),
(5, 'Amit', 102, 65000, '2022-09-10', 2),
(6, 'Sneha', 103, 72000, '2019-11-11', 4),
(7, 'Kiran', 101, 48000, '2024-01-05', 3);

insert into departments values
(101, 'HR'),
(102, 'Finance'),
(103, 'IT');

select * from employees;
select * from departments;

use student

#emoloyee in IT department ?
select * from employees as e
join departments as d
on e.department_id = d.department_id
where d.department_name = 'IT';

#count employees in each department

select department_id, count(*) as total
from employees
group by department_id;

#avg salary by department 
select department_name, count(*) as avg_salary
from employees as e
join departments as d
on e.department_id = d.department_id
group by department_name;

#max salary by department
select department_name, max(salary) as highest_salary
from employees as e
join departments as  d
on d.department_id = e.department_id
group by department_name;

#find second highest salary
select max(salary) from employees
where salary > (select max(salary) from employees);