-- 1.
select emp_no, concat(first_name,"", last_name) as full_name
from employees
where emp_no = 10944 ;

-- 2.
select concat(first_name," ",last_name) as Full_name,
Gender, Hire_date 
from employees
order by hire_date asc;

-- 3.
select count(gender) as man
from employees
where gender="M";
select count(gender) as woman
from employees
where gender="F";

 select if(gender="M", "남자", "여자")  as "성별", 
	           count(emp_no)
       from employees
 group by gender;

select gender, count(emp_no) as "성별"
from employees
group by gender;

-- 4.
select count(emp_no)
from salaries ;

-- 5.
select count(dept_name)
from departments;

-- 6.
select count(title)
from titles 
where title = "manager";

-- 7.
select distinct dept_name
from departments
order by length(dept_name) desc;

-- 8.
select distinct count(emp_no)
from salaries 
where salary>= 120000;

-- 9.
select distinct title
from titles
order by length(title) desc;

-- 10.
select count(title)
from titles
where title = "Engineer";

-- 11.
select emp_no,title, to_date 
from titles
where emp_no=13250;


