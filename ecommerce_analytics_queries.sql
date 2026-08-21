/* ====================================================================
   Project: E-Commerce Payment & Revenue Analytics
   Author: Portfolio Project
   Environment: Microsoft SQL Server (SSMS)
   Dataset: Brazilian E-Commerce Public Dataset by Olist
==================================================================== */

-- Create a dedicated database for analytics
CREATE DATABASE EcommerceAnalytics;
GO

-- Set active context to the new database
USE EcommerceAnalytics;
GO


-- ====================================================================
-- Deliverable 1: Payment Method Breakdown & Revenue Share
-- Purpose: Analyze transaction volume, total revenue, average ticket 
--          size, and market share contribution across payment methods.
-- ====================================================================

SELECT 
    payment_type,
    COUNT(payment_type) AS number_payment,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_transaction_value,
    ROUND((SUM(payment_value) / SUM(SUM(payment_value)) OVER()) * 100, 2) AS revenue_pct
FROM dbo.order_payments
GROUP BY 
    payment_type
ORDER BY 
    total_revenue DESC;
GO


-- ====================================================================
-- Deliverable 2: High-Value Delivered Orders
-- Purpose: Filter delivered transactions with total spend exceeding 500
--          to identify VIP/high-ticket customer purchases.
-- ====================================================================

SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    ROUND(SUM(op.payment_value), 2) AS total_order_value
FROM dbo.order_payments AS op
INNER JOIN dbo.orders AS o
    ON op.order_id = o.order_id
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    o.order_id, 
    o.customer_id, 
    o.order_status
HAVING 
    SUM(op.payment_value) > 500
ORDER BY 
    total_order_value DESC;
GO


-- ====================================================================
-- Deliverable 3: Monthly Revenue & Order Velocity
-- Purpose: Track month-over-month platform growth by calculating unique 
--          completed orders and total generated revenue.
-- ====================================================================

SELECT 
    FORMAT(CAST(o.order_purchase_timestamp AS DATETIME2), 'yyyy-MM') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(op.payment_value), 2) AS total_monthly_revenue
FROM dbo.order_payments AS op
INNER JOIN dbo.orders AS o
    ON op.order_id = o.order_id
WHERE 
    o.order_status = 'delivered'
GROUP BY 
    FORMAT(CAST(o.order_purchase_timestamp AS DATETIME2), 'yyyy-MM') 
ORDER BY 
    order_month ASC;
GO


-- ====================================================================
-- Deliverable 4: Installment Behavior on High-Ticket Purchases
-- Purpose: Assess average transaction size across installment counts
--          for credit card transactions.
-- ====================================================================

SELECT
    payment_installments,
    COUNT(payment_installments) AS transaction_count,
    ROUND(SUM(payment_value), 2) AS total_revenue,
    ROUND(AVG(payment_value), 2) AS avg_ticket_size
FROM dbo.order_payments
WHERE
    payment_type = 'credit_card'
GROUP BY
    payment_installments
ORDER BY
    payment_installments ASC;
GO