-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 02-07-2019
-- Purpose: Lab 5 DBS301 
-- ***********************

-- Part-A – Simple Joins
-- Question 1 
SELECT 
    departments.department_name, 
    locations.city,
    locations.street_address,   
    locations.postal_code
    FROM departments, locations
    WHERE departments.location_id = locations.location_id
    ORDER BY city, department_name;
    
-- Question 2
SELECT  
    first_name || ', ' || last_name AS "Last, First",
    hire_date,
    salary, 
    department_name,
    city
    FROM employees, departments, locations
    WHERE employees.department_id = departments.department_id AND departments.location_id = locations.location_id AND (upper(department_name) LIKE 'A%' OR upper(department_name) LIKE 'S%')
    ORDER BY department_name, "Last, First";
    

-- Question 3
SELECT  
    first_name || ', ' || last_name AS "Manager Name",
    department_name,
    city, 
    postal_code,
    state_province
    FROM employees, departments, locations 
    WHERE employees.department_id = departments.department_id AND departments.location_id = locations.location_id AND upper(state_province) IN ('ONTARIO', 'NEW JERSEY', 'WASHINGTON')
    ORDER BY city, department_name;
    
-- Question 4

--SELECT 
  --  e.last_name as "Employee",
    --e.employee_id as "Emp#",
    --m.last_name as "Manager",
    --m.manager_id as "Mgr#"
    --FROM employees e LEFT OUTER JOIN employees m ON (e.manager_id = m.employee_id);
    
SELECT 
    e.last_name as "Employee",
    e.employee_id as "Emp#",
    m.last_name as "Manager",
    m.manager_id as "Mgr#"
    FROM employees e, employees m
   WHERE e.manager_id = m.employee_id;
    
    
-- Part-B – Non-Simple Joins
-- Question 5
SELECT 
    department_name,
    city,
    street_address,
    postal_code
    country
    FROM departments JOIN locations USING (location_id)
    ORDER BY department_name desc;
    
-- Question 6
SELECT 
    first_name || ' / ' || last_name AS "First / Last",
    hire_date,
    salary,
    department_name
    FROM employees JOIN departments USING (department_id)
    WHERE upper(department_name) like 'A%' OR upper(department_name) like 'S%'
    ORDER BY department_name, last_name;
    
-- Question 7 
SELECT 
    first_name||', '||last_name as "Last, First",
    department_name,
    city,
    postal_code,
    state_province
    FROM employees e JOIN departments d USING (manager_id) JOIN locations USING (location_id)
    WHERE upper(state_province) IN ('ONTARIO', 'NEW JERSEY', 'WASHINGTON')
    ORDER BY city, department_name;
    
-- Question 8
SELECT 
    department_name,
    max(salary) as "HIGH",
    min(salary) "LOW",
    avg(salary) as "AVG"
    FROM departments JOIN employees USING (manager_id)
    GROUP BY department_name
    ORDER BY "AVG" desc;
    
-- Question 9
SELECT 
    e.last_name as "Employee",
    e.employee_id as "Emp#",
    m.last_name as "Manager",
    m.manager_id as "Mgr#"
    FROM employees e LEFT OUTER JOIN employees m ON (e.manager_id = m.employee_id);
    

    
--SELECT * FROM departments;
--SELECT * FROM locations;
--SELECT * FROM employees;

