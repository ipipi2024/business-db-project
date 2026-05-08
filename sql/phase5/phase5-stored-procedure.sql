USE company_db;

-- -------------------------------------------------------
-- STORED PROCEDURE: GetLowStockProducts
-- -------------------------------------------------------

-- Preview products with stock below 10 before creating the stored procedure
SELECT
    product_id,
    product_name,
    units_in_stock
FROM Products
WHERE units_in_stock < 10
ORDER BY units_in_stock ASC;

-- Create a stored procedure that returns products below a specified stock threshold
DELIMITER //

CREATE PROCEDURE GetLowStockProducts(IN stock_threshold INT)
BEGIN
    SELECT
        product_id,
        product_name,
        units_in_stock
    FROM Products
    WHERE units_in_stock < stock_threshold
    ORDER BY units_in_stock ASC;
END //

DELIMITER ;

-- Call the stored procedure with a threshold of 10 to list products that need restocking
CALL GetLowStockProducts(10);
