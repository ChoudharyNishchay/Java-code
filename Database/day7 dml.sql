show tables;
select * from account;
select * from branch;
describe branch;
select * from customer;
select * from loan;
select * from tran_detail;

alter table branch 
    modify bid varchar(20);
 
	alter table account
    modify bid varchar(20);
    
    alter table loan
    modify bid varchar(20);
SET SQL_SAFE_UPDATES = 0;

set sql_safe_updates = off;
-- 1. Update all Branch_id where referred as BR in place of B
        -- eg: B00001 will become BR_00001
        
    desc branch;
    select * from branch;
    
    update branch
    set bid = replace(bid,'B','BR_');
    


-- *** 2. For testing purpose create a copy of tran_detail table and use bulk insert to load 50,000 records to it. 
-- Please make necessary arrangement to generate new TRAN_ID for each record
        
	CREATE TABLE tran_detail_clone LIKE tran_detail;
    select * from tran_detail_clone;
    
    
-- 3. Update Transaction type and medium of transaction values to upper case for all records of transaction table.

	select * from tran_detail;
    UPDATE tran_detail SET medium_of_transaction= UPPER(medium_of_transaction);
    UPDATE tran_detail SET transaction_type= UPPER(transaction_type);
    
    
    
-- 4. Update phone number and base location of customer Abhishek (C00009) to 8976523191 and Pune
	
    describe customer;
    
	UPDATE customer SET mobileno = "8976520000" where custid = "C00009";
    UPDATE customer SET city = "Pune" where custid = "C00009";
    


-- ***5. Add a new column customer_cnt to Branch table and update it's value based on count of customer that branch has.

	select * from branch;
    
    ALTER TABLE branch
ADD COLUMN customer_cnt INT;

UPDATE branch
SET customer_cnt =(SELECT count(*) FROM account WHERE branch.bid=account.bid);
        
        
-- 6. Create a new table account_bak and copy all records of account table to account_bak
    
    CREATE TABLE account_bak LIKE account;
    
    INSERT INTO account_bak
	SELECT * FROM account;
    
    select * from account_bak;
    
    
    
-- 7. Update the account status as Inavtive for account of customer 'Amit Kumar Borkar'
    
    select * from account;
    
    update account set astatus = "Inavtive"
    where custid =  (select custid from customer where fname = "Amit" and mname = "Kumar" and Itname = "Borkar");  
    
    
    
-- 8. Add a new transaction to account for all loan account customers as one time charge of 1000 Rs for current month.
    
	select * from loan;
	select * from tran_detail;
    select * from account;
    
    -- as instructed by lab sir 
    update loan set loan_amount = loan_amount + 1000;
	
    
    update tran_detail set transaction_amount = 1000, medium_of_transaction = "Automatic", transaction_type = "WITHDRAWAL", 
    dot = current_date();
    
  
    
-- 9. Add Index on tnumber column on copy of tran_detail table and observe execution plan of following queries
	
    select * from tran_detail;
    
    CREATE TABLE tran_detail_clone1 LIKE tran_detail;
    
	INSERT INTO tran_detail_clone1
	SELECT * FROM tran_detail;
    
	CREATE INDEX tnumber_index
	ON tran_detail_clone1 (tnumber);
    
-- select count(tnumber) from  tran_detail_copy;

	select count(tnumber) from  tran_detail_clone1;
	
-- select * from tran_details_copy 
-- where dot > '2021-02-01';

	select * from tran_detail_clone1 
	where dot > '2021-02-01';
	  
-- select * from tran_detail_copy
-- order by tnumber;

	select * from tran_detail_clone1
	order by tnumber;

    
   
    