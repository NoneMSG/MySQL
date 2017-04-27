--숫자형 함수

select abs(2), abs(-2);

select mod(41,3), 41%3 from dual;

--가장 근접한 정수를 찾는다.
select floor(1.90), floor(-3.10);

select ceiling(1.23), ceiling(-3.10);

select round(-1.12), round(-1.99), round(1.53), round(1.33) from dual;
select round(-1.121,0), round(-1.991,1), round(1.531,0), round(1.331,1) from dual;

select pow(2,2), pow(2,10) from dual ;

--음수, 양수, 0인지 체크
select sign(-10), sign(0), sign(10) from dual;

--대소문자 구분 안함
select greatest(201,101,199,209)from dual;
select greatest("Zab","zac","abc","Abd")from dual;
select least("Zab","zac","abc","Abd")from dual;

--날짜
select curdate(), current_date;

select curtime(), current_time;

select sysdate(), current_timestamp;

--문자 포맷
select date_format(curdate(), "%W %M %Y");
--숫자 포맷
select date_format(curdate(), "%w %m %y");

select first_name, date_format(hire_date,"%Y년 %m월 %d일 %H시")
from employees;

select date_format(now(),"%Y년 %m월 %d일 %p %H시 %i분 %s초 %f") from dual;
select date_format(sysdate(),"%Y년 %m월 %d일 %p %h시 %i분 %s초 %f") from dual;

select first_name, hire_date, 
 ( 
  period_diff( date_format( now(),"%Y%m"), 
date_format(hire_date,"%y%m") ) )as "a" 
from employees;

select first_name,	
	hire_date,
	DATE_ADD(hire_date, interval 6 MONTH)
	from employees;
	
select concat (cast(now() as char),"") from dual;
select concat("현재 시간은", cast(now() as char), " 입니다" )from dual;

select cast(1-2 as unsigned) from dual;
select cast( cast(1-2 as unsigned) as signed ) from dual;