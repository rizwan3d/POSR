USE [DDPOSDB]
GO

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