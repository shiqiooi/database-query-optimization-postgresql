📘 database-query-optimization-postgresql

This repository contains SQL scripts, datasets, and execution plan outputs for a PostgreSQL query optimisation study, focusing on how different query formulations and indexing strategies affect execution performance.

The study evaluates baseline vs optimised queries using
EXPLAIN (ANALYZE, BUFFERS) and compares execution strategies such as:

Sequential Scan vs Index Scan / Index Only Scan

Hash Aggregate vs Group Aggregate

Parallel execution behaviour

Sorting and aggregation costs

📂 Repository Structure
database-query-optimization-postgresql/
│
├── schema/
│   ├── 01_create_tables.sql
│   ├── 02_constraints.sql
│   ├── 03_create_indexes.sql
│   ├── 04_analyze.sql
│   ├── categories.csv
│   ├── cities.csv
│   ├── countries.csv
│   ├── customers.csv
│   ├── employees.csv
│   ├── products.csv
│   └── README.md
│
├── queries/
│   ├── A1_baseline.sql
│   ├── A2_optimised.sql
│   ├── B1_baseline.sql
│   ├── B2_optimised.sql
│   ├── C1_baseline.sql
│   ├── C2_optimised.sql
│   ├── C3_monthly_trend_2018.sql
│   ├── D1_baseline.sql
│   └── D2_optimised.sql
│
├── outputs/
│   ├── A1_plan.txt
│   ├── A2_plan.txt
│   ├── B1_plan.txt
│   ├── B2_plan.txt
│   ├── C1_plan.txt
│   ├── C2_plan.txt
│   ├── C3_plan.txt
│   ├── D1_plan.txt
│   └── D2_plan.txt
│
└── README.md

📊 Query Case Overview

Each case compares a baseline query with an optimised version, supported by execution plan outputs.

Case A – Customer Activity by City

A1 (Baseline):
Aggregates customer transactions by city using joins and grouping without index optimisation.

A2 (Optimised):
Uses indexed columns and improved aggregation strategy to reduce execution time.

Case B – Top Products by Sales Quantity

B1 (Baseline):
Computes total quantity sold per product with less efficient join and aggregation order.

B2 (Optimised):
Rewrites aggregation and join sequence to reduce buffer reads and execution cost.

Case C – Sales Date Filtering & Monthly Trend

C1 (Baseline):
Filters sales using DATE_TRUNC() on the column, preventing effective index usage.

C2 (Optimised):
Uses range-based date filtering to enable index scans.

C3:
Generates a monthly sales trend for the entire year 2018, grouped by month.

Case D – Transaction Frequency Analysis

D1 (Baseline):
Counts transactions per entity using non-optimised grouping.

D2 (Optimised):
Improves grouping and filtering strategy for faster aggregation.

🧪 Execution Plan Outputs

All execution plans are stored in the outputs/ folder and were generated using:

EXPLAIN (ANALYZE, BUFFERS)


Each .txt file corresponds one-to-one with its query file in queries/.

📁 Dataset Availability

Due to GitHub file size limitations, the transactional dataset sales.csv (>25MB) is not included in this repository.

📎 Download here:
https://drive.google.com/file/d/16aEuZmayBbqq4dVgbCXreY2y-kP1scQu/view?usp=sharing

All other dimension tables are included under schema/.

🔁 Reproducibility Instructions

Follow these steps to reproduce the results exactly:

1️⃣ Create Tables
\i schema/01_create_tables.sql

2️⃣ Apply Constraints
\i schema/02_constraints.sql

3️⃣ Load CSV Data

Use PostgreSQL COPY or pgAdmin Import Tool to load:

categories.csv

cities.csv

countries.csv

customers.csv

employees.csv

products.csv

sales.csv (from Google Drive)

4️⃣ Create Indexes
\i schema/03_create_indexes.sql

5️⃣ Run Baseline & Optimised Queries

Execute files in queries/ and capture plans using:

EXPLAIN (ANALYZE, BUFFERS)

6️⃣ Analyze Statistics
\i schema/04_analyze.sql

🛠 Technologies Used

PostgreSQL 18

pgAdmin 4

SQL (EXPLAIN ANALYZE, BUFFERS, parallel execution)

🎓 Academic Context

This repository supports a coursework submission on:

Relational query optimisation

Execution plan analysis

Indexing strategies in PostgreSQL

All queries, plans, and datasets are organised for clarity, reproducibility, and evaluation.
