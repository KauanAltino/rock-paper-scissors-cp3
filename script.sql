-- Criando o banco de dados (se necessário)
CREATE DATABASE banco_devops_cp3;
GO

USE banco_devops_cp3;
GO

-- Criando a tabela AppUser
CREATE TABLE dbo.AppUser (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    email NVARCHAR(100) NOT NULL,
    UNIQUE (email)
);

-- Criando a tabela CustomerOrder
CREATE TABLE dbo.CustomerOrder (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_date DATETIME NOT NULL,
    user_id INT FOREIGN KEY REFERENCES dbo.AppUser(id),
    status NVARCHAR(50)
);

-- Criando a tabela OrderItem
CREATE TABLE dbo.OrderItem (
    id INT IDENTITY(1,1) PRIMARY KEY,
    order_id INT FOREIGN KEY REFERENCES dbo.CustomerOrder(id),
    product_id INT FOREIGN KEY REFERENCES dbo.Product(id),
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Criando a tabela Product
CREATE TABLE dbo.Product (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nome NVARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL
);