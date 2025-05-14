CREATE DATABASE valli_Restaurant;
USE valli_Restaurant;

commit;
rollback;

-- USER LOING PAGE
create table USER(
	User_Id int NOT NULL AUTO_INCREMENT,
	Fname varchar(50) NOT NULL,
	Lname varchar(50) NOT NULL,
	Password varchar(50) NOT NULL,
	PRIMARY KEY (`User_Id`)
);

-- CREATE CUSTOMER DEDAILS
CREATE TABLE Customer_details(
 CUSTOMER_id int PRIMARY KEY AUTO_INCREMENT,
 Customer_name varchar(30) DEFAULT NULL,
 City varchar(20) DEFAULT NULL,
 Address varchar(50) DEFAULT NULL,
 Email_id varchar(30) unique);

-- CREATE BRANCH DEDAILS
CREATE TABLE Branch_Detail (
branch_id INT PRIMARY KEY AUTO_INCREMENT,
branch_name VARCHAR (100),
menu_items TEXT,
combo_price varchar(40));

-- VEG MENU
create table veg(
id int primary key auto_increment,
veg_name varchar(60) not null,
price varchar(50));
desc veg;

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

select*from veg;

-- JUICE MENU
create table juice(
id int primary key auto_increment,
juice_name varchar(60) not null,
price varchar(50));

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


-- MAIN MENU ITEMS
create table MENU(
 menu_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR (100),
 Pric varchar(30),
 Rate float DEFAULT NULL,
 Catagory varchar(40),
 veg_id int  null,
 foreign key(veg_id) references veg(id),
 juice_id int null,
 foreign key(juice_id) references juice(id));
desc Branch_Detail;

SHOW TABLES;

-- INSERT CUSTOMER DEDAILSE 
INSERT INTO Customer_details (Customer_name, City, Address, Email_id) VALUES
('PremKumar','chennai', '390001','maria@gmail.com'),
('Ashok','chennai', '380001',  'tina@gmail.com'),
('Ram','chennai', '380001',  'mena@gmail.com'),
('Gopal','karaikudi', '380009',  'riya@gmail.com'),
('Arsath','thiricy', '380008',  'raj@gmail.com'),
('Dhoni','chennai', '3800780',  'vijay@gmail.com');

-- INSERT BRANCH DEDAILS
INSERT INTO Branch_Detail (branch_name, menu_items,combo_price) VALUES
("kanyakumari", "Biryani, fish curry,muton chukka", 450),
("chennai", "Biryani, Pongal, Idly", 600),
("karaikudi", "Biryani, chettinad spcial,uppukari",650),
("Coimbatore", "Dragon_Chicken, keema_dosa, Prawn_65",500),
("Madurai", "Chicken_65, parrota, muttoun curry",400),
("Hyderbad", "Kal_dosa, Naan, Panner_gravy", 350),
("pondychery", "potato uthappam, mushroom dragon",450);

-- INSERT MENU ITEM DATA
INSERT INTO MENU (name,Pric,Rate,Catagory,veg_id,juice_id) VALUES
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
 
select*from USER;
select*from veg;
select*from juice;
select*from Customer_details;
select*from Branch_Detail;
select*from MENU;

select count(name) from MENU;

-- joins

select e.menu_id,e.name,e.Pric,e.Rate,e.Catagory,e.veg_id,c.id,c.veg_name,c.price
from MENU as e inner join veg as c on veg_id=c.id;

-- INNER JOINS
select e.menu_id,e.name,e.Pric,e.Rate,e.Catagory,
c.id,c.veg_name,c.price,
d.id,d.juice_name,d.price
from MENU as e 
inner join veg as c on veg_id=c.id
inner join juice as d on e.juice_id=d.id;


-- CREATE RESTAURANT OWENER
create table OWNER(
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(100) NOT NULL,
	Rest_Name varchar(100) NOT NULL,
	PRIMARY KEY (`Fname`,`Lname`,`Contact`));
    
-- INSERT RESTAURANT OWENET DEDAILS
insert into `OWNER`(`Fname`,`Lname`,`Contact`,`Rest_Name`)values
("sekar","muniyandi","894056438","valli_restaurant");
select*from OWNER;

-- ADD THE NEW ONE COLUMN IN COUSTOMER DEDAILS 
alter table Customer_details add mobile_number varchar(50) unique after Address;

-- MULTIPLE VALUESE UPDATE
update Customer_details set mobile_number =case
when CUSTOMER_id=1 then 8940058241
when CUSTOMER_id=2 then 9840058241
when CUSTOMER_id=3 then 9840058875
when CUSTOMER_id=4 then 9887654321
when CUSTOMER_id=5 then 9865743269
else 9865432768
end;

-- DROP THE ONE COLUMN IN COUSTOMER DEDAILS
alter table Customer_details drop column Address;

select*from Customer_details;

-- AGGREGATE FUNCTION  
select min(Pric) from MENU;
select max(Pric) from MENU;
select count(name) from MENU;

-- CREATE RESTAURANT MANAGER
create table MANAGER(
	Manager_Id int NOT NULL AUTO_INCREMENT,
	Fname varchar(15) NOT NULL,
	Lname varchar(15) NOT NULL,
	Contact varchar(20) NOT NULL,
 	Address varchar(30) DEFAULT NULL,
  	Salary varchar(30) DEFAULT NULL,
	Sex varchar(10) DEFAULT NULL,
	Bdate date DEFAULT NULL,
	Join_Date date NOT NULL,
	PRIMARY KEY (`Manager_Id`));
    
    insert into MANAGER(Fname,Lname,Contact,Address,Salary,Sex,Bdate,Join_Date)
values
("babu","shankar","9642540626","E-28 OBH , IIIT chennai","30000","Male","1992-09-29","2014-08-01"),
("saravana","kumar","9581871321","E-27 OBH , ILIT karaikudi","40000","Male","1993-11-18","2012-08-01");

select*from MANAGER;

-- CONCAT
select Manager_Id, concat(Fname, ' ',Lname)as Full_name ,Contact,Address,Salary,Sex,Bdate,Join_Date from MANAGER;

--  CREATE RESTAURANT EMPLOYEES
CREATE TABLE employee(
  Emp_Id int primary key auto_increment,
  Emp_name varchar(10) NOT NULL,
  Designation varchar(10) DEFAULT NULL,
  Address varchar(50) DEFAULT NULL,
  City varchar(10) DEFAULT NULL,
  State varchar(20) DEFAULT NULL,
  Pincode varchar(6) DEFAULT NULL,
  Contact_no varchar(13) DEFAULT NULL unique,
  Emp_salary float DEFAULT NULL,
  salary_increass varchar(40) null,
  hiring_date date DEFAULT NULL,
  check(Emp_salary >=0)
  );
  
  -- RESTAURANT EMPLOYEES DEDAILS
INSERT INTO employee (Emp_name,Designation,Address,City,State,Pincode,Contact_no,Emp_salary,salary_increass,hiring_date) VALUES
( 'Akshat', 'chef','ashram road', 'ahmedabad','gujrat', '380009', '9874561230', 15000, 1000,'2019-04-14'),
( 'Vishal', 'chef','sarma road', 'chennai','Tamilnadu', '630554', '9874561867', 16000, 1000,'2011-03-14'),
( 'Hardik', 'chef', 'gandhiroad', 'chennai','Tamilnadu', '630557', '8974561275', 12000, 1000,'2015-08-24'),
( 'Brijesh', 'cashier','cg road', 'karaikudi','Tamilnadu', '630544', '9774561230', 20000,1000, '2015-01-10'),
( 'Jugal', 'cashier', 'mg road', 'karur','Tamilnadu', 630558,'8974561230', 25000, 1000,'2019-09-14'),
( 'ram', 'cashier', 'kk road', 'thirupur','Tamilnadu', 630559,'8974561287', 25000, 1000,'2019-09-14'),
( 'praven', 'waiter', 'mn road', 'karur','Tamilnadu', 630558,'8974361230', 21000,1000, '2019-06-04'),
( 'kavin', 'waiter', 'hp road', 'vellor','Tamilnadu', 630564,'8974567894', 17000,1000, '2019-03-17'),
( 'keerthi','cleaner', 'ram road', 'karaikudi', 'Tamilnadu', 630765,'8940058765',1000, 11000, '2022-09-14'),
( 'harshitha', 'reception', 'jj road', 'Tirupati','anthra', 649876,'8974568796', 13000,1000, '2020-05-17');

select*from employee;

-- GROUP BY
select Designation, count(Designation)count from employee group by Designation
having count(Designation)>1;

-- TRIGGER FUNCTION
create trigger tr
before update on employee
for each row
set new.Emp_salary =(new.salary_increass + new.Emp_salary);

update employee set salary_increass= 2000 where Emp_Id=1;
select*from employee;

-- SUB QUERY
select Emp_name,Emp_salary,
(select min(Emp_salary) from employee) as min, (select max(Emp_salary) from employee) as max from employee;

--  STRING FUNCTION
select format(Emp_salary,0) as salay from employee;

-- VIEW FUNCTION ----------

 -- HOW MANY CHEF EMPLOYEE IN RESTAURANT
create view chef as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='chef';
 select*from chef;
 
 -- HOW MANY CASHIER EMPLOYEE IN RESTAURANT
create view cashier as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='cashier';
 select*from cashier;
 
 -- HOW MANY RECEPTION EMPLOYEE IN RESTAURANT
create view reception as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='reception';
 select*from reception;
 
 -- HOW MANY WAITER EMPLOYEE IN RESTAURANT
create view waiter as select
 Emp_name,Address,City,State,Pincode,Contact_no,Emp_salary,hiring_date from employee where Designation ='waiter';
 select*from waiter;
 
 -- CUSTOMER ORDER ITEMS
 CREATE TABLE order_items (
  Order_Id int primary key auto_increment,
  Food_name varchar(20) DEFAULT NULL,
  Quantity int(11) DEFAULT NULL);
  
  DROP table order_items;
  
insert into order_items (Food_name,Quantity) values
 ("Mushroom Rice",2),
 ("Chicken Fry Rice",2) ,
 ("potato uthappam",2),
 ("pineapple Rice",2);
select*from order_items;


--  BILL 
create table BILL(
	Order_Id varchar(55) NULL ,
	Customer_name varchar (20) NULL,
	Name varchar(100) NULL,
    Price varchar(20) NULL,
    Total_Amount double NULL	
);
  insert into BILL(Order_Id,Customer_name,Name,Price,Total_Amount)values
    ("Order01","PremKumar","Biryani",150,null),
	(null,null,"Dragon_Chicken",120,null),
	(null,null,"Kal_dosa",150,null);
    
    select*from BILL;
    -- SUM USED
    select sum(Price) as Total from BILL;


create table MENU_BILL(
	Order_Id int NOT NULL,
	Name varchar(100) NOT NULL,
	Price varchar(20) NOT NULL
	
);
 drop table MENU_BILL;

-- FOOD ONLINE ORDER
create table HOME_DELIVERY(
	Delivery_Id int NOT NULL AUTO_INCREMENT,
	Address varchar(50) NOT NULL,
	Contact varchar(20) NOT NULL unique,
    cust_name varchar(40),
	Order_Id varchar(40) NOT NULL,
	PRIMARY KEY(`Delivery_Id`));
    
 insert into HOME_DELIVERY (Address,Contact,cust_name,Order_Id) values
  ("kk nagar",9876543212,"prem","ord01"),
  ("rn nagar",8976543249,"javid","ord07"),
  ("ram nagar",9876543765,"babu","ord06"),
  ("mm nagar",9776543278,"frank","ord03");
  
  select*from HOME_DELIVERY;
  
  -- WILD CARD
  SELECT * FROM HOME_DELIVERY
     WHERE cust_name LIKE "_a%";
    
-- STORED PROCEDURE     
DELIMITER //
create procedure selectEmployeeById(
in p_id int
)
begin
 select* from Customer_details where CUSTOMER_id = p_id;   
 end //   
 DELIMITER //
 
 call selectEmployeeById(1);
    
	



