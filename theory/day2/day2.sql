
-- The SQL BETWEEN Operator; 

/*
The BETWEEN operator selects values within a given range. The values can be numbers, text, or 
dates.

The BETWEEN operator is inclusive: begin and end values are included. 
*/

SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price NOT BETWEEN 10 AND 20;

SELECT * FROM Products
WHERE Price BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

SELECT * FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- BETWEEN Dates;


/*
The following SQL statement selects all orders with an OrderDate between '01-July-1996' and 
'31-July-1996'
*/

SELECT * FROM Orders
WHERE OrderDate BETWEEN #07/01/1996# AND #07/31/1996#;

-- or

SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';

-- SQL Aliases;


/*
SQL aliases are used to give a table, or a column in a table, a temporary name.

Aliases are often used to make column names more readable.

An alias only exists for the duration of that query.

An alias is created with the AS keyword.
*/

-- Alias for Columns;

SELECT column_name AS alias_name
FROM table_name;

-- Alias for Tables;

SELECT column_name(s)
FROM table_name AS alias_name;

SELECT CustomerID AS ID, CustomerName AS Customer
FROM Customers;

/*
Note: It requires double quotation marks or square brackets if the alias name contains spaces
*/

SELECT CustomerName AS Customer, ContactName AS [Contact Person]
FROM Customers;

SELECT CustomerName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customers;

SELECT o.OrderID, o.OrderDate, c.CustomerName
FROM Customers AS c, Orders AS o
WHERE c.CustomerName='Around the Horn' AND c.CustomerID=o.CustomerID;

/*
Without aliases:

SELECT Orders.OrderID, Orders.OrderDate, Customers.CustomerName
FROM Customers, Orders
WHERE Customers.CustomerName='Around the Horn' AND Customers.CustomerID=Orders.CustomerID;
*/

/*
Aliases can be useful when:

    There are more than one table involved in a query
    Functions are used in the query
    Column names are big or not very readable
    Two or more columns are combined together
*/

-- SQL JOIN;


/*
A JOIN clause is used to combine rows from two or more tables, based on a related column between 
them.

The "CustomerID" column in the "Orders" table refers to the "CustomerID" in the "Customers" 
table. The relationship between the two tables above is the "CustomerID" column.

Then, we can create the following SQL statement (that contains an INNER JOIN), that selects 
records that have matching values in both tables
*/

SELECT Orders.OrderID, Customers.CustomerName, Orders.OrderDate
FROM Orders
INNER JOIN Customers ON Orders.CustomerID=Customers.CustomerID;

-- Different Types of SQL JOINs;


/*
(INNER) JOIN:         Returns records that have matching values in both tables
LEFT (OUTER) JOIN:    Returns all records from the left table, and the matched records from 
                      the right table
RIGHT (OUTER) JOIN:   Returns all records from the right table, and the matched records from 
                      the left table
FULL (OUTER) JOIN:    Returns all records when there is a match in either left or right table
*/

-- SQL INNER JOIN;


/*
The INNER JOIN keyword selects records that have matching values in both tables.
*/

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

/*
JOIN Three Tables
*/

SELECT Orders.OrderID, Customers.CustomerName, Shippers.ShipperName
FROM ((Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
INNER JOIN Shippers ON Orders.ShipperID = Shippers.ShipperID);
