--Chapter 3


---
CREATE TABLE char_data_types (
    varchar_column varchar(10),
    char_column char(10),
    text_column text
);

INSERT INTO char_data_types
VALUES
    ('abc', 'abc', 'abc'),
    ('defghi', 'defghi', 'defghi');

COPY char_data_types TO 'C:\Users\Marco\Desktop\Postgres SQL\typestest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
----


--Number types
CREATE TABLE number_data_types (
    numeric_column numeric(20,5),
    real_column real,
    double_column double precision
);


INSERT INTO number_data_types
VALUES
    (.7, .7, .7),
    (2.13579, 2.13579, 2.13579),
    (2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;

---

SELECT
    numeric_column * 10000000 AS "Fixed",
    real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

---

-- Timestamp and interval types 

CREATE TABLE date_time_types (
    timestamp_column timestamp with time zone,
    interval_column interval
);

INSERT INTO date_time_types
VALUES
    ('2018-12-31 01:00 EST','2 days'),
    ('2018-12-31 01:00 PST','1 month'),
    ('2018-12-31 01:00 Australia/Melbourne','1 century'),
    (now(),'1 week');

SELECT * FROM date_time_types;

----subtracting timestamp_column with interval_column
SELECT
    timestamp_column,
    interval_column,
    timestamp_column - interval_column AS new_date
FROM date_time_types;

--**Using Cast() or :: notation
--converting date type into varchar type
SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM date_time_types;

--converting decimal types to integer and varchar types using shortcut(::)
SELECT numeric_column,  numeric_column::integer,
numeric_column :: varchar(6)
FROM number_data_types;

--wont work because char_column values('a,b,c') cant turn into integers 
SELECT CAST(char_column AS integer) FROM char_data_types;
--using shortcut
Select char_column:: integer  FROM char_data_types;


---Try it yourself 1
numeric(4,1);


--Try it yourself 2//data-type for names
varchar(65);


--Try it yourself 3//transforming incomplete date format(in text) to timestamp data type 
SELECT '4//2017':: timestamp with time zone;





