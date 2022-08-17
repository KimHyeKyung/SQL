--문제1
--전체직원의 다음 정보를 조회하세요.
--정렬은 입사일(hire_date)의 올림차순(ASC)으로 가장 선임부터 출력이 되도록 하세요. 
--이름(first_name last_name),  월급(salary),  전화번호(phone_number), 입사일(hire_date) 순서이고 
--“이름”, “월급”, “전화번호”, “입사일” 로 컬럼이름을 대체(column alias)해 보세요.
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME "이름", e.SALARY "월급", e.PHONE_NUMBER "전화번호", e.HIRE_DATE "입사일"
FROM EMPLOYEES e
ORDER BY HIRE_DATE;

--문제2 
--업무(job_id)와 월급(salary)을 월급의 내림차순(DESC)로 정렬하세요.
SELECT e.JOB_ID , e.SALARY 
FROM EMPLOYEES e 
ORDER BY SALARY DESC;

--문제3
--담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
SELECT e.FIRST_NAME , e.MANAGER_ID , e.COMMISSION_PCT , e.SALARY 
FROM EMPLOYEES e 
WHERE SALARY > 3000 AND e.MANAGER_ID IS NOT NULL AND e.COMMISSION_PCT IS NULL;

--문제4
--최고월급(max_salary)이 10000 이상인 업무의 이름(job_title)과 최고월급(max_salary)을 최고월급의(max_salary) 내림차순(DESC)로 정렬하여 출력하세요.
SELECT e.
FROM EMPLOYEES e ;

--문제5
--월급이 14000 미만 10000 이상인 직원의 이름(first_name), 월급, 커미션퍼센트 를  월급순(내림차순) 출력하세오.
--단 커미션퍼센트 가 null 이면 0 으로 나타내시오.
SELECT e.FIRST_NAME , e.SALARY , NVL(e.COMMISSION_PCT, 0)
FROM EMPLOYEES e 
WHERE SALARY < 14000 AND SALARY >=10000
ORDER BY SALARY DESC ;

--문제6(내일 진행)
--부서번호가 10, 90, 100 인 직원의 이름, 월급, 입사일, 부서번호를 나타내시오
--입사일은 1977-12 와 같이 표시하시오
SELECT e.FIRST_NAME , e.SALARY ,e.HIRE_DATE , e.DEPARTMENT_ID 
FROM EMPLOYEES e 
WHERE e.DEPARTMENT_ID IN (10, 90, 100);

--문제7
--이름(first_name)에 S 또는 s 가 들어가는 직원의 이름, 월급을 나타내시오
SELECT e.FIRST_NAME , e.SALARY 
FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%s%' OR  FIRST_NAME  LIKE  '%S%'

--문제8.
--전체 부서를 출력하려고 합니다. 순서는 부서이름이 긴 순서대로 출력해 보세오.
SELECT * 
FROM DEPARTMENTS d 
ORDER BY DEPARTMENT_NAME;