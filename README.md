# SQLite Order Analysis Project

This project demonstrates various SQL queries used to analyze order data for a fictional e-commerce store. The queries focus on sales data analysis, including revenue calculations, top-selling products, order counts, and more. All queries are written using SQLite.

## Project Setup

1. **SQLite Database**: This project uses an SQLite database to store and analyze orders.
2. **Schema**: The main table used is `orders`, which contains the following columns:
   - `order_id` (INTEGER): A unique identifier for each order.
   - `product_id` (INTEGER): The ID of the product being sold.
   - `order_date` (TEXT): The date when the order was placed (in `YYYY-MM-DD` format).
   - `amount` (REAL): The total amount of the order.

## Queries Included

The following SQL queries are included in this project to analyze the order data:

### Step 1: Set Output Mode for Better View
```sql
.mode column
.width 20 20 20 20
