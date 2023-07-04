create database library
use library;

Book Publisher Test Data.sql
INSERT INTO PUBLISHER VALUES (1, 'MCGRAW-HILL', 9989076587, 'BANGALORE');
INSERT INTO PUBLISHER VALUES (2, 'PEARSON', 9889076565, 'NEWDELHI');
INSERT INTO PUBLISHER VALUES (3, 'RANDOM HOUSE', 7455679345, 'HYDRABAD');
INSERT INTO PUBLISHER VALUES (4, 'HACHETTE LIVRE', 8970862340, 'CHENAI');
INSERT INTO PUBLISHER VALUES(5, 'GRUPO PLANETA',7756120238,'BANGALORE');

INSERT INTO BOOK VALUES (1,'DBMS','JAN-2017', 1);
INSERT INTO BOOK VALUES (2,'ADBMS','JUN-2016', 1);
INSERT INTO BOOK VALUES (3,'CN','SEP-2016', 2);
INSERT INTO BOOK VALUES (4,'CG','SEP-2015', 5);
INSERT INTO BOOK VALUES (5,'OS','MAY-2016', 2); 

INSERT INTO BOOK_AUTHORS VALUES (1, 1);
INSERT INTO BOOK_AUTHORS VALUES (1, 2);
INSERT INTO BOOK_AUTHORS VALUES (2, 3);
INSERT INTO BOOK_AUTHORS VALUES (3, 4);
INSERT INTO BOOK_AUTHORS VALUES (4, 5);

INSERT INTO AUTHOR VALUES (1, 'NAVATHE', NULL);
INSERT INTO AUTHOR VALUES (2, 'TANENBAUM', NULL);
INSERT INTO AUTHOR VALUES (3, 'EDWARD ANGEL', NULL);
INSERT INTO AUTHOR VALUES (4, 'GALVIN', NULL);

INSERT INTO LIBRARY_BRANCH VALUES (10,'RR NAGAR','BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (11,'RNSIT','BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (12,'RAJAJI NAGAR', 'BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (13,'NITTE','MANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (14,'MANIPAL','UDUPI');

INSERT INTO BOOK_COPIES VALUES (10, 1, 10);
INSERT INTO BOOK_COPIES VALUES (5, 1,11);
INSERT INTO BOOK_COPIES VALUES (2, 2,12);
INSERT INTO BOOK_COPIES VALUES (5, 2,13);
INSERT INTO BOOK_COPIES VALUES (7, 3,14);
INSERT INTO BOOK_COPIES VALUES (1, 5,10);
INSERT INTO BOOK_COPIES VALUES (3, 4,11);

INSERT INTO CARD VALUES (100);
INSERT INTO CARD VALUES (101);
INSERT INTO CARD VALUES (102);
INSERT INTO CARD VALUES (103);
INSERT INTO CARD VALUES (104);




Gaurav Chaudhary uploaded an item
SQL
Book_Publisher.sql
-- Consider following schema for library database
-- --------------------------------------------------

-- BOOK (Book_id, Title, Publisher_Name, Pub_Year)
-- BOOK_AUTHORS (Book_id, Author_Name)
-- PUBLISHER (Name, Address, Phone) BOOK_COPIES
-- (Book_id, Branch_id, No-of_Copies)
-- BOOK_LENDING (Book_id, Branch_id, Card_No, Date_Out, Due_Date)
-- LIBRARY_BRANCH (Branch_id, Branch_Name, Address)

CREATE TABLE PUBLISHER
(PUB_ID INT UNSIGNED  PRIMARY KEY,
 NAME VARCHAR(20),
 PHONE BIGINT UNSIGNED,
 ADDRESS VARCHAR(20));

CREATE TABLE BOOK
(BOOK_ID INT UNSIGNED PRIMARY KEY,
 TITLE VARCHAR(20),
 PUB_YEAR VARCHAR(20),
 PUB_ID INT UNSIGNED REFERENCES PUBLISHER (ID) ON DELETE CASCADE);
 
CREATE TABLE BOOK_AUTHORS
(AUTH_ID  INT UNSIGNED,
 BOOK_ID INT UNSIGNED REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
 PRIMARY KEY (BOOK_ID, AUTH_ID));
 
CREATE TABLE AUTHOR
( auth_id INT UNSIGNED PRIMARY KEY,
  author_name VARCHAR(20),
  author_description VARCHAR(2000)
);

CREATE TABLE LIBRARY_BRANCH
(BRANCH_ID INT UNSIGNED PRIMARY KEY,
 BRANCH_NAME VARCHAR(50),
 ADDRESS VARCHAR(50));

CREATE TABLE BOOK_COPIES
 (NO_OF_COPIES INT UNSIGNED,
  BOOK_ID INT UNSIGNED REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
  BRANCH_ID INT UNSIGNED REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE,
  PRIMARY KEY (BOOK_ID, BRANCH_ID));

CREATE TABLE CARD
(CARD_NO INT UNSIGNED PRIMARY KEY
 -- As of now single column only. In future we may extend with card owner details
);

CREATE TABLE BOOK_LENDING
(
  DATE_OUT DATE,
  DUE_DATE DATE,
  BOOK_ID INT UNSIGNED REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
  BRANCH_ID INT UNSIGNED REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON DELETE CASCADE,
  CARD_NO  INT UNSIGNED REFERENCES CARD (CARD_NO) ON DELETE CASCADE,
  PRIMARY KEY (BOOK_ID, BRANCH_ID, CARD_NO));


show tables;
use library


Library_Practice_Questions.txt
-- 1. Retrieve details of all books in the library – id, title, name of publisher, authors, number of copies in each branch,etc.

SELECT B.BOOK_ID, B.TITLE,  A.AUTHOR_NAME, C.NO_OF_COPIES, L.BRANCH_ID , P.NAME
	FROM BOOK B JOIN BOOK_COPIES C USING (BOOK_ID)
	JOIN BOOK_AUTHORS USING (BOOK_ID)
	JOIN AUTHOR A USING (AUTH_ID) 
	JOIN LIBRARY_BRANCH L USING (BRANCH_ID)
	JOIN PUBLISHER P USING (PUB_ID);


2. Get the particulars of borrowers who have borrowed more than 3 books, but from Jan 2017 to Jun 2017

INSERT INTO BOOK_LENDING(DATE_OUT,DUE_DATE,BOOK_ID,BRANCH_ID,CARD_NO)
VALUES ('2017-04-08' , '2017-05-08' ,5,13,102),
       ('2017-01-08' , '2017-02-08' ,2,11,102),
       ('2017-01-08' , '2017-02-08' ,3,12,102),
       ('2017-10-23' , '2017-11-23' ,3,11,100),
       ('2017-11-09' , '2017-12-09' ,4,12,103),
       ('2018-03-08' , '2018-04-08' ,2,12,102);

SELECT* FROM BOOK_LENDING;
select CARD_NO
from BOOK_LENDING
where DATE_OUT between '2017-01-01' and '2017-06-30'
group by CARD_NO
having count(*) >=3;


-- 3. Find name of publishers who are from same place (addresS)

select `name`, address
from publisher
where address = any(select address
from publisher
group by address
having  (count(address) > 1));

4. Find name of authors whose books has been published by same publishers.

select a.author_name
from book b inner join book_authors ba  on ba.book_id = b.book_id
inner join author a on a.auth_id = ba.auth_id
inner join (select pub_id, count(distinct a1.auth_id) t from book b1
inner join book_authors ba1 on ba1.book_id = b1.book_id
inner join author a1 on a1.auth_id = ba1.auth_id
group by b1.pub_id) j
on j.pub_id = b.pub_id and j.t > 1;



5. Find the year in which maximum number of books has been published
select substr(PUB_YEAR,5,4), count( substr(PUB_YEAR,5,4))
from book
group by substr(PUB_YEAR,5,4)
order by  count(substr(PUB_YEAR,5,4)) desc
limit 1;


6. Find cities with maximum number of library
select address, count(address)
from library_branch
group by address
order by  count(address) desc
limit 1;


7. Find the name of book and branch name where there maximum copies are maintained
select title, BRANCH_NAME, NO_OF_COPIES
from LIBRARY_BRANCH join BOOK_COPIES on LIBRARY_BRANCH.BRANCH_ID = BOOK_COPIES.BRANCH_ID
join book on BOOK_COPIES.BOOK_ID = book.BOOK_ID
order by NO_OF_COPIES desc
limit 1;



8. Find the authors and there books which has been lended till now.
select author_name, TITLE 
from AUTHOR join BOOK_AUTHORS on AUTHOR.auth_id = BOOK_AUTHORS.auth_id
join book on BOOK_AUTHORS.BOOK_ID = book.BOOK_ID
join BOOK_LENDING on book.BOOK_ID = BOOK_LENDING.BOOK_ID
group by TITLE;


9. Display the library name, author name, book name, publisher name, book quantity under all libraries
select BRANCH_NAME, author_name, TITLE, NAME, NO_OF_COPIES
from LIBRARY_BRANCH join BOOK_COPIES  on LIBRARY_BRANCH.BRANCH_ID = BOOK_COPIES.BRANCH_ID
join book on BOOK_COPIES.BOOK_ID = book.BOOK_ID
join BOOK_AUTHORS on BOOK_AUTHORS.BOOK_ID = book.BOOK_ID
join AUTHOR on BOOK_AUTHORS.AUTH_ID = AUTHOR.AUTH_ID
join publisher on book.PUB_ID = publisher.PUB_ID;


10. Find out the library card for which no book has been issued.
select CARD.CARD_NO, count(BOOK_LENDING.CARD_NO)
from CARD left join BOOK_LENDING on CARD.CARD_NO = BOOK_LENDING.CARD_NO
group by CARD.CARD_NO;
