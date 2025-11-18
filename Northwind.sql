use northwind;

select customers.customerid, customers.customername,orders.orderid
from orders
inner join customers
on orders.customerid = customers.customerid;

select employees.firstname, employees.lastname, orders.orderid,employees.employeeid
from employees
inner join orders
on orders.employeeid = employees.employeeid
order by firstname;

select productname, suppliername
from products
inner join suppliers
on suppliers.supplierid = products.supplierid
where suppliername = "G'day, mate";

select firstname,lastname,orders.orderid,orders.orderdate
from employees
inner join orders
on orders.employeeid = employees.employeeid;

select shippername, orders.orderid
from shippers
inner join orders
on shippers.shipperid = orders.shipperid
where shippername = "speedy express";

select productname, categories.categoryname
from products 
inner join categories 
on categories.categoryid = products.categoryid;

select productname, order_details.quantity 
from products 
inner join order_details
on order_details.productid=products.productid;

SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
where orderid is null;

/* alisaing*/
SELECT c.CustomerName, o.OrderID
FROM Customers as c -- rename as c
LEFT JOIN Orders as o -- rename as o
ON c.CustomerID = o.CustomerID
where orderid is null;

SELECT count(*)
FROM Customers
CROSS JOIN Orders;
/* there are 91 rows in customers
multiplied by 196 rows in orders*/

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;

select count(orderid), shippername
from shippers as s
left join orders as o
on s.shipperid = o.shipperid
group by shippername;

SELECT p.ProductName, SUM(od.Quantity * p.Price) AS TotalSales
FROM Order_Details as od
JOIN Products as p ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;

select count(customerid), c.country
from customers as c 
group by country;

select categoryname, sum(quantity) as totalquantity
from categories as c
join products as p
on c.categoryid = p.categoryid
join order_details as od
on od.productid = p.productid
group by categoryname;

select concat_ws(", ", e.firstname, e.lastname) as employee, count(orderid) as employeesales
from orders as o 
join employees as e on e.employeeid = o.employeeid
group by o.employeeid
order by employeesales desc;
