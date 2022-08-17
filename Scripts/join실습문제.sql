--join sql문제

--문제1.
--각 사원(employee)에 대해서 
--사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.
SELECT e.EMPLOYEE_ID ,e.FIRST_NAME ,d.DEPARTMENT_NAME ,mgr.FIRST_NAME "매니저 이름" 
FROM EMPLOYEES e , DEPARTMENTS d , EMPLOYEES mgr
WHERE e.DEPARTMENT_ID  = d.DEPARTMENT_ID 
	AND e.MANAGER_ID  = mgr.EMPLOYEE_ID  ;


--문제2.
--지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로 출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.
SELECT r.REGION_NAME , c.COUNTRY_NAME 
FROM REGIONS r , COUNTRIES c  
WHERE r.REGION_ID  = c.REGION_ID 
ORDER BY c.COUNTRY_NAME DESC;

--문제3.
--각 부서(department)에 대해서 부서번호(department_id), 
--부서이름(department_name), 
--매니저(manager)의 이름(first_name), 
--위치(locations)한 도시(city), 
--나라(countries)의 이름(countries_name) 
--지역구분(regions)의 이름(resion_name)까지 전부 출력해 보세요.
SELECT d.DEPARTMENT_ID, e.FIRST_NAME, l.CITY ,c.COUNTRY_NAME ,r.REGION_NAME 
FROM DEPARTMENTS d , EMPLOYEES e ,LOCATIONS l ,COUNTRIES c ,REGIONS r 
WHERE d.MANAGER_ID  = e.EMPLOYEE_ID
  AND d.LOCATION_ID = l.LOCATION_ID 
  AND l.COUNTRY_ID  = c.COUNTRY_ID 
  AND r.REGION_ID = c.REGION_ID  ;

--문제4.
--‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요.
--(현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은 고려하지 않습니다.) 
--이름은 first_name과 last_name을 합쳐 출력합니다.
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME "name", e.EMPLOYEE_ID 
FROM JOB_HISTORY jh , EMPLOYEES e, JOBS j  
WHERE jh.EMPLOYEE_ID  = e.EMPLOYEE_ID 
  AND jh.JOB_ID  = j.JOB_ID
  AND j.JOB_TITLE = 'Public Accountant'
  AND jh.EMPLOYEE_ID  = e.EMPLOYEE_ID ;
 
--문제5.
--직원들의 사번(employee_id), 이름(first_name), 성(last_name)과 부서 이름(department_name)을 조회하여 성(last_name)순서로 오름차순 정렬하세요
--//106 명  (+  부서가 없는 사람도 조회 되도록.. 107명)
SELECT e.EMPLOYEE_ID , e.FIRST_NAME ,e.LAST_NAME ,d.DEPARTMENT_NAME 
FROM EMPLOYEES e 
LEFT JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID 
ORDER BY e.LAST_NAME ;

--문제6.
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하세요
--// 37 명
--SELECT e.EMPLOYEE_ID ,e.LAST_NAME ,e.MANAGER_ID, m.LAST_NAME,e.HIRE_DATE "자신의 채용일" ,m.HIRE_DATE"매니저채용일" 
--FROM EMPLOYEES e ,EMPLOYEES m, DEPARTMENTS d 
--WHERE m.EMPLOYEE_ID = d.MANAGER_ID 
--  AND m.EMPLOYEE_ID = e.MANAGER_ID 
--  AND e.HIRE_DATE < m.HIRE_DATE ;
--
--SELECT e.EMPLOYEE_ID, e.LAST_NAME ,m.MANAGER_ID
--FROM EMPLOYEES e
--LEFT JOIN EMPLOYEES m ON e.MANAGER_ID = m.EMPLOYEE_ID;
SELECT e.LAST_NAME , e.HIRE_DATE , m.LAST_NAME , m.HIRE_DATE 
FROM EMPLOYEES e , EMPLOYEES m
WHERE e.MANAGER_ID = m.EMPLOYEE_ID 
AND e.HIRE_DATE < m.HIRE_DATE ;


 



