
--ex6
select department_id, last_name, job_id from employees
where department_id in (select department_id from departments
where department_name = 'Executive')
--ex7
select employee_id, last_name, salary from employees
where last_name in (select last_name from employees where last_name like '%u%')
and salary in (select salary from employees where salary > (select avg(salary) from employees))
--ex8
select round (max(salary),0) as Maximum, round(min(salary),0) as Minimum, 
round(avg(salary),0)as Average, round(sum(salary),0) as Sum 
from employees
--ex9
select UPPER(LEFT(last_name,1))+LOWER(SUBSTRING(last_name,2,LEN(last_name))) as Last_name, len(last_name) as length 
from employees
where last_name in (select last_name from employees
	where last_name like 'J%' or last_name like 'A%' or last_name like 'M%')
--ex10
Select employee_id, last_name, salary, salary*1.155 as new_salary
From employees
--ex11
select e.last_name, d.department_id, d.department_name 
from employees e full join departments d on d.department_id = e.department_id
--ex12
--tim nhung nhan vien den làm vi?cToroto
select * from employees
where department_id in 
	(select department_id from departments
	where location_id in (select location_id from locations where city='Toronto'))
-- tim hire_date c?a quan lý c?a các nhân viên ??n t? toronto 
select employee_id from employees
where hire_date > (select hire_date from employees
					where manager_id in
						(select manager_id from employees
						where department_id in 
							(select department_id from departments
							where location_id in (select location_id from locations where city='Toronto'))))