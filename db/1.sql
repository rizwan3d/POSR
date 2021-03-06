USE [master]
GO
/****** Object:  Database [DDPOSDB]    Script Date: 7/26/2019 3:05:25 PM ******/
CREATE DATABASE [DDPOSDB]
GO
ALTER DATABASE [DDPOSDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DDPOSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DDPOSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DDPOSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DDPOSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DDPOSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DDPOSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DDPOSDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DDPOSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DDPOSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DDPOSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DDPOSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DDPOSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DDPOSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DDPOSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DDPOSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DDPOSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DDPOSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DDPOSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DDPOSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DDPOSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DDPOSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DDPOSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DDPOSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DDPOSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DDPOSDB] SET  MULTI_USER 
GO
ALTER DATABASE [DDPOSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DDPOSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DDPOSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DDPOSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DDPOSDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DDPOSDB]
GO
/****** Object:  Table [dbo].[AccountCategory]    Script Date: 7/26/2019 3:05:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCategory](
	[AccountCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[AccountCategoryName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountCategory] PRIMARY KEY CLUSTERED 
(
	[AccountCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountGroup]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountGroup](
	[AccountGroupID] [int] IDENTITY(1,1) NOT NULL,
	[AccountGroupName] [nchar](255) NOT NULL,
	[NatureID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroup] PRIMARY KEY CLUSTERED 
(
	[AccountGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountId] [int] IDENTITY(1,1) NOT NULL,
	[AccountName] [nchar](255) NOT NULL,
	[AccountGroupID] [int] NOT NULL,
	[Refferences] [nchar](255) NULL,
	[AreaID] [int] NOT NULL,
	[AccountCategoryID] [int] NULL,
	[JoiningDate] [date] NOT NULL,
	[Business] [nchar](255) NULL,
	[Phone] [nchar](13) NULL,
	[Phone2] [nchar](13) NULL,
	[Mobile] [nchar](13) NULL,
	[Mobile2] [nchar](13) NULL,
	[Email] [nchar](255) NULL,
	[Facebook] [nchar](255) NULL,
	[BankAccountNo] [nchar](255) NULL,
	[NTNno] [nchar](255) NULL,
	[Address] [nchar](255) NULL,
	[OpeningCredit] [money] NULL,
	[OpeningDebit] [money] NULL,
	[Acitve] [bit] NOT NULL,
	[CurrentReading] [money] NULL,
	[cnic] [nchar](15) NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountsNature]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountsNature](
	[NatureID] [int] IDENTITY(1,1) NOT NULL,
	[NatureName] [nchar](20) NOT NULL,
 CONSTRAINT [PK_AccountsNature] PRIMARY KEY CLUSTERED 
(
	[NatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Area]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[AreaID] [int] IDENTITY(1,1) NOT NULL,
	[AreaName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[AreaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashPayment]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashPayment](
	[CashPaymentID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](255) NULL,
	[CashPayment] [money] NULL,
	[AccountId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[AccountIdTo] [int] NULL,
	[UserId] [int] NULL,
	[Balance] [nchar](255) NULL,
 CONSTRAINT [PK_CashPayment_1] PRIMARY KEY CLUSTERED 
(
	[CashPaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CashReceived]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashReceived](
	[CashReceivedID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](255) NULL,
	[CashREsived] [money] NULL,
	[AccountId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[AccountIdTo] [int] NULL,
	[UserId] [int] NULL,
	[Balance] [nchar](255) NULL,
 CONSTRAINT [PK_CashReceived] PRIMARY KEY CLUSTERED 
(
	[CashReceivedID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ProductCategoryid] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Color]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Color](
	[ColorID] [int] IDENTITY(1,1) NOT NULL,
	[ColorName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Color_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_Color] PRIMARY KEY CLUSTERED 
(
	[ColorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ComapanyProfile]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComapanyProfile](
	[Name] [nchar](255) NULL,
	[Bussiness] [nchar](255) NULL,
	[OwnerName] [nchar](255) NULL,
	[Date] [nchar](255) NULL,
	[RegNo] [nchar](255) NULL,
	[NTNNo] [nchar](255) NULL,
	[Phone1] [nchar](255) NULL,
	[Phone2] [nchar](255) NULL,
	[Mobile1] [nchar](255) NULL,
	[Mobile2] [nchar](255) NULL,
	[Email] [nchar](255) NULL,
	[Website] [nchar](255) NULL,
	[Address] [nchar](255) NULL,
	[CompanyRemarks] [nchar](255) NULL,
	[NoteForBill] [nchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CurrentCredit]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentCredit](
	[CurrentCreditId] [int] IDENTITY(1,1) NOT NULL,
	[Credit] [money] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_CurrentCredit] PRIMARY KEY CLUSTERED 
(
	[CurrentCreditId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CurrentDebit]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CurrentDebit](
	[CurrentDebitId] [int] IDENTITY(1,1) NOT NULL,
	[Debit] [money] NOT NULL,
	[AccountId] [int] NOT NULL,
 CONSTRAINT [PK_CurrentDebit] PRIMARY KEY CLUSTERED 
(
	[CurrentDebitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DaliOpeningCash]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DaliOpeningCash](
	[DaliOpningCashId] [int] IDENTITY(1,1) NOT NULL,
	[Cash] [money] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[DaliOpningCashId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expenses](
	[ExpensesId] [int] IDENTITY(1,1) NOT NULL,
	[ExpensesCash] [money] NOT NULL,
	[ExpensesDate] [date] NOT NULL,
	[ExpensesDis] [nchar](255) NULL,
	[AccountId] [int] NOT NULL,
	[AccountIdTo] [nchar](10) NULL,
	[UserId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Installment]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installment](
	[InstallmentId] [int] IDENTITY(1,1) NOT NULL,
	[Cash] [money] NULL,
	[InstallmentNumber] [int] NULL,
	[Resived] [bit] NULL,
	[InstallmentsId] [int] NULL,
	[DueDate] [date] NULL,
	[rid] [int] NULL,
	[Name] [nchar](100) NULL,
	[netResived] [money] NULL,
	[rDate] [nchar](255) NULL,
 CONSTRAINT [PK_Installment] PRIMARY KEY CLUSTERED 
(
	[InstallmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[installments]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[installments](
	[InstallmentsId] [int] IDENTITY(1,1) NOT NULL,
	[SaleInvoiceId] [int] NULL,
	[AccountId] [int] NULL,
	[Installments] [int] NULL,
	[MarkUp] [money] NULL,
	[DownPayment] [money] NULL,
	[InstallmentCash] [money] NULL,
	[g1] [int] NULL,
	[g2] [int] NULL,
	[edate] [date] NULL,
 CONSTRAINT [PK_installments] PRIMARY KEY CLUSTERED 
(
	[InstallmentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ledger]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ledger](
	[TType] [nchar](50) NULL,
	[TId] [int] NULL,
	[Disc] [nchar](255) NULL,
	[Qty] [money] NULL,
	[Price] [money] NULL,
	[Debit] [money] NULL,
	[Credit] [money] NULL,
	[Balance] [nchar](255) NULL,
	[AccountId] [int] NULL,
	[Date] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OpeningCashOfAllAccounts]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OpeningCashOfAllAccounts](
	[OpeningCashOfAllAccountsId] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NULL,
	[Cash] [nchar](255) NULL,
	[Date] [date] NULL,
	[Credit] [money] NULL,
	[Debit] [money] NULL,
 CONSTRAINT [PK_OpeningCashOfAllAccounts] PRIMARY KEY CLUSTERED 
(
	[OpeningCashOfAllAccountsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderInformation]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderInformation](
	[OrderInformationID] [int] IDENTITY(1,1) NOT NULL,
	[SaleInvoiceID] [int] NULL,
	[OrderType] [nchar](100) NULL,
	[TableNumber] [nchar](100) NULL,
	[ServiceCharges] [money] NULL,
	[PerHeadCharges] [money] NULL,
	[Persons] [int] NULL,
	[OrderNumber] [money] NULL,
 CONSTRAINT [PK_OrderInformation] PRIMARY KEY CLUSTERED 
(
	[OrderInformationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductGroup]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductGroup](
	[ProductGroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_productgroup] PRIMARY KEY CLUSTERED 
(
	[ProductGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nchar](255) NULL,
	[ProductCategoryid] [int] NOT NULL,
	[ProductGroupId] [int] NOT NULL,
	[ProductLocation] [nchar](255) NULL,
	[ProductManufacurer] [nchar](255) NULL,
	[AccountId] [int] NOT NULL,
	[ProductRemarks] [nchar](255) NULL,
	[MaxQua] [money] NULL,
	[MinQua] [money] NULL,
	[OrderQua] [money] NULL,
	[OpeningStock] [money] NULL,
	[Service] [bit] NULL CONSTRAINT [ConstraintName]  DEFAULT (N'0'),
	[Active] [bit] NULL,
	[barcode] [nchar](255) NULL,
	[txtextraurdu] [nchar](255) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseInvoiceItems]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseInvoiceItems](
	[PurchaseInvoiceItemsId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[Bounus] [money] NULL,
	[PPrice] [money] NULL,
	[SPrice] [money] NULL,
	[Disc] [money] NULL,
	[Total] [money] NULL,
	[PurchaseInvoiceId] [int] NULL,
		[Packing] [nchar](255) NULL,
 CONSTRAINT [PK_PurchaseInvoiceItems] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[PurchaseOrderID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[Data] [datetime] NULL,
 CONSTRAINT [PK_PurchaseOrder] PRIMARY KEY CLUSTERED 
(
	[PurchaseOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReturnInvoiceItems]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturnInvoiceItems](
	[PurchaseReturnInvoiceItemsId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[Bounus] [money] NULL,
	[PPrice] [money] NULL,
	[SPrice] [money] NULL,
	[Disc] [money] NULL,
	[Total] [money] NULL,
	[PurchaseReturnInvoiceId] [int] NULL,
 CONSTRAINT [PK_PurchaseReturnInvoiceItems] PRIMARY KEY CLUSTERED 
(
	[PurchaseReturnInvoiceItemsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Purchases]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchases](
	[PurchasesId] [int] IDENTITY(1,1) NOT NULL,
	[PurchasesPrice] [money] NOT NULL,
	[PurchasesDiscount] [money] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Purchases] PRIMARY KEY CLUSTERED 
(
	[PurchasesId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchasesInvoice]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesInvoice](
	[PurchaseInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [date] NULL,
	[AccountId] [int] NULL,
	[Customer] [nchar](255) NULL,
	[InvoiceNo] [nchar](255) NULL,
	[Phone] [nchar](255) NULL,
	[Date] [date] NOT NULL,
	[disc] [money] NULL,
	[CashRecieved] [money] NULL,
	[CashReturn] [money] NULL,
	[Total] [money] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_PurchasesInvoice] PRIMARY KEY CLUSTERED 
(
	[PurchaseInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchasesReturnInvoice]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchasesReturnInvoice](
	[PurchaseReturnInvoiceId] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [date] NULL,
	[AccountId] [int] NULL,
	[Customer] [nchar](255) NULL,
	[InvoiceNo] [nchar](255) NULL,
	[Phone] [nchar](255) NULL,
	[Date] [date] NOT NULL,
	[disc] [money] NULL,
	[CashRecieved] [money] NULL,
	[CashReturn] [money] NULL,
	[Total] [money] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_PurchasesReturnInvoice] PRIMARY KEY CLUSTERED 
(
	[PurchaseReturnInvoiceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ResTableInfo]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResTableInfo](
	[TableID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ResTableInfo] PRIMARY KEY CLUSTERED 
(
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleInvoice]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleInvoice](
	[SaleInvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Customer] [nchar](10) NULL,
	[PhoneNo] [nchar](255) NULL,
	[CarNumber] [nchar](255) NULL,
	[Dis] [nchar](255) NULL,
	[TotalDisc] [money] NULL,
	[CREsived] [money] NULL,
	[CashRetrurend] [money] NULL,
	[TotalAmount] [money] NOT NULL,
	[oc] [bit] NULL,
	[UserId] [int] NULL,
	[CurrentR] [money] NULL,
	[PreRead] [money] NULL,
	[NextRead] [money] NULL,
 CONSTRAINT [PK_SaleInvoice] PRIMARY KEY CLUSTERED 
(
	[SaleInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleInvoiceItems]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleInvoiceItems](
	[SaleInvoiceItemId] [int] IDENTITY(1,1) NOT NULL,
	[SaleInvoiceID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[SPrice] [money] NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
	[SubStockid] [int] NULL,
		[Packing] [nchar](255) NULL,
 CONSTRAINT [PK_SaleInvoiceItems] PRIMARY KEY CLUSTERED 
(
	[SaleInvoiceItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleReturnInvoice]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleReturnInvoice](
	[SaleReturnInvoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Customer] [nchar](10) NULL,
	[PhoneNo] [nchar](10) NULL,
	[TotalDisc] [money] NULL,
	[CREsived] [money] NULL,
	[CashRetrurend] [money] NULL,
	[TotalAmount] [money] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_SaleReturnInvoice] PRIMARY KEY CLUSTERED 
(
	[SaleReturnInvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SaleReturnInvoiceItems]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SaleReturnInvoiceItems](
	[SaleReturnInvoiceItemId] [int] IDENTITY(1,1) NOT NULL,
	[SaleReturnInvoiceID] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[SPrice] [money] NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_SaleReturnInvoiceItems] PRIMARY KEY CLUSTERED 
(
	[SaleReturnInvoiceItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrder]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrder](
	[OrderInvoiceiD] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [date] NOT NULL,
	[AccountId] [int] NOT NULL,
	[Customer] [nchar](10) NULL,
	[PhoneNo] [nchar](10) NULL,
	[CarNumber] [nchar](50) NULL,
	[Dis] [nchar](255) NULL,
	[TotalDisc] [money] NULL,
	[CREsived] [money] NULL,
	[CashRetrurend] [money] NULL,
	[TotalAmount] [money] NOT NULL,
	[oc] [bit] NULL,
	[OrderDeliveryDate] [date] NULL,
 CONSTRAINT [PK_SalesOrder] PRIMARY KEY CLUSTERED 
(
	[OrderInvoiceiD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesOrderItem]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesOrderItem](
	[SaleOrderItemId] [int] IDENTITY(1,1) NOT NULL,
	[OrderInvoiceiD] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Quantity] [money] NULL,
	[SPrice] [money] NULL,
	[Discount] [money] NULL,
	[Total] [money] NULL,
 CONSTRAINT [PK_SalesOrderItem] PRIMARY KEY CLUSTERED 
(
	[SaleOrderItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ShoeProducts]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoeProducts](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nchar](255) NULL,
	[ProductCategoryid] [int] NOT NULL,
	[ProductGroupId] [int] NOT NULL,
	[ProductLocation] [nchar](255) NULL,
	[ProductManufacurer] [nchar](255) NULL,
	[AccountId] [int] NOT NULL,
	[ProductRemarks] [nchar](255) NULL,
	[MaxQua] [money] NULL,
	[MinQua] [money] NULL,
	[OrderQua] [money] NULL,
	[OpeningStock] [money] NULL,
	[Service] [bit] NULL CONSTRAINT [ShoeConstraintName]  DEFAULT (N'0'),
	[Active] [bit] NULL,
 CONSTRAINT [PK_ShoeProducts] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Size]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Size](
	[SizeID] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nchar](255) NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Size_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_Size] PRIMARY KEY CLUSTERED 
(
	[SizeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[StockID] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Stock] [money] NULL,
	[SalePrice] [money] NOT NULL,
	[SaleDiscount] [money] NULL,
	[PurchasesPrice] [money] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserAccounts]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAccounts](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nchar](255) NOT NULL,
	[UserPass] [nchar](255) NOT NULL,
	[UserRightId] [nchar](255) NOT NULL,
	[UserActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserAccounts] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](250) NOT NULL,
	[Address] [nchar](250) NOT NULL,
	[Active] [bit] NOT NULL CONSTRAINT [DF_Warehouse_Active]  DEFAULT ((1)),
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[AccountViewWithCurrentBlance]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountViewWithCurrentBlance]
AS
SELECT        dbo.Accounts.AccountId, dbo.Accounts.AccountName, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName, dbo.Accounts.Refferences, dbo.Area.AreaName, dbo.Accounts.JoiningDate, dbo.Accounts.Business, 
                         dbo.Accounts.Phone, dbo.Accounts.Phone2, dbo.Accounts.Mobile, dbo.Accounts.Mobile2, dbo.Accounts.Email, dbo.Accounts.Facebook, dbo.Accounts.BankAccountNo, dbo.Accounts.NTNno, dbo.Accounts.Address, 
                         dbo.Accounts.OpeningCredit, dbo.Accounts.OpeningDebit, dbo.CurrentCredit.Credit, dbo.CurrentDebit.Debit, dbo.AccountCategory.AccountCategoryName, dbo.Accounts.CurrentReading
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountGroup ON dbo.Accounts.AccountGroupID = dbo.AccountGroup.AccountGroupID INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID INNER JOIN
                         dbo.Area ON dbo.Accounts.AreaID = dbo.Area.AreaID INNER JOIN
                         dbo.CurrentCredit ON dbo.Accounts.AccountId = dbo.CurrentCredit.AccountId INNER JOIN
                         dbo.CurrentDebit ON dbo.Accounts.AccountId = dbo.CurrentDebit.AccountId LEFT OUTER JOIN
                         dbo.AccountCategory ON dbo.Accounts.AccountCategoryID = dbo.AccountCategory.AccountCategoryID
WHERE        (dbo.Accounts.Acitve = 1)

GO
/****** Object:  View [dbo].[ViewForCashBook]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewForCashBook]
AS
SELECT        [AccountName] AS Name, [Credit], [Debit], IIF(([Debit] - [Credit]) < 0, CAST(- ([Debit] - [Credit]) AS VARCHAR) + ' CR', CAST(([Debit] - [Credit]) AS VARCHAR) + ' DR') AS [Current Blance]
FROM            AccountViewWithCurrentBlance


GO
/****** Object:  View [dbo].[AccountGroupWithNatureName]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountGroupWithNatureName]
AS
SELECT        dbo.AccountGroup.AccountGroupID, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName, dbo.AccountGroup.Active, dbo.AccountsNature.NatureID
FROM            dbo.AccountGroup INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID





GO
/****** Object:  View [dbo].[AccountsViewForProduct]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountsViewForProduct]
AS
SELECT        dbo.Accounts.AccountId, dbo.Accounts.AccountName, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountGroup ON dbo.Accounts.AccountGroupID = dbo.AccountGroup.AccountGroupID INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID
WHERE        (dbo.AccountGroup.NatureID = 2) AND (dbo.Accounts.Acitve = 1)





GO
/****** Object:  View [dbo].[AccountsViewForPurchase]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountsViewForPurchase]
AS
SELECT        dbo.Accounts.AccountId, dbo.Accounts.AccountName, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountGroup ON dbo.Accounts.AccountGroupID = dbo.AccountGroup.AccountGroupID INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID
WHERE        (dbo.Accounts.Acitve = 1)





GO
/****** Object:  View [dbo].[AccountViewWithCurrentBlanceOil]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AccountViewWithCurrentBlanceOil]
AS
SELECT        dbo.Accounts.AccountId, dbo.Accounts.AccountName, dbo.AccountGroup.AccountGroupName, dbo.AccountsNature.NatureName, dbo.Accounts.Refferences, dbo.Area.AreaName, dbo.Accounts.JoiningDate, dbo.Accounts.Business, 
                         dbo.Accounts.Phone, dbo.Accounts.Phone2, dbo.Accounts.Mobile, dbo.Accounts.Mobile2, dbo.Accounts.Email, dbo.Accounts.Facebook, dbo.Accounts.BankAccountNo, dbo.Accounts.CurrentReading, dbo.Accounts.NTNno, 
                         dbo.Accounts.Address, dbo.Accounts.OpeningCredit, dbo.Accounts.OpeningDebit, dbo.CurrentCredit.Credit, dbo.CurrentDebit.Debit, dbo.AccountCategory.AccountCategoryName
FROM            dbo.Accounts INNER JOIN
                         dbo.AccountGroup ON dbo.Accounts.AccountGroupID = dbo.AccountGroup.AccountGroupID INNER JOIN
                         dbo.AccountsNature ON dbo.AccountGroup.NatureID = dbo.AccountsNature.NatureID INNER JOIN
                         dbo.Area ON dbo.Accounts.AreaID = dbo.Area.AreaID INNER JOIN
                         dbo.CurrentCredit ON dbo.Accounts.AccountId = dbo.CurrentCredit.AccountId INNER JOIN
                         dbo.CurrentDebit ON dbo.Accounts.AccountId = dbo.CurrentDebit.AccountId LEFT OUTER JOIN
                         dbo.AccountCategory ON dbo.Accounts.AccountCategoryID = dbo.AccountCategory.AccountCategoryID
WHERE        (dbo.Accounts.Acitve = 1)

GO
/****** Object:  View [dbo].[primCols]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[primCols]
AS
SELECT        COLUMN_NAME, TABLE_NAME
FROM            INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE        (OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + QUOTENAME(CONSTRAINT_NAME)), 'IsPrimaryKey') = 1)

GO
/****** Object:  View [dbo].[ProductListView]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductListView]
AS
SELECT        dbo.Products.ProductId, dbo.Products.ProductName, dbo.ProductGroup.GroupName, dbo.Category.CategoryName, dbo.Stock.Stock, dbo.Stock.SalePrice
FROM            dbo.Products INNER JOIN
                         dbo.ProductGroup ON dbo.Products.ProductGroupId = dbo.ProductGroup.ProductGroupId INNER JOIN
                         dbo.Category ON dbo.Products.ProductCategoryid = dbo.Category.ProductCategoryid INNER JOIN
                         dbo.Stock ON dbo.Products.ProductId = dbo.Stock.ProductId
WHERE        (dbo.Products.Active = 1)





GO
/****** Object:  View [dbo].[ProductViewForSales]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProductViewForSales]
AS
SELECT        dbo.Products.ProductId, RTRIM(dbo.Products.ProductName) AS ProductName, dbo.Stock.Stock, dbo.Stock.SalePrice, dbo.Stock.PurchasesPrice, dbo.Stock.SaleDiscount, dbo.Products.Service
FROM            dbo.Products INNER JOIN
                         dbo.Stock ON dbo.Products.ProductId = dbo.Stock.ProductId
WHERE        (dbo.Products.Active = 1)

GO
/****** Object:  View [dbo].[PurchaseInvoiceHistory]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PurchaseInvoiceHistory]
AS
SELECT        dbo.PurchasesInvoice.PurchaseInvoiceId, dbo.Accounts.AccountName, dbo.PurchasesInvoice.InvoiceDate, dbo.Products.ProductName, dbo.PurchaseInvoiceItems.Quantity, dbo.PurchaseInvoiceItems.Bounus, 
                         dbo.PurchaseInvoiceItems.PPrice, dbo.PurchaseInvoiceItems.SPrice, dbo.PurchaseInvoiceItems.Disc, dbo.PurchaseInvoiceItems.Total
FROM            dbo.PurchaseInvoiceItems INNER JOIN
                         dbo.PurchasesInvoice ON dbo.PurchaseInvoiceItems.PurchaseInvoiceId = dbo.PurchasesInvoice.PurchaseInvoiceId INNER JOIN
                         dbo.Products ON dbo.PurchaseInvoiceItems.ProductId = dbo.Products.ProductId INNER JOIN
                         dbo.Accounts ON dbo.PurchasesInvoice.AccountId = dbo.Accounts.AccountId





GO
/****** Object:  View [dbo].[PurchaseReturnHistory]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PurchaseReturnHistory]
AS
SELECT        dbo.PurchasesReturnInvoice.PurchaseReturnInvoiceId, dbo.PurchasesReturnInvoice.InvoiceDate, dbo.Accounts.AccountName, dbo.Products.ProductName, dbo.PurchaseReturnInvoiceItems.Quantity, 
                         dbo.PurchaseReturnInvoiceItems.Bounus, dbo.PurchaseReturnInvoiceItems.PPrice, dbo.PurchaseReturnInvoiceItems.SPrice, dbo.PurchaseReturnInvoiceItems.Disc, dbo.PurchaseReturnInvoiceItems.Total
FROM            dbo.PurchaseReturnInvoiceItems INNER JOIN
                         dbo.PurchasesReturnInvoice ON dbo.PurchaseReturnInvoiceItems.PurchaseReturnInvoiceId = dbo.PurchasesReturnInvoice.PurchaseReturnInvoiceId INNER JOIN
                         dbo.Products ON dbo.PurchaseReturnInvoiceItems.ProductId = dbo.Products.ProductId INNER JOIN
                         dbo.Accounts ON dbo.PurchasesReturnInvoice.AccountId = dbo.Accounts.AccountId





GO
/****** Object:  View [dbo].[PurchasesReportByDate]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PurchasesReportByDate]
AS
SELECT        dbo.PurchasesInvoice.PurchaseInvoiceId, dbo.Accounts.AccountName, dbo.PurchasesInvoice.InvoiceDate, dbo.PurchasesInvoice.disc, dbo.PurchasesInvoice.Total, dbo.PurchasesInvoice.UserId
FROM            dbo.PurchasesInvoice INNER JOIN
                         dbo.Accounts ON dbo.PurchasesInvoice.AccountId = dbo.Accounts.AccountId



GO
/****** Object:  View [dbo].[SaleInvoiceHistory]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SaleInvoiceHistory]
AS
SELECT        dbo.SaleInvoice.SaleInvoiceID, dbo.SaleInvoice.Date, dbo.Accounts.AccountName, dbo.SaleInvoice.Customer, dbo.SaleInvoice.TotalDisc, dbo.SaleInvoice.CREsived, dbo.SaleInvoice.CashRetrurend, 
                         dbo.SaleInvoice.TotalAmount, dbo.Products.ProductName, dbo.SaleInvoiceItems.Quantity, dbo.SaleInvoiceItems.SPrice, dbo.SaleInvoiceItems.Discount, dbo.SaleInvoiceItems.Total, dbo.ProductGroup.GroupName ,dbo.SaleInvoiceItems.Packing
FROM            dbo.SaleInvoice INNER JOIN
                         dbo.SaleInvoiceItems ON dbo.SaleInvoice.SaleInvoiceID = dbo.SaleInvoiceItems.SaleInvoiceID INNER JOIN
                         dbo.Accounts ON dbo.SaleInvoice.AccountId = dbo.Accounts.AccountId INNER JOIN
                         dbo.Products ON dbo.SaleInvoiceItems.ProductId = dbo.Products.ProductId INNER JOIN
                         dbo.ProductGroup ON dbo.Products.ProductGroupId = dbo.ProductGroup.ProductGroupId

GO
/****** Object:  View [dbo].[SaleInvoiceHistoryOil]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SaleInvoiceHistoryOil]
AS
SELECT        dbo.SaleInvoice.SaleInvoiceID, dbo.SaleInvoice.Date, dbo.Accounts.AccountName, dbo.SaleInvoice.Customer, dbo.SaleInvoice.TotalDisc, dbo.SaleInvoice.CREsived, dbo.SaleInvoice.CashRetrurend, 
                         dbo.SaleInvoice.TotalAmount, dbo.Products.ProductName, dbo.SaleInvoiceItems.Quantity, dbo.SaleInvoiceItems.SPrice, dbo.SaleInvoiceItems.Discount, dbo.SaleInvoiceItems.Total, dbo.ProductGroup.GroupName, 
                         dbo.SaleInvoice.NextRead, dbo.SaleInvoice.PreRead, dbo.SaleInvoice.CurrentR, dbo.SaleInvoice.CarNumber, dbo.SaleInvoice.PhoneNo
FROM            dbo.SaleInvoice INNER JOIN
                         dbo.SaleInvoiceItems ON dbo.SaleInvoice.SaleInvoiceID = dbo.SaleInvoiceItems.SaleInvoiceID INNER JOIN
                         dbo.Accounts ON dbo.SaleInvoice.AccountId = dbo.Accounts.AccountId INNER JOIN
                         dbo.Products ON dbo.SaleInvoiceItems.ProductId = dbo.Products.ProductId INNER JOIN
                         dbo.ProductGroup ON dbo.Products.ProductGroupId = dbo.ProductGroup.ProductGroupId

GO
/****** Object:  View [dbo].[SaleReportByDate]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SaleReportByDate]
AS
SELECT        dbo.SaleInvoice.SaleInvoiceID, dbo.Accounts.AccountName, dbo.SaleInvoice.Date, dbo.SaleInvoice.TotalDisc, dbo.SaleInvoice.TotalAmount, dbo.SaleInvoice.UserId
FROM            dbo.SaleInvoice INNER JOIN
                         dbo.Accounts ON dbo.SaleInvoice.AccountId = dbo.Accounts.AccountId



GO
/****** Object:  View [dbo].[SaleReturnHistory]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SaleReturnHistory]
AS
SELECT        dbo.SaleReturnInvoice.SaleReturnInvoiceID, dbo.SaleReturnInvoice.Date, dbo.Accounts.AccountName, dbo.SaleReturnInvoice.Customer, dbo.SaleReturnInvoice.PhoneNo, dbo.SaleReturnInvoice.TotalDisc, 
                         dbo.SaleReturnInvoice.CREsived, dbo.SaleReturnInvoice.CashRetrurend, dbo.SaleReturnInvoice.TotalAmount, dbo.Products.ProductName, dbo.SaleReturnInvoiceItems.Quantity, dbo.SaleReturnInvoiceItems.Discount, 
                         dbo.SaleReturnInvoiceItems.SPrice, dbo.SaleReturnInvoiceItems.Total
FROM            dbo.SaleReturnInvoice INNER JOIN
                         dbo.Accounts ON dbo.SaleReturnInvoice.AccountId = dbo.Accounts.AccountId INNER JOIN
                         dbo.SaleReturnInvoiceItems ON dbo.SaleReturnInvoice.SaleReturnInvoiceID = dbo.SaleReturnInvoiceItems.SaleReturnInvoiceID INNER JOIN
                         dbo.Products ON dbo.SaleReturnInvoiceItems.ProductId = dbo.Products.ProductId





GO
ALTER TABLE [dbo].[AccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroup_AccountsNature] FOREIGN KEY([NatureID])
REFERENCES [dbo].[AccountsNature] ([NatureID])
GO
ALTER TABLE [dbo].[AccountGroup] CHECK CONSTRAINT [FK_AccountGroup_AccountsNature]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_AccountGroup] FOREIGN KEY([AccountGroupID])
REFERENCES [dbo].[AccountGroup] ([AccountGroupID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_AccountGroup]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Area] FOREIGN KEY([AreaID])
REFERENCES [dbo].[Area] ([AreaID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Area]
GO
ALTER TABLE [dbo].[CashPayment]  WITH CHECK ADD  CONSTRAINT [FK_CashPayment_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CashPayment] CHECK CONSTRAINT [FK_CashPayment_Accounts]
GO
ALTER TABLE [dbo].[CashPayment]  WITH CHECK ADD  CONSTRAINT [FK_CashPayment_Accounts1] FOREIGN KEY([AccountIdTo])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CashPayment] CHECK CONSTRAINT [FK_CashPayment_Accounts1]
GO
ALTER TABLE [dbo].[CashReceived]  WITH CHECK ADD  CONSTRAINT [FK_CashReceived_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CashReceived] CHECK CONSTRAINT [FK_CashReceived_Accounts]
GO
ALTER TABLE [dbo].[CashReceived]  WITH CHECK ADD  CONSTRAINT [FK_CashReceived_Accounts1] FOREIGN KEY([AccountIdTo])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CashReceived] CHECK CONSTRAINT [FK_CashReceived_Accounts1]
GO
ALTER TABLE [dbo].[CurrentCredit]  WITH CHECK ADD  CONSTRAINT [FK_CurrentCredit_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CurrentCredit] CHECK CONSTRAINT [FK_CurrentCredit_Accounts]
GO
ALTER TABLE [dbo].[CurrentDebit]  WITH CHECK ADD  CONSTRAINT [FK_CurrentDebit_CurrentDebit] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[CurrentDebit] CHECK CONSTRAINT [FK_CurrentDebit_CurrentDebit]
GO
ALTER TABLE [dbo].[Installment]  WITH CHECK ADD  CONSTRAINT [FK_Installment_installments] FOREIGN KEY([InstallmentsId])
REFERENCES [dbo].[installments] ([InstallmentsId])
GO
ALTER TABLE [dbo].[Installment] CHECK CONSTRAINT [FK_Installment_installments]
GO
ALTER TABLE [dbo].[installments]  WITH CHECK ADD  CONSTRAINT [FK_installments_SaleInvoice] FOREIGN KEY([SaleInvoiceId])
REFERENCES [dbo].[SaleInvoice] ([SaleInvoiceID])
GO
ALTER TABLE [dbo].[installments] CHECK CONSTRAINT [FK_installments_SaleInvoice]
GO
ALTER TABLE [dbo].[OpeningCashOfAllAccounts]  WITH CHECK ADD  CONSTRAINT [FK_OpeningCashOfAllAccounts_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[OpeningCashOfAllAccounts] CHECK CONSTRAINT [FK_OpeningCashOfAllAccounts_Accounts]
GO
ALTER TABLE [dbo].[OrderInformation]  WITH CHECK ADD  CONSTRAINT [FK_OrderInformation_SaleInvoice] FOREIGN KEY([SaleInvoiceID])
REFERENCES [dbo].[SaleInvoice] ([SaleInvoiceID])
GO
ALTER TABLE [dbo].[OrderInformation] CHECK CONSTRAINT [FK_OrderInformation_SaleInvoice]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Category] FOREIGN KEY([ProductCategoryid])
REFERENCES [dbo].[Category] ([ProductCategoryid])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Category]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductGroup] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroup] ([ProductGroupId])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductGroup]
GO
ALTER TABLE [dbo].[PurchaseInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseInvoiceItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[PurchaseInvoiceItems] CHECK CONSTRAINT [FK_PurchaseInvoiceItems_Products]
GO
ALTER TABLE [dbo].[PurchaseInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseInvoiceItems_PurchasesInvoice] FOREIGN KEY([PurchaseInvoiceId])
REFERENCES [dbo].[PurchasesInvoice] ([PurchaseInvoiceId])
GO
ALTER TABLE [dbo].[PurchaseInvoiceItems] CHECK CONSTRAINT [FK_PurchaseInvoiceItems_PurchasesInvoice]
GO
ALTER TABLE [dbo].[Purchases]  WITH CHECK ADD  CONSTRAINT [FK_Purchases_Purchases] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Purchases] CHECK CONSTRAINT [FK_Purchases_Purchases]
GO
ALTER TABLE [dbo].[PurchasesInvoice]  WITH CHECK ADD  CONSTRAINT [FK_PurchasesInvoice_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[PurchasesInvoice] CHECK CONSTRAINT [FK_PurchasesInvoice_Accounts]
GO
ALTER TABLE [dbo].[PurchasesReturnInvoice]  WITH CHECK ADD  CONSTRAINT [FK_PurchasesReturnInvoice_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[PurchasesReturnInvoice] CHECK CONSTRAINT [FK_PurchasesReturnInvoice_Accounts]
GO
ALTER TABLE [dbo].[SaleInvoice]  WITH CHECK ADD  CONSTRAINT [FK_SaleInvoice_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[SaleInvoice] CHECK CONSTRAINT [FK_SaleInvoice_Accounts]
GO
ALTER TABLE [dbo].[SaleInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleInvoiceItems_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[SaleInvoiceItems] CHECK CONSTRAINT [FK_SaleInvoiceItems_Products]
GO
ALTER TABLE [dbo].[SaleInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleInvoiceItems_SaleInvoice] FOREIGN KEY([SaleInvoiceID])
REFERENCES [dbo].[SaleInvoice] ([SaleInvoiceID])
GO
ALTER TABLE [dbo].[SaleInvoiceItems] CHECK CONSTRAINT [FK_SaleInvoiceItems_SaleInvoice]
GO
ALTER TABLE [dbo].[SaleInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleInvoiceItems_SaleInvoiceItems] FOREIGN KEY([SaleInvoiceItemId])
REFERENCES [dbo].[SaleInvoiceItems] ([SaleInvoiceItemId])
GO
ALTER TABLE [dbo].[SaleInvoiceItems] CHECK CONSTRAINT [FK_SaleInvoiceItems_SaleInvoiceItems]
GO
ALTER TABLE [dbo].[SaleReturnInvoice]  WITH CHECK ADD  CONSTRAINT [FK_SaleReturnInvoice_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[SaleReturnInvoice] CHECK CONSTRAINT [FK_SaleReturnInvoice_Accounts]
GO
ALTER TABLE [dbo].[SaleReturnInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleReturnInvoiceItems_Products1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[SaleReturnInvoiceItems] CHECK CONSTRAINT [FK_SaleReturnInvoiceItems_Products1]
GO
ALTER TABLE [dbo].[SaleReturnInvoiceItems]  WITH CHECK ADD  CONSTRAINT [FK_SaleReturnInvoiceItems_SaleReturnInvoice1] FOREIGN KEY([SaleReturnInvoiceID])
REFERENCES [dbo].[SaleReturnInvoice] ([SaleReturnInvoiceID])
GO
ALTER TABLE [dbo].[SaleReturnInvoiceItems] CHECK CONSTRAINT [FK_SaleReturnInvoiceItems_SaleReturnInvoice1]
GO
ALTER TABLE [dbo].[SalesOrder]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrder_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[SalesOrder] CHECK CONSTRAINT [FK_SalesOrder_Accounts]
GO
ALTER TABLE [dbo].[SalesOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderItem_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[SalesOrderItem] CHECK CONSTRAINT [FK_SalesOrderItem_Products]
GO
ALTER TABLE [dbo].[SalesOrderItem]  WITH CHECK ADD  CONSTRAINT [FK_SalesOrderItem_SalesOrder] FOREIGN KEY([OrderInvoiceiD])
REFERENCES [dbo].[SalesOrder] ([OrderInvoiceiD])
GO
ALTER TABLE [dbo].[SalesOrderItem] CHECK CONSTRAINT [FK_SalesOrderItem_SalesOrder]
GO
ALTER TABLE [dbo].[ShoeProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShoeProducts_Accounts] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountId])
GO
ALTER TABLE [dbo].[ShoeProducts] CHECK CONSTRAINT [FK_ShoeProducts_Accounts]
GO
ALTER TABLE [dbo].[ShoeProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShoeProducts_Category] FOREIGN KEY([ProductCategoryid])
REFERENCES [dbo].[Category] ([ProductCategoryid])
GO
ALTER TABLE [dbo].[ShoeProducts] CHECK CONSTRAINT [FK_ShoeProducts_Category]
GO
ALTER TABLE [dbo].[ShoeProducts]  WITH CHECK ADD  CONSTRAINT [FK_ShoeProducts_ProductGroup] FOREIGN KEY([ProductGroupId])
REFERENCES [dbo].[ProductGroup] ([ProductGroupId])
GO
ALTER TABLE [dbo].[ShoeProducts] CHECK CONSTRAINT [FK_ShoeProducts_ProductGroup]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Products]
GO
/****** Object:  StoredProcedure [dbo].[WithCBlance]    Script Date: 7/26/2019 3:05:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[WithCBlance]
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
END


GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "AccountGroup"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsNature"
            Begin Extent = 
               Top = 10
               Left = 471
               Bottom = 106
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountGroupWithNatureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountGroupWithNatureName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 15
         End
         Begin Table = "AccountGroup"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsNature"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 102
               Right = 661
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1215
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountsViewForProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountsViewForProduct'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountGroup"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 136
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsNature"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 234
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountsViewForPurchase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountsViewForPurchase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[51] 4[10] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 263
               Right = 674
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "AccountGroup"
            Begin Extent = 
               Top = 1
               Left = 929
               Bottom = 131
               Right = 1128
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsNature"
            Begin Extent = 
               Top = 13
               Left = 1162
               Bottom = 109
               Right = 1332
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area"
            Begin Extent = 
               Top = 135
               Left = 949
               Bottom = 248
               Right = 1119
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentCredit"
            Begin Extent = 
               Top = 390
               Left = 38
               Bottom = 503
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentDebit"
            Begin Extent = 
               Top = 390
               Left = 247
               Bottom = 503
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountCategory"
            Begin Extent = 
               Top = 190
               Left = 709
               Bottom = 303
               Right = 923
            En' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'd
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 231
            End
            DisplayFlags = 280
            TopColumn = 17
         End
         Begin Table = "AccountGroup"
            Begin Extent = 
               Top = 6
               Left = 269
               Bottom = 136
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountsNature"
            Begin Extent = 
               Top = 6
               Left = 506
               Bottom = 102
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Area"
            Begin Extent = 
               Top = 6
               Left = 714
               Bottom = 119
               Right = 884
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentCredit"
            Begin Extent = 
               Top = 6
               Left = 922
               Bottom = 119
               Right = 1093
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "CurrentDebit"
            Begin Extent = 
               Top = 102
               Left = 506
               Bottom = 215
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "AccountCategory"
            Begin Extent = 
               Top = 120
               Left = 714
               Bottom = 233
               Right = 928
            End
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlanceOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlanceOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'AccountViewWithCurrentBlanceOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[37] 4[11] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "KEY_COLUMN_USAGE (INFORMATION_SCHEMA)"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 219
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2985
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'primCols'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'primCols'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 232
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "ProductGroup"
            Begin Extent = 
               Top = 6
               Left = 275
               Bottom = 119
               Right = 449
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 6
               Left = 487
               Bottom = 119
               Right = 676
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stock"
            Begin Extent = 
               Top = 6
               Left = 714
               Bottom = 136
               Right = 884
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductListView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductListView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 218
               Right = 237
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Stock"
            Begin Extent = 
               Top = 7
               Left = 437
               Bottom = 181
               Right = 635
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductViewForSales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProductViewForSales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PurchaseInvoiceItems"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 252
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "PurchasesInvoice"
            Begin Extent = 
               Top = 159
               Left = 320
               Bottom = 289
               Right = 505
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 513
               Bottom = 136
               Right = 712
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 164
               Left = 740
               Bottom = 300
               Right = 916
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 12
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PurchaseReturnInvoiceItems"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 287
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "PurchasesReturnInvoice"
            Begin Extent = 
               Top = 179
               Left = 384
               Bottom = 309
               Right = 604
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 583
               Bottom = 136
               Right = 782
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 185
               Left = 743
               Bottom = 315
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseReturnHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchaseReturnHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PurchasesInvoice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 223
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 5
               Left = 375
               Bottom = 135
               Right = 553
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchasesReportByDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'PurchasesReportByDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[15] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaleInvoice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 9
         End
         Begin Table = "SaleInvoiceItems"
            Begin Extent = 
               Top = 95
               Left = 281
               Bottom = 225
               Right = 463
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 161
               Left = 595
               Bottom = 291
               Right = 773
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 48
               Left = 971
               Bottom = 178
               Right = 1170
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "ProductGroup"
            Begin Extent = 
               Top = 84
               Left = 761
               Bottom = 197
               Right = 935
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 14
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 990
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaleInvoice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 206
               Right = 205
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "SaleInvoiceItems"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 136
               Right = 659
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 697
               Bottom = 136
               Right = 896
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductGroup"
            Begin Extent = 
               Top = 6
               Left = 934
               Bottom = 119
               Right = 1108
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistoryOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistoryOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleInvoiceHistoryOil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[8] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaleInvoice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 249
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleReportByDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleReportByDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "SaleReturnInvoice"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Accounts"
            Begin Extent = 
               Top = 6
               Left = 270
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "SaleReturnInvoiceItems"
            Begin Extent = 
               Top = 6
               Left = 486
               Bottom = 136
               Right = 703
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "Products"
            Begin Extent = 
               Top = 0
               Left = 760
               Bottom = 130
               Right = 959
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleReturnHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SaleReturnHistory'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 24
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewForCashBook'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ViewForCashBook'
GO
USE [master]
GO
ALTER DATABASE [DDPOSDB] SET  READ_WRITE 
GO
