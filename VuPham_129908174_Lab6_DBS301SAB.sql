-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 02-14-2019
-- Purpose: Lab 6 DBS301 SAB
-- ***********************

-- Question 1
SET AUTOCOMMIT ON ;

-- Question 2
INSERT INTO employees VALUES (777, 'Vu', 'Pham', 'VPHAM66', '999.999.8888', sysdate, 'IT_PROG', NULL, 0.21, 100, 90);

-- Question 3
UPDATE employees
    SET salary = 2500
    WHERE upper(last_name) IN ('MATOS', 'WHALEN');
 
-- Question 4

  
SELECT 
    last_name
    FROM employees
    WHERE department_id IN (
                            SELECT department_id
                                 FROM employees 
                                 WHERE upper(last_name) = 'ABEL'
                           );
                           
-- Question 5
SELECT 
    last_name  
    FROM employees
    WHERE salary = (
                    SELECT 
                        min(salary)
                        FROM employees
                    );
                    
-- Question 6
SELECT DISTINCT
    city
    FROM locations
    WHERE location_id IN (
                    SELECT 
                        location_id
                        FROM departments
                        WHERE department_id IN(
                                               SELECT   
                                                    department_id
                                                    FROM employees
                                                    WHERE salary IN (
                                                                     SELECT
                                                                        min(salary)
                                                                        FROM employees
                                                                    )
                                              )
                         );

-- Question 7
SELECT 
    last_name,
    department_id,
    salary
    FROM employees
    WHERE department_id || salary IN (
                     SELECT
                        department_id ||
                        min(salary)
                        FROM employees
                        GROUP BY department_id
                    )
    ORDER BY department_id;
                    
-- Question 8
SELECT 
    city, 
    last_name
    FROM employees
    JOIN departments USING (department_id)
    JOIN locations USING (location_id)
    WHERE (city, salary) IN (
                             SELECT 
                                city, 
                                MIN(salary) 
                                FROM employees
                                JOIN departments USING (department_id) 
                                JOIN locations USING (location_id)
                                GROUP BY city);
                            
-- Question 9
SELECT 
    last_name,
    salary
    FROM employees
    WHERE salary < ANY (
                        SELECT
                            min(salary)
                            FROM employees
                            GROUP BY department_id
                            )
    ORDER BY salary DESC, last_name;
    
-- Question 10
SELECT 
    last_name,
    job_id as "Job Title",
    salary
    FROM employees 
    WHERE salary = ANY (
                        SELECT 
                            salary
                            FROM employees
                            WHERE department_id IN (
                                                    SELECT 
                                                        department_id 
                                                        FROM departments
                                                        WHERE upper(department_name) = 'IT'
                                                    )
                        )
    ORDER BY salary ASC, last_name;

                        
  
--SELECT * from locations;
--SELECT * from employees;
--select * from departments;






















                           
