# SQL-Project
# E-commerce Sales & Customer Analysis (SQL Only)

## Problem Statement
A retail business wants to understand its sales performance, customer value,
and order fulfillment health using only SQL — no BI tool, no Python. This
project analyzes 3 raw datasets (customers, orders, products) to answer 10
business questions using JOINs, aggregations, CTEs, and window functions.

## Dataset
- `customers.csv` — 800 customers (CustomerID, FullName, Email, SignUpDate, City, Country)
- `orders.csv` — 1,000 orders (OrderID, CustomerID, OrderDate, OrderStatus, TotalAmount)
- `products.csv` — 34 products, each linked to one OrderID (ProductID, ProductName, Category, Brand, UnitPrice, OrderID)

**Data note:** `products.csv` links to only 34 of the 1,000 orders. It is not
a full order-items table, so product-level questions (Q9, Q10) are based on
that smaller linked sample — this is called out as a data limitation, not
treated as full product coverage.

## Tools Used
MySQL (via XAMPP / phpMyAdmin), SQL only.

## How to Run
1. Start Apache + MySQL in XAMPP.
2. Open `http://localhost/phpmyadmin`, create a database named `ecommerce_analysis`.
3. Run `create_tables.sql` in the SQL tab to create the 3 tables.
4. Import `customers.csv`, `orders.csv`, `products.csv` into their matching tables (Import tab, CSV format, first row = column names).
5. Run each query in `analysis_queries.sql` to reproduce the results below.

## Business Questions Solved
| # | Question | SQL Concepts Used |
|---|----------|-------------------|
| 1 | Monthly revenue & order volume trend | GROUP BY, DATE_FORMAT |
| 2 | Revenue/order count by order status | GROUP BY, subquery |
| 3 | Top 10 customers by total spend | JOIN, GROUP BY, ORDER BY, LIMIT |
| 4 | Revenue by country/city | JOIN, GROUP BY |
| 5 | Average order value overall + monthly | AVG, GROUP BY |
| 6 | Customer signups per month | GROUP BY, DATE_FORMAT |
| 7 | Repeat vs one-time customers (%) | CTE, CASE, subquery |
| 8 | RFM-lite customer ranking | CTE, window function (RANK) |
| 9 | Category/brand breakdown (linked orders) | JOIN, GROUP BY |
| 10 | High-value product orders | Multi-table JOIN, ORDER BY, LIMIT |

## Key Findings
*(Fill this in after running the queries — e.g. "Top 10 customers contribute
X% of revenue", "Y% of customers are repeat buyers", "Cancelled orders
account for Z% of total revenue".)*

## Files
- `create_tables.sql` — table schema
- `analysis_queries.sql` — all 10 business question queries
- `customers.csv`, `orders.csv`, `products.csv` — source data
