-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 04-02-2019
-- Purpose: Lab 10 DBS301 
-- ***********************
-- Question 1
CREATE TABLE L10Cities  AS (SELECT * FROM locations WHERE location_id < 2000);

DESCRIBE L10Cities;

SELECT * FROM L10Cities;

-- Question 2
CREATE TABLE L10Towns  AS (SELECT * FROM locations WHERE location_id < 1500);

DESCRIBE L10Towns;

SELECT * FROM L10Towns;

-- Question 3
SHOW RecycleBin;

PURGE RecycleBin;

--Flashback RecycleBin;

DROP TABLE L10Towns;

-- Question 4
FLASHBACK TABLE L10Towns TO BEFORE DROP;

SHOW RecycleBin;

-- Question 5
DROP TABLE L10Towns;

SHOW RecycleBin;

PURGE TABLE L10Towns;

SHOW RecycleBin;

-- purge means that you delete the table without permision to restore it, therefore cannot see in the recyclebin or restore

-- Question 6
CREATE VIEW CAN_CITY_VU AS 
    (SELECT 
        street_address, 
        postal_code, 
        city, 
        state_province 
        FROM L10Cities 
        WHERE UPPER(country_id) = 'CA');

SELECT * FROM CAN_CITY_VU;

-- Question 7
CREATE OR REPLACE VIEW CAN_CITY_VU AS 
    (SELECT 
        street_address AS "Str_Adr", 
        postal_code AS "P_Code", 
        city AS "City", 
        state_province AS "Prov" 
        FROM L10Cities 
        WHERE UPPER(country_id) = 'CA');

SELECT * FROM CAN_CITY_VU;

-- Question 8
CREATE OR REPLACE VIEW vwCity_DName_VU AS 
    (SELECT 
        department_name, 
        city, 
        state_province 
        FROM locations FULL JOIN departments USING (location_id)
        WHERE UPPER(country_id) IN ('IT', 'CA'));
        
    
SELECT * FROM vwCity_DName_VU;

-- Question 9
CREATE OR REPLACE VIEW vwCity_DName_VU AS 
    (SELECT 
        department_name AS "DName", 
        city AS "City", 
        state_province AS "Prov" 
        FROM locations FULL JOIN departments USING (location_id)
        WHERE UPPER(country_id) NOT IN ('US'));

SELECT * FROM vwCity_DName_VU;

-- Question 10

SELECT * FROM ALL_OBJECTS WHERE object_type = 'VIEW' AND upper(object_name) = 'VWCITY_DNAME_VU';

DROP VIEW vwCity_DName_VU;

SELECT * FROM ALL_OBJECTS WHERE object_type = 'VIEW' AND upper(object_name) = 'VWCITY_DNAME_VU';
-- it is disapear from the Data Dictionary 


