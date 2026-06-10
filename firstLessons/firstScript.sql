# Simion Cartis
SELECT * FROM parks_and_recreation.employee_demographics; # select everything from databse.table
# keywords do not need to be capitalized, but it usually is convention 

SELECT first_name, # selecting from multiple columns, convention is to have the different columns on different lines
last_name,
birth_date,
age,
age+10
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT gender FROM parks_and_recreation.employee_demographics; #distinct keyword is self-explanetory 

SELECT DISTINCT first_name,
gender
FROM parks_and_recreation.employee_demographics; #however, with this, distinct keyword looks for distinct combinations of
                                                 #first_name and gender


# WHERE CLAUSE 
SELECT * FROM parks_and_recreation.employee_salary WHERE first_name = 'Leslie'; # sequal doesn't use == for equality, just =
SELECT * FROM parks_and_recreation.employee_salary WHERE salary > 50000; # pretty simple

SELECT * FROM parks_and_recreation.employee_demographics WHERE birth_date > '1985-01-01'; #mysql has a date data type, formatted YYYY-MM-DD

SELECT * FROM parks_and_recreation.employee_demographics WHERE birth_date > '1985-01-01' AND gender = 'male'; 

#LIKE STATEMENTS
SELECT * FROM parks_and_recreation.employee_demographics WHERE first_name LIKE 'Jer%'; # this is like regex, any first_name that starts with 'Jer' and anything after
SELECT * FROM parks_and_recreation.employee_demographics WHERE first_name LIKE 'a__'; # name that starts with an a and exactly two characters after 
SELECT * FROM parks_and_recreation.employee_demographics WHERE birth_date LIKE '1989%';

#GROUP BY
SELECT first_name FROM parks_and_recreation.employee_demographics GROUP BY gender; #this won't work because first_name is not an aggregate column, so won't work.
                                                                                   # can select gender and group by gender though, because its the same

SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender; # we want two pieces of info, gender and age. We want to get the average age for each gender
                                                                                         # therefore, select gender and AVG(age) and group all that by the gender                                                                             

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age) FROM parks_and_recreation.employee_demographics GROUP BY gender; 

#ORDER BY
SELECT * from parks_and_recreation.employee_demographics ORDER BY first_name DESC; # self-explanetory

SELECT * from parks_and_recreation.employee_demographics ORDER BY gender DESC, age; # this is descending for gender, but not age

SELECT * from parks_and_recreation.employee_demographics ORDER BY age, gender; # gender now becomes useless. This is because it's sequential, you order by each value in age, and for each unique value of age, order by gender. However, every value in age is unique
#you can also reference the columns by their index, starting at 1

#HAVING VS WHERE
SELECT gender, AVG(age) FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING AVG(age) > 40; #get the groups, then aggregated restrictions

SELECT occupation, AVG(salary) FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%' GROUP BY occupation HAVING AVG(salary) > 75000 ;

#LIMIT AND ALIASING 
SELECT * FROM parks_and_recreation.employee_demographics ORDER BY age DESC LIMIT 2, 1; # start at row 2, get the 1 after it
SELECT gender, AVG(age) AS avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING avg_age >40;
#this as can be implicitly included:
SELECT gender, AVG(age) avg_age FROM parks_and_recreation.employee_demographics GROUP BY gender HAVING avg_age >40;

#joins 
SELECT dem.employee_id, age, occupation FROM parks_and_recreation.employee_demographics dem INNER JOIN parks_and_recreation.employee_salary sal
	ON  dem.employee_id = sal.employee_id; #joins are implicitly inner, but have to specify if you want outer or whatever
    
SELECT * FROM parks_and_recreation.employee_demographics dem RIGHT JOIN parks_and_recreation.employee_salary sal
	ON  dem.employee_id = sal.employee_id; #if there is no match for specific pieces of data, those pieces will just be null
    
SELECT
sal1.employee_id emp_santa_id,
sal1.first_name first_name_santa,
sal1.last_name last_name_santa,
sal2.employee_id emp_id,
sal2.first_name first_name_emp,
sal2.last_name last_name_emp
FROM parks_and_recreation.employee_salary sal1 JOIN parks_and_recreation.employee_salary sal2
	ON sal1.employee_id + 1 = sal2.employee_id; # ON sal1.employee_id + 1 = sal2.employee_id means: there are however many potential pairing of rows. Take the pairing where sal2 employee id + 1 is the same as sal2 employee id.
                                                # So, for the row where sal1 employee id = 1, there are however many combinations with sal2 entries, only keep the combination where the employee id of sal 2 is one above the current employee id for sal1

	#3+ table joining
SELECT * FROM parks_and_recreation.employee_demographics dem INNER JOIN parks_and_recreation.employee_salary sal
	ON  dem.employee_id = sal.employee_id
 JOIN parks_and_recreation.parks_departments pd 
	ON sal.dept_id = pd.department_id; #conceptually, the first join happens, creating a temporary table, which is then joined with the pd table, resulting in the final table 
SELECT *
FROM parks_and_recreation.parks_departments;

#unions    
SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION # this defaults as a UNION DISTINCT
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary;

SELECT first_name, last_name, 'Old man' AS label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old lady' AS age_class
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'highly Paid' AS label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000;