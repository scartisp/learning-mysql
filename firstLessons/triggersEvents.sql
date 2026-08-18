-- trigger

select * 
from employee_salary;
select * 
from employee_demographics;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name) #insert into these fields in this table
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); #whatever happened in the after insert 
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'johon', 'jops', 'CEO', 10000000, NULL);

-- events
# triggers happen when events take place, you can schedule events
SELECT * 
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND #schedule the event to happen at whatever interval
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;