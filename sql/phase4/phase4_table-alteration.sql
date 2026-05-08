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

-- -------------------------------------------------------

-- Inspect current structure of the Categories table
DESCRIBE Categories;

-- Check for duplicate category_id values before adding the primary key
SELECT category_id, COUNT(*) AS count
FROM Categories
GROUP BY category_id
HAVING COUNT(*) > 1;

-- Check for NULL category_id values before applying NOT NULL constraint
SELECT *
FROM Categories
WHERE category_id IS NULL;

-- Check for NULL category_name values before applying NOT NULL constraint
SELECT *
FROM Categories
WHERE category_name IS NULL;

-- Apply constraints: enforce NOT NULL on key columns and set category_id as primary key
ALTER TABLE Categories
MODIFY category_id INT NOT NULL,
MODIFY category_name VARCHAR(255) NOT NULL,
ADD PRIMARY KEY (category_id);

-- Confirm column data types and NOT NULL constraints were applied correctly
DESCRIBE Categories;

-- Verify the primary key constraint was applied correctly on the Categories table
SHOW KEYS FROM Categories;

-- -------------------------------------------------------

-- Inspect current structure of the Products table
-- DESCRIBE Products;

-- Check for duplicate product_id values before adding the primary key
-- SELECT product_id, COUNT(*) AS count
-- FROM Products
-- GROUP BY product_id
-- HAVING COUNT(*) > 1;

-- Check for NULL product_id values before applying NOT NULL constraint
-- SELECT *
-- FROM Products
-- WHERE product_id IS NULL;

-- Check for NULL product_name, supplier_id, or category_id before applying NOT NULL constraints
-- SELECT *
-- FROM Products
-- WHERE product_name IS NULL
--    OR supplier_id IS NULL
--    OR category_id IS NULL;

-- Check for orphaned supplier_id values with no matching Suppliers record
-- SELECT p.*
-- FROM Products p
-- LEFT JOIN Suppliers s
--     ON p.supplier_id = s.supplier_id
-- WHERE s.supplier_id IS NULL;

-- Check for orphaned category_id values with no matching Categories record
-- SELECT p.*
-- FROM Products p
-- LEFT JOIN Categories c
--     ON p.category_id = c.category_id
-- WHERE c.category_id IS NULL;

-- Apply constraints: enforce NOT NULL, set primary key, and add foreign keys to Suppliers and Categories
ALTER TABLE Products
MODIFY product_id INT NOT NULL,
MODIFY product_name VARCHAR(255) NOT NULL,
MODIFY supplier_id INT NOT NULL,
MODIFY category_id INT NOT NULL,
ADD PRIMARY KEY (product_id),
ADD CONSTRAINT fk_products_supplier
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id),
ADD CONSTRAINT fk_products_category
    FOREIGN KEY (category_id) REFERENCES Categories(category_id);

-- Confirm column data types and NOT NULL constraints were applied correctly
DESCRIBE Products;

-- Verify the primary key and foreign key constraints were applied correctly on the Products table
SHOW KEYS FROM Products;
