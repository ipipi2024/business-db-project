USE company_db;

-- -------------------------------------------------------
-- VIEW: employee_sales_summary
-- -------------------------------------------------------

-- Preview the query result before creating the view
SELECT
    e.employee_id,
    e.employee_first_name,
    e.employee_last_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.order_unit_price * od.quantity) AS total_revenue
FROM Employees e
JOIN Orders o
    ON e.employee_id = o.employee_id
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY
    e.employee_id,
    e.employee_first_name,
    e.employee_last_name;

-- Create a view that shows total quantity sold and total revenue generated per employee
CREATE VIEW employee_sales_summary AS
SELECT
    e.employee_id,
    e.employee_first_name,
    e.employee_last_name,
    SUM(od.quantity) AS total_quantity_sold,
    SUM(od.order_unit_price * od.quantity) AS total_revenue
FROM Employees e
JOIN Orders o
    ON e.employee_id = o.employee_id
JOIN OrderDetails od
    ON o.order_id = od.order_id
GROUP BY
    e.employee_id,
    e.employee_first_name,
    e.employee_last_name;

-- Query the view to verify the output
SELECT *
FROM employee_sales_summary;
