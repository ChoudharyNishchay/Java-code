#---------------creating table

create table students
(
name varchar(55),
age int
);
show tables;
desc booking

show columns from students;
drop table students;
create table students (
id int,
name varchar(55),
class int
);
desc students;
insert into students
(id,name,class)
values(1,'nish',5);
insert into students
values(2,'singh',6);
select * from students;
insert into students (id,name,class)
values ('timepass','tp',5);


--###null:--notnull------
desc students;
insert into students (id,name) 
values(4,'kuch bhi');
select *from students;

create table nishnull
(
id int not null,
name varchar(55) not null
);
select *from nishnull;


##---default--------
create table nish2
(id int not null default 0,
name varchar(55) not null default 'unnamed'
);
desc nish2;
insert into nish2 () values();
select * from nish2;

------- #alter table(and column drop then using next condition )
 #1
 alter table nish2 add class int;
 desc nish2;
 #2
 alter table nish2
 drop column class;
 desc nish2;
 
 --------------#primary key 
# (uniquely identifies each record in a table)
#(pk must contain unique values and cannot be contain null values.)

create table nish_unique
( stud_id int not null,
name varchar (55),
age int,
primary key (stud_id));

desc nish_unique;
insert into nish_unique
(stud_id,name,age)
values(1,'vinod',23);
 insert into nish_unique (stud_id,name,age)
 values (2,'nishchay',22);
 select * from nish_unique;
 
  insert into nish_unique (stud_id,name,age)
 values (3,'nishchay',50);
 
 
 
#auto increment in table----------------
#---(auto increment allows a unique number to be generated automatically when a new record insert into a table.)

create table nish_auto
( stud_id int not null auto_increment,
name varchar (55),
age int,
primary key (stud_id));

desc nish_auto;
insert into nish_auto (name,age) values ('nish',22);
insert into nish_auto (name,age) values ('choudhary',22);
select * from nish_auto;

show databases
USE NISH1
DESC NISH_AUTO
INSERT INTO NISH_AUTO(NAME,AGE) VALUES ('VISHAL',21);
INSERT INTO NISH_AUTO(NAME,AGE) VALUES ('VINAY',24);
INSERT INTO NISH_AUTO(NAME,AGE) VALUES ('VICKY',27);
INSERT INTO NISH_AUTO(NAME,AGE) VALUES ('SAGAR',26);
 SELECT * FROM NISH_AUTO
 
 WHERE(USE FILTER RECORD)
 SELECT *FROM NISH_AUTO WHERE AGE =22;
 UPDATE NISH_AUTO SET AGE =28 WHERE ID 2;
 SELECT NAME FROM NISH_AUTO WHERE AGE=26;
 UPDATE NISH_AUTO SET AGE= 27 WHERE NAME ='SAGAR';
 
 DELETE FROM NISH_AUTO WHERE NAME = 'VICKY';
  SELECT * FROM  NISH_AUTO;
  DELETE FROM NISH_AUTO;
  
  ##------ DISTINCT (IS USED TO RETURN ONLY DISTINCT OR DIFFERENT VALUES.)
  (DISTINCT USED INLY ONE FIELDAND UNIQUE)
  SELECT DISTINCT NAME FROM NISH_AUTO;
  SELECT AGE,NAME FROM NISH_AUTO;
  
  ##--ORDER BY(RESULT SET IN ASCENDING OR DESCENDING ORDER)
  
  SELECT AGE FROM NISH_AUTO ORDER BY AGE ;
  SELECT DISTINCT AGE FROM NISH_AUTO ORDER BY AGE;
    SELECT DISTINCT NAME FROM NISH_AUTO ORDER BY NAME;

    SELECT DISTINCT NAME FROM NISH_AUTO ORDER BY NAME LIMIT 3;
    
    ##-- LIKE OPERATOR (WHERE CLUSE TO SERCH FOR A SPECIFIED PATTERN IN A COLUMN)
    
    select NAME FROM NISH_AUTO WHERE NAME LIKE '%OU%' ;
	
    ###-- AGGREGATE FUNCTIONS
    # COUNT() FUNCTION RETURNS THE NUMBER OF ROWS THAT MATCHES A SPECIFIED CRITERIA .
    #AVG() FUNCTION RETURNS THE AVG VALUES OS NUMERIC COLUMN
    #SUM() FUNCTION RETURNS THE TOTAL SUM OF A NUMERIC COLUMN.alter
    
    SELECT MAX(AGE)  FROM NISH_AUTO;
    SELECT MIN(AGE) FROM NISH_AUTO;
    SELECT SUM(AGE) FROM NISH_AUTO;
    SELECT COUNT(STUD_ID) FROM NISH_AUTO
    SELECT AVG(AGE) FROM NISH_AUTO;
    
    ##---LOGICAL OPERATORS NOT EQUAL TO(!)
    SELECT * FROM NISH_AUTO WHERE AGE !=22;
    ####------------<,>,<=,>=
    SELECT *FROM NISH_AUTO WHERE AGE BETWEEN 21 AND 27;
    
    SELECT * FROM NISH_AUTO WHERE NAME = 'NISH' OR NAME='CHOUDHARY';
      SELECT * FROM NISH_AUTO WHERE NAME IN ('NISH','VISHAL');
      
      ##CONCAT
     ###-- (ADDS TWO OR MORE EXPRESSION TOGETHER )
      
      SELECT CONCAT('NISH',' ','CHOUDHARY');
            SELECT CONCAT('NISH',' ','CHOUDHARY') AS FULLNAME;
                  SELECT CONCAT(NAME,' ',AGE)FROM NISH_AUTO AS FULLNAME
                  
        ## REVERSE
        SELECT REVERSE('NISH')AS REVERSE;
        
        ## DATE (YYYY-MM-DD)
        
        CREATE  TABLE DATESTU(
        NAME VARCHAR(55),
        DOB DATE,DOT TIME,DT DATETIME);
         INSERT INTO DATESTU VALUES ('NISH','1999-06-26','12:05:05','1999-06-26,12:05:05');
INSERT INTO DATESTU VALUES ('CHOUDHARY',curdate(),curtime(),now());
SELECT * FROM DATESTU;


## FOREIGN KEY
(USED TO LINK TWO TABLES TOGETHER.)
DESC CUSTOMERS;
desc orders;

CREATE TABLE ORDERS(oid  int not null auto_increment primary key,
ORDERDATE DATE,cid int,foreign key(cid) references customers(cid)); 
desc orders;

insert into customers (cid,cname,email) 
values(1,'nish','cnishchay1234@gmail.com'),
(2,'ni','i@gmail.com'),
(3,'ch','h@gmail.com');
alter table orders add amount int;
desc orders;
insert into orders (oid,orderdate,amount,cid)
values(1,'2019/05/02', 55,1),(2,'2019/05/06',45,2),(3,'2019/06/07',65,3);
insert into customers (cid,cname,email)
values(5,'ram','ram@gmail,com');

select *from orders;
###JOINS-------------------------------
select *from customers,orders where 
customers.cid= orders.cid;

 
 select cname,orderdate,amount from customers
 join orders
 on customers.cid=orders.cid;
  select *from customers
 join orders
 on customers .cid=orders.cid;
 
 SELECT CNAME,ORDERDATE,AMOUNT 