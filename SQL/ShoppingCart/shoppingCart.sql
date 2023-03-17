---1) Creating Products table
Create Table products (
    product_id BIGINT ,
	product_name varchar(50)NOT Null,
	price BIGINT NOT Null,
	Constraint  product_id_key Primary Key(product_id)
);
Insert Into products (product_id, product_name, price)
Values 
(1,'Coke',10),
(2,'Chips', 5),
(3,'Pizza',10),
(4,'Chocolate',7),
(5,'HotDog',9);


Select * from products;
--Drop table products Cascade;

--2) Creating Users Table
 
CREATE Table users(
   user_id bigserial Constraint user_id_key Primary key,
	user_name varchar(65)
);
Insert INTO users (user_name)
Values('Arnold'),
      ('Sheryl');

--3) Cart Table-------------------------------
Create Table cart(
  product_id BIGINT References products(product_id),
  qty BIGINT NOT NULL	
);
Insert Into cart (product_id,qty)
Values
(1,1);

--If exist function
Select ifexist_fn();


Select * From cart
ORDER BY product_id;

--Delete From cart where product_id = 3;
--Update cart SET qty = qty - 1 where product_id >= 1;
--Drop Table cart;

---------------------------------------


--3)OrderHeader table----------------------------------------
 Create Table orderHeader (
    order_id BIGINT   Constraint order_id_key Primary key,
	user_id BIGINT References users(user_id),
	 order_date VARCHAR(50) Not Null
	 
 );
 
Insert INTO orderHeader(order_id, user_id, order_date)

Values(1,2,'15 Apr 15h30'),
      (2,1,'15 Apr 15h35'),
      (3,2,'16 Apr 14h35'); 

Select * From orderHeader; 
--drop Table orderHeader Cascade;
------------------------------------------------------ 


--creating OrderDetails table-----------------------------
 Create Table orderDetails (
    order_id BIGINT References orderHeader(order_id),
	product_id BIGINT references products(product_id),
	 qty BIGINT NOT NULL
	 
);

Insert INTO orderDetails(order_id,product_id,qty)
Values(1,1,2),
       (1,2,1),
	    (2,3,1),
		(2,4,1),
		(3,5,1);

Select * FROM orderDetails;
--Drop table orderDetails Cascade;
---------------------------------------------------------

--Print out one order
Select oh.order_id, oh.user_id, oh.order_date, od.product_id, od.qty
From orderHeader AS oh
INNER JOIN orderDetails As od
on oh.order_id = od.order_id
Where oh.order_id = 3;

---Print out orders for the day
Select oh.order_id, oh.user_id, oh.order_date, od.product_id, od.qty
From orderHeader AS oh
INNER JOIN orderDetails As od
on oh.order_id = od.order_id
Where oh.order_date LIKE '%15 Apr%';
 


---*****************************if exist function*********************************--
Create or Replace function ifexist_fn()
return void as 
BEGIN
-----where id is 1
IF EXISTS(Select * From cart where product_id = 1 )
 THEN 
   UPDATE cart SET qty = qty + 1 where product_id = 1;
   Else 
    Insert Into cart(product_id, qty)
	 Values(1,1);
	 END IF;
-----where id is 2
IF EXISTS(Select * From cart where product_id >= 2 )
 THEN 
   UPDATE cart SET qty = qty + 1 where product_id >= 2;
   Else 
    Insert Into cart(product_id, qty)
	 Values(2,1),
	  (3,1),
	  (4,1),
	  (5,1);
	 END IF;

END;
 
 