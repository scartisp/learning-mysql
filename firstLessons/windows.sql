# Simion Cartis
select dem.first_name, gender, avg(salary) over(partition by gender) # this over partition by will do the calculation for each different value in gender field
from employee_demographics dem # now the values in the avg field are independ of the other fields. If we used group by, it 
join employee_salary sal # the avg salary of a person with a specific first name and gender, which is meaningless unless two people have same first name and gender
	on dem.employee_id = sal.employee_id;
    
select dem.first_name, gender, avg(salary)
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
    group by gender, dem.first_name;
    
select dem.first_name, gender, sum(salary) over(partition by gender) # this over partition by will do the calculation for each different value in gender field
from employee_demographics dem # now the values in the sum field are independ of the other fields. If we used group by, it will get
join employee_salary sal # the avg salary of a person with a specific first name and gender, which is meaningless unless two people have same first name and gender
	on dem.employee_id = sal.employee_id;

# rolling total
select dem.first_name, gender, salary, sum(salary) over(partition by gender order by dem.employee_id) as Rolling_total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;# order by in the over makes it so that the partition window expands for each new employee id.
										 # so it starts with the sum salary for employee with id 1, then with 1-2, 1-3, etc
                                         
select dem.employee_id,dem.first_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,#row number is not positional, it is the literal row number starting from 1
rank() over(partition by gender order by salary desc) as rank_num, # rank is positional. So if two values are the same, it will reuse the same position, and skip a number for the next value (to correct position)
dense_rank() over(partition by gender order by salary desc) as rank_num#dense rank is numeric numbering, so it won't skip numbers like rank does
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id;	
    