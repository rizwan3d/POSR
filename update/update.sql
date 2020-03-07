USE [DDPOSDB]
GO

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

IF COL_LENGTH('Products', 'txtextraurdu') IS NULL
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


GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='[JournalVoucher]' and xtype='U')
CREATE TABLE [dbo].[JournalVoucher](
	[JournalVoucherId] [int] IDENTITY(1,1) NOT NULL,
	[date] [date] NULL,
	[Description] [nchar](255) NULL,
 CONSTRAINT [PK_JournalVoucher] PRIMARY KEY CLUSTERED 
(
	[JournalVoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='[JvItems]' and xtype='U')
CREATE TABLE [dbo].[JvItems](
	[JvItemId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Dis] [nchar](255) NULL,
	[Dr] [money] NULL,
	[Cr] [money] NULL,
	[JournalVoucherId] [int] NOT NULL,
 CONSTRAINT [PK_JvItems] PRIMARY KEY CLUSTERED 
(
	[JvItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[JvItems]  WITH CHECK ADD  CONSTRAINT [FK_JvItems_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO

ALTER TABLE [dbo].[JvItems] CHECK CONSTRAINT [FK_JvItems_Accounts]
GO

ALTER TABLE [dbo].[JvItems]  WITH CHECK ADD  CONSTRAINT [FK_JvItems_JournalVoucher] FOREIGN KEY([JournalVoucherId])
REFERENCES [dbo].[JournalVoucher] ([JournalVoucherId])
GO

ALTER TABLE [dbo].[JvItems] CHECK CONSTRAINT [FK_JvItems_JournalVoucher]
GO


GO
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='[Salesman]' and xtype='U')
CREATE TABLE [dbo].[Salesman](
	[SalesmanId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[Commission] [money] NULL,
	[Salary] [money] NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Salesman] PRIMARY KEY CLUSTERED 
(
	[SalesmanId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Salesman] ADD  CONSTRAINT [DF_Salesman_Active]  DEFAULT ((1)) FOR [Active]
GO

GO
IF COL_LENGTH('SaleInvoice', 'SaleMen') IS NULL
BEGIN
    ALTER TABLE SaleInvoice
    ADD [SaleMen] [int]
END

GO

IF COL_LENGTH('Ledger', 'created_at') IS NULL
BEGIN
    ALTER TABLE Ledger
    ADD [created_at] [datetime];
END

Go

ALTER TABLE [dbo].[Ledger] ADD  CONSTRAINT [DF_Ledger_created_at]  DEFAULT (getdate()) FOR [created_at]
GO