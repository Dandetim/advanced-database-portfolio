# Portfolio 2: Query Processing and Optimisation

## 1. Introduction

This portfolio demonstrates how SQL queries are used to retrieve and analyse data from the NaijaFresh Online Store database. It also examines query execution plans and the use of indexes to improve query performance.

The exercises use the database tables created for Portfolio 1, including `customers`, `categories`, `products`, `orders`, `order_items`, `payments`, `deliveries` and `reviews`.

## 2. SQL Query Exercises

Run the statements below in MySQL Workbench against `naijafresh_db`. Save screenshots of the queries and their results as evidence.

If your actual column names differ, check the table definition using `DESCRIBE table_name;` and adjust the statement before running it.

### 2.1 Retrieve Selected Columns

Retrieve only the product name, price and available stock:

```sql
SELECT product_name, price, stock_quantity
FROM products;
```

This demonstrates selecting specific columns instead of retrieving every field using `SELECT *`.

### 2.2 Retrieve Records Using a Condition

Find products with a price greater than ₦1,000:

```sql
SELECT product_name, price
FROM products
WHERE price > 1000;
```

### 2.3 Sort Retrieved Records

Display products from the lowest price to the highest price:

```sql
SELECT product_name, price
FROM products
ORDER BY price ASC;
```

Display the three most expensive products:

```sql
SELECT product_name, price
FROM products
ORDER BY price DESC
LIMIT 3;
```

### 2.4 Use Aggregate Functions

Count the products stored in the products table:

```sql
SELECT COUNT(*) AS total_products
FROM products;
```

Calculate the average product price:

```sql
SELECT AVG(price) AS average_product_price
FROM products;
```

### 2.5 Join Related Tables

Retrieve order items together with their related product names. This assumes `order_items.product_id` references `products.product_id`:

```sql
SELECT oi.order_id, p.product_name, oi.quantity, oi.unit_price
FROM order_items AS oi
JOIN products AS p
    ON oi.product_id = p.product_id;
```

If the actual order-item price column has a different name, use the name shown by `DESCRIBE order_items;`.

### 2.6 Group and Summarise Records

Calculate the number of products in each category. This assumes `products.category_id` references `categories.category_id`:

```sql
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM categories AS c
LEFT JOIN products AS p
    ON c.category_id = p.category_id
GROUP BY c.category_id, c.category_name;
```

### 2.7 Use a Subquery

Find products priced above the average price of all products:

```sql
SELECT product_name, price
FROM products
WHERE price > (
    SELECT AVG(price)
    FROM products
);
```

## 3. Query Execution Plans

### 3.1 Use EXPLAIN

Use `EXPLAIN` to inspect the execution plan chosen by MySQL for a query:

```sql
EXPLAIN
SELECT product_name, price
FROM products
WHERE price > 1000;
```

Review the output, including:

- Access type.
- Possible keys.
- Selected key.
- Estimated rows.
- Extra information.

These fields help explain how MySQL plans to retrieve the data.

### 3.2 Use EXPLAIN ANALYZE

Use `EXPLAIN ANALYZE` to execute the query and display its actual execution-plan information:

```sql
EXPLAIN ANALYZE
SELECT product_name, price
FROM products
WHERE price > 1000;
```

Review the execution tree, actual time, rows returned and loop count.

Unlike ordinary `EXPLAIN`, `EXPLAIN ANALYZE` runs the statement to collect actual execution measurements.

It is supported by MySQL 8.0.18 and later. If your installed MySQL version does not support it, record the version and use `EXPLAIN` instead.

## 4. Indexing and Optimisation

### 4.1 Create an Index

Create an index on the product price column to support queries that filter or sort by price:

```sql
CREATE INDEX idx_products_price
ON products(price);
```

### 4.2 Inspect the Index

```sql
SHOW INDEX FROM products;
```

### 4.3 Compare the Execution Plan

Run the same `EXPLAIN` query before and after creating the index, and save both outputs.

For a fair comparison, use the same query and data. MySQL may still choose a table scan when it estimates that this is more efficient, especially for a small table or a condition that returns many rows.

```sql
EXPLAIN
SELECT product_name, price
FROM products
WHERE price > 1000;
```

Do not claim that the index improved performance unless the execution-plan output or measured results support that conclusion. Record what MySQL actually selected.

## 5. Evidence to Include

Save genuine screenshots from MySQL Workbench showing:

1. Selected-column retrieval.
2. A filtered query using `WHERE`.
3. A sorted query using `ORDER BY` and `LIMIT`.
4. Aggregate query output.
5. A successful `JOIN` query and its result.
6. The `GROUP BY` query and its result.
7. The subquery and its result.
8. The `EXPLAIN` output.
9. The `EXPLAIN ANALYZE` output, if supported by the installed MySQL version.
10. The created index shown by `SHOW INDEX`.
11. The execution plan after indexing, for comparison with the plan before indexing.

Place the screenshots and SQL script in the `portfolio-2-query-optimisation` folder in the GitHub repository.

## 6. Performance Analysis and Reflection

In the final portfolio, explain what the execution plans showed in your own results.

Discuss whether MySQL used an index or performed a table scan, the estimated and actual rows where available, and the execution time reported by `EXPLAIN ANALYZE`.

An index can reduce the amount of data MySQL needs to examine for suitable queries. However, indexes also use storage and can add work to data changes such as inserts, updates and deletes.

The best optimisation should therefore be based on the query pattern and observed execution plan rather than assuming every index makes every query faster.

## 7. Conclusion

This portfolio applies SQL retrieval, filtering, sorting, aggregation, joins, grouping and subqueries to the NaijaFresh Online Store database.

It also uses MySQL execution-plan tools and indexing to examine query processing and optimisation.

