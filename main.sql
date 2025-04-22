mv
-- Create the database (if not already created)
CREATE DATABASE IF NOT EXISTS DairyManagement;
USE DairyManagement;

-- Drop existing tables if they exist 
DROP TABLE IF EXISTS Milk_Sales;
DROP TABLE IF EXISTS Milk_Records;
DROP TABLE IF EXISTS Cows;
DROP TABLE IF EXISTS Buyers;
DROP TABLE IF EXISTS Farmers;


-- CREATING TABLE Farmers
CREATE TABLE Farmers (
    farmer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    location VARCHAR(100)
);

-- Table: Cows
CREATE TABLE Cows (
    cow_id INT PRIMARY KEY AUTO_INCREMENT,
    farmer_id INT NOT NULL,
    tag_number VARCHAR(50) UNIQUE NOT NULL,
    breed VARCHAR(50),
    dob DATE,
    FOREIGN KEY (farmer_id) REFERENCES Farmers(farmer_id)
);

-- Table: Milk_Records
CREATE TABLE Milk_Records (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    cow_id INT NOT NULL,
    record_date DATE NOT NULL,
    quantity_liters DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (cow_id) REFERENCES Cows(cow_id)
);

-- Table: Buyers
CREATE TABLE Buyers (
    buyer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100)
);

-- Table: Milk_Sales
CREATE TABLE Milk_Sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    buyer_id INT NOT NULL,
    sale_date DATE NOT NULL,
    liters_sold DECIMAL(5,2) NOT NULL,
    price_per_liter DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (buyer_id) REFERENCES Buyers(buyer_id)
);

-- Inserting data into the tables

-- Farmers table
INSERT INTO Farmers (name, phone, location) VALUES
('Joel Ngari', '0712345678', 'Embu'),

('Wanjiku Kariuki', '0723456789', 'Nyeri');

-- Cows table
INSERT INTO Cows (farmer_id, tag_number, breed, dob) VALUES
(1, 'TAG001', 'Friesian', '2020-03-01'),
(1, 'TAG002', 'Jersey', '2021-06-15'),
(2, 'TAG003', 'Guernsey', '2019-11-21');

-- Milk Records table
INSERT INTO Milk_Records (cow_id, record_date, quantity_liters) VALUES
(1, '2025-04-19', 10.5),
(1, '2025-04-20', 11.2),
(2, '2025-04-19', 8.9),
(3, '2025-04-20', 7.5);

-- Buyers table
INSERT INTO Buyers (name, phone, email) VALUES
('City Milk Ltd.', '0789001122', 'sales@citymilk.co.ke'),
('Local Market', '0799112233', 'market@local.co.ke');

-- Milk Sales table
INSERT INTO Milk_Sales (buyer_id, sale_date, liters_sold, price_per_liter) VALUES
(1, '2025-04-20', 25.00, 50.00),
(2, '2025-04-20', 15.00, 55.00);
