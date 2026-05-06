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
    order_unit_price DECIMAL(10,2),
    quantity INT,
    discount DECIMAL(5,2),

    company_name VARCHAR(255),
    contact_name VARCHAR(255),
    contact_title VARCHAR(255),

    employee_last_name VARCHAR(100),
    employee_first_name VARCHAR(100),
    employee_title VARCHAR(100),

    product_name VARCHAR(255),
    supplier_id INT,
    category_id INT,
    quantity_per_unit VARCHAR(100),
    catalog_unit_price DECIMAL(10,2),
    units_in_stock INT,
    units_on_order INT,
    reorder_level INT,
    discontinued BOOLEAN,

    category_name VARCHAR(100),

    suppliers_company_name VARCHAR(255),
    suppliers_contact_name VARCHAR(255),
    suppliers_contact_title VARCHAR(255)
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
-- Create Suppliers table
-- One row represents one supplier
-- =====================================================

DROP TABLE IF EXISTS Suppliers;

CREATE TABLE Suppliers AS
SELECT DISTINCT
    supplier_id,
    suppliers_company_name,
    suppliers_contact_name,
    suppliers_contact_title
FROM raw_data;


-- =====================================================
-- Create Categories table
-- One row represents one product category
-- =====================================================

DROP TABLE IF EXISTS Categories;

CREATE TABLE Categories AS
SELECT DISTINCT
    category_id,
    category_name
FROM raw_data;



