-- Create a new database called 'electronicsPOS'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
        FROM sys.databases
        WHERE name = N'electronicsPOS'
)
CREATE DATABASE electronicsPOS
GO

-- Create a new table called 'CUSTOMER' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.CUSTOMER', 'U') IS NOT NULL
DROP TABLE dbo.CUSTOMER
GO
-- Create the table in the specified schema
CREATE TABLE dbo.CUSTOMER
(
    [customerID]       INT            PRIMARY KEY,
    [shipping_address] VARCHAR (50)   NOT NULL,
    [customer_email]   VARCHAR (50)   NOT NULL,
    [phone_no]         VARBINARY (10) NOT NULL,
    [first_name]       VARCHAR (20)   NOT NULL,
    [last_name]        VARCHAR (20)   NOT NULL
);
GO

-- Create a new table called 'EMPLOYEE' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.EMPLOYEE', 'U') IS NOT NULL
DROP TABLE dbo.EMPLOYEE
GO
-- Create the table in the specified schema
CREATE TABLE dbo.EMPLOYEE
(
    [Fname]      VARCHAR (15) NOT NULL,
    [Mname]      VARCHAR (15) NULL,
    [Lname]      VARCHAR (20) NOT NULL,
    [privilege]  TINYINT      NOT NULL,
    [employeeID] INT          PRIMARY KEY
);
GO

-- Create a new table called 'INVOICE' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.INVOICE', 'U') IS NOT NULL
DROP TABLE dbo.INVOICE
GO
-- Create the table in the specified schema
CREATE TABLE dbo.INVOICE
(
    [invoiceID]      INT          PRIMARY KEY,
    [cust_ID]        INT          NOT NULL,
    [emp_ID]         INT          NOT NULL,
    [totalSales]     DECIMAL (18) NOT NULL,
    [payment_method] VARCHAR (50) NOT NULL,
    [home_delivery]  NCHAR (10)   NOT NULL,
    [date_time]      DATETIME     NOT NULL,
    CONSTRAINT [FK_INVOICE_ToCustomer] FOREIGN KEY ([cust_ID]) REFERENCES [dbo].[CUSTOMER] ([customerID]),
    CONSTRAINT [FK_INVOICE_ToEmployee] FOREIGN KEY ([emp_ID]) REFERENCES [dbo].[EMPLOYEE] ([employeeID])
);
GO

-- Create a new table called 'PRODUCT' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.PRODUCT', 'U') IS NOT NULL
DROP TABLE dbo.PRODUCT
GO
-- Create the table in the specified schema
CREATE TABLE dbo.PRODUCT
(
    [productID]    INT          PRIMARY KEY,
    [product_Name] VARCHAR (50) NOT NULL,
    [quantity]     INT          NOT NULL,
    [brand]        VARCHAR (20) NOT NULL,
    [description]  VARCHAR (50) NOT NULL
);
GO

-- Create a new table called 'SUPPLIER' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SUPPLIER', 'U') IS NOT NULL
DROP TABLE dbo.SUPPLIER
GO
-- Create the table in the specified schema
CREATE TABLE dbo.SUPPLIER
(
    [companyID]    INT          PRIMARY KEY,
    [company_name] VARCHAR (50) NOT NULL,
    [company_type] VARCHAR (50) NOT NULL
);
GO

-- Create a new table called 'INVOICE_DETAIL' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.INVOICE_DETAIL', 'U') IS NOT NULL
DROP TABLE dbo.INVOICE_DETAIL
GO
-- Create the table in the specified schema
CREATE TABLE dbo.INVOICE_DETAIL
(
    [Inv_ID]    INT        PRIMARY KEY,
    [Pro_ID]    INT        NOT NULL,
    [quantity]  INT        NOT NULL,
    [priceSold] DECIMAL (18) NOT NULL,
    CONSTRAINT [FK_InvoiceDetail_Invoice] FOREIGN KEY ([Inv_ID]) REFERENCES [dbo].[INVOICE] ([invoiceID]),
    CONSTRAINT [FK_InvoiceDetail_Product] FOREIGN KEY ([Pro_ID]) REFERENCES [dbo].[PRODUCT] ([productID])
);
GO

-- Create a new table called 'RESTOCK' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.RESTOCK', 'U') IS NOT NULL
DROP TABLE dbo.RESTOCK
GO
-- Create the table in the specified schema
CREATE TABLE dbo.RESTOCK
(
    [productID]      INT        PRIMARY KEY,
    [companyID]      INT        NOT NULL,
    [stock_date]     DATE       NOT NULL,
    [stock_quantity] INT        NOT NULL,
    [stock_price]    DECIMAL (18) NOT NULL,
    CONSTRAINT [FK_supplier_price_record_ToProduct] FOREIGN KEY ([productID]) REFERENCES [dbo].[PRODUCT] ([productID]),
    CONSTRAINT [FK_supplier_price_record_ToSupplier] FOREIGN KEY ([companyID]) REFERENCES [dbo].[SUPPLIER] ([companyID])
);
GO

-- Create a new table called 'STORE_PRICE_RECORD' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.STORE_PRICE_RECORD', 'U') IS NOT NULL
DROP TABLE dbo.STORE_PRICE_RECORD
GO
-- Create the table in the specified schema
CREATE TABLE dbo.STORE_PRICE_RECORD
(
    [productID]   INT        PRIMARY KEY,
    [start_date]  DATE       NOT NULL,
    [store_price] DECIMAL (18) NOT NULL,
    CONSTRAINT [FK_store_price_record_ToTable] FOREIGN KEY ([productID]) REFERENCES [dbo].[PRODUCT] ([productID])
);
GO
INSERT INTO EMPLOYEE VALUES
('Alex', NULL, 'Smith', 1, 1235)
GO
SELECT *
FROM EMPLOYEE
GO