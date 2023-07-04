create database day2;

use day2;

show tables;

-- SQL Commands: SELECT
-- Helps to read from table
-- Table structure : column, rows

SELECT *       -- Executed from workbench
  FROM dept;   -- Workbench will send this command to MySQL server
              
SELECT deptno,dname,loc -- list of columns to be displayed
FROM dept;              -- from table dept

SELECT dname
FROM dept;

select loc
from dept;

select * from emp;

-- NULL : No information / Blank 

select *
from emp;

select ename,sal 
from emp;

select ename,sal,sal * 12
from emp;

-- Alias
 -- Meaningful names
 -- They are not permanent
select ename,sal,sal * 12 AS AnnSal 
from emp;

select ename,sal,sal * 12 AnnSal 
from emp;

select ename,sal,sal * 12 
from emp;

select ename,sal * 12 
from emp;

select ename,sal,IFNULL(comm,0), (sal + IFNULL(comm,0)) * 12 "Total Annual Sal"
from emp;
-- Null values must be treated
-- IFNULL is an inbuild program helping us to replace null values with anything

select * from emp;

-- List of databases / schemas
-- List of tables
-- Access of any table (basic select, null, ifnull, aliases)


drop database day2;
drop table emp;