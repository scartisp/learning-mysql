CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

DELIMITER $$ # change delimeters so that you can have multiple queries in a store procedure
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ; 
# you do have to change it back though

CALL large_salaries();
CALL large_salaries2();

CREATE PROCEDURE large_salaries3(p_employee_id INT)
	SELECT salary
	FROM employee_salary
	WHERE employee_id = p_employee_id;

CALL large_salaries3(1);