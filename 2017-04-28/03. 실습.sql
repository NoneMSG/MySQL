-- 01.
select emp.emp_no, concat(emp.first_name," ",emp.last_name)as name, sal.salary
from salaries sal, employees emp
where sal.emp_no = emp.emp_no
and sal.to_date = "9999-01-01"
order by (sal.salary) desc;

-- 02.
select emp.emp_no, concat(emp.first_name," ",emp.last_name)as name, ti.title
from employees emp, titles ti
where emp.emp_no = ti.emp_no
and ti.to_date = "9999-01-01"
order by (emp.first_name);

-- 03.
select emp.emp_no, concat(emp.first_name," ",emp.last_name)as name, dpts.dept_name
from employees emp, departments dpts, dept_emp dpemp
where emp.emp_no = dpemp.emp_no
and dpemp.dept_no = dpts.dept_no
and dpemp.to_date = "9999-01-01"
order by (emp.first_name);

-- 04.
select emp.emp_no, concat(emp.first_name," ",emp.last_name)as name, dpts.dept_name,
ti.title, sal.salary
from employees emp, departments dpts, dept_emp dpemp,
titles ti, salaries sal
where emp.emp_no = dpemp.emp_no
and dpemp.dept_no = dpts.dept_no
and emp.emp_no = ti.emp_no
and emp.emp_no = sal.emp_no
and dpemp.to_date = "9999-01-01"
and sal.to_date = "9999-01-01"
and ti.to_date = "9999-01-01"
order by (emp.first_name);

-- 05.
select emp.emp_no, concat(emp.first_name," ",emp.last_name)as name,
ti.title
from employees emp, titles ti
where emp.emp_no = ti.emp_no
and ti.title = "Technique Leader";

-- 06. 부서명, 이름, 직책 last_name 시작 S
select concat(emp.first_name," ",emp.last_name)as name,
ti.title, dpts.dept_name
from employees emp, departments dpts, titles ti, dept_emp dpemp
 where emp.last_name like "S%"
 and emp.emp_no = ti.emp_no
 and emp.emp_no = dpemp.emp_no
 and dpemp.dept_no = dpts.dept_no;
 
 -- 07. 직책 engineer 중 급여 40000 이상 사원 급여가 큰 순서대로
 select emp.emp_no, sal.salary
 from salaries sal, employees emp, titles ti
 where sal.emp_no = emp.emp_no
 and ti.emp_no = emp.emp_no
 and ti.title = "Engineer"
 and sal.salary > 40000
 and ti.to_date = "9999-01-01"
 and sal.to_date = "9999-01-01"
 order by (sal.salary) desc;

-- 08. 급여 50000 넘는 직책을 급여 큰 순서대로
select ti.title, min(sal.salary)
 from salaries sal, employees emp, titles ti
 where sal.emp_no = emp.emp_no
 and ti.emp_no = emp.emp_no
 and ti.to_date = "9999-01-01"
 and sal.to_date = "9999-01-01"
 group by ti.title
 having min(sal.salary) > 50000 ;
 
 -- 09. 현재 부서별 연봉 큰 수서대로 
select avg(sal.salary), dp.dept_no
from salaries sal,
	employees emp,
	dept_emp dp
where sal.to_date = "9999-01-01"
and dp.to_date = "9999-01-01"
and emp.emp_no = sal.emp_no
and emp.emp_no = dp.emp_no
group by dp.dept_no
having avg(sal.salary)
order by sal.salary desc;

select dept_name, s.avg_salary
from departments dp,
			(
			select avg(sal.salary)as avg_salary, dp.dept_no
			from salaries sal,
				employees emp,
				dept_emp dp
			where sal.to_date = "9999-01-01"
			and dp.to_date = "9999-01-01"
			and emp.emp_no = sal.emp_no
			and emp.emp_no = dp.emp_no
			group by dp.dept_no
			having avg(sal.salary)
			order by sal.salary desc
			) s 
where dp.dept_no = s.dept_no
order by avg_salary desc;

-- 10. 직책별 연봉큰 순서대로 출력
select avg(sal.salary)as avg_salary, ti.title
			from salaries sal,
				employees emp,
				titles ti
			where sal.to_date = "9999-01-01"
			and ti.to_date = "9999-01-01"
			and emp.emp_no = sal.emp_no
			and emp.emp_no = ti.emp_no
			group by ti.title
			having avg(sal.salary)
			order by sal.salary desc;

