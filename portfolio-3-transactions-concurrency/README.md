# Portfolio 3: Transactions and Concurrency

## 1. Introduction

This portfolio demonstrates transaction management and concurrency control using the NaijaFresh Online Store database, implemented in MySQL.

The practical exercises demonstrate how transactions protect database consistency, how changes can be committed or rolled back, and how MySQL handles concurrent access to records.

## 2. Database Environment

- Database: `naijafresh_db`
- DBMS: MySQL
- Interface: MySQL Workbench
- Case study: NaijaFresh Online Store (simulated Nigerian grocery e-commerce platform)

## 3. Transaction Management

### 3.1 ROLLBACK Demonstration

A transaction was started using `START TRANSACTION`.

A test order was inserted into the `orders` table, and the table was queried to confirm the insertion.

The `ROLLBACK` command was then executed. A subsequent query showed that the test order had been removed and the original three orders remained.

**Observation:** ROLLBACK cancels uncommitted changes made within a transaction.

### 3.2 COMMIT Demonstration

A new transaction was started, and an order was inserted with a customer ID of 2, an amount of 2,500.00, and a Pending status.

The `COMMIT` command was executed, followed by a query of the `orders` table.

The result showed four records, confirming that the new order was saved.

**Observation:** COMMIT permanently saves the changes made within the transaction.

## 4. Concurrency Control

### 4.1 Testing Stock Updates with ROLLBACK

The product with ID 7, Frozen Chicken, initially had a stock quantity of 15.

A transaction was started, and the stock quantity was reduced by 2. The temporary result showed 13 units.

The transaction was rolled back, and a subsequent query showed that the stock quantity had returned to 15.

**Observation:** ROLLBACK restored the original stock quantity because the update had not been committed.

### 4.2 Row-Level Locking with SELECT FOR UPDATE

The following operation was used to lock the selected product record for updating:

```sql
SELECT *
FROM products
WHERE product_id = 7
FOR UPDATE;
```

The operation was executed within a transaction, and COMMIT was used to finish the transaction and release its lock.

### 4.3 Testing NOWAIT

A separate connection was used to test immediate access to the same locked product record using:

```sql
SELECT *
FROM products
WHERE product_id = 7
FOR UPDATE NOWAIT;
```

MySQL returned Error Code 3572, indicating that the statement could not immediately acquire the required lock.

**Observation:** NOWAIT prevents a transaction from waiting for a locked record. It returns an error when the lock cannot be acquired immediately.

## 5. Key Findings

The practical exercises demonstrated that:

1. `START TRANSACTION` begins a transaction.
2. `COMMIT` saves changes permanently.
3. `ROLLBACK` cancels uncommitted changes.
4. `SELECT FOR UPDATE` obtains a row lock for an update operation.
5. `NOWAIT` returns an error instead of waiting when a required lock is unavailable.

These mechanisms help protect database consistency when multiple users or transactions access the same data.

## 6. Conclusion

The exercises demonstrated how MySQL transactions and locking mechanisms can protect the integrity of an e-commerce database. The practical tests showed how uncommitted changes can be reversed, how committed changes are retained, and how row-level locks help control concurrent access.

## 7. Evidence

Screenshots and SQL implementation files for this portfolio are included in this repository to demonstrate the practical exercises and their execution results.
