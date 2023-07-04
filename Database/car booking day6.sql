-- 1) CAR BOOKING
create database carbooking;
use carbooking;
create table manf (
	manf_code int primary key, -- pk
    manf_name varchar(100) not null,
    manf_detail varchar(200)
);

create table model (
	model_code varchar(10) primary key, -- pk
    daily_hire_rate int not null,
    model_name varchar(10) not null,
    manf_code int, -- fk
    foreign key (manf_code) references manf(manf_code)
);

create table vech_categ (
	vc_code int primary key, -- pk
    vc_desc varchar(200) not null
);

create table vehicle (
	reg_numer varchar(10) primary key, -- pk
    mileage int,
	daily_hire_date int,
    date_mot_due int,
    engine_size int,
    vc_code int, -- fk
    model_code varchar(10), -- fk
    foreign key (vc_code) references vech_categ(vc_code),
    foreign key (model_code) references model(model_code)
);

create table customer (
	cust_id int primary key, -- pk
    cust_name varchar(20) not null,
    cust_detail varchar(200),
    gender char(1),
    email varchar(50),
    phone varchar(20) not null,
    addr_line1 varchar(50),
    addr_line2 varchar(50),
    addr_line3 varchar(50),
    town varchar(50),
    county varchar(50),
    country varchar(50)
);

create table booking_status (
	book_status_code varchar(10) primary key,
    book_status_desc varchar(100)
);

create table booking (
	booking_id int primary key,
    date_from date not null,
    date_to date not null,
    confir_stat char(1),
    pay_stat char(2),
    cust_id int, -- fk
    book_status_code varchar(10), -- fk
    reg_numer varchar(10), -- fk
    foreign key (cust_id) references customer(cust_id),
    foreign key (book_status_code) references booking_status(book_status_code),
    foreign key (reg_numer) references vehicle(reg_numer)    
);