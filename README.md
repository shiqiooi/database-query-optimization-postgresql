# database-query-optimization-postgresql
SQL scripts, datasets, and execution plan outputs for a PostgreSQL query optimisation study analysing execution strategies using EXPLAIN (ANALYZE, BUFFERS).

schema/
│── 01_create_tables.sql
│── 02_constraints.sql
│── 03_create_indexes.sql
│── 04_analyze.sql
│── baseline_queries.sql
│── optimised_queries.sql

data/
│── categories.csv
│── cities.csv
│── countries.csv
│── customers.csv
│── employees.csv
│── products.csv


---

## Dataset Availability

Due to GitHub file size limitations, the transactional `sales.csv` file
(>25MB) is not included directly in this repository.

The full dataset is available externally at:

**https://drive.google.com/file/d/16aEuZmayBbqq4dVgbCXreY2y-kP1scQu/view?usp=sharing**

All schema definitions, index scripts, and analytical queries in this
repository are sufficient to fully reproduce the experimental setup and
query optimisation results once the dataset is loaded locally.

---

## Reproducibility Instructions

1. Create the database schema using:


01_create_tables.sql
02_constraints.sql


2. Load the CSV datasets into PostgreSQL (COPY command).

3. Create indexes using:


03_create_indexes.sql


4. Execute baseline and optimised queries:


baseline_queries.sql
optimised_queries.sql


5. Analyse execution plans using:


04_analyze.sql


---

## Technologies Used

- PostgreSQL 18
- pgAdmin 4
- SQL (EXPLAIN ANALYZE, BUFFERS)

---

## Academic Context

This repository supports a coursework submission on relational
query optimisation and performance analysis.
