-- Find total revenue per day
SELECT
    DATE(order_date) AS order_day,
    SUM(price * quantity) AS daily_revenue
FROM orders
INNER JOIN order_items ON orders.id = order_items.order_id
GROUP BY DATE(order_date)
ORDER BY order_day;

-- Find average order value from all orders

SELECT
    AVG(order_value) AS average_order_value
FROM (
    SELECT
        sum(price * quantity) AS order_value
    FROM orders o
    INNER JOIN order_items ON o.id = order_items.order_id
    GROUP BY o.id
) AS order_values;


-- Get top 3 categories by revenue
SELECT p.category, SUM(oi.price * oi.quantity) AS category_revenue
FROM products p
INNER JOIN order_items oi ON p.id = oi.product_id
GROUP BY p.category
ORDER BY category_revenue DESC
LIMIT 3;

-- Find users with more than 5 orders
SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM users u
INNER JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING COUNT(o.id) > 5;


-- Get most reviewed products
SELECT p.id, p.name, COUNT(r.id) AS review_count
FROM products p
INNER JOIN reviews r ON p.id = r.product_id
GROUP BY p.id, p.name
ORDER BY review_count DESC
LIMIT 5;


-- Find conversion rate (view → purchase) using events
SELECT
    (SELECT COUNT(DISTINCT user_id) FROM events WHERE event_type = 'purchase')::DECIMAL /
    NULLIF((SELECT COUNT(DISTINCT (user_id, event_type)) FROM events WHERE event_type = 'view' or event_type = 'purchase'), 0) AS conversion_rate;

-- Get daily active users (DAU)
SELECT
    DATE(event_time) AS event_day,
    COUNT(DISTINCT user_id) AS daily_active_users
FROM events
GROUP BY DATE(event_time)
ORDER BY event_day DESC;


-- Find repeat customers (ordered >1 time)
SELECT u.id, u.name, COUNT(o.id) AS order_count
FROM users u
INNER JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING COUNT(o.id) > 1;


-- Find cancellation rate
SELECT (SELECT COUNT(*) FROM orders WHERE status = 'cancelled')::DECIMAL /
    NULLIF((SELECT COUNT(*) FROM orders), 0) AS cancellation_rate;

-- Get top city by revenue
SELECT u.city, SUM(oi.price * oi.quantity) AS city_revenue
FROM users u
INNER JOIN orders o ON u.id = o.user_id
INNER JOIN order_items oi ON o.id = oi.order_id
GROUP BY u.city
ORDER BY city_revenue DESC
LIMIT 5;