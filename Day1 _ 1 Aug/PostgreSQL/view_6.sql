-- Materialized Views

select * from main_salary;

create materialized view if not exists mv1
as
select emp.empname as "Name",dept.deptname as "Department",desg.desgname as "Designation",ms.salary as "Salary" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join department as dept on dept.deptid = ms.deptid inner join designation as desg
on desg.desgid = ms.desgid
with no data;


-- created mv using with no data option
-- now if I try to get data i wont get it, 
-- as there is not data as of now

select * from mv1;

-- to load data we will use REFRESH command

refresh materialized view mv1;

-- now we have data in mv1

select * from mv1;


-- A materialized view is a view that stores data that comes from the base tables.
-- Use the CREATE MATERIALIZED VIEW statement to create a materialized view.
-- Use the REFRESH MATERIALIZED VIEW statement to load data from the base tables into the view.
-- Use the DROP MATERIALIZED VIEW statement to drop a materialized view.

