INSERT INTO users (name, email, city)
SELECT 
    'User_' || i,
    'user' || i || '@example.com',
    (ARRAY['Delhi','Mumbai','Bangalore','Hyderabad','Chennai'])[floor(random()*5+1)]
FROM generate_series(1, 1000) i;


INSERT INTO products (name, category, price, stock)
SELECT 
    'Product_' || i,
    (ARRAY['Electronics','Clothing','Books','Home','Sports'])[floor(random()*5+1)],
    round((random()*5000 + 100)::numeric, 2),
    (random()*100)::int
FROM generate_series(1, 200) i;


INSERT INTO orders (user_id, order_date, status)
SELECT 
    (random()*999 + 1)::int,
    NOW() - (random()*365 || ' days')::interval,
    (ARRAY['placed','shipped','delivered','cancelled'])[floor(random()*4+1)]
FROM generate_series(1, 5000);



INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT 
    o.id,
    (random()*199 + 1)::int,
    (random()*5 + 1)::int,
    round((random()*5000 + 100)::numeric, 2)
FROM orders o
JOIN generate_series(1, 3) g ON true;


INSERT INTO payments (order_id, amount, payment_method, status, payment_date)
SELECT 
    id,
    round((random()*10000 + 200)::numeric, 2),
    (ARRAY['UPI','Card','NetBanking','Wallet'])[floor(random()*4+1)],
    (ARRAY['success','failed'])[floor(random()*2+1)],
    order_date + (random()*2 || ' days')::interval
FROM orders;


INSERT INTO reviews (user_id, product_id, rating, comment)
SELECT 
    (random()*999 + 1)::int,
    (random()*199 + 1)::int,
    (random()*4 + 1)::int,
    'Sample review text'
FROM generate_series(1, 2000);

INSERT INTO events (user_id, event_type, product_id, event_time)
SELECT 
    (random()*999 + 1)::int,
    (ARRAY['view','click','add_to_cart','purchase'])[floor(random()*4+1)],
    (random()*199 + 1)::int,
    NOW() - (random()*30 || ' days')::interval
FROM generate_series(1, 10000);