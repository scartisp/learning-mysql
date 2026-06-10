SELECT first_name, LENGTH(first_name)
FROM parks_and_recreation.employee_demographics
WHERE LENGTH(first_name) > 3;

SELECT UPPER(first_name)
FROM parks_and_recreation.employee_demographics;

SELECT TRIM('    a       ');
SELECT LTRIM('    a       '); # trim spaces on the left
SELECT RTRIM('    a       '); # trim spaces on the right

#substring stuff
SELECT first_name, LEFT(first_name, 4),#how many characters starting on the leftmost do we want to include in this substring?
RIGHT(first_name, 4),#how many characters starting on the rightmost do we want to include in this substring?
SUBSTRING(first_name, 1,2), # get a sub string starting at the ith character, then getting j characters starting on the ith character
birth_date,
SUBSTRING(birth_date,6,2)
FROM parks_and_recreation.employee_demographics; #trying to start on the 0th index gives you an error. Strings and dates start on 1

#replace
SELECT first_name, REPLACE(first_name, 'a', '@')
FROM parks_and_recreation.employee_demographics;

#locate
SELECT LOCATE('i', 'simion'); # gets the first index of the thing that we are looking for in the second arg

#concat
SELECT first_name, last_name,
CONCAT(first_name,' ', last_name) AS full_name
FROM parks_and_recreation.employee_demographics;