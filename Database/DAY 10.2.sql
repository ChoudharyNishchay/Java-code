USE HR;
SELECT * FROM employees;
-- 1. Write a query to list the names (first and last) of those employees whose name starts with A.
DROP FUNCTION start_N#
DELIMITER #

CREATE FUNCTION start_N(ch VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	IF(SUBSTR(UPPER(ch),1,1) = 'A') THEN
		RETURN ch;
	ELSE 
		RETURN NULL;
	END IF;
END#

SELECT start_N(first_name), last_name FROM employees WHERE start_N(first_name) IS NOT NULL;

-- 2. Write a query to list the names (first and last) of those employees whose last name ends with a.

DELIMITER #
CREATE FUNCTION last_N(ch VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	IF(RIGHT(lower(ch),1) = 'a') THEN
		RETURN ch;
	ELSE 
		RETURN NULL;
	END IF;
END#

SELECT first_name, last_N(last_name) FROM employees WHERE last_N(last_name) IS NOT NULL;

-- 3. Write a query to list the names (first and last) of those employees whose name have second alphabet 's' in their names.

DELIMITER #
CREATE FUNCTION second_s(ch VARCHAR(20))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	IF(SUBSTR(lower(ch),2,1) = 's') THEN
		RETURN ch;
	ELSE 
		RETURN NULL;
	END IF;
END#

SELECT second_s(first_name), last_name FROM employees WHERE second_s(first_name) IS NOT NULL;

-- 4. Write a query to list the names (first and last) of those employees whose first name has only five characters.

DROP FUNCTION five_name#

DELIMITER #
CREATE FUNCTION	five_name(ch VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE num INT;
    SET num = LENGTH(ch);
	IF(num = 5) THEN
		RETURN num;
	ELSE 
		RETURN 0;
	END IF;
END#
SELECT * from employees;

SELECT first_name, last_name FROM employees 
WHERE five_name(first_name) != 0;

-- 5. Write a query to list the names (first and last) of those employees whose first name has only five characters and starts with 'A'.

DELIMITER #
CREATE FUNCTION	five_startC(ch VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE num INT;
    DECLARE ch1 CHAR(1);
    SET ch1 = LEFT(UPPER(ch),1);
    SET num = LENGTH(ch);
	IF(num = 5 AND ch1 = 'A') THEN
		RETURN num;
	ELSE 
		RETURN 0;
	END IF;
END#

SELECT first_name, last_name FROM employees 
WHERE five_startC(first_name) != 0;

-- 6. Write a query to list the names (first and last) of those employees whose first name has only five characters and last name have third alphabet ends with 's'.

DELIMITER #
CREATE FUNCTION	five_last3(ch VARCHAR(20), ch1 VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE num INT;
    SET num = LENGTH(ch);
	IF(num = 5 AND (lower(ch1) LIKE '%s__')) THEN
		RETURN num;
	ELSE 
		RETURN 0;
	END IF;
END#

SELECT first_name, last_name FROM employees 
WHERE five_last3(first_name, last_name) != 0;

-- 7. Write a query to list the names (first and last) of the employees whose first name has only five characters and starting with 'S' and ending with 'n'.
DROP FUNCTION five_NC#
DELIMITER #
CREATE FUNCTION	five_NC(ch VARCHAR(20))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE num INT;
    SET num = LENGTH(ch);
	IF(num = 5 AND (ch LIKE 'S%n')) THEN
		RETURN num;
	ELSE 
		RETURN 0;
	END IF;
END#

SELECT first_name, last_name FROM employees 
WHERE five_NC(first_name) != 0;

-- 8. Write a query to list the names (first and last), hire date of those employees who joined in the month of which second character is 'u'.

SELECT * FROM employees;
SELECT CONCAT(first_name,' ',last_name) AS FullName, hire_date FROM employees 
WHERE MONTHNAME(hire_date) LIKE '_u%';

-- 9. Write a query to list the names (first and last), salary of those employees whose salary is four digit number ending with Zero.

SELECT CONCAT(first_name,' ',last_name) AS FullName, salary  FROM employees 
WHERE ((LENGTH(salary) - 3) = 4) AND (salary LIKE '%0');

-- 10. Write a query to list the names (first and last), salary of those employees whose names having a character set 'll' together.

SELECT CONCAT(first_name,' ',last_name) AS FullName, salary  FROM employees 
WHERE CONCAT(first_name,' ',last_name) LIKE '%ll%';

-- 11. Write a query to list first_name, last_name of employees with the pattern 'l_x' in their first name.

SELECT first_name,last_name FROM employees 
WHERE first_name LIKE '%l_x%';

-- 12. Display the first name in lower case and last name in upper case, for all employees whose employee number is in the range between 80 and 150.

SELECT lower(first_name), UPPER(last_name) FROM employees 
WHERE employee_id BETWEEN 80 AND 150;

-- 13. Display the first name and last name for all employees whose family name is King, perform this exercise with a case-insensitive search (regardless of the capitalization used for the values within last name column).

SELECT * FROM employees
SELECT first_name, last_name FROM employees 
WHERE lower(last_name) LIKE '%king%';

-- 14. Generating new email address
-- 	- For each employee, display the first name, last name, and email address. The email address will be composed from the first letter of first name, concatenated with the three first letters of last name, concatenated with @oracle.com.

SELECT first_name, last_name, email, lower(CONCAT(LEFT(first_name, 1), LEFT(last_name, 3), '@oracle.com')) AS generated_email FROM employees;

-- 	- For each employee, display the first name, last name, and email address. The email address will be composed from the first letter of first name, concatenated with the three last letters of last name, concatenated with @oracle.com.

SELECT first_name, last_name, email, lower(CONCAT(LEFT(first_name, 1), RIGHT(last_name, 3), '@oracle.com')) AS generated_email FROM employees;
