CREATE DATABASE IF NOT EXISTS order_system;
USE order_system;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE NOT NULL,
    phone VARCHAR(20),
    birth_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE,
    total_amount DECIMAL(10,2),
    payment_method VARCHAR(50),
    status VARCHAR(50),
    shipped BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

INSERT INTO customers (full_name, email, phone, birth_date, is_active)
VALUES
('Juan Pérez', 'juan1@email.com', '3001111111', '1990-01-01', TRUE),
('Ana Gómez', 'ana2@email.com', '3002222222', '1992-02-02', TRUE),
('Carlos Ruiz', 'carlos3@email.com', '3003333333', '1988-03-03', TRUE),
('Laura Díaz', 'laura4@email.com', '3004444444', '1995-04-04', TRUE),
('Pedro Torres', 'pedro5@email.com', '3005555555', '1993-05-05', TRUE),
('María López', 'maria6@email.com', '3006666666', '1991-06-06', TRUE),
('Sofía Castro', 'sofia7@email.com', '3007777777', '1994-07-07', TRUE),
('Diego Morales', 'diego8@email.com', '3008888888', '1987-08-08', TRUE),
('Paula Herrera', 'paula9@email.com', '3009999999', '1996-09-09', TRUE),
('Andrés Vega', 'andres10@email.com', '3010000000', '1990-10-10', TRUE),
('Camila Rojas', 'camila11@email.com', '3011111111', '1992-11-11', TRUE),
('Miguel Sánchez', 'miguel12@email.com', '3012222222', '1989-12-12', TRUE),
('Valentina Cruz', 'valentina13@email.com', '3013333333', '1993-01-13', TRUE),
('Jorge Molina', 'jorge14@email.com', '3014444444', '1994-02-14', TRUE),
('Daniela Romero', 'daniela15@email.com', '3015555555', '1995-03-15', TRUE);

INSERT INTO orders (customer_id, order_date, total_amount, payment_method, status, shipped)
VALUES
(1, '2024-01-01', 120.50, 'Credit Card', 'Pending', FALSE),
(2, '2024-01-02', 220.00, 'Cash', 'Completed', TRUE),
(3, '2024-01-03', 89.99, 'Transfer', 'Pending', FALSE),
(4, '2024-01-04', 300.75, 'Credit Card', 'Shipped', TRUE),
(5, '2024-01-05', 150.00, 'Cash', 'Pending', FALSE),
(6, '2024-01-06', 99.99, 'Transfer', 'Completed', TRUE),
(7, '2024-01-07', 450.00, 'Credit Card', 'Pending', FALSE),
(8, '2024-01-08', 75.25, 'Cash', 'Shipped', TRUE),
(9, '2024-01-09', 180.40, 'Transfer', 'Pending', FALSE),
(10, '2024-01-10', 210.00, 'Credit Card', 'Completed', TRUE),
(11, '2024-01-11', 60.00, 'Cash', 'Pending', FALSE),
(12, '2024-01-12', 99.50, 'Transfer', 'Shipped', TRUE),
(13, '2024-01-13', 130.00, 'Credit Card', 'Pending', FALSE),
(14, '2024-01-14', 175.75, 'Cash', 'Completed', TRUE),
(15, '2024-01-15', 250.00, 'Transfer', 'Pending', FALSE);