--creating profession table
Create TABLE professions(
   prof_id bigserial constraint prof_id_key Primary key,
	profession varchar(50) NOT NULL
);
Alter Table professions Add Constraint profession_unique Unique(profession);

---Inserting values for professions table
Insert INTO professions 
(profession)
Values

('doctor'),
('teacher'),
('software developer'),
 ('author'),
 ('College-student'),
('architect');

Select * From professions;
--Drop Table professions;
-------------------

--Creating zip-codes table
 Create Table zip_codes(
    zip_code BIGINT Constraint zip_code_key Primary key,
    province varchar(50),
    city varchar(50)
    check (zip_code between 1000 AND 9999 )
 );
 
 --Inserting values for zip_codes table
Insert INTO zip_codes 
(zip_code, province, city)
Values 
(1001, 'Gauteng','Johannesburg'),
(1002,'Gauteng','Pretoria'),
(2001,'Western Cape','Cape Town'),
(2002,'Western Cape','Mossel Bay'),
(3001,'Eastern Cape','East London'),
(3002, 'Eastern Cape', 'Port Elizabeth'),
(4001,'Kwa-Zulu Natal', 'Durban'),
(4002,'Kwa-Zulu Natal', 'Pietermaritzburg'),
(5001,'Mpumalanga','Mbombela'),
(5002,'Mpumalanga', 'Hazyview'),
(6001,'Free State','Bloemfontein'),
(6002,'Free State','Welkom'),
(7001, 'Limpopo','Polokwane'),
(7002,'Limpopo','Mokopane'),
(8001,'Northern Cape','Kimberley'),
(8002,'Northern Cape','Upington'),
(9001,'North West','Mahikeng'),
(9002,'North West','Rustenburg');


Select * From zip_codes;
--Drop Table zip_codes Cascade;
-----------------------------
       
  
 
 
 --creating status table
   Create Table rel_status (
     status_id bigserial Constraint status_id_key Primary key,
	  status varchar(50) 
   );
---Inserting values for rel_status table

Insert INTO rel_status 
(status)
Values
('single'),
('divorced');

select * From rel_status;
-----------------------
 


---Creating Interests table
Create Table interests(
   interest_id bigserial Constraint interest_id_key Primary key,
   interest varchar(30)Unique NOT NULL
   
);

--Inserting values for Interests table
Insert Into interests(interest)
Values
('Dancing'),
('Fishing'),
('Hiking'),
('Ice-Skating'),
('Mountain Biking'),
('Gaming'),
('Painting'),
('Singing'),
('Sculpting');

Select * From interests;
----------------------------------------

--Creating Seekings Table
Create Table seekings(
	seeking_id bigserial Constraint seeking_id_key Primary key,
     seeking varchar(30)Unique NOT NULL
);

--Inserting values for Seekings table
Insert Into seekings(seeking)
values
('Same Profession'),
('employed'),
('single'),
('Female'),
('Male'),
('over 25'),
('over 30'),
('College-student'),
('Same Province'),
('Same age');

Select * From seekings;

--Drop Table seekings Cascade;
/*--------------------------------------------------------------------------*/



/*------------creating my contact table(on the "Many" side of the relationship)-----------------*/
Create Table my_contacts (
    contact_id bigserial constraint contact_key Primary Key,
	last_name varchar(50) NOT NULL,
    first_name varchar(50) NOT Null,
	phone varchar(10) UNIQUE NOT NULL,
    email varchar(50) Unique NOT NULL,
    gender char(1) NOT NULL,
	birthday varchar(11),
--foreign keys
	 prof_id BIGINT References professions(prof_id),
     zip_code BIGINT References zip_codes(zip_code),
     status_id BIGINT References rel_status(status_id)
------------------
    
);
--Inserting values for my_contacts table (18 values?)
Insert INTO my_contacts 
(
 last_name,
 first_name,
 phone,
 email,	
 gender,
 birthday,
 prof_id,
 zip_code,
 status_id

)
Values
('Ndaba','Sizwe','0712345678','sizndban@gmail.co.za','M','13/03/1990',2,1001,2),
('Mary','Lisa','0722345678','limar@gmail.co.za','F','04/10/1997',1,1002,2),
('Naidoo','Dave','0732345678','davenai@gmail.co.za','M','16/09/1999',3,2001,1),
('Dube','Nolwazi','0742345678','nolwaazz@gmail.co.za','F','21/02/1991',3,2002,2),
('Francois','Marlon','0752345678','marlfran@gmail.co.za','M','12/07/2000',4,3001,1),
('Asano','Hina','0712345671','hinAsa@gmail.co.za','F','09/08/2001',6,3002,1),
('Radebe','Raymond','0712345672','rayra11@gmail.co.za','M','01/03/1995',4,4001,2),
('Hasi','Iman','0712345673','Hasiman@gmail.co.za','F','12/01/1998',3,4002,1),
('Odoi','Ike','0712345662','ikeodi@gmail.co.za','M','15/06/1999',5,5001,1),
('Gree','Asaya','0722345671','greeasa@gmail.co.za','F','20/12/1997',3,5002,2),
('Silva','Kite','0712344671','kitesil@gmail.co.za','M','11/11/2000',2,6001,1),
('Thusi','Ayanda','0712345653','ayaT@gmail.co.za','F','15/08/2001',1,6002,1),
('Condones','Phil','0714345671','philCon@gmail.co.za','M','26/02/1998',5,7001,2),
('Mwamba','Nasheyi','0712445671','nashmwa@gmail.co.za','F','23/07/1999',2,7002,1),
('Park','Steve','0712348671','.co.za','M','27/12/1999',4,8001,2),
('Ndawa','Mani','0702345671','maniNdawa@gmail.co.za','F','18/09/2000',1,8002,1),
('Jakali','Balron','0712345679','bajaka12@gmail.co.za','M','22/09/1999',2,9001,2),
('Zama','Khanya','0712345690','zamakha@gmail.co.za','F','15/09/2001',6,9002,1);

Select * From my_contacts;
--Drop Table my_contacts Cascade;
/*--------------------------------------------------------------------------------------*/



/*-------------------many to many Joining tables--------------------*/

--Creating contact_interest table
Create table contact_interest (
    contact_id BIGINT References my_contacts(contact_id),
	interest_id BIGINT references interests(interest_id)
);

Insert Into contact_interest (contact_id, interest_id)
Values
(1,2),(1,4),(1,6),
(2,3),(2,6),(2,9),
(3,1),(3,4),(3,8),
(4,1),(4,3),(4,9),
(5,2),(5,4),(5,6),
(6,5),(6,6),(6,2),
(7,2),(7,3),(7,6),
(8,3),(8,4),(8,8),
(9,1),(9,9),(9,2),
(10,2),(10,5),(10,6),
(11,2),(11,5),(11,3),
(12,5),(12,4),(12,5),
(13,5),(13,7),(13,6),
(14,4),(14,4),(14,7),
(15,2),(15,7),(15,9),
(16,1),(16,7),(16,3),
(17,8),(17,2),(17,5),
(18,3),(18,7),(18,4);


Select * From contact_interest;
--Drop table contact_interest;


--Creating contact_seeking table
Create table contact_seeking (
    contact_id BIGINT References my_contacts(contact_id),
	seeking_id BIGINT REFERENCES seekings(seeking_id)

);


Insert Into contact_seeking(contact_id, seeking_id)
Values
(1,2),(1,4),(1,6),
(2,3),(2,5),(2,7),
(3,1),(3,4),(3,7),
(4,1),(4,5),(4,3),
(5,2),(5,4),(5,6),
(6,5),(6,5),(6,2),
(7,2),(7,4),(7,6),
(8,3),(8,4),(8,6),
(9,1),(9,4),(9,2),
(10,3),(10,4),(10,6),
(11,2),(11,5),(11,3),
(12,2),(12,4),(12,7),
(13,1),(13,5),(13,6),
(14,1),(14,4),(14,6),
(15,2),(15,5),(15,7),
(16,1),(16,4),(16,9),
(17,8),(17,4),(17,5),
(18,3),(18,5),(18,4);


Select * From contact_seeking;

--Drop Table contact_seeking;
/*-------------------------------------------------------------------------*/


---Joining Tables (left join)

Select mc.contact_id, mc.last_name, mc.first_name, prof.prof_id, prof.profession, zc.zip_code, zc.city, zc.province,st.status_id,st.status,intr.interest,sk.seeking
From my_contacts AS mc LEFT JOIN professions AS prof 
On mc.prof_id = prof.prof_id

--join_zip_codes table to my_contact
LEFT JOIN  zip_codes AS zc
ON mc.zip_code = zc.zip_code 

--join rel_status to my_conact
LEFT JOIN rel_status AS st
ON  mc.status_id =  st.status_id


--join contact_interest to my_contact
Left Join contact_interest AS ci
ON mc.contact_id = ci.contact_id
Left Join interests AS intr
ON intr.interest_id = ci.interest_id

--Join contact_seeking to my_contact
Left JOIN contact_seeking AS cs
ON mc.contact_id = cs.contact_id
Left JOIN seekings AS sk
ON sk.seeking_id = cs.seeking_id
ORDER BY mc.contact_id;

