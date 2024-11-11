-- MULTIPLE TABLE QUERY

-- TASK 1
SELECT ASSIGN_NUM, ASSIGN_DATE, FIRST_NAME, LAST_NAME
FROM ASSIGNMENT_3NF, EMPLOYEE_3NF
WHERE ASSIGNMENT_3NF.EMP_NUM = EMPLOYEE_3NF.EMP_NUM;

-- TASK 2
SELECT ASSIGN_NUM, PROJ_NAME, LAST_NAME
FROM ASSIGNMENT_3NF, PROJECT_3NF, EMPLOYEE_3NF
WHERE ASSIGNMENT_3NF.PROJ_NUM = PROJECT_3NF.PROJ_NUM
AND EMPLOYEE_3NF.EMP_NUM = ASSIGNMENT_3NF.EMP_NUM;

SELECT * FROM ASSIGNMENT_3NF;
SELECT * FROM PROJECT_3NF;
SELECT * FROM EMPLOYEE_3NF;
SELECT * FROM JOB_3NF;

-- TASK 3
SELECT ASSIGN_NUM, JOB_DESCRIPTION, FIRST_NAME, LAST_NAME
FROM ASSIGNMENT_3NF, JOB_3NF, EMPLOYEE_3NF
WHERE ASSIGNMENT_3NF.EMP_NUM = EMPLOYEE_3NF.EMP_NUM
AND EMPLOYEE_3NF.JOB_CODE = JOB_3NF.JOB_CODE
AND JOB_3NF.JOB_CODE IN('501','502');

-- TASK 4
SELECT A.PROJ_NUM, PROJ_NAME, SUM(ASSIGN_HOURS) AS TOTAL_HOURS
FROM ASSIGNMENT_3NF A, PROJECT_3NF P
WHERE A.PROJ_NUM = P.PROJ_NUM
GROUP BY A.PROJ_NUM, P.PROJ_NAME;

-- TASK 5
SELECT E.EMP_NUM, E.FIRST_NAME, E.LAST_NAME, J.JOB_DESCRIPTION, SUM(A.ASSIGN_CHARGE) AS TOTAL_CHARGE
FROM ASSIGNMENT_3NF A, EMPLOYEE_3NF E, JOB_3NF J
WHERE A.EMP_NUM = E.EMP_NUM
AND E.JOB_CODE = J.JOB_CODE
GROUP BY E.EMP_NUM, E.FIRST_NAME, E.LAST_NAME, J.JOB_DESCRIPTION
HAVING SUM(A.ASSIGN_CHARGE) > 500;