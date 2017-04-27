SELECT * FROM departments;

SELECT emp_no, first_name, gender, hire_date FROM employees;

SELECT emp_no AS "eNum",
       concat(first_name," ", last_name) as "name",
	   gender AS "성별",
       hire_date AS "근무시작일"
  FROM employees;