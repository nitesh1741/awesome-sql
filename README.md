# 🚀 PRO-Level SQL Practice System

A complete **end-to-end SQL training environment** designed to take you from **zero to interview-ready** using a **real-world e-commerce + analytics database**.

This project includes:

* Production-grade database schema
* Large-scale realistic data
* Structured question sets (50 problems)
* Progressive difficulty (Basic → Advanced → FAANG patterns)

---

# 🏗️ Database Architecture

This schema simulates a real-world system like **Amazon / Flipkart**, covering:

* Users
* Products
* Orders
* Payments
* Reviews
* User activity events (analytics)

---

## 📌 Tables Overview

### 👤 users

Stores user information

| Column     | Type      | Description   |
| ---------- | --------- | ------------- |
| id         | SERIAL    | Primary key   |
| name       | VARCHAR   | User name     |
| email      | VARCHAR   | Unique email  |
| city       | VARCHAR   | User location |
| created_at | TIMESTAMP | Signup time   |

---

### 📦 products

Stores product catalog

| Column     | Type      |
| ---------- | --------- |
| id         | SERIAL    |
| name       | VARCHAR   |
| category   | VARCHAR   |
| price      | DECIMAL   |
| stock      | INT       |
| created_at | TIMESTAMP |

---

### 🛒 orders

Tracks user orders

| Column     | Type      |
| ---------- | --------- |
| id         | SERIAL    |
| user_id    | INT (FK)  |
| order_date | TIMESTAMP |
| status     | VARCHAR   |

---

### 📄 order_items

Line items inside each order

| Column     | Type     |
| ---------- | -------- |
| id         | SERIAL   |
| order_id   | INT (FK) |
| product_id | INT (FK) |
| quantity   | INT      |
| price      | DECIMAL  |

---

### 💳 payments

Payment transactions

| Column         | Type      |
| -------------- | --------- |
| id             | SERIAL    |
| order_id       | INT (FK)  |
| amount         | DECIMAL   |
| payment_method | VARCHAR   |
| status         | VARCHAR   |
| payment_date   | TIMESTAMP |

---

### ⭐ reviews

User feedback on products

| Column     | Type      |
| ---------- | --------- |
| id         | SERIAL    |
| user_id    | INT       |
| product_id | INT       |
| rating     | INT (1–5) |
| comment    | TEXT      |
| created_at | TIMESTAMP |

---

### 📊 events (🔥 Analytics Table)

Tracks user behavior

| Column     | Type      |
| ---------- | --------- |
| id         | SERIAL    |
| user_id    | INT       |
| event_type | VARCHAR   |
| product_id | INT       |
| event_time | TIMESTAMP |

---

# 📊 Data Scale

This project uses **realistic bulk data generation**:

| Table       | Records |
| ----------- | ------- |
| users       | 1,000   |
| products    | 200     |
| orders      | 5,000   |
| order_items | ~15,000 |
| payments    | 5,000   |
| reviews     | 2,000   |
| events      | 10,000  |

---

# ⚙️ Data Generation

Data is generated using PostgreSQL's powerful:

```sql
generate_series()
random()
array indexing
```

This ensures:

* Realistic distributions
* Non-uniform data
* Interview-like scenarios

---

# 🧠 Question Sets Structure

The practice problems are divided into **5 progressive levels**:

---

## 🟢 query_set_1 (Q1–10) — Foundations

* SELECT, WHERE, ORDER BY
* Basic aggregations

---

## 🔵 query_set_2 (Q11–20) — JOIN Mastery

* INNER / LEFT JOIN
* Multi-table relationships

---

## 🟡 query_set_3 (Q21–30) — Business Logic

* GROUP BY + HAVING
* KPIs and metrics

---

## 🔴 query_set_4 (Q31–40) — Advanced SQL

* Window functions
* CTEs
* Ranking, deduplication

---

## 🟣 query_set_5 (Q41–50) — FAANG Patterns 🔥

* Funnel analysis
* Cohort analysis
* Sessionization
* Fraud detection
* Retention & churn

---

# 🎯 Learning Objectives

By completing all query sets, you will:

✅ Master SQL fundamentals
✅ Think in relational models
✅ Write optimized queries
✅ Use window functions confidently
✅ Solve real-world analytics problems
✅ Be fully prepared for interviews

---

# 🚀 How to Use This Project

### 1. Setup Database

* Install PostgreSQL
* Create database: `practice_db`
* Run schema scripts

---

### 2. Insert Data

* Execute bulk data scripts
* Verify row counts

---

### 3. Practice Queries

* Start from `query_set_1.sql`
* Progress sequentially

---

### 4. Rules (Important)

* ❌ Do NOT copy solutions
* ✅ Think in steps (use CTEs)
* ✅ Optimize after solving
* ✅ Explain your logic out loud

---

# 💥 Interview Strategy

For each question:

1. Understand problem
2. Break into sub-queries
3. Use joins/CTEs
4. Optimize
5. Explain clearly

---

# 🔥 Key Patterns Covered

* Top-N per group
* Running totals
* Deduplication
* Funnel analysis
* Cohort analysis
* Retention & churn
* Ranking problems

---

# 📈 Outcome

After completing this project, you should be able to:

* Solve **medium + hard SQL problems confidently**
* Handle **real interview datasets**
* Think like a **data engineer / backend engineer**

---

# 🧑‍💻 Author Goal

This project is built to simulate:

> "What you would face inside a real tech company"

---

# ⭐ Next Steps

* Add solutions folder (optional)
* Track performance (time per question)
* Revisit weak areas

---

# 🚀 Final Note

If you can solve all 50 problems **without help**,
you are **interview-ready for top-tier companies**.

---
