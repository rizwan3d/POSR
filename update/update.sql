USE [DDPOSDB]
GO


IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SubStock' and xtype='U')
CREATE TABLE [dbo].[SubStock](
	[SubStockid] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](255) NULL,
	[ProductId] [money] NULL,
	[Stock] [money] NULL,
	[SalePrice] [money] NULL,
	[PurchasePrice] [money] NULL,
	[ExpireDate] [date] NULL,
	[another] [nchar](100) NULL,
 CONSTRAINT [PK_SubStock] PRIMARY KEY CLUSTERED 
(
	[SubStockid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='JournalVoucher' and xtype='U')
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

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='JvItems' and xtype='U')
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

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='Salesman' and xtype='U')
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

ALTER TABLE SaleInvoice  ALTER COLUMN Customer NVARCHAR(255) NOT NULL; 
GO

IF COL_LENGTH('PurchasesInvoice', 'Dis') IS NULL
BEGIN
    ALTER TABLE PurchasesInvoice
    ADD [Dis] [nchar](255) NULL
END

Go


INSERT [dbo].[ResTableInfo] ( [TableName],[Active]) VALUES ( N'NULL',1)
Go

IF COL_LENGTH('Accounts', 'LicenceNumber') IS NULL
BEGIN
    ALTER TABLE Accounts
    ADD [LicenceNumber] nchar(255) NULL;
END

Go

IF COL_LENGTH('Accounts', 'LicenceExpiryDate') IS NULL
BEGIN
    ALTER TABLE Accounts
    ADD [LicenceExpiryDate] [datetime] NULL;
END

Go


ALTER VIEW AccountViewWithCurrentBlance AS
SELECT        dbo.Accounts.AccountId, dbo.Accounts.AccountName, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName, dbo.Accounts.Refferences, dbo.Area.AreaName, dbo.Accounts.JoiningDate, dbo.Accounts.Business, 
                         dbo.Accounts.Phone, dbo.Accounts.Phone2, dbo.Accounts.Mobile, dbo.Accounts.Mobile2, dbo.Accounts.Email, dbo.Accounts.Facebook, dbo.Accounts.BankAccountNo, dbo.Accounts.NTNno, dbo.Accounts.Address, 
                         dbo.Accounts.OpeningCredit, dbo.Accounts.OpeningDebit, dbo.CurrentCredit.Credit, dbo.CurrentDebit.Debit, dbo.AccountCategory.AccountCategoryName, dbo.Accounts.CurrentReading, dbo.Accounts.LicenceNumber , dbo.Accounts.LicenceExpiryDate
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountGroup ON dbo.Accounts.AccountGroupID = dbo.AccountGroup.AccountGroupID INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID INNER JOIN
                         dbo.Area ON dbo.Accounts.AreaID = dbo.Area.AreaID INNER JOIN
                         dbo.CurrentCredit ON dbo.Accounts.AccountId = dbo.CurrentCredit.AccountId INNER JOIN
                         dbo.CurrentDebit ON dbo.Accounts.AccountId = dbo.CurrentDebit.AccountId LEFT OUTER JOIN
                         dbo.AccountCategory ON dbo.Accounts.AccountCategoryID = dbo.AccountCategory.AccountCategoryID
WHERE        (dbo.Accounts.Acitve = 1)

Go

ALTER PROCEDURE [dbo].[WithCBlance]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	

    -- Insert statements for procedure here
	SELECT [AccountId] as ID
      ,[AccountName] as Name
      ,[AccountGroupName] as [Group]
      ,[NatureName] as Nature
      ,[Refferences]
      ,[AreaName] as Area
      ,[JoiningDate] as [Joinind Date]
      ,[Business] 
      ,[Phone]
      ,[Phone2]
      ,[Mobile]
      ,[Mobile2]
      ,[Email]
      ,[Facebook]
      ,[BankAccountNo] as [Bank Account]
      ,[NTNno] as NTN
      ,[Address]
      ,[OpeningCredit]
      ,[OpeningDebit]
      ,[Credit]
      ,[Debit]
	  ,CurrentReading
	  ,IIF(([Debit]-[Credit]) < 0, CAST(-([Debit]-[Credit]) AS VARCHAR)+' CR', CAST(([Debit]-[Credit]) AS VARCHAR)+' DR') as [Current Blance] FROM AccountViewWithCurrentBlance
	  ,[LicenceNumber],[LicenceExpiryDate]
END

Go

