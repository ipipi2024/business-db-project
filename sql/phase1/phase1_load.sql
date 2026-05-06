-- =====================================================
-- Phase 1: Database Creation and Data Loading
-- Project: Business Database from Scratch
-- =====================================================

DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;
USE company_db;

-- =====================================================
-- Create raw_data table
-- This table stores the cleaned CSV data before normalization
-- =====================================================

DROP TABLE IF EXISTS raw_data;

CREATE TABLE raw_data (
    order_id INT,
    customer_id VARCHAR(50),
    employee_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via INT,
    freight DECIMAL(10,2),

    product_id INT,
    product_name VARCHAR(255),
    supplier_id INT,
    category_id INT,
    quantity_per_unit VARCHAR(100),
    unit_price DECIMAL(10,2),
    units_in_stock INT,
    units_on_order INT,
    reorder_level INT,
    discontinued BOOLEAN,

    quantity INT,
    discount DECIMAL(5,2),

    company_name VARCHAR(255),
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),

    employee_last_name VARCHAR(100),
    employee_first_name VARCHAR(100),
    employee_title VARCHAR(100),

    category_name VARCHAR(100),
    category_description TEXT,

    supplier_company_name VARCHAR(255),
    supplier_contact_name VARCHAR(255),
    supplier_contact_title VARCHAR(255)
);

-- =====================================================
-- Load cleaned CSV file into raw_data
-- =====================================================

LOAD DATA LOCAL INFILE 'C:/Users/earthlian/Desktop/business-db-project/data/cleaned/CompanyData_cleaned.csv'
INTO TABLE raw_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- =====================================================
-- Verification queries for documentation/screenshots
-- =====================================================

SELECT COUNT(*) AS total_rows
FROM raw_data;

SELECT *
FROM raw_data
LIMIT 10;

DESCRIBE raw_data;