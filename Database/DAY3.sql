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
-----------------------------------------------------
#Order By
-------------------------------------------------------------------------------------------------
1) Display emp table with salary descending order?
SELECT *
 FROM EMP
 order by sal DESC;
-----------------------------------------------------------------------------------------------
2) Display all the records in emp table order by ascending deptno, descending salary?
SELECT *
 FROM EMP
 ORDER BY DEPTNO,SAL DESC;
-----------------------------------------------------------------------------------------------
3) Display all employees in same order as they joined the company
SELECT * 
FROM EMP
 ORDER BY HIREDATE;
 ----------------------------------------------------------------------------------------------
4) Display who is making highest commission?
SELECT ENAME  , MAX(COMM) FROM EMP
----------------------------------------------------------------------------------------------
Miscellaneous
-----------------------------------------------------------------------------------------------
1) Display all employees those who were joined in third quarter of 1981?

SELECT *
 FROM EMP 
 WHERE HIREDATE LIKE '1981';
------------------------------------------------------------------------------------------
2) Display distinct job from emp table?

SELECT DISTINCT JOB FROM EMP;
-------------------------------------------------------------------------------------------
3) Display all the records in emp table where employee hired after 28-SEP-81 and before 03-DEC-81?

SELECT * 
FROM EMP 
WHERE HIREDATE>'1981-07-28' AND HIREDATE< '1981-12-03';
-------------------------------------------------------------------------------------------
4) Write a query that displays the employees whose names has letter 'T'

SELECT *
FROM EMP
 WHERE ENAME LIKE '%T%' ;
-------------------------------------------------------------------------------------------
5) Display the empno, ename, sal, and salary increased by 15%.

SELECT EMPNO,ENAME,SAL,SAL+(SAL*15)/100 AS SALARY FROM EMP
SELECT EMPNO,ENAME,SAL,SAL*1.15 FROM EMP
-----------------------------------------------------------------------------------------
6) Display all employees where ename start with J and ends with S

SELECT ENAME
 FROM EMP 
 WHERE ENAME LIKE  ('J%S')
----------------------------------------------------------------------------------------
7) Display all employees where jobs does not belong to PRESIDENT and MANAGer
SELECT *
 FROM EMP
 WHERE JOB !='PRESEDENT' AND JOB !='Manager' ;
---------------------------------------------------------------------------------------
8) Display all three figures salary in emp table
SELECT ENAME,SAL
FROM EMP
WHERE SAL BETWEEN 100 AND 999;
---------------------------------------------------------------------------------------
9) Display all ename where first character could be anything, but second character should be L?
select ename 
from emp
where ename LIKE '_L%' ;
------------------------------------------------------------------------------
GROUP BY AND GROUP FUNCTIONS
------------------------------------------------------------------------------
1) Display the maximum salary in the emp table
SELECT MAX(SAL)
 from emp;
---------------------------------------------------------------------------------------
2) Display average salary for job SALESMAN
select avg(sal)
from emp
 where job = 'salesman' ;
----------------------------------------------------------------------------------
3) Display sum of salary for each department
select  job,sum(sal)
from emp
group by job;
--------------------------------------------------------------------------------
4) Display all department with Minimum salary and maximum salary?
select job ,max(sal),min(sal)
 from emp 
 group by job;
-------------------------------------------------------------------------------
5) Display all the departments where we have more then 3 employees
select job,count(*)
from emp
group by job 
having count(*)>3;

------------------------------------------------------------------------------
6) Display count of employees working as SALESMAN
select count(job)
from emp 
where job ='salesman';
------------------------------------------------------------------------
7) Display count of employees who has joined in year 1981

SELECT Count(*)
FROM emp
WHERE year (hiredate)= 1981 ;





