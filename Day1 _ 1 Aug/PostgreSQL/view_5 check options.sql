-- updatable views with check options

CREATE TABLE employees_2 (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    department_id INT,
    employee_type VARCHAR(20) 
       CHECK (employee_type IN ('FTE', 'Contractor'))
);

INSERT INTO employees_2 (first_name, last_name, department_id, employee_type)
VALUES
    ('John', 'Doe', 1, 'FTE'),
    ('Jane', 'Smith', 2, 'FTE'),
    ('Bob', 'Johnson', 1, 'Contractor'),
    ('Alice', 'Williams', 3, 'FTE'),
    ('Charlie', 'Brown', 2, 'Contractor'),
    ('Eva', 'Jones', 1, 'FTE'),
    ('Frank', 'Miller', 3, 'FTE'),
    ('Grace', 'Davis', 2, 'Contractor'),
    ('Henry', 'Clark', 1, 'FTE'),
    ('Ivy', 'Moore', 3, 'Contractor');



select * from employees_2;

CREATE OR REPLACE VIEW fte AS 
SELECT 
  id, 
  first_name, 
  last_name, 
  department_id,
  employee_type
FROM 
  employees_2 
WHERE 
  employee_type = 'FTE';

select * from fte;

INSERT INTO fte(first_name, last_name, department_id, employee_type) 
VALUES ('John', 'Smith', 1, 'Contractor');

-- select * from employees_2;

-- this should not be done because in view we have only fte type
-- to solve this we use WITH CHECK OPTION

CREATE OR REPLACE VIEW fte AS 
SELECT 
  id, 
  first_name, 
  last_name, 
  department_id,
  employee_type
FROM 
  employees_2 
WHERE 
  employee_type = 'FTE'
WITH CHECK OPTION;

select * from fte;

-- now trying to add contractor type 
INSERT INTO fte(first_name, last_name, department_id, employee_type) 
VALUES ('John', 'Snow', 1, 'Contractor');

-- above gives error

--2) Using WITH LOCAL CHECK OPTION example

CREATE OR REPLACE VIEW fte AS 
SELECT 
  id, 
  first_name, 
  last_name, 
  department_id,
  employee_type
FROM 
  employees_2 
WHERE 
  employee_type = 'FTE';

CREATE OR REPLACE VIEW fte_1 
AS 
SELECT 
  id, 
  first_name, 
  last_name, 
  department_id, 
  employee_type 
FROM 
  fte 
WHERE 
  department_id = 1 
WITH LOCAL CHECK OPTION;

select * from fte_1;

INSERT INTO fte_1(first_name, last_name, department_id, employee_type)
VALUES ('Miller', 'Jackson', 1, 'Contractor');

SELECT 
  * 
FROM 
  employees_2
WHERE 
  first_name = 'Miller' 
  and last_name = 'Jackson';



-- 3) Using WITH CASCADED CHECK OPTION example
CREATE OR REPLACE VIEW fte_1
AS 
SELECT 
  id, 
  first_name, 
  last_name, 
  department_id, 
  employee_type 
FROM 
  fte 
WHERE 
  department_id = 1 
WITH CASCADED CHECK OPTION;

INSERT INTO fte_1(first_name, last_name, department_id, employee_type) 
VALUES ('Peter', 'Taylor', 1, 'Contractor');

-- above query gives error

