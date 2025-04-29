-- **Step 1: Set Output Mode to Table for Better View**
.mode column
.width 20 20 20 20 -- Adjust the column widths for better readability

-- **Step 2: Create the 'orders' table and insert data**
CREATE TABLE IF NOT EXISTS orders (
    order_id INTEGER,
    product_id INTEGER,
    order_date TEXT,
    amount REAL
);

INSERT INTO orders VALUES (1, 101, '2024-01-05', 100.0);
INSERT INTO orders VALUES (2, 102, '2024-01-15', 200.0);
INSERT INTO orders VALUES (3, 103, '2024-02-02', 150.0);
INSERT INTO orders VALUES (4, 101, '2024-02-20', 300.0);
INSERT INTO orders VALUES (5, 102, '2024-03-05', 250.0);
INSERT INTO orders VALUES (6, 104, '2024-03-15', 350.0);

-- **Step 3: Monthly Revenue and Order Volume**
SELECT
    strftime('%Y', order_date) AS order_year,  -- Extract year from order_date
    strftime('%m', order_date) AS order_month, -- Extract month from order_date
    SUM(amount) AS total_revenue,              -- Calculate total revenue per month
    COUNT(DISTINCT order_id) AS order_volume   -- Count unique orders per month
FROM
    orders
WHERE
    order_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- **Step 4: Top-Selling Products by Revenue**
SELECT
    product_id,              -- Select the product_id column
    SUM(amount) AS total_revenue  -- Calculate total revenue for each product
FROM
    orders
GROUP BY
    product_id               -- Group by product_id to get revenue for each product
ORDER BY
    total_revenue DESC;      -- Sort by total_revenue in descending order (highest revenue first)

-- **Step 5: Average Order Value (AOV)**
SELECT
    AVG(amount) AS average_order_value  -- Calculate the average of all amounts (AOV)
FROM
    orders;

-- **Step 6: Sales for a Specific Product (e.g., Product 101)**
SELECT
    strftime('%Y', order_date) AS order_year,  -- Extract year from order_date
    strftime('%m', order_date) AS order_month, -- Extract month from order_date
    SUM(amount) AS total_revenue,              -- Calculate total revenue for each month
    COUNT(DISTINCT order_id) AS order_volume   -- Count unique orders for each month
FROM
    orders
WHERE
    product_id = 101                          -- Filter by product_id = 101
GROUP BY
    order_year, order_month
ORDER BY
    order_year, order_month;

-- **Step 7: Sales in a Specific Month (e.g., February 2024)**
SELECT
    product_id,                              -- Select product_id column
    SUM(amount) AS total_revenue             -- Calculate total revenue for each product in February 2024
FROM
    orders
WHERE
    order_date BETWEEN '2024-02-01' AND '2024-02-29'  -- Filter for February 2024
GROUP BY
    product_id                               -- Group by product_id to get total revenue per product
ORDER BY
    total_revenue DESC;                      -- Sort by total revenue in descending order (highest first)

-- **Step 8: Number of Orders Per Product**
SELECT
    product_id,                             -- Select product_id column
    COUNT(DISTINCT order_id) AS order_count  -- Count unique orders for each product
FROM
    orders
GROUP BY
    product_id                              -- Group by product_id to get order count per product
ORDER BY
    order_count DESC;                       -- Sort by order_count in descending order (highest order count first)

-- **Step 9: Monthly Sales Analysis (Total Revenue and Order Volume by Month)**
SELECT
    strftime('%Y', order_date) AS order_year,  -- Extract year from order_date
    strftime('%m', order_date) AS order_month, -- Extract month from order_date
    SUM(amount) AS total_revenue,              -- Calculate total revenue for each month
    COUNT(DISTINCT order_id) AS order_volume   -- Count unique orders for each month
FROM
    orders
GROUP BY
    order_year, order_month
ORDER BY
    order_year DESC, order_month DESC;
