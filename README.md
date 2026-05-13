# SQL Insurance Claims Analysis

## Project Overview

This project is part of my SQL portfolio focused on building practical data analysis skills using PostgreSQL.

It explores a simulated insurance claims dataset to understand how SQL can be used to analyse business data and extract useful operational insights.

The focus is on using SQL to identify patterns in claims data such as cost trends, frequency, and claim categories.

---

## Business Context

Insurance claims data is typically used to understand:
- high-cost claim categories
- frequent claim types
- severity patterns
- operational trends in claims processing

This project simulates that type of analysis using SQL.

---

## What I Worked On

In this project, I used SQL to perform structured analysis tasks including:

- analysing claim categories and costs  
- identifying frequent claim types  
- exploring severity patterns  
- using aggregations and grouping for insights  
- filtering and summarising claims data  

---

## How I Approached It

I focused on moving from raw data → structured analysis → meaningful insights.

The goal was not just to write queries, but to understand what the data means in a business context.

---

## Tools Used

- PostgreSQL  
- SQL  
- Git & GitHub  

---

## Example SQL Query

```sql
SELECT 
    claim_category,
    COUNT(*) AS total_claims,
    SUM(claim_amount) AS total_cost
FROM claims
GROUP BY claim_category
ORDER BY total_cost DESC;
