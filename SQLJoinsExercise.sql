/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT P.Name, C.Name 
 FROM products as P
 INNER JOIN categories AS C ON C.CategoryID = P.CategoryID
 WHERE C.Name = 'Computers';
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.Name, p.Price, r.Rating FROM products as p
 INNER JOIN reviews AS r on r.ProductID = p.ProductID
 WHERE r.rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, Sum(s.quantity) AS total FROM Sales AS S
INNER JOIN employees AS e on e.EmployeeID = s.EmployeeID
GROUP BY e.EmployeeID
ORDER BY total DESC;



/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name AS 'Department Name', c.name AS 'Category Name' FROM departments AS d
INNER JOIN categories as c ON c.DepartmentID = d.DepartmentID
WHERE c.Name = 'Appliances' OR c.name = 'Games';


/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 SELECT * FROM products as p WHERE p.Name = 'Eagles: Hotel California';
 
 
SELECT p.Name, Sum(s.Quantity) as 'Total Sold', sum(s.Quantity * s.PricePerUnit) as 'Total Price'
FROM products AS p
INNER JOIN sales as s on s.ProductID = p.ProductID
WHERE p.ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT * FROM products as p WHERE p.Name = 'Visio TV';

SELECT p.Name, r.Reviewer, r.Rating, r.Comment FROM reviews AS r
INNER JOIN products as p on p.ProductID = r.ProductID
Where p.ProductID = 857;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name, Sum(s.Quantity) as TotalSold
FROM sales AS s
INNER JOIN employees AS e ON e.EmployeeID = s.EmployeeID
INNER JOIN products AS p ON p.ProductID = s.ProductID
GROUP BY e.EmployeeID, p.ProductID;