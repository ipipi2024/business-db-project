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
