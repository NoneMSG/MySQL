--집계

select *
	from salaries
where emp_no = 10060;

select avg(salary)
	from salaries
where emp_no = 10060;

--회사 사원들의 근무간 받은 월급의 평균은?
select emp_no, avg(salary)
	from salaries
 group by emp_no 
 order by avg(salary) desc;
 -- 같은의미 avg(salary)를 처음부터 계산하는게 아니라 order by절에 타이틀을 넘겨주기 위함 
 select emp_no, avg(salary) as avg_salary, sum(salary), max(salary)
	from salaries
 group by emp_no 
 order by avg_salary desc;  
  
--현재 급여중에 최고 급여는 ?

select max(salary), min(salary), avg(salary) 
from salaries 
where to_date = "9999-1-1";

select avg(salary) 
from salaries 
where to_date = "9999-1-1" ;
 
 -- 사원별 직책 변경 회수
 select emp_no, count(title) 
 from titles
 group by emp_no ; 
 
 -- where절을 건너왔기 때문에 where절을 못 탄다. 그럴땐 having절 사용
 select emp_no, avg(salary)
 from salaries
 group by emp_no
 having avg(salary)>50000
 order by avg(salary) desc; 
 
 select *
 from titles
 where to_date = "9999-1-1" ;
 
  -- join은 조건을 통해서 만들 수 있다.
 select a.emp_no, b.salary, a.title
 from titles a, salaries b
 where a.emp_no = b.emp_no  -- join조건
 and a.to_date = "9999-1-1"  -- select 조건
 and b.to_date = "9999-1-1"  ;-- select 조건 
 
 -- 집계테이블이 새로 생성되어 평균값을 구한다
 select a.title, avg(b.salary)
 from titles a, salaries b
 where a.emp_no = b.emp_no  -- join조건
 and a.to_date = "9999-1-1"  -- select 조건
 and b.to_date = "9999-1-1"  -- select 조건 
 group by a.title ;
 
 select a.title, avg(b.salary), count(a.emp_no)
 from titles a, salaries b
 where a.emp_no = b.emp_no  -- join조건
 and a.to_date = "9999-1-1"  -- select 조건
 and b.to_date = "9999-1-1"  -- select 조건 
 group by a.title ;
 
 