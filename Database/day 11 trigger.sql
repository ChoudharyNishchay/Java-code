1. Create a trigger to raise error if employee salary is less then avg salary of 
corresponding department.
delimiter #
create trigger salless
before insert
on emp
for each row
begin
if new.sal<(select avg(sal) from emp where deptno=new.deptno) then
signal sqlstate '45000' set message_text='the salary cannot be less than the department average salary';
end if ;
end #

insert into emp
values (8888,'nish','clerk',7782,'2022-03-23',2000,null,10);
==================================================================================================

2. Add an additional column called to emp table called as last_updated_by and last_updated_date.
   Upon each update issued on emp table, these columns must be updated by database user and current date (use function current_user() and SYSDATE())
   
   alter table emp
   add column last_updated_by varchar(20) default null;
      
   alter table emp
   add column last_updated_date date default null;

   delimiter #
   create trigger update_emp
   before update
   on emp
   for each row
   begin
   set new.last_updated_by =current_user();
   set new.last_updated_date=sysdate();
   end #

update emp
set ename ='Nish'
where empno=7369;
select * from emp;
rollback;
====================================================================================================
3.  Upon delete of department records from dept table.
 The corresponding employees records must be deleted as well. Implement this requirement with trigger
delimiter #
create trigger del_ques
before delete
on dept
for each row
 begin
 delete from emp where deptno=old.deptno;
 end#

 delete from dept where deptno=10;
  select * from emp;
  rollback;
 
======================================================================================================
4. Create a table with following design

      Table NAme : scott_schema_audit
	   Columns : table_name, operation_name, db_user, change_date

   Populate this table each time the user perform any DML command on emp,dept or salgrade table.
                        Sample data will look like
                 table_name, operation_name, db_user, change_date
				 emp          update         root@localhost   2020-09-14
				 dept         delete         root@localhost   2020-09-15
				 ....
				 
	         
create table scott_schema_audit(
audit_table_name varchar(64),
operation_name varchar(10),
db_user varchar(20),
change_date date
);
delimiter #
create procedure insert_audit(
p_table_name varchar(64),
p_operation_name varchar(10),
p_db_user varchar(20),
p_change_date date)
begin
insert into scott_schema_audit
values (p_table_name , p_operation_name , p_db_user, p_change_date);
end#

delimiter #
create trigger del
before delete
on emp
for each row
begin
call insert_audit('emp','delete',current_user ,sysdate());
end #

delimiter #
create trigger del1
before delete
on dept
for each row
begin
call insert_audit('dept','delete',current_user ,sysdate());
end #

delimiter #
create trigger del2
before delete
on salgrade
for each row
begin
call insert_audit('salgrade','delete',current_user ,sysdate());
end #

delimiter #
create trigger ins
before insert
on emp
for each row
begin
call insert_audit('emp','insert',current_user ,sysdate());
end #


delimiter #
create trigger ins1
before insert
on dept
for each row
begin
call insert_audit('dept','insert',current_user ,sysdate());
end #


delimiter #
create trigger ins2
before insert
on salgrade
for each row
begin
call insert_audit('salgrade','insert',current_user ,sysdate());
end #


delimiter #
create trigger upp
after update
on emp
for each row
begin
call insert_audit('emp','update',current_user ,sysdate());
end #

delimiter #
create trigger upp1
after update
on dept
for each row
begin
call insert_audit('dept','update',current_user ,sysdate());
end #

delimiter #
create trigger upp2
after update
on salgrade
for each row
begin
call insert_audit('emp','update',current_user ,sysdate());
end #

insert into emp
values (9999,'Nish',null,null,null,null,null,10,null,null);
delete from emp where empno=9999;
insert into dept
values (50,'construction','delhi');
delete from dept where deptno=50;

select * from scott_schema_audit;
rollback;
