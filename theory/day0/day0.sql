-- Here we go!

-- SQL;

/*
Although SQL is an ANSI/ISO standard, there are different versions of the SQL language.
However, to be compliant with the ANSI standard, they all support at least the major commands 
(such as SELECT, UPDATE, DELETE, INSERT, WHERE) in a similar manner.
*/

-- RDBMS;

/*
RDBMS stands for Relational Database Management System.
RDBMS is the basis for SQL, and for all modern database systems such as MS SQL Server, IBM DB2, 
Oracle, MySQL, and Microsoft Access. The data in RDBMS is stored in database objects called tables. 
*/

-- Table;

/*
A table is a collection of related data entries and it consists of columns and rows.
Look at the "Customers" table:
*/

SELECT * FROM Customers;

/*
Every table is broken up into smaller entities called fields. The fields in the Customers table 
consist of CustomerID, CustomerName, ContactName, Address, City, PostalCode and Country. 
*/

-- Field;

/*
A field is a column in a table that is designed to maintain specific information about every record 
in the table.
*/

-- Record;

/*
A record, also called a row, is each individual entry that exists in a table. For example, 
there are 91 records in the above Customers table. 
A record is a horizontal entity in a table.
A column is a vertical entity in a table that contains all information associated with a 
specific field in a table.
*/

/*
A database most often contains one or more tables. Each table is identified by a name 
(e.g. "Customers" or "Orders"). Tables contain records (rows) with data.
*/

-- SQL Statements

/*
Most of the actions you need to perform on a database are done with SQL statements.
The following SQL statement selects all the records in the "Customers" table:
*/

SELECT * FROM Customers;

/*
SQL keywords are NOT case sensitive: select is the same as SELECT
*/

/*
Some database systems require a semicolon at the end of each SQL statement.
Semicolon is the standard way to separate each SQL statement in database systems that allow 
more than one SQL statement to be executed in the same call to the server.
*/

/*
Some of The Most Important SQL Commands;

SELECT 				- extracts data from a database
UPDATE 				- updates data in a database
DELETE 				- deletes data from a database
INSERT INTO 			- inserts new data into a database
CREATE DATABASE 		- creates a new database
ALTER DATABASE 		- modifies a database
CREATE TABLE 			- creates a new table
ALTER TABLE 			- modifies a table
DROP TABLE 			- deletes a table
CREATE INDEX 			- creates an index (search key)
DROP INDEX 			- deletes an index
*/

-- The SQL SELECT Statement;

/*
The SELECT statement is used to select data from a database.
The data returned is stored in a result table, called the result-set.
*/

SELECT column1, column2, ...
FROM table_name;

/*
Here, column1, column2, ... are the field names of the table you want to 
select data from. If you want to select all the fields available in the 
table, use the following syntax
*/

SELECT * FROM table_name;

/*
The following SQL statement selects the "CustomerName" and "City" columns 
from the "Customers" table:
*/

SELECT CustomerName, City FROM Customers;

/*
The following SQL statement selects all the columns from the "Customers" table
*/

-- The SQL SELECT DISTINCT Statement;

/*
The SELECT DISTINCT statement is used to return only distinct (different) values.
Inside a table, a column often contains many duplicate values; and sometimes you 
only want to list the different (distinct) values.
*/

SELECT DISTINCT column1, column2, ...
FROM table_name;

/*
The following SQL statement selects only the DISTINCT values from the 
"Country" column in the "Customers" table
*/

SELECT DISTINCT Country FROM Customers;

-- The SQL WHERE Clause;

/*
The WHERE clause is used to filter records.
It is used to extract only those records that fulfill a specified condition.
*/

SELECT column1, column2, ...
FROM table_name
WHERE condition;

/*
Note: The WHERE clause is not only used in SELECT statements, it is also 
used in UPDATE, DELETE, etc.!
*/


/*
The following SQL statement selects all the customers from the country "Mexico", 
in the "Customers" table
*/

SELECT * FROM Customers
WHERE Country='Mexico';

-- Text Fields vs. Numeric Fields

/*
SQL requires single quotes around text values (most database systems will also 
allow double quotes).
However, numeric fields should not be enclosed in quotes
*/

-- Operators in The WHERE Clause;

/*
Operator	Description	Example
========    ===================
=			Equal	
>			Greater than	
<			Less than	
>=			Greater than or equal	
<=			Less than or equal	
<>			Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	Between a certain range	
LIKE		Search for a pattern	
IN			To specify multiple possible values for a column
*/

SELECT * FROM Products
WHERE Price <> 18;

-- The SQL AND, OR and NOT Operators;

/*
The WHERE clause can be combined with AND, OR, and NOT operators.

The AND and OR operators are used to filter records based on more than one condition:

The AND operator displays a record if all the conditions separated by AND are TRUE.
The OR operator displays a record if any of the conditions separated by OR is TRUE.
The NOT operator displays a record if the condition(s) is NOT TRUE.
*/

SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;

SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;

/*
The following SQL statement selects all fields from "Customers" where country 
is "Germany" AND city is "Berlin"
*/

SELECT * FROM Customers
WHERE Country='Germany' AND City='Berlin';

/*
The following SQL statement selects all fields from "Customers" where city 
is "Berlin" OR "München"
*/

SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

/*
The following SQL statement selects all fields from "Customers" where country 
is NOT "Germany"
*/

SELECT * FROM Customers
WHERE NOT Country='Germany';

-- Combining AND, OR and NOT;

/*
You can also combine the AND, OR and NOT operators.

The following SQL statement selects all fields from "Customers" where country 
is "Germany" AND city must be "Berlin" OR "München" 
(use parenthesis to form complex expressions)
*/

SELECT * FROM Customers
WHERE Country='Germany' AND (City='Berlin' OR City='München');

/*
The following SQL statement selects all fields from "Customers" where country 
is NOT "Germany" and NOT "USA"
*/

SELECT * FROM Customers
WHERE NOT Country='Germany' AND NOT Country='USA';

-- The SQL ORDER BY Keyword;

/*
The ORDER BY keyword is used to sort the result-set in ascending or descending order.

The ORDER BY keyword sorts the records in ascending order by default. To sort the 
records in descending order, use the DESC keyword.
*/

SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;

/*
The following SQL statement selects all customers from the "Customers" table, 
sorted by the "Country" column
*/

SELECT * FROM Customers
ORDER BY Country;

/*
The following SQL statement selects all customers from the "Customers" table, 
sorted DESCENDING by the "Country" column
*/

SELECT * FROM Customers
ORDER BY Country DESC;

-- ORDER BY Several Columns;

/*
The following SQL statement selects all customers from the "Customers" table, 
sorted by the "Country" and the "CustomerName" column. This means that it orders 
by Country, but if some rows have the same Country, it orders them by CustomerName
*/

SELECT * FROM Customers
ORDER BY Country, CustomerName;

/*
The following SQL statement selects all customers from the "Customers" table, 
sorted ascending by the "Country" and descending by the "CustomerName" column
*/

SELECT * FROM Customers
ORDER BY Country ASC, CustomerName DESC;

-- The SQL INSERT INTO Statement;

/*
The INSERT INTO statement is used to insert new records in a table.

It is possible to write the INSERT INTO statement in two ways:
1. Specify both the column names and the values to be inserted
*/

INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

/*
2. If you are adding values for all the columns of the table, you do not need 
to specify the column names in the SQL query. However, make sure the order of 
the values is in the same order as the columns in the table.
*/

INSERT INTO table_name
VALUES (value1, value2, value3, ...);

/*
The following SQL statement inserts a new record in the "Customers" table
*/

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

/*
The CustomerID column is an auto-increment field and will be generated automatically 
when a new record is inserted into the table.
*/

-- Insert Data Only in Specified Columns;

/*
It is also possible to only insert data in specific columns.
The following SQL statement will insert a new record, but only insert data in 
the "CustomerName", "City", and "Country" columns (CustomerID will be updated automatically)
*/

INSERT INTO Customers (CustomerName, City, Country)
VALUES ('Cardinal', 'Stavanger', 'Norway');

-- Empty columns will have "null" value;
