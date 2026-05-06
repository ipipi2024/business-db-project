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