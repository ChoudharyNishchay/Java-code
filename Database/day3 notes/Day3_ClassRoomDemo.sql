RDBMS : SQL

Oracle Database
----------------
select ename || ' is working as ' || job from emp;

MySQL Database
---------------
select CONCAT(ename, ' is working as ', job) JobDescription from emp;

-- Oracle ---Migration---> MySQL

use dac22;
SELECT  ename,job, IFNULL(comm,0)
  FROM  emp;

-- redundant values  
-- eliminate duplicate values from result
SELECT DISTINCT job FROM emp;

SELECT empno FROM emp; 

SELECT DISTINCT job,deptno FROM emp;
-- ----------------------------------------
select empno,mgr from emp;

select * from emp; -- request all records from emp table

-- filter the data based on any criteria
-- Restrict data / restricting records : Restriction

SELECT *
  FROM emp           -- 1. Load table data in memory (RAM)
 WHERE empno = 7788;  -- 2. Filter the records based on the condition

SELECT *
FROM emp
WHERE job='MANAGER';
     
Comparison operator
= 
>
<
>=
<=
<>  != 

select *
from emp
where sal < 2000;

find out people working as clerk and earning more then 1000$
Logical operator : AND / OR / NOT

T  AND  T  --> T
T  AND  F  --> F
F  AND  F  --> F

T  OR  T --> T
T  OR  F --> T


select *
from emp
where job='CLERK' AND sal <= 1000

Find people working in department 10 or department 20

select *
from emp
where deptno = 10 OR (deptno = 20 AND job='MANAGER');

select *
from emp
where (deptno = 10 OR deptno = 20) AND job='MANAGER';

-- Date values : YYYY-MM-DD
select *
from emp
WHERE hiredate > '1981-03-01';

0	107	08:55:53	select *
 from emp
 WHERE hiredate > '01-JAN-1981'
 LIMIT 0, 1000	Error Code: 1525. Incorrect DATE value: '01-JAN-1981'	0.015 sec

-- We cannot use normal comparison operators with null values
 SELECT *
 FROM emp
 WHERE comm = NULL;
 
-- Special Operators provided by SQL (ANSI)

-- Dealing with null values
 IS NULL
 IS NOT NULL

SELECT *
 FROM emp
 WHERE comm IS NULL;

SELECT *
 FROM emp
 WHERE comm IS NOT NULL;

-- Range operator : BETWEEN AND operator
-- Date and numbers
Find out employees earning in the range of 1000 and 2000 

SELECT *
  FROM emp
 WHERE sal >= 1000 AND sal <= 2000;
 
SELECT *
  FROM emp
 WHERE sal BETWEEN 1100 AND 2000;

SELECT *
  FROM emp
 WHERE hiredate BETWEEN '1981-02-01' AND '1981-04-28';
 
-- Wildcard character search for string
-- LIKE

select *
from emp
where job LIKE 'SALES%' 

select *
from emp
where ename LIKE 'A%'  

select *
from emp
where ename LIKE '%S'  

select *
from emp
where ename LIKE '%S%'  -- letter s may be found anywhere in the string

select *
from emp
where ename LIKE '%s%' -- MySQL perform case insensitive search
                       -- Collations 
                       -- Oracle perform case sensitive search

-- Search in string column : ename, job

SELECT *
FROM emp
WHERe ename LIKE 'ADAM%';

SELECT *
FROM emp
WHERe ename LIKE '%ADAM';  

SELECT *
FROM emp
WHERe ename LIKE '%ADAM%';  

SELECT *
FROM emp
WHERE sal LIKE '11%';

SELECT *
FROM emp
WHERe ename LIKE 'A_A_S';  

SELECT *
FROM emp
WHERe ename LIKE '%A%' AND ename like '%M%';  

SELECT *
FROM emp
WHERe ename LIKE '%%' ;  

-- List operator 

find people working as clerk or salesman or manager

select *
from emp
where job = 'CLERK' OR job='SALESMAN' or job='MANAGER';

select *
from emp
where job IN ('CLERK','SALESMAN','MANAGER') AND sal > 2000;

select *
from emp
where deptno IN (10,20);

SELECT -- Projection
FROM 
WHERE -- Restriction

----------------------------------------------------------------

SELECT *
FROM emp
WHERE ename like 'ADAM\_%';

-----------------------------------------------------------------

Group function
-------------------
Inbuilt programs which are used to return a single result for group of records.

SELECT sum(sal),max(sal), min(sal), avg(sal), count(sal)
from emp;

select count(*)
from emp
where deptno=10;

select * from emp;

SUM / avg : Numeric values
MAX / MIN : Numeric + Date values
Count : Works with any data type

select min(hiredate) from emp;
SELECT count(ename),count(hiredate),count(sal), count(comm)
from emp;

-- All group function ignore null values

count of employee 

select count(empno)
from emp;

select count(*)
from emp;

select sum(comm),avg(IFNULL(comm,0)),count(comm) from emp;


Find count of employee who are earning commission

SELECT count(*)            -- 3. Provide the records to count function
 FROM emp                  -- 1. Load table data in memory of server
 WHERE comm IS NOT NULL
 AND comm <>0;            -- 2. apply this filter on each record

SELECT count(comm)
from emp;

Find count of employee working as clerk

select count(*)
from emp
where job='CLERK';

Find count of employee working as manager

select count(*)
from emp
where job='MANAGER';

Find count of employee working for clerk and manager

select count(*)                       -- 3
from emp                              -- 1
where job IN ('MANAGER','CLERK');     -- 2

select *
from emp                              -- 1
where job IN ('MANAGER','CLERK');     -- 2

select count(*)
from emp       
where job IN ('MANAGER','CLERK');


select job,count(*)                 -- Call group function for each group of records
from emp                         -- 1. Table loaded in memory
where job IN ('MANAGER','CLERK') -- 2. Filter records based on condition
group by job;                    -- 3. Divide the result in groups
                                       -- Find distinct values in the JOB (CLERK, MANAGER)
                                       -- Create group based on distinct values
                                          CLERK
                                          MANAGER
									   
select deptno,count(*)                 -- Call group function for each group of records
from emp                         -- 1. Table loaded in memory
where job IN ('MANAGER','CLERK') -- 2. Filter records based on condition
group by deptno;                 -- 3. Divide the result in groups
                                       -- Find distinct values in the DEPTNO (10,20,30)
                                       -- Create group based on distinct values
                                          10
                                          20
                                          30

select empno,count(*)                 -- Call group function for each group of records
from emp                         -- 1. Table loaded in memory
where job IN ('MANAGER','CLERK') -- 2. Filter records based on condition
group by empno; 

-- Only show result for records where max(sal) is more then 2000$

select deptno,job,count(job),max(sal),sum(sal) -- 5. 
from emp                              -- 1. Load table data in memory
where job IN ('MANAGER','CLERK')      -- 2. Apply filter job in (manager and clerk)
group by deptno,job                   -- 3. Perform grouping
having max(sal) > 2000 

-- Error Code: 1111. Invalid use of group function	0.000 sec

  select deptno,job,count(job),max(sal),sum(sal) -- 5. 
from emp                              -- 1. Load table data in memory
where job IN ('MANAGER','CLERK')      -- 2. Apply filter job in (manager and clerk)
  and max(sal) > 2000 
group by deptno,job                   -- 3. Perform grouping

Error Code: 1111. Invalid use of group function	0.000 sec

select deptno,job,count(job),max(sal),sum(sal) -- 5. 
from emp                              -- 1. Load table data in memory
where job IN ('MANAGER','CLERK')      -- 2. Apply filter job in (manager and clerk)
group by deptno,job                   -- 3. Perform grouping
having max(sal) > 2000 ;

--------------------------------------------------------------------------------------
-- Sorting of data
-- Ordering of data

select * from emp; -- Ordering of record is not guaranteed

select *
from emp
order by ename;

select *
from emp
order by job; -- ascending

select *
from emp
order by job desc; -- descending

select *
from emp
order by deptno asc,sal asc; -- descending

-- TopN Analysis

select *
from emp
Order by sal
limit 3;

select * 
from emp
order by hiredate desc
limit 2;

-- Interview question
SELECT DISTINCT count
FROM  1. 
WHERE  2. 
GROUP BY 3.
HAVING <count> 4.
ORDER BY 5. count
LIMIT 6.


select deptno,count(*)
from emp
group by deptno
order by count(*)

COUNT
MAX
MIN
AVG
SUM

IFNULL

All inbuilt functions

select round(avg(sal),2) from emp;
