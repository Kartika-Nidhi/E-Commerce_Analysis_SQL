USE eda_project_db;



-- ============================================================
-- 1. CATEGORIES
-- ============================================================

CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL UNIQUE
);


-- ============================================================
-- 2. SUBCATEGORIES
-- ============================================================

CREATE TABLE subcategories (
    subcategory_id INT PRIMARY KEY,
    subcategory_name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,

    CONSTRAINT fk_subcategory_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id),

    CONSTRAINT uq_subcategory_category
        UNIQUE (subcategory_name, category_id)
);


-- ============================================================
-- 3. BRANDS
-- ============================================================

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(150) NOT NULL UNIQUE
);


-- ============================================================
-- 4. SUPPLIERS
-- ============================================================

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(150) NOT NULL UNIQUE
);


-- ============================================================
-- 5. CUSTOMERS
-- ============================================================

CREATE TABLE customers (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_name VARCHAR(150),
    customer_age INT,
    gender VARCHAR(20),
    customer_segment VARCHAR(50),
    customer_type VARCHAR(50),
    customer_city VARCHAR(100),
    customer_state VARCHAR(100),
    customer_country VARCHAR(100),
    region VARCHAR(100),
    customer_postal_code VARCHAR(30),
    customer_acquisition_cost DECIMAL(12,2)
);


-- ============================================================
-- 6. PRODUCTS
-- ============================================================

CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_name VARCHAR(255),
    subcategory_id INT NOT NULL,
    brand_id INT NOT NULL,
    supplier_id INT NOT NULL,
    unit_price DECIMAL(12,2),
    product_cost DECIMAL(12,2),
    product_rating DECIMAL(3,2),

    CONSTRAINT fk_product_subcategory
        FOREIGN KEY (subcategory_id)
        REFERENCES subcategories(subcategory_id),

    CONSTRAINT fk_product_brand
        FOREIGN KEY (brand_id)
        REFERENCES brands(brand_id),

    CONSTRAINT fk_product_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);


-- ============================================================
-- 7. MARKETING CAMPAIGNS
-- ============================================================

CREATE TABLE marketing_campaigns (
    campaign_id INT PRIMARY KEY,
    campaign_name VARCHAR(150) NOT NULL,
    marketing_channel VARCHAR(100),

    CONSTRAINT uq_campaign
        UNIQUE (campaign_name, marketing_channel)
);


-- ============================================================
-- 8. ORDERS
-- ============================================================

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    order_date DATE,
    order_time TIME,
    order_status VARCHAR(50),
    sales_channel VARCHAR(50),
    customer_id VARCHAR(50) NOT NULL,
    currency VARCHAR(10),
    campaign_id INT,
    coupon_code VARCHAR(100),

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_order_campaign
        FOREIGN KEY (campaign_id)
        REFERENCES marketing_campaigns(campaign_id)
);


-- ============================================================
-- 9. ORDER ITEMS
-- ============================================================

CREATE TABLE order_items (
    order_item_id BIGINT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(12,2),
    discount_percentage DECIMAL(8,2),
    discount_amount DECIMAL(12,2),
    gross_sales DECIMAL(14,2),
    tax_amount DECIMAL(14,2),
    shipping_cost DECIMAL(14,2),
    net_sales DECIMAL(14,2),
    product_cost DECIMAL(14,2),
    profit DECIMAL(14,2),

    CONSTRAINT fk_order_item_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_order_item_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


-- ============================================================
-- 10. PAYMENTS
-- ============================================================

CREATE TABLE payments (
    payment_id BIGINT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    currency VARCHAR(10),

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- ============================================================
-- 11. SHIPMENTS
-- ============================================================

CREATE TABLE shipments (
    shipment_id BIGINT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    shipping_method VARCHAR(50),
    warehouse VARCHAR(100),
    delivery_days INT,
    estimated_delivery_days INT,
    delivery_status VARCHAR(50),

    CONSTRAINT fk_shipment_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- ============================================================
-- 12. RETURNS
-- ============================================================

CREATE TABLE returns (
    return_id BIGINT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    return_status VARCHAR(50),
    return_reason VARCHAR(255),

    CONSTRAINT fk_return_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- ============================================================
-- 13. REVIEWS
-- ============================================================

CREATE TABLE reviews (
    review_id BIGINT PRIMARY KEY,
    order_id VARCHAR(50) NOT NULL,
    customer_id VARCHAR(50) NOT NULL,
    customer_rating DECIMAL(3,2),
    review_sentiment VARCHAR(30),
    customer_review TEXT,

    CONSTRAINT fk_review_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    CONSTRAINT fk_review_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- ============================================================
-- 14. LOYALTY TRANSACTIONS
-- ============================================================

CREATE TABLE loyalty_transactions (
    loyalty_transaction_id BIGINT PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    order_id VARCHAR(50) NOT NULL,
    loyalty_points_earned INT,
    loyalty_points_redeemed INT,

    CONSTRAINT fk_loyalty_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    CONSTRAINT fk_loyalty_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


-- ============================================================
-- 15. CUSTOMER METRICS
-- ============================================================

CREATE TABLE customer_metrics (
    customer_id VARCHAR(50) PRIMARY KEY,
    customer_lifetime_value DECIMAL(14,2),
    is_repeat_customer BOOLEAN,
    customer_order_count INT,

    CONSTRAINT fk_customer_metrics_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- ============================================================
-- VERIFY TABLES
-- ============================================================

SHOW TABLES;