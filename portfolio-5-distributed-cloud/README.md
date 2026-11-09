# Portfolio 5: Distributed and Cloud Database Exercise

## Case Study: NaijaFresh Online Store

### 1. Introduction

NaijaFresh is a simulated Nigerian online grocery store that sells products such as vegetables, fruits, grains, meat and poultry, and beverages.

As the platform grows, it may receive increasing numbers of customers, product searches, orders, and transactions. A single database server may eventually struggle to handle the workload or remain available during hardware or network failures.

This portfolio examines how distributed database technologies can help NaijaFresh improve availability, scalability, and reliability. MongoDB is used as the selected NoSQL database technology.

### 2. Database Technology

- **Database:** MongoDB
- **Interface:** MongoDB Compass
- **Deployment environment:** Local MongoDB server
- **Database name:** `naijafresh_nosql`
- **Collection:** `products`

MongoDB is a document-oriented NoSQL database. It stores information in flexible BSON documents and supports distributed database architectures.

### 3. Database Replication

Replication involves maintaining copies of database data across multiple database servers.

For NaijaFresh, replication would help protect product information and other important records against individual server failures.

MongoDB supports replication through a Replica Set.

A typical replica set consists of:

- **Primary member:** Receives write operations.
- **Secondary members:** Maintain copies of data from the primary member.
- **Automatic election:** A secondary member may become the new primary if the existing primary becomes unavailable and an election majority is available.

**Application to NaijaFresh:**

If the primary database server fails, another eligible replica-set member can take over, helping reduce service interruption.

### 4. Database Sharding

Sharding is a technique used to distribute large datasets across multiple database servers.

Instead of storing all data on one server, the database distributes data across multiple shards.

For NaijaFresh, product or order records could be distributed using an appropriate shard key, depending on the application's access patterns.

Potential benefits include:

- Improved horizontal scalability.
- Distribution of storage requirements.
- Distribution of query workloads.
- Support for growing volumes of customer and transaction data.

Sharding would be particularly useful if NaijaFresh expands its operations and accumulates large amounts of product and order information.

### 5. Availability and Fault Tolerance

Availability refers to the ability of a database system to remain accessible when users need it.

Fault tolerance is the ability of a system to continue operating despite the failure of some components.

MongoDB replication can improve availability by maintaining multiple copies of data and supporting primary-member elections.

For NaijaFresh, this can reduce the risk of the entire online store becoming unavailable when one database server experiences a failure.

### 6. Consistency

Consistency concerns the correctness and reliability of data across database operations and distributed database members.

MongoDB provides configurable read and write concerns.

- **Write concern:** Determines the acknowledgement required for a write operation.
- **Read concern:** Determines the consistency and isolation properties of data returned by read operations.

For NaijaFresh, appropriate consistency settings would help ensure that important information, such as product stock quantities and order records, is handled reliably.

### 7. Cloud Database Deployment

A cloud database deployment would allow NaijaFresh to host its database infrastructure using a managed cloud database service rather than relying entirely on a locally maintained server.

MongoDB Atlas is one example of a managed cloud database platform.

Potential advantages include:

- Managed database infrastructure.
- Scalability as application demand increases.
- Monitoring and backup capabilities.
- Support for distributed database configurations.

A future production deployment could use MongoDB Atlas to support the growth of NaijaFresh.

### 8. Application to NaijaFresh

A distributed database architecture would support the following business requirements:

| Business requirement | Relevant database feature |
|---|---|
| Protecting data against server failure | Replication |
| Managing growing datasets | Sharding |
| Reducing service interruption | Availability and failover |
| Maintaining reliable data operations | Read and write concerns |
| Supporting future infrastructure growth | Cloud deployment |

### 9. Implementation Status and Evidence

The local MongoDB server was connected successfully through MongoDB Compass.

The database `naijafresh_nosql` was created, and a `products` collection was populated with ten simulated product documents.

Queries were also performed to retrieve products using category, price, and stock-quantity conditions.

The replica-set configuration, sharding configuration, and cloud deployment have not been implemented as part of the work documented here. They are discussed as proposed approaches for a future distributed NaijaFresh deployment.

Screenshots of the actual MongoDB database, product documents, and query results will be included as implementation evidence.

### 10. Conclusion

Distributed database technologies can help NaijaFresh support future growth by improving scalability, availability, and data reliability.

MongoDB replication can provide additional protection against individual server failures, while sharding can distribute large datasets across multiple servers.

Cloud database deployment can also reduce infrastructure-management demands as the platform expands.

The exercise demonstrates the role of distributed database concepts in designing a more scalable and reliable online grocery platform.

### 11. References

- MongoDB Documentation – Replication: https://www.mongodb.com/docs/manual/replication/
- MongoDB Documentation – Sharding: https://www.mongodb.com/docs/manual/sharding/
- MongoDB Documentation – Read and Write Concern: https://www.mongodb.com/docs/manual/reference/read-concern/
- MongoDB Atlas: https://www.mongodb.com/products/platform/atlas-database
