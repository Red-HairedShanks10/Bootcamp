----Chapter 5 Basic math

SELECT 2 + 2;    
SELECT 9 - 1;    
SELECT 3 * 4;
----------------

-----division 
--**integer division
SELECT 11 / 5;
--modulo division
SELECT 11 % 5;  
--decimal division
SELECT 11.0 / 5; 
SELECT CAST(11 AS numeric(3,1)) / 5;

---------exponential calc, Roots, factorals

SELECT (4 ^ 2) ::bigint;
SELECT (|/ 10) :: bigint;
SELECT sqrt(10);
SELECT ||/ 10;
--SELECT (4) !;


--- Order of operations
SELECT 7 + 8 * 9; 	
SELECT (7 + 8) * 9;	
SELECT 3 ^ 3 - 1;   
SELECT 3 ^ (3 - 1); 
Select (7+8) * (3*3) + (5*2);

----

SELECT * FROM us_counties_2010;

---
SELECT geo_name,
state_us_abbreviation AS "st",
p0010001 AS "Total Population",
p0010003 AS "White Alone",
p0010004 AS "Black or African American Alone",
p0010005 AS "Am Indian/Alaska Native Alone",
p0010006 AS "Asian Alone",
p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
p0010008 AS "Some Other Race Alone",
p0010009 AS "Two or More Races"
FROM us_counties_2010;

----finding the total of black and white
SELECT geo_name,
state_us_abbreviation AS "st",
p0010003 AS "White Alone",
p0010004 AS "Black Alone",
p0010003 + p0010004 AS "Total White and Black"
FROM us_counties_2010;

---finding total of all races,sort by difference in descending order
SELECT geo_name,
state_us_abbreviation AS "st",
 p0010001 AS "Total",
 p0010003 + p0010004 + p0010005 + p0010006 + p0010007
+ p0010008 + p0010009 AS "All Races",
(p0010003 + p0010004 + p0010005 + p0010006 + p0010007
+ p0010008 + p0010009) - p0010001 AS "Difference"
FROM us_counties_2010
ORDER BY "Difference" DESC;


---finding percentage of asians for each state, sort by pct asian column in desc order
SELECT geo_name,
state_us_abbreviation AS "st",
(CAST (p0010006 AS numeric(8,1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;

--creating percentage change 
CREATE TABLE percent_change (
department varchar(20),
spend_2014 numeric(10,2),
spend_2017 numeric(10,2)
);
INSERT INTO percent_change
VALUES
('Building', 250000, 289000),
('Assessor', 178556, 179500),
('Library', 87777, 90001),
('Clerk', 451980, 650000),
('Police', 250000, 223000),
('Recreation', 199000, 195000);

--check percentage change
SELECT department,
spend_2014,
spend_2017,
round( (spend_2017 - spend_2014) /
spend_2014 * 100, 1) AS "pct_change"
FROM percent_change;

--finding sum of ppl for the whole nation, and average ppl in each county state
SELECT sum(p0010001) AS "County Sum",
round(avg(p0010001), 0) AS "County Average"
FROM us_counties_2010;

---
CREATE TABLE percentile_test (
numbers integer
);
INSERT INTO percentile_test (numbers) VALUES
(1), (2), (3), (4), (5), (6);
SELECT
percentile_cont(.5)
WITHIN GROUP (ORDER BY numbers),
percentile_disc(.5)
WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;

--finding county median
SELECT sum(p0010001) AS "County Sum",
round(avg(p0010001), 0) AS "County Average",
percentile_cont(.5)
WITHIN GROUP (ORDER BY p0010001) AS "County Median"
FROM us_counties_2010;

---find the mode of population column
SELECT mode() WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010;


---Try it yourself 1
SELECT 3.14 * (5 ^ 2);

--Try it yourself 2
SELECT geo_name,
       state_us_abbreviation,
       p0010001 AS total_population,
       p0010005 AS american_indian_alaska_native_alone,
       (CAST (p0010005 AS numeric(8,1)) / p0010001) * 100
           AS percent_american_indian_alaska_native_alone
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY'
ORDER BY percent_american_indian_alaska_native_alone DESC;

---Try it yourself 3
SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'NY';

SELECT percentile_cont(.5)
        WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010
WHERE state_us_abbreviation = 'CA';







