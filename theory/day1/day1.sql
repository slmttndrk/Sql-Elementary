
-- SQL NULL Values; 

/*
A field with a NULL value is a field with no value.

If a field in a table is optional, it is possible to insert a new record or update a record 
without adding a value to this field. Then, the field will be saved with a NULL value.
 
Note: A NULL value is different from a zero value or a field that contains spaces. 
A field with a NULL value is one that has been left blank during record creation!
*/



-- How to Test for NULL Values; 

/*
It is not possible to test for NULL values with comparison operators, such as =, <, or <>.

We will have to use the IS NULL and IS NOT NULL operators instead.
*/

SELECT column_names
FROM table_name
WHERE column_name IS NULL;

SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NULL;

SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;

-- The SQL UPDATE Statement; 

/*
The UPDATE statement is used to modify the existing records in a table.
*/


UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;

UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;

/*
Note: Be careful when updating records in a table! Notice the WHERE clause in the UPDATE 
statement. The WHERE clause specifies which record(s) that should be updated. If you 
omit the WHERE clause, all records in the table will be updated!
*/

UPDATE Customers
SET ContactName='Juan';

-- UPDATE Multiple Records; 

/*
It is the WHERE clause that determines how many records will be updated.

The following SQL statement will update the ContactName to "Juan" for all records 
where country is "Mexico"
*/

UPDATE Customers
SET ContactName='Juan'
WHERE Country='Mexico';

-- The SQL DELETE Statement; 

/*
The DELETE statement is used to delete existing records in a table.
*/

DELETE FROM table_name WHERE condition;

/*
Note: Be careful when deleting records in a table! Notice the WHERE clause 
in the DELETE statement. The WHERE clause specifies which record(s) should be deleted. 
If you omit the WHERE clause, all records in the table will be deleted!
*/

DELETE FROM table_name;

DELETE FROM Customers WHERE CustomerName='Alfreds Futterkiste';

DELETE FROM Customers;

-- The SQL SELECT TOP Clause; 

/*
The SELECT TOP clause is used to specify the number of records to return.

The SELECT TOP clause is useful on large tables with thousands of records. 
Returning a large number of records can impact performance.
*/

/*
Note: Not all database systems support the SELECT TOP clause. MySQL supports 
the LIMIT clause to select a limited number of records, while Oracle uses 
FETCH FIRST n ROWS ONLY and ROWNUM.
*/

-- SQL Server / MS Access Syntax;

SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;

SELECT TOP 3 * FROM Customers
WHERE Country='Germany';

SELECT TOP 50 PERCENT * FROM Customers;

-- MySQL  Syntax;

SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;

SELECT * FROM Customers
WHERE Country='Germany'
LIMIT 3;

-- Oracle 12 Syntax;

SELECT column_name(s)
FROM table_name
ORDER BY column_name(s)
FETCH FIRST number ROWS ONLY;

SELECT * FROM Customers
WHERE Country='Germany'
FETCH FIRST 3 ROWS ONLY;

SELECT * FROM Customers
FETCH FIRST 50 PERCENT ROWS ONLY;

-- The SQL MIN() and MAX() Functions;

/*
The MIN() function returns the smallest value of the selected column.

The MAX() function returns the largest value of the selected column.
*/

SELECT MIN(column_name)
FROM table_name
WHERE condition;

SELECT MAX(column_name)
FROM table_name
WHERE condition;

SELECT MIN(Price) AS SmallestPrice
FROM Products;

SELECT MAX(Price) AS LargestPrice
FROM Products;

-- The SQL COUNT(), AVG() and SUM() Functions;

/*
The COUNT() function returns the number of rows that matches a specified criterion.
*/

SELECT COUNT(column_name)
FROM table_name
WHERE condition;

SELECT COUNT(ProductID)
FROM Products;

/*
Note: NULL values are not counted.
*/

/*
The AVG() function returns the average value of a numeric column.
*/

SELECT AVG(column_name)
FROM table_name
WHERE condition;

SELECT AVG(Price)
FROM Products;

/*
Note: NULL values are ignored.
*/

/*
The SUM() function returns the total sum of a numeric column. 
*/

SELECT SUM(column_name)
FROM table_name
WHERE condition;

SELECT SUM(Quantity)
FROM OrderDetails;

/*
Note: NULL values are ignored.
*/

-- The SQL LIKE Operator;

/*
The LIKE operator is used in a WHERE clause to search for a specified pattern in a column.

There are two wildcards often used in conjunction with the LIKE operator:

    The percent sign (%) represents zero, one, or multiple characters
    The underscore sign (_) represents one, single character

The percent sign and the underscore can also be used in combinations!

Tip: You can also combine any number of conditions using AND or OR operators.
*/

SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;

/*
LIKE Operator						Description
=============						===========
WHERE CustomerName LIKE 'a%'		Finds any values that start with "a"
WHERE CustomerName LIKE '%a'		Finds any values that end with "a"
WHERE CustomerName LIKE '%or%'		Finds any values that have "or" in any position
WHERE CustomerName LIKE '_r%'		Finds any values that have "r" in the second position
WHERE CustomerName LIKE 'a_%'		Finds any values that start with "a" and are at least 2 
									characters in length
WHERE CustomerName LIKE 'a__%'		Finds any values that start with "a" and are at least 3 
									characters in length
WHERE ContactName LIKE 'a%o'		Finds any values that start with "a" and ends with "o"
*/

SELECT * FROM Customers
WHERE CustomerName LIKE 'a%';

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

-- SQL Wildcard Characters;

/*
A wildcard character is used to substitute one or more characters in a string.

Wildcard characters are used with the LIKE operator. The LIKE operator is used in a WHERE 
clause to search for a specified pattern in a column.
*/

/*
WC	Description											Example
== ===========                                         =======
%	zero or more characters								bl% finds bl, black, blue, and blob
_	a single character									h_t finds hot, hat, and hit
[]	any single character within the brackets			h[oa]t finds hot and hat, but not hit
^	any character not in the brackets					h[^oa]t finds hit, but not hot and hat
-	any single character within the specified range		c[a-b]t finds cat and cbt
*/

SELECT * FROM Customers
WHERE City LIKE '%es%';

SELECT * FROM Customers
WHERE City LIKE 'L_n_on';

SELECT * FROM Customers
WHERE City LIKE '[a-c]%';

SELECT * FROM Customers
WHERE City NOT LIKE '[bsp]%';

-- The SQL IN Operator;

/*
The IN operator allows you to specify multiple values in a WHERE clause.

The IN operator is a shorthand for multiple OR conditions.
*/

SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);

/*
The following SQL statement selects all customers that are located in "Germany", "France" or "UK"
*/

SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK');

/*
The following SQL statement selects all customers that are from the same countries as the suppliers
*/

SELECT * FROM Customers
WHERE Country IN (SELECT Country FROM Suppliers);

