-- ASSIGNMENT 9

-- TASK 1: For each invoice, list the invoice number and invoice date
-- along with the ID, first name, and last name of the customer for 
-- which the invoice was created. 
SELECT I.INVOICE_NUM, I.INVOICE_DATE, C.CUST_ID, C.FIRST_NAME, C.LAST_NAME
FROM INVOICES I, CUSTOMER C
WHERE I.CUST_ID = C.CUST_ID;

-- TASK 2: For each invoice placed on November 15, 2021,
-- list the invoice number along with the ID, first name,
-- and last name of the customer for which the invoice was created. 
SELECT I.INVOICE_NUM, C.FIRST_NAME, C.LAST_NAME, C.CUST_ID
FROM INVOICES I, CUSTOMER C
WHERE I.CUST_ID = C.CUST_ID
AND I.INVOICE_DATE = '2021-11-15';

-- TASK 3: For each invoice, list the invoice number, invoice date,
-- item ID, quantity ordered, and quoted price for each 
-- invoice line that makes up the invoice. 
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, QUANTITY, QUOTED_PRICE
FROM INVOICES I, INVOICE_LINE IL
WHERE I.INVOICE_NUM = IL.INVOICE_NUM;

-- TASK 4: Use the IN operator to find the ID, first name,
-- and last name of each customer for which as invoice
-- was created on November 15, 2021. 
SELECT I.CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER C, INVOICES I
WHERE INVOICE_DATE IN('2021-11-15');

-- TASK 5: Repeat Task 4, but this time use the EXISTS operator in your answer. 
SELECT CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER
WHERE EXISTS(SELECT * FROM INVOICE_LINE, INVOICES
	WHERE INVOICES.CUST_ID = CUSTOMER.CUST_ID
	AND INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM);

-- TASK 6: Find the ID, first name, and last name of each customer 
-- for which an invoice was not created on November 15, 2021. 
SELECT C.CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER C, INVOICES I
WHERE C.CUST_ID = I.CUST_ID AND I.INVOICE_DATE <> '2021-11-15';

-- TASK 7: For each invoice, list the invoice number, invoice date,
-- item ID, description, and category for each item that makes up the invoice. 
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, IT.DESCRIPTION, IT.CATEGORY
FROM INVOICES I, INVOICE_LINE IL, ITEM IT
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
AND IL.ITEM_ID = IT.ITEM_ID;

-- TASK 8: Repeat Task 7, but this time order the rows
-- by category and then by invoice number
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, IT.DESCRIPTION, IT.CATEGORY
FROM INVOICES I, INVOICE_LINE IL, ITEM IT
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
AND IL.ITEM_ID = IT.ITEM_ID
ORDER BY CATEGORY, INVOICE_NUM;

-- TASK 9: Use a subquery to find the sales rep ID,
-- first name, and last name of each sales rep who represents
-- at least one customer with a credit limit of $500. 
-- List each sales rep only once in the results. 
SELECT REP_ID, FIRST_NAME, LAST_NAME
FROM SALES_REP
WHERE EXISTS(SELECT * FROM CUSTOMER
WHERE SALES_REP.REP_ID = CUSTOMER.REP_ID
AND CREDIT_LIMIT = 500);