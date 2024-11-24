-- ASSIGNMENT 10

-- TASK 1: Find the ID, first name, and last name of each customer
-- that currently has an invoice on file for Wild Bird Food (25 lb).
SELECT CUSTOMER.CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER, INVOICES, INVOICE_LINE, ITEM
WHERE CUSTOMER.CUST_ID = INVOICES.CUST_ID
	AND INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
	AND INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID
	AND ITEM.DESCRIPTION = 'Wild Bird Food (25 lb)';

-- TASK 2: List the invoice number and invoice date for each invoice
-- created for the customer James Gonzalez.
SELECT INVOICE_NUM, INVOICE_DATE
FROM INVOICES
WHERE CUST_ID IN(SELECT CUST_ID
	FROM CUSTOMER
	WHERE FIRST_NAME = 'James'
	AND LAST_NAME = 'Gonzalez');

-- TASK 3: List the invoice number and invoice date 
-- for each invoice that contains an invoice line for a Wild Bird Food (25 lb).
SELECT INVOICES.INVOICE_NUM, INVOICES.INVOICE_DATE, ITEM.DESCRIPTION
FROM INVOICES, INVOICE_LINE, ITEM
WHERE INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
	AND ITEM.ITEM_ID = INVOICE_LINE.ITEM_ID
	AND ITEM.DESCRIPTION = 'Wild Bird Food (25 lb)';

-- TASK 4: List the invoice number and invoice date 
-- for each invoice that either was created for James Gonzalez 
-- or that contains an invoice line for Wild Bird Food (25lb).
SELECT DISTINCT INVOICES.INVOICE_NUM, INVOICE_DATE
FROM INVOICES, INVOICE_LINE, ITEM, CUSTOMER
WHERE INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
	AND INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID
	AND INVOICES.CUST_ID = CUSTOMER.CUST_ID
	AND (ITEM.DESCRIPTION = 'Wild Bird Food (25 lb)' 
	OR (CUSTOMER.FIRST_NAME = 'James' AND CUSTOMER.LAST_NAME = 'Gonzalez'));

SELECT DISTINCT INVOICES.INVOICE_NUM, INVOICE_DATE
FROM INVOICES
JOIN CUSTOMER ON INVOICES.CUST_ID = CUSTOMER.CUST_ID
LEFT JOIN INVOICE_LINE ON INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
LEFT JOIN ITEM ON INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID
WHERE CUSTOMER.FIRST_NAME = 'James' AND CUSTOMER.LAST_NAME = 'Gonzalez'
OR ITEM.DESCRIPTION = 'Wild Bird Food (25 lb)';

-- TASK 5: List the invoice number and invoice date 
-- for each invoice that was created for James Gonzalez 
-- and that contains an invoice line for Wild Bird Food (25lb).
SELECT DISTINCT INVOICES.INVOICE_NUM, INVOICES.INVOICE_DATE
FROM INVOICES
JOIN CUSTOMER ON INVOICES.CUST_ID = CUSTOMER.CUST_ID
JOIN INVOICE_LINE ON INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
JOIN ITEM ON INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID
WHERE CUSTOMER.FIRST_NAME = 'James'
	AND CUSTOMER.LAST_NAME = 'Gonzalez'
	AND ITEM.DESCRIPTION = 'Wild Bird Food (25 lb)';

-- TASK 6: List the invoice number and invoice date 
-- for each invoice that was created for James Gonzalez 
-- but that does not contain an invoice line for Wild Bird Food (25lb).
SELECT DISTINCT INVOICES.INVOICE_NUM, INVOICES.INVOICE_DATE
FROM INVOICES, INVOICE_LINE, ITEM, CUSTOMER
WHERE INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM
	AND INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID
	AND INVOICES.CUST_ID = CUSTOMER.CUST_ID
	AND DESCRIPTION <> 'Wild Bird Food (25 lb)'
	AND FIRST_NAME = 'James'
	AND LAST_NAME = 'Gonzalez';

-- TASK 7: List the item ID, description, unit price, and category 
-- for each item that has a unit price greater than the 
-- unit price of every item in category CAT. Use the ALL operator in your query.
SELECT ITEM_ID, DESCRIPTION, PRICE, CATEGORY
FROM ITEM
WHERE PRICE > ALL(SELECT PRICE FROM ITEM WHERE CATEGORY = 'CAT');

-- TASK 8: For each item, list the item ID, description, 
-- units on hand, invoice number, and quantity ordered. 
-- All items should be included in the results. 
-- For those items that are currently not on an invoice, 
-- the invoice number and quantity ordered should be left blank.
-- Order the results by item ID.
SELECT ITEM.ITEM_ID, ITEM.DESCRIPTION, ITEM.ON_HAND, INVOICE_LINE.INVOICE_NUM, INVOICE_LINE.QUANTITY 
FROM ITEM
LEFT JOIN INVOICE_LINE ON (INVOICE_LINE.ITEM_ID = ITEM.ITEM_ID) ORDER BY ITEM_ID;

-- TASK 9: Repeat Task 7 using the ANY operator.
SELECT ITEM_ID, DESCRIPTION, PRICE, CATEGORY
FROM ITEM
WHERE PRICE > ANY (SELECT PRICE FROM ITEM WHERE CATEGORY = 'CAT');

-- TASK 10: or each sales rep, list the ID, first name, 
-- and last name for the customer, along with the sales rep first name, 
-- and sales rep last name. All reps should be included in the results. 
-- Order the results by rep ID 
SELECT SALES_REP.REP_ID, SALES_REP.FIRST_NAME AS REP_FIRST_NAME, SALES_REP.LAST_NAME AS REP_LAST_NAME, CUSTOMER.CUST_ID, CUSTOMER.FIRST_NAME AS CUST_FIRST_NAME, CUSTOMER.LAST_NAME AS CUST_LAST_NAME 
FROM CUSTOMER, SALES_REP
WHERE CUSTOMER.REP_ID = SALES_REP.REP_ID
ORDER BY REP_ID;