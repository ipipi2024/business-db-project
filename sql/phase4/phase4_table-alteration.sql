USE company_db;

-- Inspect current structure of the Customers table
DESCRIBE Customers;

-- Check for duplicate customer_id values before adding the primary key
SELECT customer_id, COUNT(*) AS count
FROM Customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- Check for NULL customer_id values before applying NOT NULL constraint
SELECT *
FROM Customers
WHERE customer_id IS NULL;

-- Check for NULL company_name values before applying NOT NULL constraint
SELECT *
FROM Customers
WHERE company_name IS NULL;

-- Apply constraints: enforce NOT NULL on key columns and set customer_id as primary key
ALTER TABLE Customers
MODIFY customer_id CHAR(5) NOT NULL,
MODIFY company_name VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (customer_id);

-- -------------------------------------------------------

-- Inspect current structure of the Employees table
DESCRIBE Employees;

-- Check for duplicate employee_id values before adding the primary key
SELECT employee_id, COUNT(*) AS count
FROM Employees
GROUP BY employee_id
HAVING COUNT(*) > 1;

-- Check for NULL employee_id values before applying NOT NULL constraint
SELECT *
FROM Employees
WHERE employee_id IS NULL;

-- Check for NULL employee_first_name values before applying NOT NULL constraint
SELECT *
FROM Employees
WHERE employee_first_name IS NULL;

-- Check for NULL employee_last_name values before applying NOT NULL constraint
SELECT *
FROM Employees
WHERE employee_last_name IS NULL;

-- Apply constraints: enforce NOT NULL on key columns and set employee_id as primary key
ALTER TABLE Employees
MODIFY employee_id INT NOT NULL,
MODIFY employee_first_name VARCHAR(255) NOT NULL,
MODIFY employee_last_name VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (employee_id);

-- -------------------------------------------------------

-- Inspect current structure of the Suppliers table
DESCRIBE Suppliers;

-- Check for duplicate supplier_id values before adding the primary key
SELECT supplier_id, COUNT(*) AS count
FROM Suppliers
GROUP BY supplier_id
HAVING COUNT(*) > 1;

-- Check for NULL supplier_id values before applying NOT NULL constraint
SELECT *
FROM Suppliers
WHERE supplier_id IS NULL;

-- Check for NULL supplier_company_name values before applying NOT NULL constraint
SELECT *
FROM Suppliers
WHERE supplier_company_name IS NULL;

-- Apply constraints: enforce NOT NULL on key columns and set supplier_id as primary key
ALTER TABLE Suppliers
MODIFY supplier_id INT NOT NULL,
MODIFY supplier_company_name VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (supplier_id);
