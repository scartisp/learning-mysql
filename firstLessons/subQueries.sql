# Simion Cartis
select *
from employee_demographics
where employee_id in
(
    select employee_id from employee_salary
    where dept_id = 1
); # you can use subqueries in where statements

select first_name, salary, 
(
	select avg(salary) 
    from employee_salary
)
from employee_salary; # you can use subqueries in select statements

select avg(`max(age)`)
from 
	(select gender, avg(age), max(age), min(age), count(age)
	from employee_demographics
	group by gender) as aggregated_table; # this is excessive, but you can add subquery in from statements

