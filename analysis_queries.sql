-- ============================================================
-- E-COMMERCE SALES & CUSTOMER ANALYSIS
-- Analysis queries (MySQL / MariaDB - XAMPP)
-- ============================================================


-- Q1. Monthly revenue and order volume trend
-- Business question: Is revenue growing or shrinking month over month?
SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    COUNT(OrderID)                  AS TotalOrders,
    SUM(TotalAmount)                AS TotalRevenue
FROM orders
GROUP BY OrderMonth
ORDER BY OrderMonth;


-- Q2. Revenue and order count by order status
-- Business question: How much revenue is stuck in Pending/Cancelled vs actually Delivered?
SELECT
    OrderStatus,
    COUNT(OrderID)      AS OrderCount,
    SUM(TotalAmount)     AS Revenue,
    ROUND(SUM(TotalAmount) * 100.0 / (SELECT SUM(TotalAmount) FROM orders), 2) AS PctOfTotalRevenue
FROM orders
GROUP BY OrderStatus
ORDER BY Revenue DESC;


-- Q3. Top 10 customers by total spend
-- Business question: Who are the highest-value customers to prioritize for retention?
SELECT
    c.CustomerID,
    c.FullName,
    c.City,
    c.Country,
    COUNT(o.OrderID)   AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpend
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.FullName, c.City, c.Country
ORDER BY TotalSpend DESC
LIMIT 10;


-- Q4. Revenue by country and city
-- Business question: Which regions generate the most revenue?
SELECT
    c.Country,
    c.City,
    COUNT(o.OrderID)   AS TotalOrders,
    SUM(o.TotalAmount) AS TotalRevenue
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Country, c.City
ORDER BY TotalRevenue DESC;


-- Q5. Average order value (AOV) overall and monthly trend
-- Business question: Is the average customer spending more or less per order over time?
SELECT
    DATE_FORMAT(OrderDate, '%Y-%m') AS OrderMonth,
    ROUND(AVG(TotalAmount), 2)      AS AvgOrderValue,
    COUNT(OrderID)                  AS TotalOrders
FROM orders
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- Overall AOV (single number)
SELECT ROUND(AVG(TotalAmount), 2) AS OverallAOV FROM orders;


-- Q6. Customer signups per month vs orders placed per month
-- Business question: Do new signups translate into actual orders?
SELECT
    DATE_FORMAT(c.SignUpDate, '%Y-%m') AS SignUpMonth,
    COUNT(DISTINCT c.CustomerID)       AS NewCustomers
FROM customers c
GROUP BY SignUpMonth
ORDER BY SignUpMonth;


-- Q7. Repeat customers vs one-time customers (%)
-- Business question: What share of our customer base keeps coming back?
WITH order_counts AS (
    SELECT CustomerID, COUNT(OrderID) AS NumOrders
    FROM orders
    GROUP BY CustomerID
)
SELECT
    CASE WHEN NumOrders > 1 THEN 'Repeat Customer' ELSE 'One-Time Customer' END AS CustomerType,
    COUNT(*) AS NumCustomers,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT CustomerID) FROM orders), 2) AS Percentage
FROM order_counts
GROUP BY CustomerType;


-- Q8. Customer ranking by Recency, Frequency, Monetary (RFM-lite)
-- Business question: Who are our most engaged, highest-value customers right now?
WITH rfm AS (
    SELECT
        c.CustomerID,
        c.FullName,
        DATEDIFF(CURDATE(), MAX(o.OrderDate)) AS Recency_Days,
        COUNT(o.OrderID)                       AS Frequency,
        SUM(o.TotalAmount)                     AS Monetary
    FROM customers c
    JOIN orders o ON c.CustomerID = o.CustomerID
    GROUP BY c.CustomerID, c.FullName
)
SELECT
    CustomerID,
    FullName,
    Recency_Days,
    Frequency,
    Monetary,
    RANK() OVER (ORDER BY Monetary DESC) AS SpendRank
FROM rfm
ORDER BY SpendRank
LIMIT 20;


-- Q9. Category / brand breakdown for orders that have product data
-- Business question: Among the orders we can trace to a specific product, what sells most?
-- NOTE: products.csv only links to 34 of the 1000 orders, so this is a limited sample, not full coverage.
SELECT
    p.Category,
    p.Brand,
    COUNT(p.ProductID) AS NumProducts,
    ROUND(AVG(p.UnitPrice), 2) AS AvgUnitPrice,
    SUM(o.TotalAmount) AS LinkedOrderRevenue
FROM products p
JOIN orders o ON p.OrderID = o.OrderID
GROUP BY p.Category, p.Brand
ORDER BY LinkedOrderRevenue DESC;


-- Q10. High-value product orders - which customers bought them
-- Business question: Which customers are linked to our highest-priced product purchases?
SELECT
    c.CustomerID,
    c.FullName,
    p.ProductName,
    p.Category,
    p.UnitPrice,
    o.OrderID,
    o.OrderDate,
    o.TotalAmount,
    o.OrderStatus
FROM products p
JOIN orders o     ON p.OrderID = o.OrderID
JOIN customers c  ON o.CustomerID = c.CustomerID
ORDER BY p.UnitPrice DESC
LIMIT 10;
