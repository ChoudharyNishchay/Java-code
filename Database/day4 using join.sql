
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

use emp;
select* from emp;
use dept;

--------------------------------------------------------------
---#1) Display all records in EMP table those were joined before SCOTT joined?
select* from emp
where HIREDATE < (SELECT HIREDATE FROM EMP WHERE ENAME =' SCOTT ');
-----------------
SELECT*
FROM EMP D
CROSS JOIN EMP E 
WHERE D.ENAME='SCOTT';



#--2) Display details of department where department has 3 employees?
SELECT *
FROM DEPT D
JOIN EMP E ON E.DEPTNO = D.DEPTNO
GROUP BY E.DEPTNO
HAVING COUNT(*) = 3

---#3) Display details of department with Minimum salary and maximum salary?
 select d.deptno,d.dname,d.loc,max(e.sal),min(e.sal)
 from dept d
 join emp e
 on d.deptno = e.deptno
 group by d.deptno
 -------------------------------
 select d.deptno,d.dname,d.loc,e.sal
 from dept d
 join emp e
 on d.deptno =e.deptno
 where e.sal =((select min(sal) from emp))
 union
 select d.deptno,d.dname,d.loc,e.sal
 from dept d
 join emp e
 on d.deptno =e.deptno
 where e.sal =((select max(sal) from emp))

---#4) Display all ename, sal, deptno,dname from emp, dept table where all department which has employees as well as department does not have any employees. This query should include non matching rows.

select e.ename,e.sal,d.deptno,d.dname
from emp e right join dept d on e.deptno=d.deptno

---#5) Display all ename, sal, deptno from emp, dept table where all employees which has matching department as well as employee does not have any departments. This query should include non matching rows.

 select e.ENAME,E.SAL,E.DEPTNO,D.DNAME
 FROM EMP E
 LEFT JOIN DEPT D
 ON E.DEPTNO =D.DEPTNO;
 
---#6) Display all ename, sal, dname. Result must include all employees as well as all departments. This query should include non matching rows on both the tables.

 select e.ENAME,E.SAL,E.DEPTNO,D.DNAME
 FROM EMP E
 RIGHT JOIN DEPT D
 ON E.DEPTNO =D.DEPTNO;

select 
e.ENAME,E.SAL,E.DEPTNO,D.DNAME
 FROM EMP E
 LEFT JOIN DEPT D
 ON E.DEPTNO =D.DEPTNO;

---#7) Display all ename, empno, dname from emp, dept table without joining two tables

SELECT ENAME,EMPNO,(SELECT DNAME FROM DEPT WHERE EMP.DEPTNO = DEPT.DEPTNO)
AS DNAME FROM EMP;


---#8) Display all the departments where department does not have any employees

select 
E.ENAME,D.DEPTNO,D.DNAME,D.LOC
FROM EMP e
RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME is null;

---#9) Display all the departments where department does have atleast one employee

select distinct
D.DEPTNO,D.DNAME,D.LOC
FROM EMP e
RIGHT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE E.ENAME is not null;

---#10) Display all employees those who are not managers?
SELECT*
FROM EMP
WHERE EMP.EMPNO NOT IN (SELECT EMPNO FROM EMP WHERE JOB = 'MANAGER');
---------------
SELECT E1.EMPNO,E1.ENAME FROM EMP E1 LEFT JOIN EMP E2 ON E1.EMPNO =E2.MGR
WHERE E2.MGR IS NULL;


---#11) Display all the records for deptno which belongs to employee name JAMES?
select DISTINCT d.DEPTNO,d.DNAME,d.LOC
 from dept d
 join emp e
 on d.DEPTNO = E.DEPTNO
 where e.DEPTNO = (select DEPTNO from emp where ENAME = 'JAMES')



---#12) Display all the records in emp table where salary should be less then or equal to ADAMS salary?
    Select e.EMPNO,e.ENAME,e.SAL
     from emp e join emp e1 on e.EMPNO = e1.EMPNO
      where e1.EMPNO in (select EMPNO from emp where SAL<=(select SAL from emp where ENAME = 'ADAMS')) and e1.ENAME <> 'ADAMS'
 

---#13)Display ename ,sal grade ,dname,loc for each employee. 

select ename, sal ,grade, dname,loc 
from EMP JOIN DEPT ON EMP.DEPTNO =DEPT.DEPTNO
JOIN SALGRADE ON EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;

---#14) Display all employee whose location is DALLAS?
SELECT*
FROM EMP JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.LOC ='DALLAS';