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


CREATE TABLE Products AS
SELECT DISTINCT
    product_id,
    product_name,
    supplier_id,
    category_id,
    quantity_per_unit,
    units_in_stock,
    units_on_order,
    reorder_level,
    discontinued
FROM raw_data;

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




