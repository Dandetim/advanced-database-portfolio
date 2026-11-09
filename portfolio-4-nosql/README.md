# Portfolio 4: NoSQL and Advanced Data Models

## Case Study: NaijaFresh Online Store

### 1. Introduction

NaijaFresh is a simulated Nigerian online grocery store that sells products such as vegetables, fruits, grains, meat and poultry, and beverages.

This portfolio demonstrates how a NoSQL database can be used to store and retrieve product information using MongoDB.

### 2. Database Technology

**Database:** MongoDB  
**Interface:** MongoDB Compass  
**Deployment:** Local MongoDB server

MongoDB is a document-oriented NoSQL database. It stores information in flexible BSON documents rather than requiring every record to follow a fixed relational table structure.

### 3. Database Implementation

A database named `naijafresh_nosql` was created.

A collection named `products` was created to store grocery product information.

Each product document contains fields such as:

- `product_id`
- `product_name`
- `category`
- `price`
- `stock_quantity`
- `description`

Ten sample product documents were inserted successfully.

### 4. Practical Operations Performed

The following operations were tested using MongoDB Compass:

1. Created the database and products collection.
2. Inserted ten product documents.
3. Retrieved product documents.
4. Filtered products using comparison operators such as `$lt` and `$gt`.
5. Filtered products by category and stock quantity.
6. Sorted products in ascending order using `1`.
7. Sorted products in descending order using `-1`.
8. Limited query results to three documents.

### 5. Why MongoDB Is Suitable for NaijaFresh

MongoDB is suitable for this simulated grocery platform because:

- Its flexible document structure allows product records to contain different attributes.
- It supports efficient filtering and retrieval of product information.
- It supports sorting and limiting query results.
- It can accommodate additional product information as the store expands.

### 6. Evidence

Screenshots of the following practical activities are included in the portfolio evidence:

- MongoDB Compass connection.
- Database and collection creation.
- Product document insertion.
- Product filtering.
- Ascending and descending sorting.
- Limiting query results.

### 7. Learning Outcome

This exercise improved my understanding of document-oriented databases and practical MongoDB operations. I learned how to create collections, insert documents, retrieve records, filter data, sort results and limit query output.

### 8. Conclusion

The exercise demonstrated how MongoDB can support the storage and retrieval of product information for NaijaFresh. The practical implementation provided experience with NoSQL database operations using MongoDB Compass.
