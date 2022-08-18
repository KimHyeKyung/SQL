--혼합쿼리 실습문제

--문제1
--가장 늦게 입사한 직원의 이름(first_name,last_name)과 연봉(salary)와 근무하는 부서의 이름(department_name)은?
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME ,
       e.SALARY ,
       d.DEPARTMENT_NAME,
       e.HIRE_DATE 
FROM EMPLOYEES e , DEPARTMENTS d 
WHERE e.HIRE_DATE = (SELECT max(HIRE_DATE) 
					FROM EMPLOYEES)
AND e.DEPARTMENT_ID = d.DEPARTMENT_ID ;




--문제2. 
--평균연봉(salary)이 가장 높은 부서 직원들의 
--직원번호(employee_id), 이름(first_name), 성(last_name)과 업무(job_title), 급여(salary), 직급명(job_title)
--내가 한 쿼리
SELECT e.EMPLOYEE_ID "사번",e.FIRST_NAME "이름", e.LAST_NAME "성", e.SALARY "급여", avg_sal, j.job_title "업무"
FROM EMPLOYEES e 
	 , (
		SELECT 	rownum
				,department_id
				,avg_sal
		FROM (
				SELECT d.DEPARTMENT_NAME , AVG(e.SALARY) avg_sal, d.department_id
				FROM DEPARTMENTS d ,EMPLOYEES e
				WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID 
				GROUP BY d.DEPARTMENT_NAME, d.department_id
				ORDER BY avg_sal DESC
			)
		WHERE rownum=1
		)t
	 ,JOBS j
WHERE e.DEPARTMENT_ID = t.department_id
  AND e.job_id  = j.job_id; 

 
 
 
 
 
 

--문제3.
--평균 급여(salary)가 가장 높은 부서는? 
SELECT dep.DEPARTMENT_NAME
FROM DEPARTMENTS dep
	,(
		SELECT rownum
			   ,t.DEPARTMENT_NAME
			   ,t.department_id
		FROM (
				SELECT avg(Salary) avg_sal , d.DEPARTMENT_NAME , d.DEPARTMENT_ID 
				FROM EMPLOYEES e , DEPARTMENTS d 
				WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID 
				GROUP BY department_name, d.DEPARTMENT_ID
				ORDER BY avg_sal desc
			)t
		WHERE rownum = 1
	)tt
WHERE dep.DEPARTMENT_ID = tt.department_id;

--문제4.
--평균 급여(salary)가 가장 높은 지역(대륙)은? 
select region_name
from regions
where region_id =  (select r.region_id
                    from employees e,
                         departments d,
                         locations l,
                         countries c,
                         regions r
                    where e.department_id = d.department_id
                    and   d.location_id = l.location_id
                    and   l.country_id = c.country_id
                    and   c.region_id = r.region_id
                    group by r.region_id
                    having avg(salary) = (select max(avg(salary))
                                          from employees e,
                                               departments d,
                                               locations l,
                                               countries c,
                                               regions r
                                          where e.department_id = d.department_id
                                          and   d.location_id = l.location_id
                                          and   l.country_id = c.country_id
                                          and   c.region_id = r.region_id
                                          group by r.region_id));
