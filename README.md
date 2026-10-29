# Smart Computer Hardware Inventory Management System

A SQL-based Database Management System (DBMS) mini project developed using **MySQL** to manage computer hardware products, categories, suppliers, purchases, and sales.

## Project Overview

The Smart Computer Hardware Inventory Management System is designed to organize computer hardware inventory records in a relational database. It stores product information, categorizes hardware components, maintains supplier details, and records purchase and sales transactions.

This project focuses on database design and SQL implementation, including relational tables, primary keys, foreign keys, constraints, and sample data.

## Objectives

- Design a relational database for computer hardware inventory management.
- Organize products into categories.
- Maintain supplier information.
- Record hardware purchases and sales.
- Implement primary key and foreign key relationships.
- Apply SQL constraints to improve data integrity.
- Practice database creation, data manipulation, and SQL queries.

## Technologies Used

- **Database:** MySQL
- **Database Management Tool:** MySQL Workbench
- **Version Control:** Git and GitHub
- **ER Diagram Tool:** draw.io / diagrams.net

## Database Tables

The database consists of five tables:

| Table | Description |
|---|---|
| `categories` | Stores computer hardware categories. |
| `suppliers` | Stores supplier and contact information. |
| `products` | Stores product details, categories, suppliers, prices, and stock levels. |
| `purchases` | Records incoming hardware purchases. |
| `sales` | Records outgoing hardware sales and payment status. |

## Database Relationships

- A category can be associated with multiple products.
- A supplier can supply multiple products.
- A supplier can be associated with multiple purchase records.
- A product can appear in multiple purchase records.
- A product can appear in multiple sales records.

These relationships are implemented using primary keys and foreign keys.

## Project Structure

```text
Smart-Computer-Hardware-Inventory-Management-System/
├── smart_hardware_inventory.sql
├── README.md
├── ER_Diagram/
└── Report/
```

The `ER_Diagram` and `Report` directories will contain the ER diagram, relational schema, project documentation, and output screenshots as they are prepared.

## How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Download or clone this repository.
3. Open `smart_hardware_inventory.sql` in MySQL Workbench.
4. Review the SQL script before executing it.
5. Execute the script to create the database, tables, and sample records.
6. Verify the tables and records using SQL queries.

**Important:** The SQL script contains `DROP DATABASE IF EXISTS smart_hardware_inventory;`. Executing the complete script will delete an existing database with that name. Back up any important data and review the script before running it.

## Current Implementation

The SQL script includes:

- Database creation and configuration.
- Five relational tables.
- Primary keys and foreign key constraints.
- Data integrity constraints, including `NOT NULL`, `UNIQUE`, and `CHECK`.
- Ten sample records in each table.

Additional deliverables, including the ER diagram, relational schema, SQL query demonstrations, and project report, will be maintained in the repository as they are completed.

## Project Purpose

This project is developed for academic learning as part of a Database Management Systems laboratory mini project. It demonstrates the practical application of relational database design and SQL using a computer hardware inventory scenario.

## License

This project is intended for educational and academic purposes.
