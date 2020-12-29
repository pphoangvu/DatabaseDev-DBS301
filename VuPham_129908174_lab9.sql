-- ***********************
-- Name: Vu Pham
-- ID: 129908174
-- Date: 03-25-2019
-- Purpose: Lab 9 DBS301 
-- ***********************
-- Question 1
CREATE TABLE L09SalesRep (
    RepId			NUMBER(6),	
    FName			VARCHAR2(20),    
    LName			VARCHAR2(25),   
    Phone#			VARCHAR2(20),        
    Salary			NUMBER(8,2),                            
    Commission		NUMBER(2,2)
   
);


INSERT INTO L09SalesRep 
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    phone_number, 
    salary, 
    commission_pct 
    FROM employees
WHERE department_id = 80;


-- Question 2
CREATE TABLE L09Cust (
   CUST#	  	NUMBER(6),
   CUSTNAME 	VARCHAR2(30),
   CITY 		VARCHAR2(20),
   RATING		CHAR(1),
   COMMENTS	VARCHAR2(200),
   SALESREP#	NUMBER(7) );

INSERT INTO L09Cust VALUES( 501, 'ABC LTD.', 'Montreal', 'C', '',	201);
INSERT INTO L09Cust VALUES( 502, 'Black Giant', 'Ottawa', 'B', '',	202);
INSERT INTO L09Cust VALUES( 503, 'Mother Goose', 'London', 'B', '',	202);
INSERT INTO L09Cust VALUES( 701, 'BLUE SKY LTD', 'Vancouver', 'B', '',	102);
INSERT INTO L09Cust VALUES( 702, 'MIKE and SAM Inc.', 'Kingston', 'A', '',	107);
INSERT INTO L09Cust VALUES( 703, 'RED PLANET', 'Mississauga', 'C', '',	107);
INSERT INTO L09Cust VALUES( 717, 'BLUE SKY LTD ', 'Regina', 'D', '',	102);

-- Question 3
CREATE TABLE L09GoodCust (
    CustId		NUMBER	(6),
    Name		VARCHAR2(30),    
    Location	VARCHAR2(20),   
    RepId		NUMBER(7)    	  
);

INSERT INTO L09GoodCust
SELECT 
    CUST#,
    CUSTNAME,
    CITY,
    SALESREP#
    FROM L09Cust
    WHERE upper(RATING) = 'A' OR upper(RATING) = 'B';
    
-- Question 4
ALTER TABLE L09SalesRep
    ADD JobCode VARCHAR2(12);

DESCRIBE L09SalesRep;

-- Question 5 
ALTER TABLE L09SalesRep
    MODIFY (salary NOT NULL, repid NOT NULL, fname VARCHAR2(37), lname NOT NULL);

DESCRIBE L09SalesRep;

--ALTER TABLE L09GoodCust
--MODIFY (location NULL, CustId NULL, name NULL, repid NULL);

-- Question 6
ALTER TABLE L09SalesRep
    DROP COLUMN jobcode;
    
-- Question 7
ALTER TABLE L09SalesRep
    ADD CONSTRAINT L09SalesRep_repid_pk PRIMARY KEY (repid);

ALTER TABLE L09GoodCust
    ADD CONSTRAINT L09GoodCust_CustId_pk PRIMARY KEY (CustId);
    
-- Question 8
ALTER TABLE L09SalesRep
    ADD CONSTRAINT L09SalesRep_phone#_uk UNIQUE (phone#);

ALTER TABLE L09GoodCust
    ADD CONSTRAINT L09GoodCust_name_uk UNIQUE (name);
   
   
-- Question 9 
ALTER TABLE L09SalesRep
    ADD CONSTRAINT L09SalesRep_salary_ck CHECK(salary >= 6000 AND salary <= 12000)
    ADD CONSTRAINT L09SalesRep_commission_ck CHECK(commission <= 0.5);

-- Question 10
--INSERT INTO L09GoodCust (repid)
--SELECT 
 -- repid 
 --FROM L09SalesRep;
    
-- It said cannot insert NULL because we alter the table to set repid to not null;

-- Question 11
-- Yes by alter the table with this command 
ALTER TABLE L09GoodCust
ADD CONSTRAINT L09GoodCust_RepId_FK 
FOREIGN KEY  (RepId)
REFERENCES L09SalesRep (RepId);

UPDATE L09GoodCust SET RepID = '';
-- Question 12
-- The FK is enable

-- Question 13
ALTER TABLE L09SalesRep
    DROP CONSTRAINT L09SalesRep_salary_ck;

ALTER TABLE L09SalesRep
    ADD CONSTRAINT L09SalesRep_salary_ck CHECK(salary >= 5000 AND salary <= 15000);
   
   
-- Question 14
SELECT  constraint_name, constraint_type, search_condition, table_name
FROM     user_constraints
WHERE upper(table_name) IN ('L09SALESREP','L09GOODCUST')
ORDER  BY  4 , 2;





    
    





    
    

