-- EXERCISE 2

-- TASK 1: ist the assignment number, project number, and employee number for all assignments.
SELECT ASSIGN_NUM, PROJ_NUM, EMP_NUM
FROM ASSIGNMENT_3NF;

-- TASK 2: List all rows and columns for the EMPLOYEE_3NF table.
SELECT *
FROM EMPLOYEE_3NF;

SELECT * FROM ASSIGNMENT_3NF;

-- TASK 3: List the first and last names of employees 
-- who were hired on or after January 1, 2000
SELECT FIRST_NAME, LAST_NAME
FROM EMPLOYEE_3NF
WHERE EMP_HIREDATE >= '2000-01-01';

-- TASK 4: List the first and last names of employees who
-- were hired on or after January 1, 2000
SELECT ASSIGN_NUM, ASSIGN_HOURS
FROM ASSIGNMENT_3NF
WHERE ASSIGN_CHG_HOUR > 50;

SELECT * FROM ASSIGNMENT_3NF;

-- TASK 5: List the employee number and job description 
-- for all employees with job codes '502' or '503'.
SELECT EMP_NUM, JOB_CODE
FROM EMPLOYEE_3NF
WHERE JOB_CODE IN('502', '503');

SELECT * FROM EMPLOYEE_3NF;