-- ============================================
-- E-COMMERCE SALES & CUSTOMER ANALYSIS
-- Table creation script (MySQL / XAMPP)
-- ============================================

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    CustomerID   VARCHAR(15) PRIMARY KEY,
    FullName     VARCHAR(100),
    Email        VARCHAR(100),
    SignUpDate   DATE,
    City         VARCHAR(50),
    Country      VARCHAR(50)
);

CREATE TABLE orders (
    OrderID      VARCHAR(15) PRIMARY KEY,
    CustomerID   VARCHAR(15),
    OrderDate    DATE,
    OrderStatus  VARCHAR(20),
    TotalAmount  DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID)
);

CREATE TABLE products (
    ProductID    VARCHAR(15) PRIMARY KEY,
    ProductName  VARCHAR(100),
    Category     VARCHAR(50),
    Brand        VARCHAR(50),
    UnitPrice    DECIMAL(10,2),
    OrderID      VARCHAR(15),
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID)
);
