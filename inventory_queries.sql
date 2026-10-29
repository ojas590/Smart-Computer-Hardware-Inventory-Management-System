
-- SMART COMPUTER HARDWARE INVENTORY MANAGEMENT SYSTEM
-- SQL QUERIES
-- Database: smart_hardware_inventory

USE smart_hardware_inventory;


-- 1. Display all products
SELECT * FROM products;


-- 2. Display products with a unit price greater than 2000
SELECT product_id, product_name, unit_price
FROM products
WHERE unit_price > 2000;


-- 3. Display product, category, supplier and price using JOIN
SELECT
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id;


-- 4. Display sales details along with product names
SELECT
    sa.sale_id,
    sa.customer_name,
    p.product_name,
    sa.quantity,
    sa.sale_date,
    sa.unit_price
FROM sales sa
JOIN products p
    ON sa.product_id = p.product_id;


-- 5. Count products available in each category
SELECT
    c.category_name,
    COUNT(p.product_id) AS total_products
FROM categories c
LEFT JOIN products p
    ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;


-- 6. Calculate total and average sales value
SELECT
    SUM(unit_price * quantity) AS total_sales_value,
    AVG(unit_price * quantity) AS average_sale_value
FROM sales;


-- 7. Display products priced above the average product price
SELECT product_name, unit_price
FROM products
WHERE unit_price > (
    SELECT AVG(unit_price)
    FROM products
);


-- 8. Display products that have never been sold
SELECT product_id, product_name
FROM products
WHERE product_id NOT IN (
    SELECT product_id
    FROM sales
);


-- 9. Create a view for product inventory details
CREATE VIEW product_inventory_view AS
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    s.supplier_name,
    p.unit_price,
    p.quantity_in_stock,
    p.reorder_level
FROM products p
JOIN categories c
    ON p.category_id = c.category_id
JOIN suppliers s
    ON p.supplier_id = s.supplier_id;


-- 10. Display the product inventory view
SELECT * FROM product_inventory_view;
