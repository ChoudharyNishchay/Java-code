-- Nested Queries / SubQuery
-- 1)Display all employees where their salary is less then the Ford’s salary?    

select * 
from emp
 where sal < (select sal from emp where ename ='FORD' );

-- 2) Display all records in EMP table those were joined before SCOTT joined?

select * 
from emp 
where hiredate < (select hiredate from emp where ename = 'SCOTT');

-- 3) Display department details with Minimum salary and maximum salary of that department?

select deptno, min(sal) as 'Minimum', max(sal) 'Maximum' from emp group by deptno;

-- 4) Display all the departments where department does have atleast one employee

select deptno
 from emp group by deptno having count(*)>1;

-- 5) Display all employees those who are not managers?

select ename, job 
from emp where job <> 'MANAGER';

-- 6) Display all the records for deptno which belongs to employee name JAMES?

select *
 from emp 
 where deptno = (select deptno from emp where ename = 'JAMES');

-- 7) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
select *
from emp 
where sal <= (select sal from emp where ename = 'ADAMS');

-- 8) Display all subordinate those who are working under BLAKE?
select *
from emp 
where mgr = (select empno from emp where ename = 'blake');

-- 9) Display all record in emp table working in same deptno as of KING?
select * 
from emp 
where deptno = (select deptno from emp where ename = 'KING');

-- 10) Display all employee whose location is DALLAS?
select * 
from emp
 where deptno = (select deptno from dept where loc = 'dallas');

-- 11) List ename, job, sal and department of all employees whose salary is not within the salary grade? 
select ename,job,sal,dname,loc 
from emp,dept,salgrade
where sal<(select min(losal) from salgrade)
or sal>(select max(hisal) from  salgrade);