
-- The SQL SELECT INTO Statement;

/*
The SELECT INTO statement copies data from one table into a new table.
The new table will be created with the column-names and types as defined in the old table. 
You can create new column names using the AS clause.
*/

SELECT *
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT column1, column2, column3, ...
INTO newtable [IN externaldb]
FROM oldtable
WHERE condition;

SELECT * INTO CustomersBackup2017
FROM Customers;

/*
The following SQL statement uses the IN clause to copy the table into a new table in another 
database
*/

SELECT * INTO CustomersBackup2017 IN 'Backup.mdb'
FROM Customers;

SELECT CustomerName, ContactName INTO CustomersBackup2017
FROM Customers;

SELECT * INTO CustomersGermany
FROM Customers
WHERE Country = 'Germany';

SELECT Customers.CustomerName, Orders.OrderID
INTO CustomersOrderBackup2017
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID;

/*
Tip: SELECT INTO can also be used to create a new, empty table using the schema of another. 
Just add a WHERE clause that causes the query to return no data:
*/

SELECT * INTO newtable
FROM oldtable
WHERE 1 = 0;

-- The SQL INSERT INTO SELECT Statement;

/*
The INSERT INTO SELECT statement copies data from one table and inserts it into another 
table.

The INSERT INTO SELECT statement requires that the data types in source and target tables 
matches.

Note: The existing records in the target table are unaffected.
*/

INSERT INTO table2
SELECT * FROM table1
WHERE condition;

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;

/*
The columns that are not filled with data, will contain NULL
*/

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT SupplierName, ContactName, Address, City, PostalCode, Country FROM Suppliers;

INSERT INTO Customers (CustomerName, City, Country)
SELECT SupplierName, City, Country FROM Suppliers
WHERE Country='Germany';

-- The SQL CASE Statement;

/*
The CASE statement goes through conditions and returns a value when the first condition 
is met (like an if-then-else statement). So, once a condition is true, it will stop reading 
and return the result. If no conditions are true, it returns the value in the ELSE clause.

If there is no ELSE part and no conditions are true, it returns NULL.
*/

CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;

SELECT OrderID, Quantity,
CASE
    WHEN Quantity > 30 THEN 'The quantity is greater than 30'
    WHEN Quantity = 30 THEN 'The quantity is 30'
    ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetails;

SELECT CustomerName, City, Country
FROM Customers
ORDER BY
(CASE
    WHEN City IS NULL THEN Country
    ELSE City
END);

-- SQL ISNULL() Function;

SELECT ProductName, UnitPrice * (UnitsInStock + UnitsOnOrder)
FROM Products;

/*
In the example above, if any of the "UnitsOnOrder" values are NULL, the result will be NULL.

The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL
*/

SELECT ProductName, UnitPrice * (UnitsInStock + ISNULL(UnitsOnOrder, 0))
FROM Products;

-- SQL Stored Procedures for SQL Server;

/*
What is a Stored Procedure?
A stored procedure is a prepared SQL code that you can save, so the code can be reused over and 
over again.

So if you have an SQL query that you write over and over again, save it as a stored procedure, 
and then just call it to execute it.

You can also pass parameters to a stored procedure, so that the stored procedure can act based 
on the parameter value(s) that is passed.
*/

CREATE PROCEDURE procedure_name
AS
sql_statement
GO;

-- Execute a Stored Procedure;

EXEC procedure_name;

-- Example:

CREATE PROCEDURE SelectAllCustomers
AS
SELECT * FROM Customers
GO;

-- Execute:

EXEC SelectAllCustomers;

/*
Stored Procedure With One Parameter
*/

-- Example:

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30)
AS
SELECT * FROM Customers WHERE City = @City
GO;

-- Execute:

EXEC SelectAllCustomers @City = 'London';

/*
Stored Procedure With Multiple Parameters
*/

-- Example:

CREATE PROCEDURE SelectAllCustomers @City nvarchar(30), @PostalCode nvarchar(10)
AS
SELECT * FROM Customers WHERE City = @City AND PostalCode = @PostalCode
GO;

-- Execute:

EXEC SelectAllCustomers @City = 'London', @PostalCode = 'WA1 1DP';

-- SQL Comments;

/*
Comments are used to explain sections of SQL statements, or to prevent execution of SQL 
statements.

Single Line Comments
Single line comments start with --.

Any text between -- and the end of the line will be ignored (will not be executed).
*/

--Select all:
SELECT * FROM Customers;

SELECT * FROM Customers -- WHERE City='Berlin';


-- Multi-line Comments
-- Multi-line comments start with /* and end with */.
-- Any text between /* and */ will be ignored.

/*Select all the columns
of all the records
in the Customers table:*/
SELECT * FROM Customers;

SELECT CustomerName, /*City,*/ Country FROM Customers;

SELECT * FROM Customers WHERE (CustomerName LIKE 'L%'
OR CustomerName LIKE 'R%' /*OR CustomerName LIKE 'S%'
OR CustomerName LIKE 'T%'*/ OR CustomerName LIKE 'W%')
AND Country='USA'
ORDER BY CustomerName;

-- SQL Operators;

-- SQL Arithmetic Operators:

/*

Operator	Description	Example
+	        Add	
-	        Subtract	
*	        Multiply	
/	        Divide	
%	        Modulo

*/

-- SQL Bitwise Operators:

/*

Operator	Description
&	        Bitwise AND
|	        Bitwise OR
^	        Bitwise exclusive OR

*/

-- SQL Comparison Operators:

/*

Operator	Description	Example
=	        Equal to	
>	        Greater than	
<	        Less than	
>=	        Greater than or equal to	
<=	        Less than or equal to	
<>	        Not equal to

*/

-- SQL Compound Operators:

/*

Operator	Description
+=	        Add equals
-=	        Subtract equals
*=	        Multiply equals
/=	        Divide equals
%=	        Modulo equals
&=	        Bitwise AND equals
^-=	    Bitwise exclusive equals
|*=	    Bitwise OR equals

*/

-- SQL Logical Operators:

/*

Operator	Description	Example
ALL	    TRUE if all of the subquery values meet the condition	
AND	    TRUE if all the conditions separated by AND is TRUE	
ANY	    TRUE if any of the subquery values meet the condition	
BETWEEN	TRUE if the operand is within the range of comparisons	
EXISTS	    TRUE if the subquery returns one or more records	
IN	        TRUE if the operand is equal to one of a list of expressions	
LIKE	    TRUE if the operand matches a pattern	
NOT	    Displays a record if the condition(s) is NOT TRUE	
OR	        TRUE if any of the conditions separated by OR is TRUE	
SOME	    TRUE if any of the subquery values meet the condition

*/

