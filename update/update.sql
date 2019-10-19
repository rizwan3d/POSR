IF COL_LENGTH('Products', 'txtextraurdu') IS NULL
BEGIN
    ALTER TABLE Products
    ADD [txtextraurdu] [nchar](255)
END

GO

IF COL_LENGTH('Products', 'barcode') IS NULL
BEGIN
    ALTER TABLE Products
    ADD [barcode] [nchar](255)
END

GO

IF COL_LENGTH('PurchaseInvoiceItems', 'Packing') IS NULL
BEGIN
    ALTER TABLE PurchaseInvoiceItems
    ADD [Packing] [nchar](255)
END

GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='wpacking' and xtype='U')
    CREATE TABLE [dbo].[wpacking](
	[wpackingid] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_wpacking] PRIMARY KEY CLUSTERED 
(
	[wpackingid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

