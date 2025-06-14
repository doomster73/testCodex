CREATE DATABASE BookShop;
GO
USE BookShop;
GO
CREATE TABLE Books (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Author NVARCHAR(255) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    PublishedYear INT
);
GO
INSERT INTO Books (Title, Author, Price, PublishedYear) VALUES
('1984', 'George Orwell', 9.99, 1949),
('Brave New World', 'Aldous Huxley', 12.99, 1932),
('Fahrenheit 451', 'Ray Bradbury', 8.99, 1953);
GO
