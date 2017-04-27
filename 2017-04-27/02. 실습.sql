-- 1.

select salary, max(salary), min(salary), 
 max(salary)-min(salary) as "최고임금-최저임금"
from salaries;

-- 02.
select  max(date_format(last_day(hire_date),"%Y년 %m월 %d일")) as "마지막"
from employees;


-- 03.

select min(date_format(hire_date, "%Y년 %m월 %d일")) as "입사일"
from employees
where emp_no is not null;

-- 04.

select avg(salary) as "average paycheck"
from salaries;

-- 05. 
select  max(salary), min(salary)
from salaries;

-- 06.
SELECT min(birth_date), max(birth_date)
from employees;

select date_format(now(), '%Y')-date_format(min(birth_date), '%Y') as "최연장자",
date_format(now(), '%Y')-date_format(max(birth_date), '%Y') as "최소연자"
from employees;

select floor( period_diff( date_format(min(birth_date), "%Y"),date_format(now(),"%Y")  ))as "younger" ,
       floor( period_diff( date_format(max(birth_date), "%Y"),date_format(now(),"%Y")  ))as "older"
from employees;
