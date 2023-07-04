
Procedure
=======
    1. Prepare a program which can perform following operation
	- Lookout for tables which has missing constraints
	- Display list of those table
DELIMITER #
CREATE PROCEDURE ifConstraint()
BEGIN
SELECT table_name FROM information_schema.tables WHERE table_schema = 'day10_assignments'
AND table_name NOT IN (
SELECT table_name FROM information_schema.table_constraints WHERE table_schema = 'day10_assignments');

END #
drop procedure ifConstraint





2. Prepare a program to delete the data from emp. It will receive two inputs employee number and employee name. If employee number is passed as null then delete the data based on employee name.
Backup the deleted data to employee_backup table

delimiter #
create procedure deleteData (
in eno int,
in empname varchar(10)
)
begin
	if(eno is null) then
		insert into employee_backup (select * from emp where ename=empname);
		delete from emp where ename=empname;
	else
		insert into employee_backup (select * from emp where empno=eno);
		delete from emp where empno=eno;
    end if;
end#


