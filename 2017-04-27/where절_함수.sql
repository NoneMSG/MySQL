select *
from titles 
where title = "Staff";

select * from salaries;

select * from salaries
where salary between 50000 and 60000 ;
--위와 같은의미
select * from salaries
where 50000 <= salary and salary <= 60000;

--문자열도 비교가 가능하다.
select concat(first_name, "",last_name),
hire_date
from employees
where hire_date < "1991-1-1";

select dep_no from departments ;

select emp_no, dept_no from dept_emp
where dept_no in ("d005", "d006", "d007");

--%1989%, 1989%, %1989
select emp_no,first_name,hire_date from employees
where hire_date like "1989%";

select emp_no,first_name,hire_date from employees
where hire_date <= "1989-1-1" 
and hire_date >=1989-12-31;

--함수 
select upper('SEoul');
select Ucase('seOUL');

select first_name, hire_date
from employees 
order by hire_date ;

select first_name, hire_date
from employees 
order by hire_date desc ;

--2개의 컬럼을 동시에 정렬가능 
select hire_date,first_name
from employees
order by hire_date asc, first_name asc;