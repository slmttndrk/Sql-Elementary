
-- SQL LEFT JOIN Keyword;

/*
The LEFT JOIN keyword returns all records from the left table (table1), and the matching records 
from the right table (table2). The result is 0 records from the right side, if there is no 
match.
*/

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName;

-- SQL RIGHT JOIN Keyword;

/*
The RIGHT JOIN keyword returns all records from the right table (table2), and the matching 
records from the left table (table1). The result is 0 records from the left side, if there 
is no match.
*/

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;

-- SQL FULL OUTER JOIN Keyword;

/*
The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or 
right (table2) table records.

Tip: FULL OUTER JOIN and FULL JOIN are the same.
Note: FULL OUTER JOIN can potentially return very large result-sets!
*/


SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;

SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.CustomerName;

/*
Note: The FULL OUTER JOIN keyword returns all matching records from both tables whether 
the other table matches or not. So, if there are rows in "Customers" that do not have matches 
in "Orders", or if there are rows in "Orders" that do not have matches in "Customers", those 
rows will be listed as well.
*/

-- SQL Self Join;

/*
A self join is a regular join, but the table is joined with itself.
*/

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

/*
The following SQL statement matches customers that are from the same city:
*/

SELECT A.CustomerName AS CustomerName1, B.CustomerName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
AND A.City = B.City
ORDER BY A.City;

-- The SQL UNION Operator;

/*
The UNION operator is used to combine the result-set of two or more SELECT statements.

Every SELECT statement within UNION must have the same number of columns
The columns must also have similar data types
The columns in every SELECT statement must also be in the same order
*/

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;

/*
The UNION operator selects only distinct values by default. To allow duplicate values, 
use UNION ALL
*/

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;

/*
Note: The column names in the result-set are usually equal to the column names in the 
first SELECT statement.

The following SQL statement returns the cities (only distinct values) from both the 
"Customers" and the "Suppliers" table
*/

SELECT City FROM Customers
UNION
SELECT City FROM Suppliers
ORDER BY City;

SELECT City FROM Customers
UNION ALL
SELECT City FROM Suppliers
ORDER BY City;

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Suppliers
WHERE Country='Germany'
ORDER BY City;

SELECT 'Customer' AS Type, ContactName, City, Country
FROM Customers
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Suppliers;

/*
Notice the "AS Type" above - it is an alias. SQL Aliases are used to give a table or a column
a temporary name. An alias only exists for the duration of the query. So, here we have created 
a temporary column named "Type", that list whether the contact person is a "Customer" or a 
"Supplier".
*/

