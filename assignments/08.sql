-- ASSIGNMENT 08


-- TASK 1: Find the ID, first name, and last name of each customer whose 
-- first name begins with the letter “S.” 
SELECT CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER
WHERE FIRST_NAME LIKE 'S%';

-- TASK 2: List all details about all items. Order the output by description. 
SELECT *
FROM ITEM
ORDER BY DESCRIPTION;

-- TASK 3: List all details about all items. 
-- Order the output by item ID within location. 
-- (That is, order the output by location and then by item ID.) 
SELECT *
FROM ITEM
ORDER BY ITEM_ID, LOCATION;

-- TASK 4: How many customers have balances that are more than their credit limits? 
SELECT COUNT(*)
FROM CUSTOMER
WHERE BALANCE > CREDIT_LIMIT;

-- TASK 5: Find the total of the balances for all customers represented
-- by sales rep 10 with balances that are less than their credit limits. 
SELECT SUM(BALANCE)
FROM CUSTOMER
WHERE BALANCE < CREDIT_LIMIT
AND REP_ID = '10';

-- TASK 6: List the item ID, description, and on-hand value 
-- of each item whose number of units on hand is more than the 
-- average number of units on hand for all items. 
SELECT ITEM_ID, DESCRIPTION, ON_HAND * PRICE AS ON_HAND_VALUE
FROM ITEM
WHERE ON_HAND > (SELECT AVG(ON_HAND) FROM ITEM);

-- TASK 7: What is the price of the least expensive item in the database? 
SELECT MIN(PRICE)
FROM ITEM;

-- TASK 8: What is the item ID, description, 
-- and price of the least expensive item in the database?
SELECT ITEM_ID, DESCRIPTION, PRICE
FROM ITEM
WHERE PRICE = (SELECT MIN(PRICE) FROM ITEM);

-- TASK 9: List the sum of the balances of all customers for each sales rep. 
-- Order and group the results by sales rep ID. 
SELECT REP_ID, SUM(BALANCE) AS TOTAL_BALANCE
FROM CUSTOMER
GROUP BY REP_ID
ORDER BY REP_ID;

-- TASK 10: List the sum of the balances of all customers for each 
-- sales rep but restrict the output to those sales reps for which 
-- the sum is more than $150. Order the results by sales rep ID
SELECT REP_ID, SUM(BALANCE) AS TOTAL_BALANCE
FROM CUSTOMER
GROUP BY REP_ID
HAVING SUM(BALANCE) > 150 
ORDER BY REP_ID;

-- TASK 11: List the item ID of any item with an unknown description. 
SELECT ITEM_ID
FROM ITEM
WHERE DESCRIPTION IS NULL OR DESCRIPTION = '';

-- TASK 12: List the item ID and description of 
-- all items that are in the DOG or CAT category 
-- and contain the word “Small” in the description. 
SELECT ITEM_ID, DESCRIPTION, CATEGORY
FROM ITEM
WHERE CATEGORY IN ('DOG','CAT')
AND DESCRIPTION LIKE '%Small%';