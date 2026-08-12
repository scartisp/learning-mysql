# Simion Cartis
select dem.first_name, gender, avg(salary) over(partition by gender) # this over partition by will do the calculation for each different value in gender field
from employee_demographics dem # now the values in the avg field are independ of the other fields. If we used group by, it 
join employee_salary sal # the avg salary of a person with a specific first name and gender, which is meaningless unless two people have same first name and gender
	on dem.employee_id = sal.employee_id;
    
select dem.first_name, gender, sum(salary) over(partition by gender) # this over partition by will do the calculation for each different value in gender field
from employee_demographics dem # now the values in the avg field are independ of the other fields. If we used group by, it 
join employee_salary sal # the avg salary of a person with a specific first name and gender, which is meaningless unless two people have same first name and gender
	on dem.employee_id = sal.employee_id;