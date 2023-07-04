show databases;
create database EMP;
use emp;

CREATE TABLE EMP
       (EMPNO INT UNSIGNED NOT NULL,
        ENAME VARCHAR(10),
        JOB VARCHAR(9),
        MGR INT UNSIGNED,
        HIREDATE DATE,
        SAL FLOAT,
        COMM FLOAT,
        DEPTNO INT UNSIGNED);

INSERT INTO EMP VALUES
        (7369, 'SMITH',  'CLERK',     7902,
        STR_TO_DATE('17-DEC-1980', '%d-%b-%Y'),  800, NULL, 20);
INSERT INTO EMP VALUES
        (7499, 'ALLEN',  'SALESMAN',  7698,
        STR_TO_DATE('20-FEB-1981', '%d-%b-%Y'), 1600,  300, 30);
INSERT INTO EMP VALUES
        (7521, 'WARD',   'SALESMAN',  7698,
        STR_TO_DATE('22-FEB-1981', '%d-%b-%Y'), 1250,  500, 30);
INSERT INTO EMP VALUES
        (7566, 'JONES',  'MANAGER',   7839,
        STR_TO_DATE('2-APR-1981', '%d-%b-%Y'),  2975, NULL, 20);
INSERT INTO EMP VALUES
        (7654, 'MARTIN', 'SALESMAN',  7698,
        STR_TO_DATE('28-SEP-1981', '%d-%b-%Y'), 1250, 1400, 30);
INSERT INTO EMP VALUES
        (7698, 'BLAKE',  'MANAGER',   7839,
        STR_TO_DATE('1-MAY-1981', '%d-%b-%Y'),  2850, NULL, 30);
INSERT INTO EMP VALUES
        (7782, 'CLARK',  'MANAGER',   7839,
        STR_TO_DATE('9-JUN-1981', '%d-%b-%Y'),  2450, NULL, 10);
INSERT INTO EMP VALUES
        (7788, 'SCOTT',  'ANALYST',   7566,
        STR_TO_DATE('09-DEC-1982', '%d-%b-%Y'), 3000, NULL, 20);
INSERT INTO EMP VALUES
        (7839, 'KING',   'PRESIDENT', NULL,
        STR_TO_DATE('17-NOV-1981', '%d-%b-%Y'), 5000, NULL, 10);
INSERT INTO EMP VALUES
        (7844, 'TURNER', 'SALESMAN',  7698,
        STR_TO_DATE('8-SEP-1981', '%d-%b-%Y'),  1500,    0, 30);
INSERT INTO EMP VALUES
        (7876, 'ADAMS',  'CLERK',     7788,
        STR_TO_DATE('12-JAN-1983', '%d-%b-%Y'), 1100, NULL, 20);
INSERT INTO EMP VALUES
        (7900, 'JAMES',  'CLERK',     7698,
        STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'),   950, NULL, 30);
INSERT INTO EMP VALUES
        (7902, 'FORD',   'ANALYST',   7566,
        STR_TO_DATE('3-DEC-1981', '%d-%b-%Y'),  3000, NULL, 20);
INSERT INTO EMP VALUES
        (7934, 'MILLER', 'CLERK',     7782,
        STR_TO_DATE('23-JAN-1982', '%d-%b-%Y'), 1300, NULL, 10);

CREATE TABLE DEPT
       (DEPTNO INT UNSIGNED,
        DNAME VARCHAR(14),
        LOC VARCHAR(13));

INSERT INTO DEPT VALUES (10, 'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT VALUES (20, 'RESEARCH',   'DALLAS');
INSERT INTO DEPT VALUES (30, 'SALES',      'CHICAGO');
INSERT INTO DEPT VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS
        (ENAME VARCHAR(10),
         JOB   VARCHAR(9),
         SAL   INT UNSIGNED,
         COMM  INT UNSIGNED);

CREATE TABLE SALGRADE
        (GRADE INT,
         LOSAL INT,
         HISAL INT);

INSERT INTO SALGRADE VALUES (1,  700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

CREATE TABLE DUMMY
        (DUMMY INT);

INSERT INTO DUMMY VALUES (0);
show databases;
use  EMP;
show tables;
select * from EMP;
select EMPNO,ENAME from EMP;
SELECT sal,sal*12 from EMP;
select empno , ename from emp;
desc emp;
desc dept;
desc salgrade;
select distinct job from emp;
select concat(Ename,'is earining'sal)
as details from emp;
select ename as "Name" ,
job as "Desiganation" from emp;
select ename ,
sal+ifnull(comm ,1500) + 1000
as Annual_Sal from EMP;
Select distinct ifnull(mgr,'NA')
as 'Manager Number'
from emp;
select ename as Name , sal as Salary ,
ifnull(comm,1500) as 'commission'
from emp;

---------------------------------------------------------
Assign_Day2_SELECT.txt
Today
09:33

Gaurav Chaudhary uploaded an item
Text
Assign_Day2_SELECT.txt
Assumption : We have created Scott schema (database) in MySQL and created following tables using attached script
EMP
DEPT
SALGRADE
BONUS

Questions on SELECT Clause
----------------------------------------
1. Display all the records in emp table
select * from emp;
2. Display first two column from emp table
select empno , ename from emp;
3. Display the structure of emp, dept and salgrade table
desc emp;
desc dept;
desc salgrade;
4. Display unique jobs from employee table
select distinct job from emp;
5. Display the output as follows 
          SCOTT is earning 800 dollars
          ...
select concat(ename,'is earning ',sal, 'dollars ') from emp;
SELECT CONCAT(ENAME,'IS EARNING ',SAL)
AS "DETAILS" FROM EMP;
6. Display the output from employee table in following format

 Employee Name  Designation 
-----------------------   ---------------------
 SMITH                 CLERK
 ALLEN                 SALESMAN
...
select ename as "Name" ,
job as "Designation" from emp;

7. Display the name of employee and annual salary of each employee. Annual sal must be calculated by considering sal, comm and bonus of 1000$ for each employee
select ename ,
sal+ifnull(comm ,1500) + 1000
as Annual_Sal from emp;
8. Display the list of manager's employee number in following format. Ensure that same manager number must not be repeated. Also ensure that NULL must not be displayed in the result (display NA in place of null)

Manager Number
------------------------
7902
7698
7839
7566

select distinct ifnull(mgr,'NA')
AS ' Manager Number'
from emp;

9. Display the employee name, salary and commission and ensure that we consider the commission as 1500 for employees where commission is not paid.

select ename as Name , sal as Salary ,
ifnull(comm,1500) as 'commission'
from emp;