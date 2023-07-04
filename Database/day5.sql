CREATE DATABASE inventory;

USE inventory;

CREATE TABLE supplier
(
S_No     VARCHAR(5),
SNAME    VARCHAR(20),
STATUS   INT,
CITY     VARCHAR(15)
);

CREATE TABLE Parts
(
   P_No        INT,
   suppid      INT,
   partname    VARCHAR(10),
   partdesc    VARCHAR(8),
   partweight  INT,
   price       INT
);

CREATE TABLE SupplierPart
(
S_No      VARCHAR(5),
P_No      VARCHAR(5),
QUANTITY  INT
);



Use inventory;
show tables;
select * from parts;
select * from supplier;
select * from supplierpart;


Insert into SUPPLIER Values (2001,'peel',14,'London');
Insert into SUPPLIER Values (2002,'Serres',16,'San Jose');
Insert into SUPPLIER Values (2003,'Motika',22,'London');
Insert into SUPPLIER Values (2004,'Rifkin',21,'Barcelona');
Insert into SUPPLIER Values (2005,'Axelrod',10,'New York');
Insert into SUPPLIER Values (2006,'pierson',8,'Lisbon');
Insert into SUPPLIER Values (2007,'Smith',14,'Barcelona');
Insert into SUPPLIER Values (2008,'Aston',34,'San Jose');

SELECT * FROM supplier;

desc parts;

Insert into PARTS values(3001,2008,'Nut','Redcolor',18.69,1007);
Insert into PARTS values(3003,2001,'Bolt','2.5 inch',767.19,1001);
Insert into PARTS values(3002,2007,'Screw','1.5 inch',1900.10,1004);
Insert into PARTS values(3005,2003,'Cam','2mm',5160.45,1002);
Insert into PARTS values(3006,2008,'Cog','12mm',1098.16,1007);
Insert into PARTS values(3009,2002,'Spanner','point 7',1713.23,1003);
Insert into PARTS values(3007,2004,'Nut','1.5 inch',75.75,1002);
Insert into PARTS values(3008,2006,'Nut','1.8 inch',4723.00,1001);
Insert into PARTS values(3010,2004,'Screw','12 inch',1309.95,1002);

select * from parts;

insert into SUPPLIERPART Values (2001,3001,200);
insert into SUPPLIERPART Values (2001,3003,400);
insert into SUPPLIERPART Values (2002,3003,200);
insert into SUPPLIERPART Values (2002,3009,100);
insert into SUPPLIERPART Values (2003,3003,200);
insert into SUPPLIERPART Values (2003,3006,500);
insert into SUPPLIERPART Values (2004,3010,500);
insert into SUPPLIERPART Values (2005,3002,200);
insert into SUPPLIERPART Values (2005,3009,100);
insert into SUPPLIERPART Values (2005,3010,200);
insert into SUPPLIERPART Values (2005,3001,100);
insert into SUPPLIERPART Values (2005,3003,200);
insert into SUPPLIERPART Values (2005,3006,800);
insert into SUPPLIERPART Values (2005,3009,400);
insert into SUPPLIERPART Values (2005,3010,500);

select * from supplierpart;
set sql_safe_updates=0;

#1)Update the price of part Nut by 50$
update parts set price=price+50
where partname='Nut';
select *from parts;

#3)Supplier 2001 is leaving the business hence remove the supplier data from supplier table.

show variables like '%autocomit%';
select * from supplier;
delete from supplier where s_no=2001;
#4)Update Supplier Part Table and replace S_no 2001 with 2005

select * from supplierpart;
update supplierpart set s_no =2005 where s_no= 2001;

#5)Remove the part Screw which is 1.5 inch in length and also remove its data from Supplier part table.

select * from parts;

delete from supplierpart
where p_no in (select p_no from parts where partname = 'screw' and partdesc ='1.5 inch');

select *from supplierpart;

delete from parts
where partname ='screw' and partdesc ='1.5 inch';

select * from parts;