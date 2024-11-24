-- ASSIGNMENT 7

-- TASK 1: List the item ID, description, and price for all items. 
SELECT ITEM_ID, DESCRIPTION, PRICE
FROM ITEM;

-- TASK 2: List all rows and columns for the complete INVOICES table. 
SELECT * FROM INVOICES;

-- TASK 3: List the first and last names of customers 
-- with credit limits of $1,000 or more. 
SELECT FIRST_NAME, LAST_NAME
FROM CUSTOMER
WHERE CREDIT_LIMIT >= '1000';

-- TASK 4: List the order number for each order
-- placed by customer number 125 on 11/15/2021
SELECT INVOICE_NUM
FROM INVOICES
WHERE CUST_ID = '125' AND INVOICE_DATE = '2021-11-15';

-- TASK 5: List the number and name of each customer represented
-- by sales rep 10 or sales rep 15
SELECT CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER
WHERE REP_ID = '10' OR REP_ID = '15';

-- TASK 6: List the item ID and description of each item that is not in category HOR.
SELECT ITEM_ID, DESCRIPTION
FROM ITEM
WHERE CATEGORY <> 'HOR';

-- TASK 7: List the item ID, description, and number of units on hand
-- for each item that has between 10 and 30 units on hand, including 
-- both 10 and 30. Provide two alternate SQL 
-- statements to produce the same results. 
SELECT ITEM_ID, DESCRIPTION, ON_HAND
FROM ITEM
WHERE ON_HAND BETWEEN 10 AND 30;

-- TASK 8: List the item ID, description, and on-hand value 
-- (units on hand * unit price) of each item in category CAT.
-- (On-hand value is technically units on hand * cost, but there is
-- no COST column in the ITEM table.) Assign the name 
-- ON_HAND_VALUE to the computed column. 
SELECT ITEM_ID, DESCRIPTION, (ON_HAND * PRICE) AS ON_HAND_VALUE
FROM ITEM
WHERE CATEGORY = 'CAT';

-- TASK 9: List the item ID, description, and on-hand value
-- for each item where the on-hand value is at least $1,500.
-- Assign the name ON_HAND_VALUE to the computed column
SELECT ITEM_ID, DESCRIPTION, ON_HAND * PRICE AS ON_HAND_VALUE
FROM ITEM
WHERE ON_HAND * PRICE >= 1500;

-- TASK 10: List the item ID, description, and on-hand value for
-- each item where the on-hand value is at least $1,500. 
-- Assign the name ON_HAND_VALUE to the computed column.
SELECT ITEM_ID, DESCRIPTION
FROM ITEM
WHERE CATEGORY IN ('FSH', 'BRD');