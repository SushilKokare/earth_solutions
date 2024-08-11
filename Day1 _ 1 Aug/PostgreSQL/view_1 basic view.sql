create table student(roll int,fname varchar(30), percentage float);

select * from student;


insert into student(roll,fname,percentage) values(1,'sushil',88.20);

insert into student(roll,fname,percentage) values(2,'sumeet',92.54);

insert into student(roll,fname,percentage) values(3,'AA',75.23);
insert into student(roll,fname,percentage) values(4,'BB',64.45);
insert into student(roll,fname,percentage) values(5,'CC',64.45);
insert into student(roll,fname,percentage) values(6,'DD',75.85);
insert into student(roll,fname,percentage) values(7,'EE',85.46);

select roll from student;



create view per as
select percentage from student;

select * from per;

create or REPLACE VIEW per
as
select roll,percentage from student;


CREATE OR REPLACE VIEW per AS
SELECT roll, percentage
FROM student;


drop view if exists per;

create view per as
select roll,percentage from student;

select * from per;