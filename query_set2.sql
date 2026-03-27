-- Get all orders with user name and city
SELECT o.id, u.name, u.city, o.order_date, o.status
FROM orders o
JOIN users u ON o.user_id = u.id;

-- List all products in each order
SELECT o.id as order_id, p.name as product_name, oi.quantity, oi.price
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
JOIN products p ON oi.product_id = p.id;

-- Find total amount per order
SELECT o.id, SUM(oi.quantity * oi.price) as total_amount
FROM orders o
JOIN order_items oi ON o.id = oi.order_id
GROUP BY o.id;

-- Get all users who placed at least one order
SELECT DISTINCT u.id, u.name, u.email
FROM users u
JOIN orders o ON u.id = o.user_id;

-- Find users who never placed an order
SELECT u.id, u.name, u.email
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE o.id IS NULL;


-- Get all orders with payment status
SELECT o.id, u.name, o.order_date, o.status as order_status, p.status as payment_status
FROM orders o
JOIN users u ON o.user_id = u.id
LEFT JOIN payments p ON o.id = p.order_id;

-- Find products that were never ordered
SELECT p.id, p.name
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
WHERE oi.product_id IS NULL;


-- Get total quantity sold per product
SELECT p.id, p.name, SUM(oi.quantity) as total_sold
FROM products p
LEFT JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.id, p.name;


-- Find top 5 users with most orders
SELECT u.id, u.name, COUNT(o.id) as total_orders
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_orders DESC
LIMIT 5;


-- Get total revenue per user
SELECT u.id, u.name, SUM(oi.quantity * oi.price) as total_revenue
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
LEFT JOIN order_items oi ON o.id = oi.order_id
GROUP BY u.id, u.name;