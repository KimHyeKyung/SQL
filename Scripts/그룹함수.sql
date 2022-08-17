--그룹함수

--count : null은 포함안됨
SELECT count(*), COUNT(COMMISSION_PCT) 
FROM EMPLOYEES e ;

SELECT count(*)
FROM EMPLOYEES e 
WHERE SALARY > 16000;

--sum
SELECT count(*), sum(salary)
FROM EMPLOYEES e ;

--avg
SELECT COUNT(COMMISSION_PCT) , sum(COMMISSION_PCT), AVG( e.COMMISSION_PCT)
FROM EMPLOYEES e ;
--**avg는 null값이면 빼고 계산하기 때문에 nvl함수와 같이 사용해야 한다!
SELECT COUNT(COMMISSION_PCT) , sum(COMMISSION_PCT), AVG(NVL(e.COMMISSION_PCT ,0))  
FROM EMPLOYEES e ;

--max()/min()
SELECT MAX(SALARY), MIN(SALARY)  
FROM EMPLOYEES e ;

--group by
SELECT e.DEPARTMENT_ID , ROUND(AVG(SALARY))  
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
ORDER BY DEPARTMENT_ID ;

SELECT e.DEPARTMENT_ID , JOB_ID ,COUNT(*), sum(SALARY) 
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID , JOB_ID 
ORDER BY DEPARTMENT_ID ;

--having
SELECT e.DEPARTMENT_ID , COUNT(*), SUM(SALARY)  
FROM EMPLOYEES e 
GROUP BY DEPARTMENT_ID 
HAVING sum(SALARY) > 20000 AND DEPARTMENT_ID IN (100,50,80) 
ORDER BY DEPARTMENT_ID ;