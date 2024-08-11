-- Alter Views


select * from main_salary;


create view mv1
as
select emp.empname as "Name",dept.deptname as "Department",desg.desgname as "Designation",ms.salary as "Salary" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join department as dept on dept.deptid = ms.deptid inner join designation as desg
on desg.desgid = ms.desgid;

select * from mv1;

-- 1. Rename view

alter view if exists mv1
rename to mv2;

select * from mv1; -- this gives error as mv1 is now renamed to mv2

select * from mv2;

-- 2. Changing the view option

alter view if exists mv2
set (security_barrier = false);


alter view if exists mv2
set (check_option=local);

-- 3. changing the view column

select * from mv2;

alter view if exists mv2
rename column "Name" to Full_Name;

select * from mv2;

