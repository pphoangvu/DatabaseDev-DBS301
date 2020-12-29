-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 01-24-2019
-- Purpose: Lab 3 DBS301 
-- ***********************


-- Question 1 

SELECT to_char(sysdate + 1, 'Mon ddth" of the year" yyyy') 
    AS tomorrow
    FROM dual;

-- Advance Option
DEFINE tomorrow = sysdate +1;
SELECT to_char(&tomorrow, 'Mon ddth" of the year" yyyy') 
    AS tomorrow
    FROM dual;

-- Question 2
SELECT 
    last_name, 
    first_name, 
    salary,
    salary + (salary * 0.04) AS "Good Salary", 
    ((salary + (salary * 0.04)) - salary)*12 AS "Annual Pay Increase" 
    FROM employees
    WHERE department_id IN (20,50,60);
    
-- Question 3
SELECT 
    first_name ||  ', ' || last_name || ' is ' || job_id AS "FULL NAME AND JOB"
    FROM employees
    WHERE (upper(first_name) LIKE 'C%' OR upper(first_name) LIKE 'K%')  AND upper(last_name) LIKE '%S'
    ORDER BY last_name;

-- Question 4
SELECT 
    last_name,
    hire_date,
    floor((to_number(to_char(sysdate, 'yyyymmdd')) - to_number(to_char(hire_date, 'yyyymmdd'))) / 10000) AS "Years worked"
    FROM employees 
    WHERE  hire_date <= to_date('120101' , 'yy-mm-dd')
    ORDER BY 3;
    
-- Question 5
SELECT 
    city AS "City Name",
    country_id AS "Country Code",
    COALESCE(state_province, 'Unknown Province') AS "State Province"   
    FROM locations
    WHERE upper(city) LIKE 'S%' AND length(city) >= 8;
    
-- Question 6
SELECT 
    last_name,
    hire_date,
    to_char(next_day(add_months(hire_date, 12), 'Thursday'), 'Day, Month "the " Ddsp "of year" yyyy') AS "REVIEW DAY"
    FROM employees
    WHERE hire_date >= to_date('01012017','ddmmyyyy')
    ORDER BY "REVIEW DAY";




    
    
    






