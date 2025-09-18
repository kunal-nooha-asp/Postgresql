CREATE TABLE Customers(
 cust_id SERIAL PRIMARY KEY,
 cust_name VARCHAR(100) NOT NULL,
 cust_phone VARCHAR(20) NOT NULL,
 city VARCHAR(100) NOT NULL,
 cust_email VARCHAR(100) NOT NULL UNIQUE
 
);


CREATE TABLE orders(
 order_id SERIAL PRIMARY KEY,
 cust_id INT REFERENCES Customers(cust_id),
 order_date Date NOT NULL,
 amount NUMERIC NOT NULL
	
);

INSERT INTO Customers VALUES (DEFAULT , 'sopan' ,'98278328' , 'Aurangabad' , 'sopandarekar99@gmail.com' ),
(DEFAULT , 'kiran' ,'93498498' , 'Jalna' , 'Kiran@gmail.com' ),
(DEFAULT , 'kishor' ,'98272328' , 'Pune' , 'Kishor@gmail.com' ),
(DEFAULT , 'gopal' ,'98278228' , 'Aurangabad' , 'gopal@gmail.com' ),
(DEFAULT , 'krishna' ,'98278328' , 'Aurangabad' , 'krishna@gmail.com' );



SELECT * FROM Customers;

INSERT INTO orders (cust_id , order_date , amount) VALUES (1, '2025-09-15', 75000.00),
(1, '2025-10-01', 1200.00),
(1, '2025-09-20', 2000.00),
(2, '2025-09-09', 60000.00),
(2, '2025-09-20',   350.00),
(3, '2025-01-23', 89899.00),
(3, '2025-02-01',  1200.00),
(4, '2025-09-10', 77000.00),
(4, '2025-09-11',   450.00),
(5, '2025-08-30', 45000.00),
(5, '2025-09-18',  1500.00),
(6, '2025-07-21', 24000.50),
(6, '2025-06-11',  3200.00);


SELECT * FROM ORDERS;


INSERT INTO Customers ( cust_name, cust_phone ,city, cust_email) VALUES
( 'Saanvi Patel', '98489334' ,  'Mumbai',     'saanvi.patel@example.com'),
( 'Rohit Verma',   '894949393',  'Delhi',      'rohit.verma@example.com'),
( 'Maya Singh',   '8949494944',   'Bengaluru',  'maya.singh@example.com'),
( 'Nikhil Gupta', '4858594944',  'Hyderabad',  'nikhil.gupta@example.com'),
('Priya Nair',   '598699494',   'Chennai',    'priya.nair@example.com');



-- Inner Join

SELECT c.cust_id, c.cust_name  , c.city ,o.order_id , o.amount

FROM Customers c
INNER JOIN orders o ON o.cust_id = c.cust_id;



--- Left Join 

SELECT c.cust_id , c.cust_name , o.order_id , o.amount
FROM Customers c
LEFT JOIN orders o ON o.cust_id =c.cust_id;

--Right Join 

SELECT c.cust_id , c.cust_name , o.order_id , o.amount
FROM Customers c
 RIGHT JOIN orders o ON c.cust_id =o.cust_id;


 -- Full Outer  Join
SELECT c.cust_name, o.order_id
FROM Customers c
FULL OUTER JOIN orders o ON c.cust_id = o.cust_id;



-- self Join




SELECT c1.cust_name AS Customer , c2.cust_name AS referred_by
FROM Customers c1
JOIN Customers c2 ON  c1.city=c2.city
WHERE c1.cust_id <> c2.cust_id;



-- INDEX 

CREATE INDEX idx_cust_id ON Orders(cust_id);

CREATE INDEX idx_cust_mail ON Customers(cust_email);

SELECT indexname , indexdef
FROM pg_indexes
WHERE tablename ='orders';



-- SEQUENCE 
CREATE SEQUENCE customer_id_seq
	START WITH 11
	INCREMENT BY 1
	MINVALUE 1
	NO MAXVALUE
	CACHE 1




INSERT INTO Customers (cust_id , cust_name , cust_phone , city , cust_email) VALUES
(nextval('customer_id_seq') , 'master' , '5847584844' , 'pune' , 'master89@gmail.com');


SELECT currval('customer_id_seq');


ALTER TABLE Customers
ALTER COLUMN cust_id  SET DEFAULT nextval('customer_id_seq');




ALTER TABLE Customers
ALTER COLUMN cust_id  SET DEFAULT nextval('customer_id_seq');



SELECT * FROM Customers;

