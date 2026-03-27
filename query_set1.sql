-- List all users from Delhi

SELECT * from users WHERE city = 'Delhi';

-- Count total users per city
SELECT city, COUNT(*) as total_users FROM users GROUP BY city;


-- Get top 10 most expensive products
SELECT * FROM products ORDER BY price DESC LIMIT 10;


-- Find all orders placed in last 7 days
SELECT * FROM orders WHERE order_date >= CURRENT_DATE - INTERVAL '7 days';


-- Count total orders per status
SELECT status, COUNT(*) as total_orders FROM orders GROUP BY status;

-- Get all products with stock < 10

SELECT * FROM products WHERE stock < 10;


-- Find total number of reviews per product
SELECT product_id, COUNT(*) as total_reviews FROM reviews GROUP BY product_id;
-- Get average product price per category
SELECT category, AVG(price) as average_price FROM products GROUP BY category;
-- Find users who signed up in last 30 days
SELECT * FROM users WHERE created_at >= CURRENT_DATE - INTERVAL '30 days';
-- Count total events per event_type
SELECT event_type, COUNT(*) as total_events FROM events GROUP BY event_type;