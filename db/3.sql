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
 CONSTRAINT [PK_SubStock] PRIMARY KEY CLUSTERED 
(
	[SubStockid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO