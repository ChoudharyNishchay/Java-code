create database banking;
use banking;
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema banking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema banking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `banking` DEFAULT CHARACTER SET utf8 ;
USE `banking` ;

-- -----------------------------------------------------
-- Table `banking`.`account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banking`.`account` (
  `acnumber` VARCHAR(6) NULL,
  `custid` VARCHAR(6) NULL,
  `bid` VARCHAR(6) NULL,
  `opening_balance` INT NULL,
  `aod` DATE NULL,
  `atype` VARCHAR(10) NULL,
  `astatus` VARCHAR(10) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banking`.`branch`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banking`.`branch` (
  `bid` VARCHAR(6) NULL,
  `bname` VARCHAR(30) NULL,
  `bcity` VARCHAR(30) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banking`.`tran_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banking`.`tran_detail` (
  `tnumber` VARCHAR(6) NULL,
  `acnumber` VARCHAR(6) NULL,
  `dot` DATE NULL,
  `medium_of_transaction` VARCHAR(20) NULL,
  `transaction_type` VARCHAR(20) NULL,
  `transaction_amount` INT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banking`.`loan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banking`.`loan` (
  `custid` VARCHAR(6) NULL,
  `bid` VARCHAR(6) NULL,
  `loan_amount` INT NULL,
  `loan_type` VARCHAR(10) NULL,
  `loan_status` VARCHAR(20) NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `banking`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `banking`.`customer` (
  `custid` INT NULL,
  `fname` VARCHAR(30) NULL,
  `mname` VARCHAR(30) NULL,
  `Itname` VARCHAR(30) NULL,
  `city` VARCHAR(15) NULL,
  `mobileno` VARCHAR(10) NULL,
  `occupation` VARCHAR(10) NULL,
  `dob` DATE NULL)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

2. BankSchema_TestData.sql
Today
13:31

Gaurav Chaudhary moved an item to
Google Drive Folder
Assignment 1
SQL
2. BankSchema_TestData.sql
13:31

Gaurav Chaudhary uploaded an item
SQL
2. BankSchema_TestData.sql
INSERT INTO customer VALUES('C00001','Ramesh','Chandra','Sharma','Delhi','9543198345','Service','1976-12-06');
INSERT INTO customer VALUES('C00002','Avinash','Sunder','Minha','Delhi','9876532109','Service','1974-10-16');
INSERT INTO customer VALUES('C00003','Rahul',null,'Rastogi','Delhi','9765178901','Student','1981-09-26');
INSERT INTO customer VALUES('C00004','Parul',null,'Gandhi','Delhi','9876532109','Housewife','1976-11-03');
INSERT INTO customer VALUES('C00005','Naveen','Chandra','Aedekar','Mumbai','8976523190','Service','1976-09-19');
INSERT INTO customer VALUES('C00006','Chitresh',null,'Barwe','Mumbai','7651298321','Student','1992-11-06');
INSERT INTO customer VALUES('C00007','Amit','Kumar','Borkar','Mumbai','9875189761','Student','1981-09-06');
INSERT INTO customer VALUES('C00008','Nisha',null,'Damle','Mumbai','7954198761','Service','1975-12-03');
INSERT INTO customer VALUES('C00009','Abhishek',null,'Dutta','Kolkata','9856198761','Service','1973-05-22');
INSERT INTO customer  VALUES('C00010','Shankar',null,'Nair','Chennai','8765489076','Service','1976-07-12');

INSERT INTO branch VALUES('B00001','Asaf ali road','Delhi');
INSERT INTO branch VALUES('B00002','New delhi main branch','Delhi');
INSERT INTO branch VALUES('B00003','Delhi cantt','Delhi');
INSERT INTO branch VALUES('B00004','Jasola','Delhi');
INSERT INTO branch VALUES('B00005','Mahim','Mumbai');
INSERT INTO branch VALUES('B00006','Vile parle','Mumbai');
INSERT INTO branch VALUES('B00007','Mandvi','Mumbai');
INSERT INTO branch VALUES('B00008','Jadavpur','Kolkata');
INSERT INTO branch VALUES('B00009','Kodambakkam','Chennai');

INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00001','C00001','B00001',10000,'2012-12-15','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00002','C00002','B00001',12000,'2012-06-12','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00003','C00003','B00002',12500,'2012-05-17','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00004','C00002','B00005',11300,'2013-01-27','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00005','C00006','B00006',20000,'2012-12-17','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00006','C00007','B00007',12000,'2010-08-12','Saving','Suspended');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00007','C00007','B00001',15500,'2012-10-02','Saving','Active');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00008','C00001','B00003',11640,'2009-11-09','Saving','Terminated');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00009','C00003','B00007',11000,'2008-11-30','Saving','Terminated');
 
INSERT INTO account (acnumber,custid,bid,opening_balance,aod,atype,astatus)
 VALUES('A00010','C00004','B00002',11000,'2013-03-01','Saving','Active');

INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
VALUES('T00001','A00001','2013-01-01','Cheque','Deposit',2000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00002','A00001','2013-02-01','Cash','Withdrawal',1000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00003','A00002','2013-01-01','Cash','Deposit',2000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00004','A00002','2013-02-01','Cash','Deposit',3000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00005','A00007','2013-01-11','Cash','Deposit',7000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00006','A00007','2013-01-13','Cash','Deposit',9000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00007','A00001','2013-03-13','Cash','Deposit',4000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00008','A00001','2013-03-14','Cheque','Deposit',3000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00009','A00001','2013-03-21','Cash','Withdrawal',9000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00010','A00001','2013-03-22','Cash','Withdrawal',2000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00011','A00002','2013-03-25','Cash','Withdrawal',7000);
INSERT INTO tran_detail(tnumber, acnumber, dot, medium_of_transaction, transaction_type, transaction_amount)
 VALUES('T00012','A00007','2013-03-26','Cash','Withdrawal',2000);

INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00001','B00001',100000, 'PERSONAL','ACTIVE');
INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00002','B00002',200000, 'CAR', 'ACTIVE');
INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00009','B00008',400000, 'HOME', 'ACTIVE');
INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00010','B00009',500000, 'HOME', 'ACTIVE');
INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00001','B00003',600000, 'HOME', 'ACTIVE');
INSERT INTO loan(custid, bid, loan_amount, loan_type, loan_status) VALUES('C00002','B00001',600000, 'HOME', 'DUE');

show tables
show create table customer;

Introduce following constraint on tables in Bank schema.

Customer table
####-- 1. Customer id in customer table must be unique and does not allow null values
alter table customer
add (unique key(custid));

alter table customer
drop constraint `custid`;

show create table customer;
CREATE TABLE `customer` (
   `custid` varchar(6) DEFAULT NULL,
   `fname` varchar(30) DEFAULT NULL,
   `mname` varchar(30) DEFAULT NULL,
   `Itname` varchar(30) DEFAULT NULL,
   `city` varchar(15) DEFAULT NULL,
   `mobileno` varchar(10) DEFAULT NULL,
   `occupation` varchar(10) DEFAULT NULL,
   `dob` date DEFAULT NULL,
   UNIQUE KEY `Itname_UNIQUE` (`Itname`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3
 

###-- 2. Column fname must not allow space in it
alter table customer
add constraint check(fname not like '% %');


-- 3. First name, middle name and last name must not be same


alter table customer
add unique(fname,mname,itname);

-- 4. Age of customer (based on date of birth) must be more then 10 years old.
alter table customer
add constraint check((sysdate()-dob > 10));

select * from customer;

CREATE TABLE `customer` (
   `custid` varchar(6) NOT NULL,
   `fname` varchar(30) DEFAULT NULL,
   `mname` varchar(30) DEFAULT NULL,
   `ltname` varchar(30) DEFAULT NULL,
   `city` varchar(15) DEFAULT NULL,
   `mobileno` varchar(10) DEFAULT NULL,
   `occupation` varchar(10) DEFAULT NULL,
   `dob` date DEFAULT NULL,
   UNIQUE KEY `custid` (`custid`),
   UNIQUE KEY `fname` (`fname`,`mname`,`ltname`),
   CONSTRAINT `customer_chk_1` CHECK ((not((`fname` like _utf8mb3'% %')))),
   CONSTRAINT `customer_chk_2` CHECK ((`dob` <= _utf8mb4'2011-03-24'))
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
 
 
#Branch Table
show create table branch;


CREATE TABLE `branch` (
   `bid` varchar(6) NOT NULL,
   `bname` varchar(30) NOT NULL,
   `bcity` varchar(30) DEFAULT NULL,
   UNIQUE KEY `bid` (`bid`),
   UNIQUE KEY `bid_2` (`bid`),
   UNIQUE KEY `bid_3` (`bid`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3


-- 1. Branch name must not be null
alter table branch
modify bname varchar(30) not null;

-- 2. Branch id must be unique and not null

alter table branch
add (unique key(bid));
SHOW CREATE TABLE BRANCH;


 
###--Account Table 
show create table `account`;
select * from account;
-- 1. Account number for each record must be unique
alter table `account`
add (unique key(acnumber));

-- 2. Customer Id must be of valid customer and must not be left as blank
alter table `account`
modify custid varchar(6) not null;

-- 3. opening balance must be more then 10000
alter table `account`
modify opening_balance int not null;
alter table `account`
add constraint check(`opening_balance` >= '10000');

-- 4. Acount opening date must not be of past dates
alter table `account`
add constraint check(aod >= '2008-11-29');

-- 5. Branch id (bid) must be of valid branch 
alter table `account`
modify bid varchar(6) not null;

CREATE TABLE `account` (
   `acnumber` varchar(6) NOT NULL,
   `custid` varchar(6) NOT NULL,
   `bid` varchar(6) NOT NULL,
   `opening_balance` int NOT NULL,
   `aod` date DEFAULT NULL,
   `atype` varchar(10) DEFAULT NULL,
   `astatus` varchar(10) DEFAULT NULL,
   PRIMARY KEY (`acnumber`),
   UNIQUE KEY `acnumber` (`acnumber`),
   CONSTRAINT `account_chk_1` CHECK ((`opening_balance` >= _utf8mb4'10000')),
   CONSTRAINT `account_chk_2` CHECK ((`aod` >= _utf8mb4'2008-11-29'))
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

##Tran_detail Table
show create table tran_detail;
select * from tran_detail;
-- 1. Transaction number must be unique for each transaction
alter table tran_detail
add (unique key(tnumber));
-- 2. Account number must refer to valid account
alter table `account`
add (primary key(`acnumber`));
alter table tran_detail
add (foreign key(acnumber) references `account`(acnumber))

CREATE TABLE `tran_detail` (
   `tnumber` varchar(6) DEFAULT NULL,
   `acnumber` varchar(6) DEFAULT NULL,
   `dot` date DEFAULT NULL,
   `medium_of_transaction` varchar(20) DEFAULT NULL,
   `transaction_type` varchar(20) DEFAULT NULL,
   `transaction_amount` int DEFAULT NULL,
   UNIQUE KEY `tnumber` (`tnumber`),
   KEY `acnumber` (`acnumber`),
   CONSTRAINT `tran_detail_ibfk_1` FOREIGN KEY (`acnumber`) REFERENCES `account` (`acnumber`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3

 
###Loan Table
show create table loan;
desc loan
-- 1. Customer Id must be of valid customer and must not be left as blank
alter table loan
modify custid varchar(6) not null;
-- 2. Branch id (bid) must be of valid branch 
alter table branch
modify bid varchar(6) not null;
-- 3. One customer can take only one loan for each loan type
alter table loan
add unique(custid,loan_type);


 CREATE TABLE `loan` (
   `custid` varchar(6) NOT NULL,
   `bid` varchar(6) DEFAULT NULL,
   `loan_amount` int DEFAULT NULL,
   `loan_type` varchar(10) DEFAULT NULL,
   `loan_status` varchar(20) DEFAULT NULL,
   UNIQUE KEY `custid` (`custid`,`loan_type`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3