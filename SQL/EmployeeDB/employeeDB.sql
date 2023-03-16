--*********"One" side of ONE to Many relationship********--

--Creating Departments table
Create Table Departments (
depart_id bigserial Constraint depart_id_key Primary key,
depart_name varchar(50) NOT NULL,
depart_city varchar(50) NOT NULL

);
--Inserting valuess
Insert INTO Departments (depart_name, depart_city)
Values
('IT','Johannesburg'),
('Marketing','East London'),
('Sales','Cape Town'),
('Production','Johannesburg'),
('Research','Cape Town');

Select * From Departments;
-------------------------------------



--Creating Roles table
Create Table Roles (
role_id bigserial Constraint role_id_key Primary key,
_role varchar(50)NOT NULL	
);
--Inserting values to Roles table
Insert into Roles(_role)
Values
('Manager'),
('Designer'),
('SaleRep'),
('Manager'),
('Analyst');


--Creating Salaries table
Create Table Salaries(
salary_id bigserial Constraint salary_id_key Primary key,
salary BIGINT NOT NULL
);
--inserting values in Salaries
Insert into Salaries(salary)
Values
(40000),
(30000),
(34000),
(34000),
(30000);

--Creating Overtime_Hours table
Create Table Overtime_Hours(
overtime_id bigserial Constraint overtime_id_key Primary key,
overtime_hours varchar(55)
);
--Inserting values into Overtime_Hours
Insert into Overtime_Hours(overtime_hours)
Values
('5hrs'),
('4hrs'),
('6hrs'),
('5hrs'),
('4hrs');


--****The many side of the ONE TO MANY relationship*****--
Create Table Employees (
emp_id bigserial Constraint emp_id_key Primary key,
first_name varchar(50) NOT NULL,
surname varchar(65) NOT NULL,
gender char(1) NOT NULL,
address varchar(50) NOT Null,
email varchar(50) Unique NOT NULL,
---foreign keys
depart_id BIGINT References Departments(depart_id),
role_id BIGINT References Roles(role_id),
salary_id BIGINT References Salaries(salary_id),
overtime_id BIGINT References Overtime_Hours(overtime_id)
);

Insert INTO Employees (

first_name,
surname,
gender,
address,
email,
---Foreign keys	
depart_id,
role_id,
salary_id,
overtime_id
)
Values
('Thabo', 'Nyathi','M','112-BedfordView','tnbabo@gmail.co.za',1,2,1,1),
('Alan', 'Davis','M','11-GreenHill','alandavie@gmail.co.za',2,1,3,4),
('Nnandi', 'Ngwenya','F','45-CrestWood','nnanndi@gmail.co.za',4,3,5,2),
('Kenshin','Himura','M','78-KyotoSquare','HimBaKen@gmail.co.za',3,4,5,5),
('Sarah','Saldara','f','022-FreeView','saladara@gmail.co.za',5,5,4,3);

---*************Left Join*********** tables--
Select emp.emp_id, emp.first_name, emp.surname, emp.gender, emp.address, emp.email, depart.depart_name,job.role_id,job._role,sal.salary,ovhr.overtime_hours
From Employees AS emp Left Join Departments AS depart
On emp.depart_id = depart.depart_id

Left Join
Roles AS job
On emp.role_id = job.role_id

Left Join
Salaries AS sal
On emp.salary_id = sal.salary_id

Left Join
Overtime_Hours AS ovhr
On emp.overtime_id = ovhr.overtime_id