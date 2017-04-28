
select a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no -- 조인조건 
and a.gender= "F";        -- row 선택조건

select concat(a.first_name," ",a.last_name), b.title, a.emp_no
from employees as a, titles as b
where a.emp_no = b.emp_no;

select count(*)
from employees as a, titles as b
where a.emp_no = b.emp_no;

	select count(*) 
	from employees 
natural join titles;
  
  
 -- join using 
 
 select count(*)
	 from employees a
 		join titles using (emp_no) ;
		
-- join on 
select count(*)
from employees a
join titles b on a.emp_no = b.emp_no; 

-- 직책이 engineer의 여직원의 이름과 직책\
select *
from employees a, titles b
where a.emp_no = b.emp_no  -- 조인조건 
and b.title = "engineer" -- 선택 조건
and a.gender = "F";      -- 선택 조건

select a.first_name, b.title
from employees a, titles b
where a.emp_no = b.emp_no  -- 조인조건 
and b.title = "engineer" -- 선택 조건
and a.gender = "F";      -- 선택 조건

-- 조건과 결과는 같지만 조건문이 약간 다르다.
select a.first_name, b.title
from employees a
join titles b 
on a.emp_no = b.emp_no -- join 조건
where b.title = "engineer" -- 선택 조건
and a.gender = "F";      -- 선택 조건

--  사번, 직원전체이름, 근무부서 출력
select emp.emp_no, concat(emp.first_name," ",emp.last_name) as name, 
dpt.dept_no, dpts.dept_name
from employees emp, dept_emp dpt, departments dpts
where emp.emp_no =dpt.emp_no and dpt.dept_no = dpts.dept_no
and dpt.to_date="9999-01-01";

-- 햔재의 사번, 전체이름, 연봉 출력
select emp.emp_no, concat(emp.first_name," ",emp.last_name) as name,
sal.salary
from employees emp, salaries sal
where emp.emp_no = sal.emp_no and sal.to_date="9999-01-01";
   
select emp.emp_no, concat(emp.first_name," ",emp.last_name) as name,
sal.salary
from employees emp, salaries sal
where emp.emp_no = sal.emp_no and sal.to_date="9999-01-01"
order by sal.salary desc;
 
 --  1
select dpt.dept_no
from employees emp, dept_emp dpt
where emp.emp_no = dpt.emp_no
and concat(emp.first_name," ",emp.last_name) = "Fai Bale";

--  2
select emp.emp_no, emp.first_name
from employees emp, dept_emp dpt
where emp.emp_no = dpt.emp_no
and dpt.dept_no = "d004"
and dpt.to_date = "9999-01-01";

-- subquery  
select emp.emp_no, emp.first_name
from employees emp, dept_emp dpt
where emp.emp_no = dpt.emp_no
and dpt.to_date = "9999-01-01"
and dpt.dept_no = ( select dpt.dept_no
					from employees emp, dept_emp dpt
					where emp.emp_no = dpt.emp_no
					and concat(emp.first_name," ",emp.last_name) = "Fai Bale"
					);
					
-- error 여러개의 subquery 조건이 있을때 equal을 쓰면...
select emp.emp_no, emp.first_name
from employees emp, dept_emp dpt
where emp.emp_no = dpt.emp_no
and dpt.to_date = "9999-01-01"
and dpt.dept_no = ( select dept_no from departments);

-- 현재 전체사원의 평균월급보다 적은 급여를 받는 사원의 이름, 급여
select concat(emp.first_name," ",emp.last_name) as name,
sal.salary
from employees emp, salaries sal
where emp.emp_no = sal.emp_no
and sal.to_date = "9999-01-01"
and sal.salary < (select avg(salary) from salaries
				  where to_date = "9999-01-01"
					);
					
-- 가장적은 급여를 받고 있는 직책의 평균급여
-- top-k 방식
select tit.title, avg(sal.salary) as avg_salary
from salaries sal, employees emp, titles tit
where sal.emp_no = emp.emp_no
and  emp.emp_no = tit.emp_no
and tit.to_date = "9999-01-01"
and sal.to_date = "9999-01-01"
group by tit.title 
order by avg_salary asc
 limit 0, 1;
 
 -- from 절을 이용 방식 subquery
select min(avg_salary)
from (select tit.title, avg(sal.salary) as avg_salary
	from salaries sal, employees emp, titles tit
	where sal.emp_no = emp.emp_no
	and  emp.emp_no = tit.emp_no
	and tit.to_date = "9999-01-01"
	and sal.to_date = "9999-01-01"
	group by tit.title 
	) avg_sal;

-- 급여 50000 이상 직원 이름
 -- 1) join 해결
select emp.first_name
from employees emp, salaries sal
where emp.emp_no = sal.emp_no
and sal.to_date = "9999-01-01"
and sal.salary > 50000 ;

-- 2) subquery로 해결
-- =any in 별차이없다
select concat(first_name," ",last_name) 
from employees 
where emp_no =any(
	select emp_no 
	from salaries 
	where to_date = "9999-01-01" 
	and salary> 50000
	);
	

-- 가장 낮은 평균 월급을 받고 있는 부서에서 근무하는 직원들의 이름과 부서
select dpt.dept_no, max(sal.salary)
from employees emp, dept_emp dpt, salaries sal
where emp.emp_no = dpt.emp_no
and emp.emp_no = sal.emp_no
and sal.to_date = "9999-01-01"
and dpt.to_date = "9999-01-01"
group by dpt.dept_no;

-- where절에  subquery 사용
  select emp.first_name, dpt.dept_no , sal.salary
  from employees emp, salaries sal, dept_emp dpt
  where emp.emp_no = sal.emp_no
  and emp.emp_no = dpt.emp_no
  and sal.to_date  = "9999-01-01"
  and dpt.to_date = "9999-01-01"
  and(dpt.dept_no, sal.salary) =any 
  						(select dpt.dept_no, min(sal.salary)
						from employees emp, dept_emp dpt, salaries sal
						where emp.emp_no = dpt.emp_no
						and emp.emp_no = sal.emp_no
						and sal.to_date = "9999-01-01"
						and dpt.to_date = "9999-01-01"
						group by dpt.dept_no);

-- from절 사용
 select emp.first_name, dpt.dept_no , sal.salary
  from employees emp, dept_emp dpt, salaries sal, 
  (select dpt.dept_no, min(sal.salary)
						from employees emp, dept_emp dpt, salaries sal
						where emp.emp_no = dpt.emp_no
						and emp.emp_no = sal.emp_no
						and sal.to_date = "9999-01-01"
						and dpt.to_date = "9999-01-01"
						group by dpt.dept_no) d
where emp.emp_no = dpt.emp_no
and emp.emp_no = sal.emp_no
and sal.to_date = "9999-01-01"
and dpt.to_date = "9999-01-01"
group by dpt.dept_no;