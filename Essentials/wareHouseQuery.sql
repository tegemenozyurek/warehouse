use railway;

CREATE TABLE warehouses (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            name VARCHAR(100) NOT NULL,
                            location VARCHAR(100)
);

CREATE TABLE products (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(100) NOT NULL,
                          sku VARCHAR(50) UNIQUE,
                          price DECIMAL(10,2)
);

CREATE TABLE warehouse_stocks (
                                  id INT AUTO_INCREMENT PRIMARY KEY,
                                  warehouse_id INT NOT NULL,
                                  product_id INT NOT NULL,
                                  stock INT NOT NULL DEFAULT 0,

                                  UNIQUE (warehouse_id, product_id),

                                  FOREIGN KEY (warehouse_id) REFERENCES warehouses(id),
                                  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE stock_movements (
                                 id INT AUTO_INCREMENT PRIMARY KEY,
                                 warehouse_id INT NOT NULL,
                                 product_id INT NOT NULL,
                                 quantity INT NOT NULL,
                                 movement_type ENUM('IN', 'OUT') NOT NULL,
                                 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

                                 FOREIGN KEY (warehouse_id) REFERENCES warehouses(id),
                                 FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO warehouses (name, location)
VALUES ('Main Warehouse', 'Izmir');

INSERT INTO products (name, sku, price)
VALUES ('Mouse', 'MS-001', 299.99);

INSERT INTO warehouse_stocks (warehouse_id, product_id, stock)
VALUES (1, 1, 10);

###### Stock IN ######
INSERT INTO stock_movements (warehouse_id, product_id, quantity, movement_type)
VALUES (1, 1, 5, 'IN');

UPDATE warehouse_stocks
SET stock = stock + 5
WHERE warehouse_id = 1 AND product_id = 1;

###### Stock OUT ######
INSERT INTO stock_movements (warehouse_id, product_id, quantity, movement_type)
VALUES (1, 1, 3, 'OUT');

UPDATE warehouse_stocks
SET stock = stock - 3
WHERE warehouse_id = 1 AND product_id = 1;

