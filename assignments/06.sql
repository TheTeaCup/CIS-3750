-- ASSIGNMENT #6

-- TASK #1 - CREATE NONCAT TABLE
CREATE TABLE NONCAT (
	ITEM_ID CHAR(4) PRIMARY KEY,
	DESCRIPTION CHAR(30),
	ON_HAND INT,
	CATEGORY CHAR(3),
	PRICE DECIMAL(5,2)
);

-- TASK #2 - INSERT NON CAT ITEMS FROM ITEM TABLE
INSERT INTO NONCAT (ITEM_ID,DESCRIPTION,ON_HAND,CATEGORY,PRICE)
SELECT ITEM_ID,DESCRIPTION,ON_HAND,CATEGORY,PRICE
FROM ITEM
WHERE CATEGORY <> 'CAT';

-- TASK #3 - CHANGE ITEM DT12 DESCRIPTION
UPDATE NONCAT
SET DESCRIPTION = 'Dog Toy Gift Bonanza'
WHERE ITEM_ID = 'DT12';

-- TASK #4 - INCREASE PRICE OF EACH BRD CATEGORY ITEM
UPDATE NONCAT
SET PRICE = PRICE * 1.05
WHERE CATEGORY = 'BRD';

-- TASK #5 - ADD NEW VALUES
INSERT INTO NONCAT VALUES('FF17', 'Premium Fish Food', 10, 'FSH', 11.95);

-- TASK #6 - DELETE HOR CATEGORY ITEMS
DELETE FROM NONCAT
WHERE CATEGORY = 'HOR';

-- TASK #7 - CHANGE ITEM UF39 CATEGORY TO NULL
UPDATE NONCAT
SET CATEGORY = NULL
WHERE ITEM_ID = 'UF39';

-- TASK #8 - ADD A NEW COLUMN
ALTER TABLE NONCAT
ADD ON_HAND_VALUE DECIMAL(7,2);

UPDATE NONCAT
SET ON_HAND_VALUE = ON_HAND*PRICE;

-- TASK #9 - UPDATE COLUMN DESCRIPTION
ALTER TABLE NONCAT
ALTER COLUMN DESCRIPTION CHAR(40);

-- TASK #10 - DROP NON CAT TABLE
DROP TABLE NONCAT;