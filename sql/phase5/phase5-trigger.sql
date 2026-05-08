USE company_db;

-- -------------------------------------------------------
-- TRIGGER: trg_reduce_stock_after_orderdetail_insert
-- -------------------------------------------------------

-- Check the current stock level for product_id = 1 before the trigger test
SELECT product_id, product_name, units_in_stock
FROM Products
WHERE product_id = 1;

-- Create a trigger that automatically reduces stock quantity after a new order detail is inserted
DELIMITER //

CREATE TRIGGER trg_reduce_stock_after_orderdetail_insert
AFTER INSERT ON OrderDetails
FOR EACH ROW
BEGIN
    UPDATE Products
    SET units_in_stock = units_in_stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END //

DELIMITER ;

-- Verify the trigger was created successfully
SHOW TRIGGERS;

-- Test the trigger by inserting a new order detail for product_id = 1
INSERT INTO OrderDetails (
    order_id,
    product_id,
    order_unit_price,
    quantity,
    discount
)
VALUES (
    10248,
    1,
    18.00,
    2,
    0
);

-- Confirm stock was reduced by 2 after the insert
SELECT product_id, product_name, units_in_stock
FROM Products
WHERE product_id = 1;
