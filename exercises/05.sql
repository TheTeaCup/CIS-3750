CREATE TABLE table1
(
   vcode SMALLINT PRIMARY KEY,
   name VARCHAR(10)
);

insert into table1 values(7, 'Alex');
insert into table1 values(8, 'Tony');
insert into table1 values(9, 'Charles');
insert into table1 values(11, 'Mary');
insert into table1 values(13, 'John');

CREATE TABLE table2
(
   scode SMALLINT PRIMARY KEY,
   vcode SMALLINT,
   rcode SMALLINT,
   total SMALLINT,
);

insert into table2 values(341, 9, 7, 102);
insert into table2 values(213, 11, 4, 59);
insert into table2 values(312, 7, 8, 89);

SELECT * FROM table1;
SELECT * FROM table2;

-- USING JOIN FOR MULTIPLE TABLE QUERY
SELECT *
FROM table1 JOIN table2 ON table1.vcode = table2.vcode;

SELECT *
FROM table1 INNER JOIN table2 ON table1.vcode = table2.vcode;
SELECT * FROM table1;
SELECT * FROM table2;

-- USING LEFT JOIN
SELECT *
FROM table1 LEFT JOIN table2 ON table1.vcode = table2.vcode;

-- USING RIGHT JOIN
SELECT * 
FROM table2 RIGHT JOIN table1 ON table2.vcode = TABLE1.vcode;

