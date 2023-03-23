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
--Select ifexist_fn();
Select  ifexist_fn2(1);
Select  ifexist_fn2(2);
Select  ifexist_fn2(3);
Select  ifexist_fn2(4);
Select  ifexist_fn2(5);

Select * From cart
ORDER BY product_id;

--Delete From cart where product_id = 3;
--Drop Table cart cascade;

---------------------------------------


--3)OrderHeader table----------------------------------------
 Create Table orderHeader (
    order_id BIGSERIAL Constraint order_id_key Primary key,
	user_id BIGINT References users(user_id)ON Delete Cascade,
	order_date timestamp DEFAULT current_timestamp Not Null
	 
 );
 
Insert INTO orderHeader(user_id)

Values(2),
      (1),
      (2); 

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
Select oh.order_id, oh.user_id, users.user_name, oh.order_date, od.product_id,  prod.product_name, od.qty, sum(prod.price * od.qty) as total_price
From orderDetails As od
INNER JOIN products AS prod
on od.product_id = prod.product_id



INNER JOIN orderHeader as oh
ON oh.order_id = od.order_id
 
INNER JOIN users
on oh.user_id = users.user_id
Where oh.order_id = 3
Group By oh.order_id,od.order_id,users.user_name, od.product_id, od.qty,prod.product_name;

---Print out orders for the day
Select oh.order_id, oh.user_id,users.user_name, oh.order_date, od.product_id,  prod.product_name, od.qty, sum(prod.price * od.qty) as total_price
From orderDetails As od
INNER JOIN products AS prod
on od.product_id = prod.product_id

INNER JOIN orderHeader as oh
ON oh.order_id = od.order_id

INNER JOIN users
on oh.user_id = users.user_id
Where date(oh.order_date) = '2023/03/23'
Group By oh.order_id,od.order_id,users.user_name, od.product_id, od.qty,prod.product_name
ORDER BY oh.order_id;
 


---*****************************if exist function*********************************--
Create or Replace function ifexist_fn2(prod_id BIGINT)
return void as 
BEGIN
-----where id is 1
IF EXISTS(Select * From cart where product_id = prod_id )
 THEN 
   UPDATE cart SET qty = qty + 1 where product_id = prod_id;
   Else 
    Insert Into cart(product_id, qty)
	 Values(prod_id,1);
	 END IF;
/*-----where id is 2
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
*/
END;
 
 
 
 
