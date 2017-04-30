-- 01 현재 평균 연봉보다 많은 월급 받는 직원 수

select count(emp.emp_no)
from employees emp, salaries sal
where sal.emp_no = emp.emp_no
and sal.to_date = "9999-01-01"
and sal.salary > (select sal.salary
					from salaries sal, employees emp
					where sal.emp_no = emp.emp_no
					and sal.to_date = "9999-01-01"
					having avg(sal.salary)
					);
				
-- 02 현재, 각 부서별 최고급여 받는 사원 사번, 이름, 부서, 연봉, 연봉내림차순 순서로

select dept_name, highest_Salary , Emp_Num, name
from departments dp, 
			(
			select max(sal.salary)as highest_Salary, emp.emp_no as Emp_Num, dpemp.dept_no,
			concat(emp.first_name," ",emp.last_name)as name
			from salaries sal, employees emp, dept_emp dpemp
			where emp.emp_no = sal.emp_no
			and emp.emp_no = dpemp.emp_no
			and sal.to_date = "9999-01-01"
			and dpemp.to_date = "9999-01-01"
			group by emp.emp_no 
			
			) s
where dp.dept_no = s.dept_no
group by dept_name
order by highest_Salary desc;


-- 03. 현재, 자신의 부서 평균 급여보다 연봉이 많은 사원의 사번, 이름, 연봉 조회
select e.emp_no, concat(e.first_name," ",e.last_name)as name, s.salary
from employees e, salaries s
where e.emp_no = s.emp_no
and s.to_date = "9999-01-01"
and s.salary >any (select sal.salary
					from salaries sal, departments dept, 
					employees emp,
					dept_emp dptemp
					where sal.emp_no = emp.emp_no
					and dept.dept_no = dptemp.dept_no
					and emp.emp_no = dptemp.emp_no
					and sal.to_date = "9999-01-01"
					and dptemp.to_date = "9999-01-01"
					group by dept.dept_name
					having avg(sal.salary));

-- 04 현재 사원의 사번, 이름, 매니저 이름, 부서 이름 출력

select e.emp_no,
concat (e.first_name," ",e.last_name) as name,
concat( em.first_name, " ", em.last_name) as mname,
d.dept_name as depart
from employees e, dept_emp de, dept_manager dm, employees em,
departments d
where e.emp_no = de.emp_no
and de.dept_no = dm.dept_no
and d.dept_no =de.dept_no
and de.to_date = "9999-01-01"
and dm.to_date = "9999-01-01"
;

-- 05 현재, 평균연봉 가장 높은 부서의 사원들 사번, 이름, 직책, 연봉 조회 연봉순으로
select a.emp_no, a.first_name, b.title, c.salary
  from employees a,
       titles b,
       salaries c, 
	   dept_emp d,
       (  select b.dept_no, avg(c.salary )
            from employees a, dept_emp b, salaries c
           where a.emp_no = b.emp_no
             and a.emp_no = c.emp_no
             and b.to_date = "9999-01-01"
             and c.to_date = "9999-01-01"
	    group by b.dept_no
        order by avg(c.salary ) desc
           limit 0, 1) e
 where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and a.emp_no = d.emp_no
    and d.dept_no = e.dept_no;

-- 06. 평균 연봉 가장 높은 부서

select dp.dept_name, avg_salary
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
			limit 0, 1
			)z
where dp.dept_no = z.dept_no;

-- 07
select avg(sal.salary)as avg_salary, t.title
			from salaries sal,
				employees emp,
				titles t
			where sal.to_date = "9999-01-01"
			and t.to_date = "9999-01-01"
			and emp.emp_no = sal.emp_no
			and emp.emp_no = t.emp_no
			group by t.title
			having avg(sal.salary)
			order by sal.salary desc
			limit 0, 1;


-- 08. 자신의 매니저보다 높은 연봉을 받는 직원 ?

select sal.salary, emp.emp_no, dp.dept_name
from employees emp, salaries sal,
departments dp, dept_emp dpemp,(
select t.title, s.salary as mss, dp.dept_no as dpn
from titles t , employees e, salaries s,
dept_manager dm, departments dp
where t.emp_no = e.emp_no
and e.emp_no = s.emp_no
and dp.dept_no = dm.dept_no
and t.title = "Manager"
order by (s.salary) desc) z
where emp.emp_no = sal.emp_no 
and emp.emp_no = dpemp.emp_no
and dp.dept_no = dpemp.dept_no
and dp.dept_no= z.dpn
and sal.salary > z.mss ;

select t.title, s.salary
from titles t , employees e, salaries s,
dept_manager dm, departments dp
where t.emp_no = e.emp_no
and e.emp_no = s.emp_no
and dp.dept_no = dm.dept_no
and t.title = "Manager"
order by (s.salary) desc
;
