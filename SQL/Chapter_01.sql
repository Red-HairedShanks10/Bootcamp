-- Chapter 1


-- Creating a database named analysis

CREATE DATABASE analysis;



CREATE TABLE teachers (
    id bigserial,
    first_name varchar(25),
    last_name varchar(50),
    school varchar(50),
    hire_date date,
    salary numeric
);

----------------------
DROP TABLE teachers;
-----------------------
--Inserting data into the teachers table

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
       ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
       ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
       ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
       ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
       ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
	   
Select * FROM teachers;

--------Try it yourself 1---------------

---***Creating animal types table
CREATE TABLE animal_types (
   animal_type_id bigserial,
   common_name varchar(100) NOT NULL,
   extinction_status varchar(50) NOT NULL
);

Insert INTO animal_types(common_name,extinction_status)
Values('Rhino','endangered'),
       ('Polar Bear','endangered'),
	   ('Orca','in abundance');
	   
Select * FROM animal_types;

------------------------
DROP Table animal_types;
-------------------------


---***creating animal details table
Create Table animal_details
(  
	animal_details_id bigserial,
	given_name varchar(100)NOT NULL,
	gender varchar(1)NOT NULL,
    date_of_birth date NOT NULL
  
);
---------
Insert INTO animal_details(given_name,gender,date_of_birth)
Values('Kina','F','2018/04/20'),
      ('Frost','M','2016/02/22'),
	  ('Rin','F','2019/03/12');

SELECT * FROM animal_details;

--------------------
DROP TABLE animals_details;
-----------------------------

----TRY IT YOURSELF 2b
Insert INTO  animal_details(given_name,gender,date_of_birth)
Value ('Tess','M' '2019/04/23');










