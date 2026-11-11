Portfolio 1: Database Design and Modelling
Case Study: NaijaFresh Online Store
Overview
NaijaFresh is a simulated Nigerian online grocery store selling vegetables, fruits, grains, meat and poultry, and beverages. Its database supports customer registration, product management, order processing, payments, deliveries and customer reviews.
Relational Database
The MySQL database is named naijafresh_db and contains eight tables:
- customers: customer details and contact information.
- categories: grocery product categories.
- products: product descriptions, prices and stock quantities.
- orders: customer order headers and status.
- order_items: products and quantities within each order.
- payments: payment method, amount and status.
- deliveries: delivery address and status.
- reviews: customer ratings and comments.
Keys, Relationships and Constraints
Primary keys uniquely identify records. Foreign keys connect products to categories, orders to customers, order items to orders and products, payments and deliveries to orders, and reviews to customers and products. Unique and other constraints support data integrity. The reviews table includes a rating constraint from 1 to 5.
Normalisation
Separating customers, categories, products, orders and related records into different tables reduces repeated data and supports consistent updates. The order_items table separates order headers from individual products, allowing one order to contain multiple products.
Implementation and Evidence
The schema was created and inspected using MySQL Workbench. The SQL scripts, ER diagram/relational model, table structures and implementation screenshots are stored in this portfolio folder.
Learning Outcome
This activity developed practical understanding of relational schema design, primary and foreign keys, constraints, table relationships and transactional data organisation.
