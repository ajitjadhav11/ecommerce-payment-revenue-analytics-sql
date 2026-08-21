# E-Commerce Payment & Revenue Analytics (SQL Server)

## 📌 Project Overview
An end-to-end exploratory and commercial revenue analytics project built on Microsoft SQL Server (SSMS) using the Brazilian E-Commerce public dataset (Olist). This project evaluates financial transaction dynamics, installment elasticity, and monthly growth trajectories.

## 🛠️ Tech Stack & Skills
* **Database Engine:** Microsoft SQL Server
* **Environment:** SQL Server Management Studio (SSMS)
* **SQL Concepts:** Data Type Casting (`DATETIME2`), Window Aggregations (`OVER()`), String Formatting (`FORMAT`), Relational Joins (`INNER JOIN`), Multi-level Aggregations (`GROUP BY`, `HAVING`).

---

## 📊 Core Business Deliverables & Insights

### 1. Payment Channel Share
* **Credit Card dominance:** Generates **78.34%** of total platform gross revenue with an average ticket of **$163.32**.
* **Boleto (Bank Slip):** Captures **17.92%** market share, serving as the secondary payment channel.
* **Vouchers & Debit Cards:** Account for **< 4%** combined revenue.

### 2. High-Value Order Segmentation
* Filtered delivered purchases exceeding **$500** to isolate VIP transactions.
* The highest single delivered order totaled **$13,664.08**.

### 3. Monthly Revenue Trajectory & Velocity
* Analyzed order volume and revenue growth from late 2016 through mid-2018.
* Highlighted peak seasonal demand during November 2017 (Black Friday), generating **$1.15M+** across **7,289** completed orders.

### 4. Installment Mechanics & Average Order Value (AOV)
* Identified a direct positive relationship between installment options and purchase size:
  * **1 Installment:** Average order value of **$95.87**.
  * **10 Installments:** Average order value increases to **$415.09** (a **333%** uplift).

---

## 📁 Repository Structure
* `ecommerce_analytics_queries.sql` - Complete T-SQL script containing schema setups, data validation checks, and all 4 analytical queries.
* `olist_order_payments_dataset.csv` - Order payment transaction records.
* `olist_orders_dataset.csv` - Order status and timestamp metadata records.
* `README.md` - Project documentation and executive summary.
