SELECT first_name, last_name,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 and 50 THEN 'old'
    ELSE "on death's door"
END AS Age_bracket           					 # need to end case statements with END
FROM parks_and_recreation.employee_demographics;

# bonus and pay increase
# find pay increase and bonus
#	< 50,000 = 5%
#   > 50,000 = 7%
# if Finance = 10%
SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary *1.05
    WHEN salary > 50000 THEN salary*1.1
    WHEN salary = 50000 THEN salary
END AS New_salary,
CASE
WHEN dept_id = 6 THEN salary *.10
ELSE 0
END AS bonus
FROM parks_and_recreation.employee_salary;

