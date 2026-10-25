-- Active: 1760630334103@@127.0.0.1@3306@practice_db
CREATE DATABASE practice_db;
USE practice_db;

CREATE TABLE produtcs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
)

-- SELECT * from produtcs

SET @num1 = 10;
SET @num2 = 10;
SET @num3 = 10;

SELECT 
    @num1+ @num2 + @num3 AS addition;    