--Q1
--returns users working in electronics department
SELECT *
FROM User u
JOIN Department d ON u.dep_no=d.dep_no
WHERE d.`name`  = 'logistics';

--Q2
--returns products ordered in cart weekly
SELECT *
FROM Product p
JOIN `Shopping cart` sc ON p.item_ID=sc.item_ID
WHERE sc.`category`  = 'weekly';

--Q3
--returns who approved cart 34
SELECT *
FROM Manager m
JOIN `Shopping cart` sc ON m.man_ID=sc.man_ID
WHERE sc.`cart_ID`  = 13422;

--Q4
--returns who issued cart 34
SELECT *
FROM employee e
JOIN Shopping cart sc ON e.man_ID=sc.man_ID
WHERE sc.`cart_ID`  = 13422;

--Q5
-- return manager and nr. of departments if manager leads more than one department
SELECT Manager m,COUNT(DISTINCT Dep_no) AS no_dep
FROM department d
JOIN department d ON d.Dep_no=m.Dep_no
GROUP BY m.man_ID
HAVING no_dep>1;


--Q6
--Return all departments and the total salary costs of all users 
--working into each department ordered by the total replacement costs descending

SELECT d.`name`, sum(salaries) AS sum_SC
FROM user u
JOIN department d ON d.Dep_no=u.Dep_no
GROUP BY (d.name)
ORDER BY (sum_SC) DESC

--Q7
--Return the first name, last name, birth date, department name, and employment status 
--which has two possible values {employee, manager} of all employees.
SELECT u.fname,u.lname,u.DOB,d.name,'employee'AS`employment_status`
FROM user u JOIN employee e ON u.ID=e.emp_ID
JOIN departments d ON d.Dept_no=u.Dept_no
WHERE e.emp_no NOT in(select dm.emp_no FROM dept_manager dm)
UNION 
SELECT e.first_name,e.last_name,e.birth_date,d.dept_name,'manager'AS`employment_status`
FROM user u JOIN manager m ON u.ID=m.man_ID
JOIN departments d ON d.Dept_no=m.Dept_no

--Q8
-- Returns the employee having the highest salary
SELECT *
FROM user AS u
WHERE u.salaries = ( 
	SELECT MAX(salaries) 
	FROM user 
	)

--Q9
-- Returns the last ordered product for each employee
SELECT u.use, MAX(s.`date`) AS last_order_date
FROM shipment s
GROUP BY s.employee

-- Returns the last recorded delivery for each country
SELECT s.country, MAX(s.`delivered-recorded-date`) AS max_delivery_date
FROM shipment s
GROUP BY s.country



