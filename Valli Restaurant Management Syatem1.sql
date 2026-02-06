CREATE DATABASE valli_Restaurant;
USE valli_Restaurant;
 drop database valli_restaurant;
commit;
rollback;

# USER LOING PAGE
create table USER(
	User_Id int NOT NULL AUTO_INCREMENT,
	Fname varchar(50) NOT NULL,
	Lname varchar(50) NOT NULL,
    Email varchar(100) not null unique,
	Password varchar(50) NOT NULL,
	PRIMARY KEY (`User_Id`)
);
desc USER;

# CREATE BRANCH DEDAILS
CREATE TABLE Branch_Detail (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
branch_name VARCHAR (100),
menu_items TEXT,
combo_price varchar(40));
desc Branch_Detail;

# VEG MENU
create table veg(
id int primary key auto_increment,
veg_name varchar(60) not null,
price decimal(8,2) not null);
desc veg;

# JUICE MENU
create table juice(
id int primary key auto_increment,
juice_name varchar(60) not null,
price decimal(8,2) not null	);
desc juice;

# MAIN MENU ITEMS
create table MENU(
 menu_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR (100)not null,
 Price decimal(8,2)not null,
 Rate decimal(3,2)default null,
 Catagory varchar(40),
 veg_id int  null,
 foreign key(veg_id) references veg(id),
 juice_id int null,
 foreign key(juice_id) references juice(id));
desc Branch_Detail;

# CREATE CUSTOMER DEDAILS
CREATE TABLE Customer_details(
 CUSTOMER_id int PRIMARY KEY AUTO_INCREMENT,
 Customer_name varchar(30) DEFAULT NULL,
 City varchar(20) DEFAULT NULL,
 Address varchar(50) DEFAULT NULL,
 Email_id varchar(30) unique);
desc Customer_details;

SHOW TABLES;

-- INSERT VEG ITEMS
insert into veg(veg_name, price) values
('mushroom curry','150'),
('Gobi manchurian dry','180'),
('sampar rice','50'),
('curd rice','60'),
('veg biriyani','130'),
('veg fried rice','150'),
('veg hakka noodels','130'),
('veg 65','110'),
('veg manchurian','150'),
('Gobi manchurian','150'),
('panneer chilly','130'),
('veg cripsy','120'),
('mushroom 65','90'),
('mashroom fried rice','150'),
('babycorn chilly',110);
select count(veg_name) from veg;

-- INSERT JUICE ITEMS
insert into juice(juice_name, price) values
('Apple zing','80' ),
('Mango tango','75' ),
('pomegranate','85' ),
('berry bliss','80' ),
('orange','80' ),
('pineapple','100' ),
('fruit juice','120' ),
('sweet lime','50' ),
('mosambi','90' ),
('carrot','80' ),
('watermelon','80' ),
(' fresh lime soda','80' ),
('grap jcie','110' ),
('vegetable juice','90' ),
('fresh lime water','80' ); 
select count(juice_name) from juice;

-- INSERT CUSTOMER DEDAILSE 
INSERT INTO Customer_details (Customer_name, City, Address, Email_id) VALUES
('PremKumar','chennai', 'kk nagar 630765','prem@gmail.com'),
('Ashok','chennai', 'asok nagar 630231',  'asok@gmail.com'),
('Ram','chennai', 'ram nagar 60906',  'ram@gmail.com'),
('Gopal','karaikudi', 'saibaba street 630908',  'gopal@gmail.com'),
('Arsath','thiricy', 'vengetesh nagar 630692',  'arsath@gmail.com'),
('Dhoni','chennai', 'velachery 630874',  'dhoni@gmail.com'),
('Gokul','chennai', 'babu nagar 630308',  'gokul@gmail.com'),
('franklin','thiricy', 'kanesh nagar 630738',  'frank@gmail.com');

-- INSERT BRANCH DEDAILS
INSERT INTO Branch_Detail (branch_name, menu_items,combo_price) VALUES
("kanyakumari", "mutton_Biryani, fish curry,muton chukka", 650),
("chennai", "chicken_Biryani, Pongal, Idly", 380),
("karaikudi", "mutton_Biryani, chettinad spcial,uppukari",600),
("Coimbatore", "Dragon_Chicken, keema_dosa, Prawn_65",500),
("Madurai", "Chicken_65, parrota, muttoun curry",400),
("Hyderbad", "Kal_dosa, Naan, Panner_gravy", 250),
("pondychery", "potato uthappam, mushroom dragon",350);

-- INSERT MENU ITEMS 
INSERT INTO MENU (name,Price,Rate,Catagory,veg_id,juice_id) VALUES
 ("Chicken Tikka",160,4,"Starters",1,1),
 ("Tandoori Chicken",250,4.5,"Starters",2,2),
 ("Tandoori King Prawn",200,4.3,"SeaFood",3,3),
 ("King Prawn Rosun",250,3,"SeaFood",4,4),
 ("Mushroom Rice",150,4.2,"Rice",5,5),
 ("Chicken Fry Rice",150,4.2,"Rice",6,6),
 ("Garlic Naan",130,4.4,"Bread",7,7),
 ("Kal_dosa",50,4,"Starters",8,8),
 ("Chapati",30,4,"Bread",9,9),
 ("Chicken_65",210,4.2,"Starters",10,10),
 ("parrota",30,4.3,"Starters",11,11),
 ("muttoun curry",180,4,"Starters",12,12),
 ("Pongal",50,3.3,"Starters",13,13),
 ("muton chukka",250,4,"Starters",14,14),
 ("potato uthappam",50,4,"Starters",15,15);
 select count(name) from MENU;
select max(Price) from MENU;

select*from USER;
select*from veg;
select*from juice;
select*from Customer_details;
select*from Branch_Detail;
select*from MENU;

# JOINS
select e.menu_id,e.name,e.Price,e.Rate,e.Catagory,e.veg_id,c.id,c.veg_name,c.price
from MENU as e inner join veg as c on veg_id=c.id;

# INNER JOINS
select e.menu_id,e.name,e.Price,e.Rate,e.Catagory,
c.id,c.veg_name,c.price,
d.id,d.juice_name,d.price
from MENU as e 
inner join veg as c on veg_id=c.id
inner join juice as d on e.juice_id=d.id;

# CREATE RESTAURANT OWENER
create table OWNER(
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(100) NOT NULL,
	Rest_Name varchar(100) NOT NULL);
    desc OWNER;
    
-- INSERT RESTAURANT OWENET DEDAILS
insert into OWNER(Fname,Lname,Contact,Rest_Name)values
("sekar","muniyandi","894056438","valli_restaurant");
select*from OWNER;

# ADD THE NEW ONE COLUMN IN COUSTOMER DEDAILS 
alter table Customer_details add mobile_number varchar(50) unique after Address;

# MULTIPLE VALUESE UPDATE
update Customer_details set mobile_number =case
when CUSTOMER_id=1 then 8940058241
when CUSTOMER_id=2 then 9840058241
when CUSTOMER_id=3 then 9840058875
when CUSTOMER_id=4 then 9887654321
when CUSTOMER_id=5 then 9865743269
when CUSTOMER_id=6 then 8965743254
when CUSTOMER_id=7 then 9765743763
else 9865432768
end;
select*from Customer_details;

# DROP THE ONE COLUMN IN COUSTOMER DEDAILS
alter table Customer_details drop column Address;

select*from Customer_details;

# AGGREGATE FUNCTION  
select min(Price) from (MENU);
select max(Price) from (MENU);
select count(name) from (MENU);

# TABLE Booking
create table BOOKING(
	Booking_Id int NOT NULL AUTO_INCREMENT,
	Table_Num varchar(30) NOT NULL,
	booking_Date date NOT NULL,
	booking_Time time NOT NULL,
	Cust_Id int NOT NULL,
	PRIMARY KEY (Booking_Id),
	FOREIGN KEY (Cust_Id) REFERENCES Customer_details(CUSTOMER_id));
    
	desc BOOKING;
    
    drop tables BOOKING;
    
    insert into Booking(Table_Num,booking_Date,booking_Time,Cust_Id)values
('02', '2025-05-15', '10:00:00', 2),
('12', '2025-05-20', '12:00:00', 1),
('06', '2025-05-11', '09:00:00', 4),
('08', '2025-05-16', '09:20:00', 3),
('03', '2025-05-17', '10:00:00', 5),
('10', '2025-05-19', '12:00:00', 7),
('04', '2025-05-20', '14:00:00', 8),
('05', '2025-05-25', '08:20:00', 6);

    select*from Booking;
    
    # BETWEEN Operator
    select*from Booking where booking_Date between "2025-05-15" AND "2025-05-20";

	# join
    select e.Booking_Id,e.Table_Num,e.booking_Date,e.booking_Time,e.Cust_Id,c.Customer_name
from Booking as e inner join Customer_details as c on Booking_Id=c.CUSTOMER_id;

# CREATE RESTAURANT MANAGER
create table MANAGER(
	Manager_Id int NOT NULL AUTO_INCREMENT,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Address varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Sex varchar(10) DEFAULT NULL,
	DOB date DEFAULT NULL,
	Join_Date date NOT NULL,
	PRIMARY KEY (`Manager_Id`));
    
    desc MANAGER;
    drop tables manager;
    
    insert into MANAGER(Fname,Lname,Contact,Address,Salary,Sex,DOB,Join_Date)
values
("babu","shankar","9642540626","kk nagar,chennai 630654","30000","Male","1992-09-29","2014-08-01"),
("saravana","kumar","9581871321","mm nagar,chennai 630554","40000","Male","1993-11-18","2012-08-01");
 select*from MANAGER;

# CONCAT
select Manager_Id, concat(Fname, ' ',Lname)as Full_name ,Contact,Address,Salary,Sex,DOB,Join_Date from MANAGER;

#  CREATE RESTAURANT EMPLOYEES
CREATE TABLE employee(
  Emp_Id int primary key auto_increment,
  Emp_name varchar(10) NOT NULL,
  Designation varchar(10) DEFAULT NULL,
  Age int not null,
  Address varchar(50) DEFAULT NULL,
  City varchar(10) DEFAULT NULL,
  State varchar(20) DEFAULT NULL,
  Pincode varchar(6) DEFAULT NULL,
  Contact_no varchar(13) DEFAULT NULL unique,
  Emp_salary decimal(10,2) DEFAULT 0,
  salary_increass decimal(10,0) null,
  hiring_date date DEFAULT NULL,
  check(Emp_salary >=0),
  check(Age >=18)
);
desc employee;
  
# RESTAURANT EMPLOYEES DEDAILS
INSERT INTO employee (Emp_name,Designation,Age,Address,City,State,Pincode,Contact_no,Emp_salary,salary_increass,hiring_date) VALUES
( 'Akshat', 'chef',33,'ashram road', 'ahmedabad','gujrat', '380009', '9874561230', 15000, 1000,'2019-04-14'),
( 'Vishal', 'chef',27,'sarma road', 'chennai','Tamilnadu', '630554', '9874561867', 16000, 1000,'2011-03-14'),
( 'Hardik', 'chef',35, 'gandhiroad', 'chennai','Tamilnadu', '630557', '8974561275', 12000, 1000,'2015-08-24'),
( 'Brijesh', 'cashier',30,'cg road', 'karaikudi','Tamilnadu', '630544', '9774561230', 20000,1000, '2015-01-10'),
( 'Jugal', 'cashier',33, 'mg road', 'karur','Tamilnadu', 630558,'8974561230', 25000, 1000,'2019-09-14'),
( 'ram', 'cashier',25, 'kk road', 'thirupur','Tamilnadu', 630559,'8974561287', 25000, 1000,'2019-09-14'),
( 'praven', 'waiter',23, 'mn road', 'karur','Tamilnadu', 630558,'8974361230', 21000,1000, '2019-06-04'),
( 'karthi', 'waiter',31, 'pm road', 'chennai','Tamilnadu', 630588,'9874561740', 23000, 1000,'2017-09-15'),
( 'Dhinesh', 'chef',27, 'velachry road', 'chennai','Tamilnadu', 630709,'8974561709', 22000, 1000,'2020-04-19'),
( 'kamal', 'waiter',23, 'madipakam road', 'chennai','Tamilnadu', 630487,'9874361750', 21000,1000, '2020-04-02'),
( 'kavin', 'waiter',37, 'hp road', 'vellor','Tamilnadu', 630564,'8974567894', 17000,1000, '2019-03-17'),
( 'keerthi','cleaner',28, 'ram road', 'karaikudi', 'Tamilnadu', 630765,'8940058765',1000, 11000, '2022-09-14'),
( 'harshitha', 'reception',21, 'jj road', 'Tirupati','Anthra', 649876,'8974568796', 13000,1000, '2020-05-17'),
( 'ramya', 'reception',20, 'mani road', 'chennai','Tamilnadu', 630589,'9874568573', 12500,1000, '2021-03-04'),
( 'Guru', 'waiter',23, 'vk road', 'chennai','Tamilnadu', 630608,'8974568645', 13500,1000, '2021-03-08');
select*from employee;

select count(Emp_name) from employee;

# string function
select upper(Emp_name)from employee; 

# Operators based retrieve Querys.

# Equality Operator (=)
SELECT * FROM Booking WHERE booking_Date ="2025-05-20";

# Inequality Operator (!= or <>)
SELECT * FROM employee WHERE Age != 25;

# Greater Than Operator (>)
SELECT * FROM employee WHERE Age > 30;

# Less Than Operator (<)
SELECT * FROM employee WHERE Age < 23;

# Greater Than or Equal To Operator (>=)
SELECT * FROM MENU WHERE Price >= 150;

# Less Than or Equal To Operator (<=)
SELECT * FROM MENU WHERE Price <= 100;

# BETWEEN Operator
select * from employee where Emp_salary between "16000" and "20000";

# IN Operator
SELECT * FROM Customer_details WHERE CUSTOMER_id IN (01, 03, 04);

# LIKE Operator
SELECT * FROM employee WHERE Emp_name LIKE '%a';

# NOT Operator
-- SELECT * FROM reservations WHERE NOT Payment_Status = "completed";

# AND Operator
SELECT * FROM employee WHERE Age > 20 AND Emp_salary = '21000';

# OR Operator
SELECT * FROM employee WHERE Age <=25 OR Designation = 'chef';

# Oreder by
select* from employee order by (Emp_salary);

select* from employee order by(Emp_salary)desc;

# GROUP BY
select Designation, count(Designation)count from employee group by Designation
having count(Designation)>1;

# TRIGGER FUNCTION
create trigger tr
before update on employee
for each row
set new.Emp_salary =(new.salary_increass + new.Emp_salary);

update employee set salary_increass= 2000 where Emp_Id=1;
select*from employee;

# SUB QUERY
select Emp_name,Emp_salary,
(select min(Emp_salary) from employee) as min, (select max(Emp_salary) from employee) as max from employee;

#  STRING FUNCTION
select format(Emp_salary,0) as salay from employee;

# VIEW FUNCTION ----------

 # HOW MANY CHEF EMPLOYEE IN RESTAURANT
create view chef as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='chef';
 select*from chef;
 
 # HOW MANY CASHIER EMPLOYEE IN RESTAURANT
create view cashier as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='cashier';
 select*from cashier;
 
 # HOW MANY RECEPTION EMPLOYEE IN RESTAURANT
create view reception as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='reception';
 select*from reception;
 
 # HOW MANY WAITER EMPLOYEE IN RESTAURANT
create view waiter as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='waiter';
 select*from waiter;
 
 # CUSTOMER ORDER ITEMS
 CREATE TABLE order_items (
  Order_Id int primary key auto_increment,
  customer_name varchar(30) null,
  Food_name varchar(20) DEFAULT NULL,
  Quantity int(11) DEFAULT NULL);
desc order_items;

insert into order_items (customer_name,Food_name,Quantity) values
 ("prem","Mushroom Rice",2),
 (null,"Chicken Fry Rice",2) ,
 (null,"potato uthappam",2),
 (null,"pineapple juice",2);
select*from order_items;

#  BILL 
create table BILL_1(
	Order_Id varchar(55) NULL ,
	Customer_name varchar (20) NULL,
	Name varchar(100) NULL,
    Price decimal(8,2) NULL,
    Total_Amount double NULL	
);
desc bill_1;

  insert into BILL_1(Order_Id,Customer_name,Name,Price,Total_Amount)values
    ("Order01","PremKumar","Mushroom Rice",150+150,null),
	(null,null,"Chicken Fry Rice",150+150,null),
	(null,null,"potato uthappam",50+50,null),
	(null,null,"pineapple juice",100+100,null);
    select*from bill_1;

    
# SUM USED
    select sum(Price) as Total from BILL_1;

create table BILL_2(
	Order_Id varchar(55) NULL ,
	Customer_name varchar (20) NULL,
	Name varchar(100) NULL,
    Price varchar(20) NULL,
    Total_Amount double NULL	
);
desc bill_2;

  insert into BILL_2(Order_Id,Customer_name,Name,Price,Total_Amount)values
    ("Order02","Ram","Tandoori King Prawn",200,null),
	(null,null,"Chicken Fry Rice",150,null),
	(null,null,"pineapple",100,null);
	select*from BILL_2;
    
#sum
    select sum(Price) as Total from BILL_2;

    -- SUM USED
    select sum(Price) as Total from BILL_1;
    select sum(Price) as Total from BILL_2;
    
    select max(Price)from (BILL_1);
	select min(Price)from (BILL_1);

	select max(Price)from (BILL_2);
	select min(Price)from (BILL_2);

-------------------------------------------------
create table MENU_BILL(
	Order_Id int NOT NULL,
	Name varchar(100) NOT NULL,
	Price varchar(20) NOT NULL
	
);
 drop table MENU_BILL;

# FOOD HOME_DELIVERY
create table HOME_DELIVERY(
	Delivery_Id int NOT NULL AUTO_INCREMENT,
	Address varchar(50) NOT NULL,
	Contact varchar(20) NOT NULL unique,
    cust_first_name varchar(40),
    cust_last_name varchar(40),
	Order_Id varchar(40) NOT NULL,
    order_items varchar(100),
    price decimal(10,2)not null,
	PRIMARY KEY(Delivery_Id,Order_Id));
    desc HOME_DELIVERY;
    
 insert into HOME_DELIVERY (Address,Contact,cust_first_name,cust_last_name,Order_Id,order_items,price) values
  ("chennai kk nagar 630554",9876543212,"prem","kumar","ord01","Mushroom Rice,pineapple juice,Chicken_65",'520'),
  ("chennai rn nagar 630987",8976543249,"javid","ahamet","ord07","chicken_Biryani, Pongal, Idly",'450'),
  ("chennai ram nagar 630856",9876543765,"babu","shankar","ord06","potato uthappam, mushroom dragon",'250'),
  ("chennai mm nagar 640857",9776543278,"sebastin","frankglin","ord03","Chicken_65, parrota, muttoun curry",'420');
  
  select*from HOME_DELIVERY;
  
# WILD CARD
  SELECT * FROM HOME_DELIVERY
     WHERE cust_first_name LIKE "_a%";
    
# STORED PROCEDURE     
    
DELIMITER //
create procedure InsertHOME_DELIVERY(
  in p_Address varchar(50),
  in p_Contact varchar(15),
  in p_cust_first_name varchar(40),
  in p_cust_last_name varchar(40),
  in p_Order_Id varchar(40),
  in p_order_items varchar(80),
  in p_price decimal(10,2)
)
begin

insert into HOME_DELIVERY(
  Address,Contact,cust_first_name,cust_last_name,Order_Id,order_items,price
  ) values(
  p_Address,p_Contact,p_cust_first_name,p_cust_last_name,p_Order_Id,p_order_items,p_price
);
end //
DELIMITER ;

call InsertHOME_DELIVERY("chennai Arumpakam 630541",98765448512,"mani","kandan","ord06","Mushroom Rice,pineapple juice,Chicken_65",'560');
call InsertHOME_DELIVERY("chennai medavakam 630560",98582448512,"mohamed","arsath","ord08","chicken Rice,apple juice,mutton crevy",'580');

select*from HOME_DELIVERY;

-- drop procedure if exists InsertHOME_DELIVERY;



-- UPDATE PROCEDURE

DELIMITER //
create procedure updateHOME_DELIVERY
(
  IN p_delivery_id INT,
  in p_Address varchar(50),
  in p_Contact varchar(15),
  in p_cust_first_name varchar(40),
  in p_cust_last_name varchar(40),
  in p_Order_Id varchar(40),
  in p_order_items varchar(80),
  in p_price decimal(10,2)
)
begin
  update home_delivery
  set address= p_address,
  contact = p_contact,
  cust_first_name =p_cust_first_name,
  cust_last_name = p_cust_last_name,
  order_id = p_Order_Id,
  order_items = p_order_items,
  price = p_price
 WHERE delivery_id = p_delivery_id;
 end//
 
 DELIMITER ;
 
 drop procedure if exists updateHOME_DELIVERY;

CALL updateHOME_DELIVERY('1',"chennai ennor 630560",98876248512,"mohamed","arsath","ord2","chicken Rice,apple juice,mutton crevy",'580');

  select*from HOME_DELIVERY;

-- Delete Procedure
DELIMITER //
CREATE PROCEDURE deleteHOME_DELIVERY(
    IN p_delivery_id INT
)
BEGIN
    DELETE FROM HOME_DELIVERY
    WHERE delivery_id = p_delivery_id;
END //
DELIMITER ;

CALL deleteHOME_DELIVERY('1');

select*from HOME_DELIVERY;


                
