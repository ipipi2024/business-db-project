CREATE TABLE Customers AS
SELECT DISTINCT
    customer_id,
    company_name,
    contact_name,
    contact_title
FROM raw_data;

CREATE TABLE Employees AS
SELECT DISTINCT
    employee_id,
    employee_first_name,
    employee_last_name,
    employee_title
FROM raw_data;


DROP TABLE IF EXISTS Products;

CREATE TABLE Products AS
SELECT
    product_id,
    MAX(product_name) AS product_name,
    MAX(supplier_id) AS supplier_id,
    MAX(category_id) AS category_id,
    MAX(quantity_per_unit) AS quantity_per_unit,
    MAX(units_in_stock) AS units_in_stock,
    MAX(units_on_order) AS units_on_order,
    MAX(reorder_level) AS reorder_level,
    MAX(discontinued) AS discontinued
FROM raw_data
GROUP BY product_id;

CREATE TABLE Orders AS
SELECT DISTINCT
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    ship_via,
    freight
FROM raw_data;

-- =====================================================
-- Create OrderDetails table
-- One row represents one product inside one order
-- =====================================================

DROP TABLE IF EXISTS OrderDetails;


CREATE TABLE OrderDetails AS
SELECT DISTINCT
    order_id,
    product_id,
    order_unit_price,
    quantity,
    discount
FROM raw_data;




