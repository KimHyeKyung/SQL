--dual : 가상의 테이블

--INICAP(컬럼명) : 영어의 첫글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
SELECT INITCAP('apple') FROM dual;

--LOWER(컬럼명)/UPPER(컬럼명) 입력값을 전부 소문자/대문자로 변경하는 함수
SELECT e.FIRST_NAME , LOWER(e.FIRST_NAME), UPPER(e.FIRST_NAME)  
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID  = 100;

--SUBSTR(컬럼명, 시작위치, 글자수)
--숫자는 1부터 시작
--음수인 경우 오른쪽à왼쪽 검색을 한 후 왼쪽/오른쪽으로 글자수 만큼 추출
SELECT e.FIRST_NAME , SUBSTR(FIRST_NAME,1,3), SUBSTR(FIRST_NAME,-3,2)  
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID  = 100;

--LPAD(컬럼명, 자리수, '채울문자')/RPAD(컬럼명, 자리수, '채울문자')
--공백에 특별한 문자로 채우기
SELECT e.FIRST_NAME , LPAD(FIRST_NAME,10,'*'), RPAD(FIRST_NAME,10,'*') 
FROM EMPLOYEES e ;

--REPLACE(컬럼명, 문자1, 문자2)
--컬럼명에서 문자1을 문자2로 바꿔준다.
SELECT e.FIRST_NAME , REPLACE (FIRST_NAME,'a','*')
FROM EMPLOYEES e 
WHERE DEPARTMENT_ID =100;

select 	first_name, 
		replace(first_name, 'a', '*'), 
		replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--ROUND(숫자, 출력을 원하는 자리수) : 반올림
SELECT round(123.346, 2) "r2"
FROM dual;

--TRUNC(숫자, 출력을 원하는 자리수) : 버림
SELECT TRUNC(123.346, 2) "t2"
FROM dual;

--sysdate
SELECT SYSDATE
FROM dual;

SELECT FIRST_NAME , HIRE_DATE , months_between(sysdate, hire_date) 
from employees
where department_id = 110;

--to_char
select first_name, to_char(salary*12, '$999,999') "SAL"
from employees
where department_id =110;

select 	sysdate, 
		to_char(sysdate, 'YYYY"년" MM"월" DD"일" HH24"시" MI"분" SS"초"')
from dual;

--NVL(컬럼명,null일때 값) / NVL2(컬럼명, null아닐때 값, null일때 값)
--평균같이 계산에 사용될 경우 null을 0으로 변경해준다.
SELECT 	e.FIRST_NAME 
		,e.COMMISSION_PCT 
		,NVL(e.COMMISSION_PCT,0)
		,NVL2(e.COMMISSION_PCT, 100, 0) 
FROM EMPLOYEES e ;
