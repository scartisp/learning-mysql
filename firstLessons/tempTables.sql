#first way to make temp table
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Simion', 'Cartis', 'Perfect Blue');

# another way
CREATE TEMPORARY TABLE salary_over_50k
SELECT * 
FROM employee_salary
WHERE salary >= 50000; #just make a table from a pre-existing one 
#this table will persist as long as this session does. It is accessible from different scripts
SELECT *
FROM salary_over_50k; 

#temp tables are for more advanced stuff, cte's is for lighter work. One level of tranformation for CTE's