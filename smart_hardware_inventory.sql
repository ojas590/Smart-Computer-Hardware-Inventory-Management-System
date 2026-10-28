
-- SMART COMPUTER HARDWARE INVENTORY MANAGEMENT SYSTEM
DROP DATABASE IF EXISTS smart_hardware_inventory;
CREATE DATABASE smart_hardware_inventory
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE smart_hardware_inventory;

-- 1. CATEGORIES
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(60) NOT NULL UNIQUE,
    description VARCHAR(255)
) ENGINE=InnoDB;

INSERT INTO categories (category_id, category_name, description) VALUES
(1, 'Processors', 'Desktop and laptop CPUs'),
(2, 'Memory (RAM)', 'Desktop and laptop memory modules'),
(3, 'Storage', 'SSD and hard disk drives'),
(4, 'Motherboards', 'Computer mainboards'),
(5, 'Graphics Cards', 'Dedicated graphics processing units'),
(6, 'Power Supplies', 'Computer power supply units'),
(7, 'Cooling', 'CPU coolers and case fans'),
(8, 'Monitors', 'Computer display screens'),
(9, 'Keyboards', 'Wired and wireless keyboards'),
(10, 'Networking', 'Network adapters and Wi-Fi devices');

-- 2. SUPPLIERS
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    city VARCHAR(60)
) ENGINE=InnoDB;

INSERT INTO suppliers
(supplier_id, supplier_name, contact_person, phone, email, city) VALUES
(1, 'TechSource Distributors', 'Amit Sharma', '9876501001', 'amit@techsource.example', 'Pune'),
(2, 'Prime Computer Supplies', 'Neha Patil', '9876501002', 'neha@primecomp.example', 'Mumbai'),
(3, 'Digital Parts Hub', 'Rahul Verma', '9876501003', 'rahul@digitalhub.example', 'Nagpur'),
(4, 'NextGen Hardware', 'Priya Joshi', '9876501004', 'priya@nextgen.example', 'Nashik'),
(5, 'Reliable IT Wholesale', 'Karan Shah', '9876501005', 'karan@reliableit.example', 'Aurangabad'),
(6, 'SmartTech Traders', 'Sneha Kulkarni', '9876501006', 'sneha@smarttech.example', 'Pune'),
(7, 'Core Components India', 'Vikas Rao', '9876501007', 'vikas@corecomponents.example', 'Hyderabad'),
(8, 'Vision Display Supply', 'Pooja Deshmukh', '9876501008', 'pooja@visiondisplay.example', 'Mumbai'),
(9, 'Network World Supplies', 'Arjun Mehta', '9876501009', 'arjun@networkworld.example', 'Bengaluru'),
(10, 'Universal PC Parts', 'Riya Singh', '9876501010', 'riya@universalpc.example', 'Delhi');

-- 3. PRODUCTS
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    supplier_id INT NOT NULL,
    brand VARCHAR(60) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity_in_stock INT NOT NULL DEFAULT 0,
    reorder_level INT NOT NULL DEFAULT 5,
    CONSTRAINT fk_products_category
      FOREIGN KEY (category_id) REFERENCES categories(category_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_products_supplier
      FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_product_price CHECK (unit_price >= 0),
    CONSTRAINT chk_product_stock CHECK (quantity_in_stock >= 0),
    CONSTRAINT chk_product_reorder CHECK (reorder_level >= 0)
) ENGINE=InnoDB;

INSERT INTO products
(product_id, product_name, category_id, supplier_id, brand, unit_price, quantity_in_stock, reorder_level) VALUES
(1, 'Core i5 Processor', 1, 1, 'Intel', 18500.00, 12, 5),
(2, '16GB DDR4 RAM', 2, 2, 'Kingston', 3200.00, 25, 8),
(3, '1TB NVMe SSD', 3, 3, 'Samsung', 6500.00, 4, 6),
(4, 'B550 Motherboard', 4, 4, 'MSI', 11200.00, 7, 3),
(5, 'RTX 4060 Graphics Card', 5, 7, 'NVIDIA', 31000.00, 3, 4),
(6, '650W Power Supply', 6, 5, 'Corsair', 5900.00, 10, 4),
(7, 'CPU Air Cooler', 7, 6, 'Cooler Master', 2400.00, 15, 5),
(8, '24-inch LED Monitor', 8, 8, 'LG', 9200.00, 6, 3),
(9, 'Mechanical Keyboard', 9, 10, 'Redragon', 2800.00, 18, 6),
(10, 'Wi-Fi 6 Network Adapter', 10, 9, 'TP-Link', 1800.00, 5, 5);

-- 4. PURCHASES (incoming stock)
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    supplier_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    quantity INT NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    invoice_number VARCHAR(40) NOT NULL UNIQUE,
    CONSTRAINT fk_purchases_product
      FOREIGN KEY (product_id) REFERENCES products(product_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_purchases_supplier
      FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_purchase_quantity CHECK (quantity > 0),
    CONSTRAINT chk_purchase_cost CHECK (unit_cost >= 0)
) ENGINE=InnoDB;

INSERT INTO purchases
(purchase_id, product_id, supplier_id, purchase_date, quantity, unit_cost, invoice_number) VALUES
(1, 1, 1, '2026-01-05', 15, 17000.00, 'PUR-2026-001'),
(2, 2, 2, '2026-01-08', 30, 2800.00, 'PUR-2026-002'),
(3, 3, 3, '2026-01-10', 12, 5700.00, 'PUR-2026-003'),
(4, 4, 4, '2026-01-12', 10, 9800.00, 'PUR-2026-004'),
(5, 5, 7, '2026-01-15', 6, 28500.00, 'PUR-2026-005'),
(6, 6, 5, '2026-01-18', 14, 5100.00, 'PUR-2026-006'),
(7, 7, 6, '2026-01-20', 20, 1950.00, 'PUR-2026-007'),
(8, 8, 8, '2026-01-22', 8, 8100.00, 'PUR-2026-008'),
(9, 9, 10, '2026-01-25', 22, 2250.00, 'PUR-2026-009'),
(10, 10, 9, '2026-01-28', 10, 1400.00, 'PUR-2026-010');

-- 5. SALES (outgoing stock)
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    sale_date DATE NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    customer_name VARCHAR(100) NOT NULL,
    payment_status ENUM('Paid', 'Pending', 'Partially Paid') NOT NULL DEFAULT 'Paid',
    CONSTRAINT fk_sales_product
      FOREIGN KEY (product_id) REFERENCES products(product_id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT chk_sale_quantity CHECK (quantity > 0),
    CONSTRAINT chk_sale_price CHECK (unit_price >= 0)
) ENGINE=InnoDB;

INSERT INTO sales
(sale_id, product_id, sale_date, quantity, unit_price, customer_name, payment_status) VALUES
(1, 1, '2026-02-01', 2, 19500.00, 'Aarav Computers', 'Paid'),
(2, 2, '2026-02-02', 5, 3500.00, 'Bright Office IT', 'Paid'),
(3, 3, '2026-02-03', 3, 7000.00, 'Patil Computer Services', 'Pending'),
(4, 4, '2026-02-04', 2, 12500.00, 'Smart Systems', 'Paid'),
(5, 5, '2026-02-05', 1, 33500.00, 'Digital Point', 'Partially Paid'),
(6, 6, '2026-02-06', 4, 6500.00, 'Aarav Computers', 'Paid'),
(7, 7, '2026-02-07', 3, 2800.00, 'Bright Office IT', 'Paid'),
(8, 8, '2026-02-08', 2, 10500.00, 'Vision Tech', 'Pending'),
(9, 9, '2026-02-09', 6, 3200.00, 'Campus IT Store', 'Paid'),
(10, 10, '2026-02-10', 2, 2200.00, 'Network Solutions', 'Paid');

