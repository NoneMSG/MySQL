--함수연습

--소문자 대문자변환
select upper("seOul"),
ucase("seouL") from dual;

SELECT concat(first_name, ' ',last_name), gender, hire_date
  FROM employees
 WHERE upper(last_name) = upper('AcTon');
 
--대문자 -> 소문자 
select lower("seOul"),
lcase("seouL") from dual;

--db에서는 모든시작은 1부터 시작된다.
select substring("ABCDEFGHIJKLMNOPQRSTU",3,5) from dual; 

--문자열을 잘라내어 비교하는것도 가능하다.
select first_name, hire_date 
	from employees
 where substring(hire_date,1,4)="1989"; 
 
 -- 자리수 채우기
 select lpad("hi",5,"*"),
 rpad("hi",5,"*") from dual;
 
 -- 모자란 값을 값 왼쪽에 특정 문자로 채워넣는다 
 select emp_no, lpad( cast(salary as char), 10, "*")
 from salaries
 where from_date like "2001-%"
 and salary < 70000;
 
 select concat("----",ltrim("    hello    "),"-----") from dual;
 select concat("----",rtrim("    hello    "),"-----") from dual;
 select concat("----",trim(both "x" from "    hello    "),"-----") from dual;
 select concat("----",trim(leading "x" from "    hello    "),"-----") from dual;
 select concat("----",trim(trailing "x" from "    hello    "),"-----") from dual;
 
 select emp_no, trim( leading "*" from lpad(cast(salary as char), 10, '*'))
  from salaries
  where from_date like "2001-%"
  and salary < 70000;