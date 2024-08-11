-- Studying Views 

-- simple views
create view view_desg 
as 
select emp.empname as "Name",desg.desgname as "Designation" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join designation as desg
on desg.desgid = ms.desgid;

select * from view_desg;

create view view_dept
as
select emp.empname as "Name",dept.deptname as "Department" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join department as dept on dept.deptid = ms.deptid;

select * from view_dept;

create view view_salary
as
select emp.empname as "Name",ms.salary as "Salary" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid;

select * from view_salary;

create view view_all
as 
select emp.empname as "Name",dept.deptname as "Department",desg.desgname as "Designation",ms.salary as "Salary" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join department as dept on dept.deptid = ms.deptid inner join designation as desg
on desg.desgid = ms.desgid;

select * from view_all;


-- views from views
select * from view_all where "Name"='aa';

create view view_it
as 
select * from view_all 
where "Department" = 'IT';


select * from view_it;

-- --  replacing view query
-- create or replace view view_it
-- as 
-- select * from view_all;


-- dropping views

drop view if exists view_hr;

drop view if exists view_all; -- got error as view_it  depends on view_all

-- to do so we will delete the view_it view and then view_it)

drop view if exists view_all cascade; -- this is remove dependency (view_it) and then remove view_all

select * from view_it; -- error as view_it doest not exists