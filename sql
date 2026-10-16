-- =====================================================================
-- Assignment: Week 1 MySQL Database Assignment
-- Topic: Library Management System
-- Description: Creating and managing a MySQL database using SQL commands.
-- =====================================================================

-- 1. Create the Database
CREATE DATABASE IF NOT EXISTS library_db;

-- 2. Select the Database for use
USE library_db;

-- 3. Create Tables
-- Table 1: Authors (Independent table)
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    country VARCHAR(50)
);

-- Table 2: Books (Dependent on authors via Foreign Key)
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    publication_year INT,
    genre VARCHAR(50),
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-- Table 3: Members (Independent table)
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE
);

-- 4. Insert Sample Data
INSERT INTO authors (first_name, last_name, country) VALUES
('J.K.', 'Rowling', 'United Kingdom'),
('George', 'Orwell', 'United Kingdom'),
('J.R.R.', 'Tolkien', 'United Kingdom');

INSERT INTO books (title, author_id, publication_year, genre, available_copies) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 1997, 'Fantasy', 3),
('1984', 2, 1949, 'Dystopian', 5),
('The Hobbit', 3, 1937, 'Fantasy', 2);

INSERT INTO members (first_name, last_name, email, join_date) VALUES
('Alice', 'Smith', 'alice@example.com', '2026-01-15'),
('Bob', 'Jones', 'bob@example.com', '2026-02-10');

-- 5. Query the Data (Retrieval Examples)
-- View all books with their respective authors using a JOIN
SELECT 
    b.book_id, 
    b.title, 
    CONCAT(a.first_name, ' ', a.last_name) AS author_name, 
    b.publication_year, 
    b.genre, 
    b.available_copies
FROM books b
JOIN authors a ON b.author_id = a.author_id;

-- 6. Update Data Example
-- Update the available copies for a specific book
UPDATE books 
SET available_copies = 4 
WHERE title = '1984';

-- 7. Delete Data Example
-- Remove a member by their ID
DELETE FROM members 
WHERE member_id = 2;
