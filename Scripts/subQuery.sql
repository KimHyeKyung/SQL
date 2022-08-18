--subQuery
--가급적 order by를 하지 않는다: 해봤자 의미없다.
--단일행 subQuery와 다중행 subQuery에 따라 연산자를 잘 선택해야 한다.
SELECT e.EMPLOYEE_ID , e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE SALARY > (SELECT SALARY
				FROM EMPLOYEES e2
				WHERE FIRST_NAME = 'Den');
			
SELECT FIRST_NAME , SALARY , EMPLOYEE_ID 
FROM employees
WHERE SALARY = (SELECT MIN(SALARY)
				FROM EMPLOYEES e );
			
SELECT FIRST_NAME , SALARY , EMPLOYEE_ID 
FROM employees
WHERE SALARY < (SELECT AVG(SALARY)
				FROM EMPLOYEES e );
			
SELECT FIRST_NAME , SALARY , EMPLOYEE_ID 
FROM employees
WHERE SALARY in (SELECT SALARY 
				FROM EMPLOYEES e
				WHERE DEPARTMENT_ID=110);
			
SELECT FIRST_NAME , SALARY , EMPLOYEE_ID 
FROM employees
WHERE SALARY > ANY (SELECT SALARY 
				FROM EMPLOYEES e
				WHERE DEPARTMENT_ID=110);
			
SELECT FIRST_NAME , SALARY , EMPLOYEE_ID 
FROM employees
WHERE SALARY > ALL (SELECT SALARY 
				FROM EMPLOYEES e
				WHERE DEPARTMENT_ID=110);	

SELECT MAX(SALARY), DEPARTMENT_ID  
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID ; 

--잘못된 subQuery
--SELECT em.DEPARTMENT_ID, em.FIRST_NAME , em.SALARY  
--FROM EMPLOYEES em
--WHERE (em.DEPARTMENT_ID, em.SALARY) IN 
--	(
--		SELECT MAX(SALARY), DEPARTMENT_ID  
--		FROM EMPLOYEES e 
--		GROUP BY DEPARTMENT_ID
--	);

--where절 subQuery
SELECT department_id,employee_id,first_name,salary
FROM employees
WHERE (department_id, salary) IN 
	(
		SELECT department_id, max(salary)
		FROM employees
		GROUP BY department_id
	)
ORDER BY DEPARTMENT_ID ;

--from절 subQuery
SELECT e.DEPARTMENT_ID , e.EMPLOYEE_ID , e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e ,(SELECT DEPARTMENT_ID, MAX(SALARY) SALARY
					FROM EMPLOYEES
					GROUP BY DEPARTMENT_ID) s
WHERE e.DEPARTMENT_ID = s.department_id
AND e.SALARY = s.salary
ORDER BY DEPARTMENT_ID ;

--[rowmun]
--잘못된 rownum
select rownum, 
		first_name, 
		salary
from employees
order by salary desc;

--정확한 rownum : subQuery이용
--급여순이 11~20등까지의 직원을 출력하라
SELECT rn
	, first_name
	, salary
FROM (
		SELECT rownum rn
				, first_name
				, salary
		FROM ( SELECT first_name
						, salary
				FROM  employees
				ORDER BY salary DESC
			 )
	)
WHERE rn >= 11
	AND rn <= 20;

--쌤이하신것(정답)
select rn,  
       name,
       salary,
       hire_date
FROM
(
	select rownum rn,
	       name,
	       salary,
	       hire_date
	from (
	       SELECT e.FIRST_NAME || ' ' || e.LAST_NAME name,
			      e.SALARY ,
			      TO_CHAR(e.HIRE_DATE, 'YYYY-MM-DD') hire_date 
			FROM EMPLOYEES e 
			WHERE TO_CHAR(e.HIRE_DATE, 'YYYY') = '2007'
			ORDER BY 2 desc
	     )
)
where rn >= 3
and rn <= 7;
