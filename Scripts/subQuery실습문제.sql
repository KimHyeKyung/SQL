--subQuery 실습문제

--각 업무별 급여의 총합을 구하고자한다.
--급여의 총합이 가장 높은 업무부터 업무명(job_title)과 급여 총합을 조회하라.
SELECT job_title, SUM(salary) 
from(	SELECT j.JOB_TITLE, SALARY  
		FROM EMPLOYEES e , JOBS j
		WHERE e.JOB_ID = j.JOB_ID 
	)
GROUP BY job_title
ORDER BY sum(salary)DESC;

--쌤쿼리
SELECT j.JOB_TITLE  , sum(e.SALARY)
FROM EMPLOYEES e, JOBS j 
WHERE e.JOB_ID = j.JOB_ID 
GROUP BY j.JOB_TITLE
ORDER BY 2 desc;
SELECT j.JOB_TITLE , temp.sum_sal
FROM JOBS j, 
	(SELECT e.JOB_ID , sum(e.SALARY) sum_sal
	FROM EMPLOYEES e 
	GROUP BY e.JOB_ID) temp
WHERE j.JOB_ID = temp.JOB_ID
ORDER BY 2 desc;

--자신의 부서 평균 급여보다 급여가 많은 직원의 직원번호, last_name,급여를 조회하세요 //38		
SELECT e.EMPLOYEE_ID , e.LAST_NAME , e.SALARY 
FROM EMPLOYEES e , (SELECT e.department_id, avg(salary) avg_salary
					FROM EMPLOYEES e 
					GROUP BY e .DEPARTMENT_ID
					ORDER BY avg_salary DESC) t
WHERE e.DEPARTMENT_ID = t.department_id
AND e.SALARY > t.avg_salary;



