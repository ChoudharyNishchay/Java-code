-- ASSIGNMENT ON CURSOR **** SESSION 11
-- 1. Prepare a program to display the comma separated list of employee names in following format

  --  Deptno    Employees
  --  -------   ------------
  --  10        Scott, Smith, Jones
 --   20        Allen, Ford
  --  30 
  use emp
call disp_list();

DELIMITER #
CREATE PROCEDURE disp_list()
BEGIN
	DECLARE stop_loop BOOLEAN default false;
    DECLARE v_deptno int;
    DECLARE v_ename varchar(64);
    DECLARE v_list varchar(2000);
    DECLARE cur1 CURSOR FOR select deptno from dept;
    DECLARE cur2 CURSOR FOR select ename from emp where deptno = v_deptno;
	DECLARE CONTINUE HANDLER FOR NOT FOUND set stop_loop = TRUE;
    CREATE TEMPORARY TABLE dept_list (deptno int, emp_list varchar(2000));
    
    OPEN cur1;
		outerloop: LOOP
			set stop_loop = FALSE;
			FETCH cur1 into v_deptno;
			
            if stop_loop then leave outerloop;
            end if;
            
            OPEN cur2;
				innerloop: LOOP
					FETCH cur2 into v_ename;
                    if stop_loop then leave innerloop;
					end if;
                    
                    if v_list is null then set v_list = v_ename;
                    else set v_list = concat(v_list,',',v_ename);
                    end if;
                END LOOP;            
            CLOSE cur2;
				insert into dept_list values(v_deptno,v_list);
                set v_list = null;
            
        END LOOP;
    
    CLOSE cur1;
    select * from dept_list;
    DROP temporary table dept_list;
END#


-- 2. Prepare a program to show the details in following format
select 10 deptno, 'SALES' dname, q2(10);
select * from dept;

delimiter #
CREATE DEFINER=`root`@`localhost` FUNCTION `q2`(p_deptno int) RETURNS varchar(200) CHARSET utf8mb4
    READS SQL DATA
    DETERMINISTIC
BEGIN
	DECLARE stop_loop BOOLEAN;
    DECLARE v_deptno int default 10;
    DECLARE v_ename1 varchar(25);
    DECLARE v_emp_list1 varchar(100);
	DECLARE cur1 CURSOR FOR select ename from emp where deptno = v_deptno;
    -- DECLARE cur2 CURSOR FOR select ename from emp where deptno = 20;
    -- DECLARE cur3 CURSOR FOR select ename from emp where deptno = 30;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		SET stop_loop = TRUE;
	OPEN cur1;
	printloop: LOOP
		FETCH cur1 into v_ename1;
        if stop_loop then
			leave printloop;
		end if;
        
        if v_emp_list1 is null then
			set v_emp_list1 = v_ename1;
		else
			set v_emp_list1 = concat(v_emp_list1,',',v_ename1);
		end if;
    
    END LOOP;
    CLOSE cur1;
        
RETURN v_emp_list1;
END#


-- 3. For performance testing we are trying to increase number of records by 10 times for each department. For eg: If there are 3 employees in dept 10 then we should be able to increase the employee count to 30 using same / random values
call q3(10);

delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `q3`(p_deptno int)
BEGIN
	DECLARE cnt int;
    DECLARE ind int;
    DECLARE stop_loop BOOLEAN default FALSE;
    DECLARE v_empno int;
    DECLARE v_ename varchar(25);
    DECLARE v_job varchar(25);
    DECLARE v_mgr int(25);
    DECLARE v_hiredate date;
    DECLARE v_sal int;
    DECLARE v_comm int;
    DECLARE cur CURSOR FOR select empno,ename,job,mgr,hiredate,sal,comm from emp where deptno = p_deptno;
    DECLARE CONTINUE HANDLER FOR NOT FOUND 
		set stop_loop = TRUE;
        
    set cnt = 30 - (select count(empno) from emp where deptno = p_deptno);
    OPEN cur;
    fetchloop: LOOP
    FETCH cur into v_empno,v_ename,v_job,v_mgr,v_hiredate,v_sal,v_comm;
    if stop_loop then
		leave fetchloop;
    end if;
		set ind = 1;
        insertloop: LOOP
			if (ind = cnt/3) then
				leave insertloop;
            end if;
        insert into emp(empno,ename,job,mgr,hiredate,sal,comm,deptno) values(v_empno,v_ename,v_job,v_mgr,v_hiredate,v_sal,v_comm,p_deptno);
        set ind = ind + 1;
        END LOOP;    
    
    END LOOP;    
    CLOSE cur;

END#


-- 4. Prepare a program to create clone of all tables in given schema
-- needs dynamic variables??
use world;
show tables;
call clone_tables('world');

delimiter #
CREATE DEFINER=`root`@`localhost` PROCEDURE `clone_tables`(p_schema varchar(25))
BEGIN
	DECLARE stop_loop BOOLEAN DEFAULT FALSE;
    DECLARE v_table varchar(25);
	DECLARE cur CURSOR FOR select table_name from information_schema.tables where table_schema = p_schema;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
		set stop_loop = TRUE;
	
    OPEN cur;
    cloneloop: LOOP
		FETCH cur into v_table;
        IF stop_loop then
			leave cloneloop;
        END IF;
		set @v_sql = concat('CREATE TABLE ',v_table,'_bkp', ' LIKE ', v_table);
		PREPARE stmt FROM @v_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;
    END LOOP;
    CLOSE cur;
END#













13:29:53	CREATE PROCEDURE disp_list() BEGIN  DECLARE stop_loop BOOLEAN default false	Error Code:
 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL
 server version for the right syntax to use near '' at line 3	0.000 sec
