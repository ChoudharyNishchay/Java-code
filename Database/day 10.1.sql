1_Simple Assignments around function and Procedure.txt
Taken from online site
----------------------
#--1. Write a PL/SQL program to arrange the number of two variable in such a
 way that the small number will store in num_small variable and
 large number will store in num_large variable.


delimiter #
create procedure examp1(p_a int ,p_b int )
begin
  Declare  num_small , num_large int ;
if (p_a<p_b) then set num_small=p_a;
set num_large=p_b;
SELECT NUM_SMALL, NUM_LARGE;
else set num_large = p_b;
set num_small=p_a;
SELECT NUM_SMALL, NUM_LARGE;

end if ;
  
 end#

call examp1(5,2);


DROP PROCEDURE Num_arrangement;


#--2. Write a PL/SQL program to check whether a number is even or odd.


DELIMITER #

CREATE PROCEDURE Evenodd ( in num int)
begin 
if (num % 2 = 0) then 
   select 'EVEN' num;

 else
  select 'odd' num;
   
 end if;
 
 end#


DELIMITER #
CREATE PROCEDURE num1 (num int)
 begin 
 if (num % 2 = 0) then 
      select concat(num,'  = ' , ' EVEN') ;
    else 
    select concat( num , '  = ' ,'ODD');    
       end if;    
    END#

call num1(2);

#---4. Write a PL/SQL procedure to calculate the total salary for specific employee.

DROP PROCEDURE totalsalary

DELIMITER #
CREATE PROCEDURE totalsalary(p_empno INT)
BEGIN
SELECT ((IFNULL(sal,0)*12)+IFNULL(comm,0)) AS total_salary 
FROM emp
WHERE empno = p_empno;

END#


CALL totalsalary(7654);
CALL totalsalary(7369);


#--5. Write a PL/SQL program to check whether a date falls on weekend i.e. SATURDAY or SUNDAY.

DELIMITER #
CREATE PROCEDURE checkdate(p_date DATE)

BEGIN
	DECLARE v_day INT ;
    SET v_day = dayofweek(p_date);
     IF v_day = 7 THEN
          SELECT 'Day of given date is on weekend and it is SATURDAY';
     ELSE IF v_day = 1 THEN
          SELECT 'Day of given date is on weekend and it is SUNDAY';
     ELSE
          SELECT 'Day of given date is not on weekend';
	END IF;
     END IF;
 END#
 
 CALL checkdate('2022-03-26');
 CALL checkdate('2022-03-25');

=============================================================
DELIMITER #
create procedure weekday_or_not( d date )
begin 
declare x varchar(20);
select weekday(d) into x;
if x=5 or x= 6
then 
select concat(d,' :- ', 'Its a weekend ');
else 
 select concat(d,'  :- ','not a weekend');
 end if;
end #
##===================================================================
#--6. Write a PL/SQL program to count number of employees in provided department.

 CALL numofemp(10);
 CALL numofemp(20);
 
 
delimiter #
 CREATE DEFINER=`root`@`localhost` PROCEDURE `numofemp`(p_deptno INT)
BEGIN
DECLARE v_deptno INT;
SELECT count(*) AS number_of_employee
FROM emp
WHERE deptno = p_deptno;
END#


## 7. Write a PL/SQL program to display the description against a grade.

 
 CALL grade1desc(1);
 CALL gradedescofemp(9999);
 
delimiter #
 CREATE DEFINER=`root`@`localhost` PROCEDURE `grade1desc`(p_grade INT)
BEGIN
SELECT concat('Salary range of given grade is ',losal,' to ',hisal) AS Dscription
FROM salgrade
WHERE grade = p_grade;

END#
 ---------------------------------------------------------------------
 CREATE DEFINER=`root`@`localhost` PROCEDURE `gradedescofemp`(p_empid INT)
BEGIN
SELECT concat('Salary grade of given employee is ', grade)
FROM salgrade
WHERE  (select sal FROM emp WHERE empno =p_empid) BETWEEN losal AND hisal;

END
 
 
 
 /*
 8. Write a PL/SQL program to count number of employees in a specific department and check whether this 
 department have any vacancies or not (considering that each department has 45 head count requirement). 
 If any vacancies, how many vacancies are in that department.
 */


CALL vacancies(10);
CALL vacancies(20);

delimiter #

CREATE DEFINER=`root`@`localhost` PROCEDURE `vacancies`(p_deptno INT)
BEGIN
DECLARE v_totalcnt , v_vacancy, v_count INT;
SET v_totalcnt= 45;
SELECT count(*) INTO v_count 
FROM emp
WHERE deptno = p_deptno; 
IF v_count>0 AND v_count<=v_totalcnt THEN
  SET v_vacancy = v_totalcnt-v_count;
  SELECT concat('TOTAL VANCANCIES ARE :',v_vacancy) AS VACANCIES;
ELSE 
  SELECT 'No Vacancies';
  
END IF;
  

END#



-- 9. Write a PL/SQL program to display the description against a grade using CASE statement.

CALL gradedescstd('A');
CALL gradedescstd('B');
CALL gradedescstd('C');
CALL gradedescstd('D');
CALL gradedescstd('F');
CALL gradedescstd('H');



delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `gradedescstd`(p_grade CHAR(1))
BEGIN
 CASE p_grade
    WHEN 'A' THEN SELECT 'Your Grade is Outstanding';
    WHEN 'B' THEN SELECT'Your Grade is Excellent';
    WHEN 'C' THEN SELECT'Your Grade is Very Good';
    WHEN 'D' THEN SELECT'Your Grade is Average';
    WHEN 'F' THEN SELECT'Your Grade is Poor';
    ELSE SELECT'INVALIDE GRADE ENTER GRADE BETWEEN A TO F.';
  END CASE;	
  END#
*/



-- 10. Write a PL/SQL program to check whether a given number is positive, negative or zero.

CALL numbercheck(5);
CALL numbercheck(0);
CALL numbercheck('-8');
CALL numbercheck(NULL);


delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `numbercheck`(p_num INT)
BEGIN

IF p_num > 0 THEN 
  SELECT 'ENTERED NUMBER IS POSITIVE NUMBER';
ELSE IF p_num < 0 THEN
  SELECT 'ENTERED NUMBER IS POSITIVE NUMBER';
ELSE IF p_num = 0 THEN
   SELECT 'ENTERED NUMBER IS ZERO';
ELSE 
   SELECT 'NO VALUE IS ENTERED THAT IS NULL';
   
END IF;
END IF;
END IF;  
  
END#



-- 11. Write a PL/SQL program to check whether a given character is letter or digit.

CALL charactercheck('5');
CALL charactercheck('A');
CALL charactercheck('f');
CALL charactercheck('6');

delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `charactercheck`(p_char CHAR(1))
BEGIN

IF (p_char >= 'A' AND p_char <= 'Z' ) OR (p_char >= 'a' AND p_char <= 'z')  THEN
   SELECT 'ENTERED CHARACTER IS A LETTER';
ELSE  IF p_char >= 0  AND p_char <= 9 THEN 
  SELECT 'ENTERED CHARACTER IS A DIGIT' ;
ELSE 
  SELECT 'OTHER CHARACTER';
   
 END IF;
 END IF;
 

END#



-- 12. Write a PL/SQL program to display which day is a specific date.

CALL specificdate('2022-03-28');
CALL specificdate('1996-08-09');
CALL specificdate('1995-09-09');

delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `specificdate`(p_date DATE)
BEGIN
DECLARE v_day VARCHAR(9) ;

SET v_day = dayname(p_date);
SELECT v_day;

END#


-- 13. Write a program in PL/SQL to update the salary of a specifc employee by 8%
-- if the salary exceeds the avg salary of their job.

USE humanresource;

CALL updatesalary(107);
CALL updatesalary(103);

delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `updatesalary`(p_empid INT)
BEGIN
DECLARE v_sal, v_minsal, v_maxsal INT;
DECLARE v_avg DOUBLE;
SELECT salary INTO v_sal FROM employees e WHERE employee_id = p_empid;
SELECT min_salary INTO v_minsal FROM employees e JOIN jobs j USING(job_id) WHERE  employee_id = p_empid;
SELECT max_salary INTO v_maxsal FROM employees e JOIN jobs j USING(job_id) WHERE  employee_id = p_empid;

SET v_avg =  (v_minsal+ v_maxsal)/2;

IF v_sal > v_avg THEN
    UPDATE employees
    SET salary = salary+(salary*0.08)
    WHERE employee_id = p_empid;
ELSE 
  SELECT 'SALARY OF GIVEN EMPLOYEE IS LOWER THAN ITS AVERAGE JOB SALARY';
END IF;
END#




-- 14. Write a program in PL/SQL to print 1st n numbers from provided input.
--  input : start with, end with, top n


DELIMITER #
   
CREATE FUNCTION f14(E1 CHAR(100),E2 char(100))
RETURNS CHAR(100)
DETERMINISTIC
BEGIN


	RETURN( select concat(substr(E1,1,1),substr(E2,1,3),'@oracle.com'));
	

END#
SELECT  first_name,last_name,f14(FIRST_NAME,LAST_NAME) as email from employees




