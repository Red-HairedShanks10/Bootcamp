-- Chapter 2


-- Creating a database named analysis

CREATE DATABASE analysis;

-- Creating a table named teachers with six columns

CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

-- Inserting data into the teachers table

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
	   
Select * From teachers;	   

--Using Where clause
SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';


--**Using Where clause with comparison operators
--Retrieve rows that dont have F.D Roosevelt HS
SELECT school
FROM teachers
WHERE school != 'F.D. Roosevelt HS';


--retrieve rows of teachers who were hired before 2000
SELECT first_name, last_name, hire_date
FROM teachers
WHERE hire_date < '2000-01-01';

--retrieve rows of teachers who have a salary between 40000 and 65000
SELECT first_name, last_name, school, salary
FROM teachers
WHERE salary BETWEEN 40000 AND 65000;

--retrieve rows of teachers who are in a school with ROOS included in in school name(ordered by newest to earliest)
SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;

--*****

--try it yourself 1
Select first_name, last_name, school
From teachers
Order By school ASC, last_name ASC;

--try it yourself 2
Select first_name, last_name, school, salary
From teachers
Where first_name Like '%S%'
 AND salary > 40000;
 
 --try it yourself 3
 
 Select first_name, last_name, school, salary, hire_date
 From teachers
 Where hire_date >= '2010-01-01'
 Order By salary Desc;


