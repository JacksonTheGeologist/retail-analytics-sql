# Retail Analytics SQL Project

## Overview
This project analyzes retail transaction data to understand products, stores, sales and revenue performance using SQL.

The focus is on:
- Correct data modeling 
- Safe joins and aggregation
- Business-relevant insights

## Dataset
The dataset includes 4 tables and came from kaggle.com

- transactions: line-item level retail transactions
- products: product metadata including price and category
- customers: customer attributes
- stores: store information

## Data Grain
- transactions: Transactions at the individual product level, multiple products in a single sale would be under 2 different transaction ids
- products, customers, and stores are dimension tables. 

## Key Questions
- Which products and stores generate the most revenue?
- How do the discouns impact total revenue?
- Are there customers, products, or stores with no activity?
- Which products perform best within each store?

## Tools
- SQL (PostgreSQL)
- GItHub for version control and documentation. 
