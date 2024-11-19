-- ASSIGNMENT 9

-- TASK 1
SELECT I.INVOICE_NUM, I.INVOICE_DATE, C.CUST_ID, C.FIRST_NAME, C.LAST_NAME
FROM INVOICES I, CUSTOMER C
WHERE I.CUST_ID = C.CUST_ID;

-- TASK 2
SELECT I.INVOICE_NUM, C.FIRST_NAME, C.LAST_NAME, C.CUST_ID
FROM INVOICES I, CUSTOMER C
WHERE I.CUST_ID = C.CUST_ID
AND I.INVOICE_DATE = '2021-11-15';

-- TASK 3
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, QUANTITY, QUOTED_PRICE
FROM INVOICES I, INVOICE_LINE IL
WHERE I.INVOICE_NUM = IL.INVOICE_NUM;

-- TASK 4
SELECT I.CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER C, INVOICES I
WHERE INVOICE_DATE IN('2021-11-15');

-- TASK 5
SELECT CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER
WHERE EXISTS(SELECT * FROM INVOICE_LINE, INVOICES
	WHERE INVOICES.CUST_ID = CUSTOMER.CUST_ID
	AND INVOICES.INVOICE_NUM = INVOICE_LINE.INVOICE_NUM);

-- TASK 6
SELECT C.CUST_ID, FIRST_NAME, LAST_NAME
FROM CUSTOMER C, INVOICES I
WHERE C.CUST_ID = I.CUST_ID AND I.INVOICE_DATE <> '2021-11-15';

-- TASK 7
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, IT.DESCRIPTION, IT.CATEGORY
FROM INVOICES I, INVOICE_LINE IL, ITEM IT
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
AND IL.ITEM_ID = IT.ITEM_ID;

-- TASK 8
SELECT I.INVOICE_NUM, I.INVOICE_DATE, IL.ITEM_ID, IT.DESCRIPTION, IT.CATEGORY
FROM INVOICES I, INVOICE_LINE IL, ITEM IT
WHERE I.INVOICE_NUM = IL.INVOICE_NUM
AND IL.ITEM_ID = IT.ITEM_ID
ORDER BY CATEGORY, INVOICE_NUM;

-- TASK 9
SELECT REP_ID, FIRST_NAME, LAST_NAME
FROM SALES_REP
WHERE EXISTS(SELECT * FROM CUSTOMER
WHERE SALES_REP.REP_ID = CUSTOMER.REP_ID
AND CREDIT_LIMIT = 500);

-- TASK 10


-- TASK 11