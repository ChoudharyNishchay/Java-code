Functions
use day10;
1. Write a program to take the input as empno and return the experience of employee in terms of number of years.
---#drop function experience
 delimiter #
 create function experience(
 f_empno int)
 returns int
 not deterministic
 reads sql data
 begin
 declare f_exp int;
 set f_exp=(year(sysdate())-year((select hiredate from emp where empno=7369)));
 return f_exp;
 end #
 select experience(7836) as experince;
use hr
use emp
 =====================================================================================================
 
2. Write a program to take the input as deptno and return 
the comma separated list of employee names

delimiter #
create function list_emp(deptnumber int)
returns varchar(3000)
not deterministic
reads sql data
begin
declare f_ename varchar(20);
declare f_ename_list varchar(3000) default null;
declare cur cursor for select ename from emp where deptno=deptnumber;
declare exit handler for not found 
begin
return f_ename_list;
end;
open cur;
			innerloop:loop
            fetch cur into f_ename;
               if f_ename_list is null then
               set f_ename_list= f_ename;
               else
               set f_ename_list=concat(f_ename_list,' , ',f_ename);
               end if;
               end loop innerloop;
end #
select * from emp;
select list_emp(20) as employees;

=========================================================================================
3. Add a new column incentive to emp table. Write a program to calculate 
and update the incentive using following logic.
     If employees salary is more then avg salary of dept then incentive is 0
	 If employees salary is less then avg salary of dept then incentive is 10% of salary
     alter table emp drop column incentive
     alter table emp
     add 
     (incentive float default null);

     delimiter #
     create function insen(f_empno int,f_sal float,f_deptno int)
     returns float
     not deterministic
     reads sql data
     begin
     declare deptavg float;
     select avg(sal) into deptavg
     from emp
     where deptno=f_deptno;
	 if (f_sal>deptavg) then
     return 0;
     else 
     return .1*f_sal;
	end if;
end #  
                            
update emp
set incentive=insen(empno, sal,deptno);

=========================================================================================================

4. Write a program to get the count of employees working in provided deptno

delimiter #
create function count_emp(f_deptno int)
returns int
not deterministic
reads sql data
begin
return (select count(*) from emp where deptno= f_deptno); 
end #

select deptno, dname,count_emp(deptno)
from dept;
