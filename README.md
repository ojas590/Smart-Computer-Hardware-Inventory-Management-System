# Smart Computer Hardware Inventory Management System

A database-focused **DBMS Mini Project** developed using MySQL to manage computer hardware products, categories, suppliers, purchases, and sales.

## Project Overview

The Smart Computer Hardware Inventory Management System is a relational database application designed to organize and manage computer hardware inventory records. It maintains product details, categorizes hardware components, stores supplier information, and records purchase and sales transactions.

The project demonstrates the practical implementation of database design concepts, SQL commands, primary and foreign keys, integrity constraints, joins, aggregate functions, subqueries, and views.

The primary focus is on **database design and SQL implementation**, without requiring a graphical user interface.

## Objectives

- Design a relational database for computer hardware inventory management.
- Organize hardware products into categories.
- Maintain supplier and product information.
- Record purchase and sales transactions.
- Establish relationships using primary keys and foreign keys.
- Apply integrity constraints to maintain data consistency.
- Retrieve meaningful information using SQL queries.
- Generate inventory information through a database view.

## Technologies Used

- **Database:** MySQL
- **Database Management Tool:** MySQL Workbench
- **Query Language:** SQL
- **Version Control:** Git and GitHub
- **ER Diagram Tool:** draw.io / diagrams.net

## Database Design

The database is named `smart_hardware_inventory` and consists of five relational tables.

| Table | Description |
|---|---|
| `categories` | Stores hardware categories such as processors, RAM, storage, and graphics cards. |
| `suppliers` | Stores supplier names, contact details, email addresses, and cities. |
| `products` | Stores product names, categories, suppliers, brands, prices, stock quantities, and reorder levels. |
| `purchases` | Records incoming hardware purchases, quantities, costs, suppliers, and invoice numbers. |
| `sales` | Records sales transactions, product quantities, selling prices, customers, and payment status. |

### Database Relationships

- One category can be associated with multiple products.
- One supplier can be associated with multiple products.
- One supplier can have multiple purchase records.
- One product can appear in multiple purchase records.
- One product can appear in multiple sales records.

These relationships are implemented using primary key and foreign key constraints.

## SQL Implementation

The project uses two separate SQL files to organize database creation and query execution.

### 1. `smart_hardware_inventory.sql`

This file contains the database definition and sample data.

- Database creation and configuration.
- Creation of all five tables.
- Primary key and foreign key constraints.
- `NOT NULL`, `UNIQUE`, and `CHECK` constraints.
- Sample data with 10 records in each table.

### 2. `inventory_queries.sql`

This file contains SQL queries for retrieving and analyzing inventory information.

| SQL Concept | Implementation |
|---|---|
| Basic SELECT | Display all products and filter products by price. |
| JOIN queries | Retrieve product, category, supplier, and sales details. |
| Aggregate functions | Count products by category and calculate sales value statistics. |
| Subqueries | Find products priced above the average and products that have never been sold. |
| Views | Create and retrieve `product_inventory_view`. |

## Project Structure

```text
Smart-Computer-Hardware-Inventory-Management-System/
│
├── smart_hardware_inventory.sql
├── inventory_queries.sql
├── README.md
│
├── ER_Diagram/
│   ├── Smart_Hardware_Inventory_ER_Diagram.drawio
│   └── Smart_Hardware_Inventory_ER_Diagram.png
│
└── Report/
    ├── Inventory_Management_Report.pdf
    └── screenshots/
```

The `ER_Diagram` and `Report` entries represent the planned organization for the remaining project deliverables. Add the corresponding files as they are completed.

## How to Run the Project

### Prerequisites

- MySQL Server
- MySQL Workbench

### Execution Steps

1. Clone or download this repository.
2. Open MySQL Workbench and connect to your MySQL Server instance.
3. Open `smart_hardware_inventory.sql`.
4. Review the script before execution and run it to create the database, tables, and sample records.
5. Open `inventory_queries.sql` in a separate SQL editor tab.
6. Execute the queries individually or in suitable groups.
7. Review the result grids to verify the query outputs.

**Important:** The database script contains `DROP DATABASE IF EXISTS smart_hardware_inventory;`. Running the complete script will delete the existing database with that name before recreating it. Back up any important data and review the script before execution.

## Expected Outcomes

After successful execution, the project provides:

- A relational database containing five interconnected tables.
- Sample records for demonstrating inventory operations.
- Supplier and category information linked to products.
- Purchase and sales transaction records.
- SQL query results for inventory retrieval and analysis.
- A database view combining product, category, supplier, pricing, and stock information.

## Conclusion

The Smart Computer Hardware Inventory Management System demonstrates how relational database concepts and SQL can be applied to a practical inventory management scenario. It provides hands-on experience with database creation, table relationships, constraints, data retrieval, aggregate analysis, subqueries, and views.

This project is intended for academic learning as part of a Database Management Systems laboratory mini project.
