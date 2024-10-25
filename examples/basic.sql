-- BASIC SQL EXAMPLES

-- Create a table
CREATE TABLE BASIC (
    ID CHAR(3) PRIMARY KEY,
    DESCRIPTION CHAR(30),
);

-- Insert data into the table
INSERT INTO BASIC VALUES('001','First');

-- Select data from the table
SELECT * FROM BASIC;

-- Update data in the table
UPDATE BASIC SET DESCRIPTION = 'Second' WHERE ID = '001';

-- ALTER TABLE
ALTER TABLE BASIC ADD COLUMN NAME CHAR(30);

-- Delete data from the table
DELETE FROM BASIC WHERE ID = '001';

-- Drop the table
DROP TABLE BASIC;