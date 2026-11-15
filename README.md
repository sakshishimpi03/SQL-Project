🛒 E-commerce Sales & Customer Analysis (SQL Project)
📌 Project Overview
This project analyzes an e-commerce business using SQL to understand sales performance, customer purchasing behavior, revenue trends, and order fulfillment.

The analysis uses three datasets — Customers, Orders, and Products — and answers 10 business questions using SQL queries.
🎯 Project Objectives
- Analyze monthly sales and revenue trends.
- Identify high-value customers.
- Understand revenue distribution across order statuses.
- Evaluate customer purchasing patterns.
- Analyze sales across countries and cities.
- Explore product categories and brands.
- Generate insights to support customer retention and business decisions.
📂 Dataset Description
Dataset	Description	Records
customers.csv	Customer details, location, email, and signup date	800
orders.csv	Order ID, customer ID, order date, status, and total amount	1,000
products.csv	Product name, category, brand, price, and order ID	34


Data limitation: products.csv links to only 34 of the 1,000 orders. Product-level analysis therefore represents a limited linked sample, not the complete order-item data.
🛠️ Tools & Technologies
- MariaDB / MySQL
- SQL
- XAMPP
- phpMyAdmin
- CSV datasets
💻 SQL Concepts Used
- SELECT, WHERE
- GROUP BY, ORDER BY
- Aggregate functions: SUM, COUNT, AVG
- JOINs
- Subqueries
- Common Table Expressions (CTEs)
- CASE statements
- Date functions
- Window functions (RANK)
- LIMIT
🔍 Business Questions
No.	Business Question	SQL Techniques
1	Is revenue growing or declining month over month?	GROUP BY, DATE_FORMAT
2	How much revenue is Pending/Cancelled vs Delivered?	GROUP BY, subquery
3	Who are the top 10 highest-value customers?	JOIN, SUM, GROUP BY
4	Which countries and cities generate the highest revenue?	JOIN, GROUP BY
5	What is the average order value overall and monthly?	AVG, GROUP BY
6	How many new customers sign up each month?	DATE_FORMAT, COUNT
7	What percentage of customers are repeat vs one-time buyers?	CTE, CASE
8	Which customers have the highest RFM-lite ranking?	CTE, window function
9	Which product categories and brands perform best?	JOIN, GROUP BY
10	What are the highest-value product orders?	Multi-table JOIN, ORDER BY, LIMIT


📸 Query Results & Screenshots
📈 1. Monthly Revenue and Order Trend
The query groups orders by month and calculates the total number of orders and revenue for each month.

📦 2. Revenue by Order Status
The query compares order counts and revenue across Shipped, Delivered, Pending, Processing, and Cancelled statuses.

Insight: Pending and Cancelled orders together account for approximately 38.84% of the total revenue shown in the query output. This highlights the importance of monitoring pending orders and cancellations.
🏆 3. Top 10 Customers by Total Spending
The query joins Customers and Orders, then ranks customers by their total spending.

Top customer in the displayed results: Sitara Singh (CUST-1377), from Delhi, with 4 orders and total spending of 193,596.54.
💡 Key Findings
- Monthly revenue and order volume fluctuate over the displayed period.
- Pending and Cancelled orders represent a substantial share of the revenue in the status analysis.
- The top-spending customer in the displayed results is Sitara Singh, with total spending of 193,596.54.
- The remaining queries examine geographical revenue, average order value, customer signups, repeat purchases, RFM-lite ranking, and product performance.
🗂️ Project Structure
Ecommerce-Sales-Customer-Analysis/
├── datasets/
│   ├── customers.csv
│   ├── orders.csv
│   └── products.csv
├── screenshots/
│   ├── monthly_revenue.png
│   ├── order_status_revenue.png
│   └── top_customers.png
├── create_tables.sql
├── analysis_queries.sql
└── README.md
▶️ How to Run
1. Install XAMPP and start Apache and MySQL.
2. Open phpMyAdmin in your browser.
3. Create a database named ecommerce_analysis.
4. Execute create_tables.sql to create the tables.
5. Import each CSV file into its matching table.
6. Open and execute the queries in analysis_queries.sql.
7. Review the results and compare them with the screenshots in the screenshots folder.
✅ Conclusion
This project demonstrates the practical use of SQL for e-commerce data analysis. It applies joins, aggregations, subqueries, CTEs, and window functions to investigate sales trends, customer value, and order fulfillment. The findings can help a business identify retention opportunities and areas that may need operational attention.

Project Type: Data Analysis | SQL Project
Domain: E-commerce
Database: MariaDB / MySQL
Author: Sakshi Shimpi
