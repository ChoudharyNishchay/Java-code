-- 2) SUPPLY CHAIN
create database supplychain;
use supplychain;

create table customer (
	cid int primary key,
    name varchar(20),
    address varchar(50),
    contact varchar(20),
    credit_limit float
);

create table `order` (
	oid int primary key,
    customer_id int,-- fk
    reference varchar(50),
    purchase_date date
);
alter table `order`
add constraint fk_constraint foreign key (customer_id) references customer(cid);

create table manufacturer (
	mid int primary key,
    manufacturer_name varchar(20),
    address varchar(50),
    contact varchar(20)
);

create table product (
	pid int primary key,
    name varchar(20),
    color varchar(10),
    manufactured_date date,
    manufacturer_id int, -- fk
    foreign key (manufacturer_id) references manufacturer(mid)
);

create table `order-items` (
	oid int, -- fk
    product_id int, -- fk
    qty int,
    `warranty#` int,
    unit_price float,
    foreign key (oid) references `order`(oid),
    foreign key (product_id) references product(pid),
    primary key(oid,product_id)
);

-- 1. Create a copy of customer table and name it as customer_bak.
create table customer_bak like customer;

-- 2. Rename the customer_bak table to cust_copy
alter table customer_bak
rename to cust_copy;


-- 3. Add not null constraint to customer name column in customer table
alter table customer
modify column name varchar(20) not null;

-- 4. Add check constraint on credit_limit column on customer table 
   -- (credit_limit < 20000)
alter table customer
add constraint check (credit_limit < 20000);

-- 5. Change the datatype of Addess column in Customer table to "Text"
alter table customer
modify column address text;

-- 6. Drop foreign key constraint from Order table (pointing to customer table)
alter table `order`
drop constraint `fk_constraint`;

-- 7. Add foreign key constraint from Order to table to cust_copy table
alter table `order`
add constraint foreign key (customer_id) references cust_copy(cid);

-- 8. Change the name of "Color" column in product table to "Colour"
alter table product
rename column color to colour;

-- 9. Add a column parent_product_id to Product table
alter table product
add (parent_product_id int);

-- 10. Add foreign key constraint to parent_product_id column which refers to Product.PID column
alter table product
add constraint foreign key (parent_product_id) references product(pid);