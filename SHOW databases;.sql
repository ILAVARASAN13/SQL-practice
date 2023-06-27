SHOW databases;
USE SQL_Basics;
--creating a product table
CREATE TABLE product(
    P_CODE INT PRIMARY KEY,
    P_NAME VARCHAR (255),
    PRICE DECIMAL (10,2),
    STOCK INT,
    CATEGORY VARCHAR(255)
);
--CREATING a customer table
CREATE TABLE CUSTOMER (
    C_ID INT PRIMARY KEY,
    C_NAME VARCHAR(255),
    C_LOCATION VARCHAR(255),
    C_PHONENO VARCHAR(20)
);
--CREATING A SALES TABLE
CREATE TABLE SALES (
    ORDER_DATE DATE,
    ORDER_NO INT PRIMARY KEY,
    C_ID INT,
    C_NAME VARCHAR(255),
    S_CODE INT,
    P_NAME VARCHAR(255),
    QTY INT,
    PRICE INT
);
--INSERTING VALUES INTO THE PRODUCT TABLE
INSERT INTO product (P_CODE,P_NAME,PRICE,STOCK,CATEGORY)
VALUES (1,'tulip',198,5,'perfume'),
(2,'cornoto',50,21,'icecream'),
(3,'Pen',10,52,'Stationary'),
(4,'Lays',10,20,'snacks'),
(5,'mayanoise',90,10,'dip'),
(6,'jam',105,10,'spread'),
(7,'shampoo',5,90,'hair product'),
(8,'axe',210,4,'perfume'),
(9,'park avenue',901,2,'perfume'),
(10,'wattagirl',201,3,'perfume'),
(11,'pencil',4,10,'Stationary'),
(12,'sharpener',5,90,'Stationary'),
(13,'sketch pen',30,10,'Stationary'),
(14,'tape',15,30,'Stationary'),
(15,'paint',60,12,'Stationary'),
(16,'chocolate',25,50,'snacks'),
(17,'biscuts',60,26,'snacks'),
(18,'mango',100,21,'fruits'),
(19,'apple',120,9,'fruits'),
(20,'kiwi',140,4,'fruits'),
(21,'carrot',35,12,'vegetable'),
(22,'onion',22,38,'vegetable'),
(23,'tomato',21,15,'vegetable'),
(24,'serum',90,4,'hair product'),
(25,'conditioner',200,5,'hair product'),
(26,'oil bottle',40,2,'kitchen utensil');
--INSERTING VALUES INTO CUSTOMER TABLE
INSERT INTO CUSTOMER(C_ID,C_NAME,C_LOCATION,C_PHONENO)
VALUES (1111,'Nisha','kerala','8392320'),
(1212,'Oliver','kerala','4353891'),
(1216,'Nila','delhi','3323242'),
(1246,'Vignesh','chennai','1111212'),
(1313,'shiny','Maharastra','5454543'),
(1910,'Mohan','mumbai','9023941'),
(2123,'Biyush','Bombay','1253358'),
(3452,'Alexander','West Bengal','1212134'),
(3921,'Mukesh','Manipur','4232321'),
(5334,'Christy','pakistan','2311111'),
(9021,'Rithika','Kashmir','1121344'),
(9212,'Jessica','banglore','1233435'),
(9875,'Stephen','chennai','1212133');
--INSERTING VALUES INTO SALES TABLE
INSERT INTO SALES(ORDER_DATE,ORDER_NO,C_ID,C_NAME,S_CODE,P_NAME,QTY,PRICE)
VALUES ('24-07-2016','HM06',9212,'Jessica',11,'pencil',3,30),
('19-10-2016','HM09',3921,'Mukesh',17,'biscuits',10,600),
('30-10-2016','HM10',9875,'Stephen',2,'cornoto',10,500),
('12-04-2018','HM03','1212','Oliver',20,'kiwi',3,420),
('02-05-2018','HM05',1910,'Mohan',20,'kiwi',2,280),
('20-09-2018','HM08',5334,'Chirsty',16,'chocolate',2,50),
('11-01-2019','HM07',1246,'Vignesh',19,'apple',5,600),
('15-03-2019','HM01',1910,'Mohan',5,'mayanoise',4,360),
('10-02-2021','HM04',1111,'Nisha',25,'conditioner',5,1000),
('12-02-2021','HM02',2123,'Biyush',3,'Pen',2,20);

--CHANGING DATA TYPE OF THE ORDER_NO IN THE SALES TABLE
ALTER TABLE SALES
MODIFY COLUMN ORDER_NO VARCHAR(10);

--NEW COLUMN FOR STORING THE DATE AS A STR
ALTER TABLE SALES
ADD COLUMN order_date_str VARCHAR(10);
--UPDATE NEW COLUMN WITH CONVERTED DATE VALUES
UPDATE SALES
SET order_date_str = DATE_FORMAT('ORDER_DATE','%d-%m-%Y');
--remove the old date column
ALTER TABLE SALES
DROP COLUMN ORDER_DATE;
--RENAME THE NEW COLUMN TO 'ORDER_DATE'
ALTER TABLE SALES
CHANGE COLUMN order_date_str ORDER_DATE VARCHAR(10);

--ADDING TWO NEW COLUMNS TO SALES TABLE
ALTER TABLE SALES
ADD COLUMN S_NO INT,
ADD COLUMN CATEGORIES VARCHAR(25);

-- to change the column type of stock in the product table to varchar.
ALTER TABLE product
MODIFY COLUMN STOCK VARCHAR(50);
-- CHANGING THE TABLE NAME TO CUSTOMER_TO_CUSTOMER DETAILS
RENAME TABLE CUSTOMER TO CUSTOMER_DETAILS;
--DROPING S_NO& CATEGORIES
ALTER TABLE SALES
DROP COLUMN S_NO,
DROP COLUMN CATEGORIES; 
--TO DISPLAY EVERYTHING FROM SALES
SELECT*FROM SALES;
-- TO DISPLAY ORDER_NO,C_ID,_ORDER_DATE,QTY
SELECT ORDER_NO,C_ID,ORDER_DATE,QTY FROM SALES;
-- TO DISPLAY EVERYTHING FROM PRODUCT IF THE CATEGORY IS STATIONAERY
SELECT*
FROM product
 WHERE CATEGORY = 'Stationary';
-- to display a unique category on product 
select DISTINCT CATEGORY
FROM product;
-- DISPLAYING SALES 
SELECT*
FROM SALES
WHERE QTY>2 AND PRICE<500;
--showing customer names ending a
SELECT C_NAME
FROM CUSTOMER_DETAILS
WHERE C_NAME LIKE '%a';
--to display product details in descending order
SELECT*
FROM product
ORDER BY PRICE DESC;

