-- Just Created 4 tables to study views 

create table employees(empid int, empname varchar(200), empcity varchar(200), empstate varchar(200), empcontact bigint);


create table department(deptid int, deptname varchar(100));

create table designation (desgid int, desgname varchar(100));

create table main_salary (empid int, deptid int, desgid int, salary float);


insert into employees values(1,'aa','solapur','maharashtra',9876543210);

insert into employees values(2,'bb','solapur','maharashtra',9384665032);
insert into employees values(3,'cc','pune','maharashtra',9875432154);
insert into employees values(4,'dd','pune','maharashtra',9898341320);
insert into employees values(5,'ee','banglore','karnataka',9837463521);
insert into employees values(6,'ff','banglore','karnataka',9983615334);
insert into employees values(7,'gg','pune','maharashtra',9373846253);

select * from employees;

insert into department values(1, 'IT');

insert into department values(2, 'Sales');
insert into department values(3, 'HR');

select * from department;

insert into designation values(1, 'employee');
insert into designation values(2, 'Team Lead');
insert into designation values(3, 'manager');
insert into designation values(4, 'ceo');


select * from designation;

-- create table main_salary (empid int, deptid int, desgid int, salary float);

insert into main_salary values(1,1,1,20000);

insert into main_salary values(2,3,4,100000);
insert into main_salary values(3,3,3,70000);
insert into main_salary values(4,2,1,26000);
insert into main_salary values(5,2,1,35000);
insert into main_salary values(6,1,2,450000);
insert into main_salary values(7,1,1,23000);

select * from main_salary;


select emp.empname as "Name",dept.deptname as "Department",desg.desgname as "Designation",ms.salary as "Salary" from main_salary as ms inner join employees as emp
on emp.empid=ms.empid inner join department as dept on dept.deptid = ms.deptid inner join designation as desg
on desg.desgid = ms.desgid;
