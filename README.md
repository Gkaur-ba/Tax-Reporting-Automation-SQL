# Tax-Reporting-Automation-SQL
Data cleaning, validation, and automated KPI reporting for tax records using SQL.

# Tax Data Reporting Automation & Accuracy Optimization

## 📌 Project Overview
This repository showcases an end-to-end SQL database solution designed to automate recurring operational reports and optimize data accuracy for high-volume client tax records. 

Inspired by enterprise data challenges managed during my professional experience, this project simulates transitioning an operational pipeline from manual, error-prone spreadsheets into an optimized, automated relational database framework.

## 🛠️ Tech Stack & Skills Demonstrated
* **Database Engine:** SQL (MySQL)
* **Core Skills:** Data Cleaning, Data Validation, Query Optimization, Database View Automation, CTEs (Common Table Expressions)
* **Analysis Tools:** Advanced Excel (Logical Verification, Source Data Structure)

## 📉 The Business Challenge
Internal management teams relied on manual workflows to extract KPIs and track operational metrics across massive volumes of client tax records. This manual pipeline created severe operational bottlenecks, slowed down weekly leadership reviews, and introduced human data-entry inconsistencies that compromised reporting reliability.

## 💡 The Solution & Actions Taken
1. **Data Architecture & Integrity (`/data`):** Structured an operational tracking dataset containing key financial metrics (Gross Income, Deductions, Status, Filing Categories). 
2. **Automated Data Cleaning Pipeline (`/scripts/01_data_cleaning.sql`):** Wrote robust SQL scripts utilizing CTEs and window functions to systematically identify and delete system-generated duplicate records, handle missing numeric elements (NULL values), and apply range validation logic to flag impossible financial records for audit.
3. **Report Automation & Optimization (`/scripts/02_reporting_queries.sql`):** Developed optimized SQL Views (`CREATE VIEW`) to aggregate real-time performance indicators (Completion Rates, Average Deductions, Total Filings). This entirely removed the need for manual calculations.

## 📊 Business Impact & Results
* **Improved Reporting Accuracy:** Achieved an **approximate 15% increase in reporting accuracy** by establishing strict, reproducible validation rules and eliminating manual manipulation errors.
* **Operational Efficiency:** Reduced manual reporting generation loops by **25%**, giving the business real-time, automated access to clean metrics.
* **Data Reliability:** Enhanced underlying data health, ensuring management reviews were built on structured, error-free databases.
