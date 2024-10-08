USE [master]
GO
/****** Object:  Database [iSmart]    Script Date: 8/20/2024 9:38:47 AM ******/
CREATE DATABASE [iSmart]
GO
USE [iSmart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActionType](
	[ActionId] [int] NOT NULL,
	[Action] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_ActionType] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableForReturns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportId] [int] NOT NULL,
	[ExportId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[Available] [int] NOT NULL,
 CONSTRAINT [PK_AvailableForReturns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BatchDetails]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BatchDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryCheckDetailId] [int] NOT NULL,
	[BatchCode] [nvarchar](max) NOT NULL,
	[ExpectedQuantity] [int] NOT NULL,
	[ActualQuantity] [int] NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_BatchDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[BillId] [int] IDENTITY(1,1) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Canceled] [datetime2](7) NULL,
	[Updated] [datetime2](7) NULL,
	[StatusId] [int] NOT NULL,
	[UpdatedId] [int] NULL,
	[WarehouseId] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[CreatedId] [int] NOT NULL,
	[BillCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BillDetail]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BillDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[BillId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[CurrentStock] [int] NOT NULL,
	[ActualStock] [int] NOT NULL,
	[AmountDifferential] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_StocktakeNoteDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerAddress] [nvarchar](200) NOT NULL,
	[CustomerPhone] [nvarchar](20) NOT NULL,
	[CustomerEmail] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveyId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](50) NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[DeliveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailToken]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailToken](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[Token] [nvarchar](64) NOT NULL,
	[UserId] [int] NOT NULL,
	[IssuedAt] [datetime2](7) NOT NULL,
	[ExpiredAt] [datetime2](7) NOT NULL,
	[IsUsed] [bit] NOT NULL,
	[IsRevoked] [bit] NOT NULL,
 CONSTRAINT [PK_EmailToken] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportOrder](
	[ExportId] [int] IDENTITY(1,1) NOT NULL,
	[ExportCode] [nvarchar](50) NOT NULL,
	[UserId] [int] NOT NULL,
	[TotalPrice] [real] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[StatusId] [int] NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ExportedDate] [datetime2](7) NULL,
	[WarehouseId] [int] NOT NULL,
	[CancelDate] [datetime2](7) NULL,
	[DeliveryId] [int] NOT NULL,
	[image] [varchar](max) NULL,
	[StaffId] [int] NULL,
	[CustomerId] [int] NOT NULL,
	[WarehouseDestinationId] [int] NULL,
 CONSTRAINT [PK_ExportOrder] PRIMARY KEY CLUSTERED 
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportOrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ExportId] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[Quantity] [int] NULL,
	[ImportOrderDetailId] [int] NOT NULL,
 CONSTRAINT [PK_ExportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[featureId] [int] IDENTITY(1,1) NOT NULL,
	[featurename] [nvarchar](50) NOT NULL,
	[url] [nvarchar](max) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goods]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goods](
	[GoodsId] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [nvarchar](100) NOT NULL,
	[GoodsCode] [nvarchar](24) NULL,
	[CategoryId] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[SupplierId] [int] NOT NULL,
	[MeasuredUnit] [nvarchar](100) NULL,
	[Image] [nvarchar](max) NULL,
	[StatusId] [int] NOT NULL,
	[StockPrice] [real] NOT NULL,
	[Barcode] [nvarchar](24) NULL,
	[MaxStock] [int] NULL,
	[MinStock] [int] NULL,
	[CreatedDate] [datetime2](7) NULL,
	[WarrantyTime] [int] NULL,
 CONSTRAINT [PK_Goods] PRIMARY KEY CLUSTERED 
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsHistory](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NOT NULL,
	[ActionId] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[CostPrice] [real] NULL,
	[CostPriceDifferential] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[QuantityDifferential] [nvarchar](11) NULL,
	[Note] [nvarchar](250) NULL,
	[OrderCode] [nvarchar](max) NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_GoodsHistory] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoodsWarehouses]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoodsWarehouses](
	[GoodsId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_GoodsWarehouses] PRIMARY KEY CLUSTERED 
(
	[GoodsId] ASC,
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportOrder](
	[ImportId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[TotalCost] [real] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ImportedDate] [datetime2](7) NULL,
	[StatusId] [int] NOT NULL,
	[ImportCode] [nvarchar](50) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[DeliveryId] [int] NOT NULL,
	[image] [varchar](max) NULL,
	[StaffId] [int] NULL,
	[WarehouseDestinationId] [int] NULL,
 CONSTRAINT [PK_ImportOrder] PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportOrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[BatchCode] [nvarchar](max) NOT NULL,
	[ImportId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[CostPrice] [real] NOT NULL,
	[ManufactureDate] [datetime2](7) NOT NULL,
	[ExpiryDate] [datetime2](7) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ActualQuantity] [int] NOT NULL,
 CONSTRAINT [PK_ImportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryCheckDetails]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryCheckDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InventoryCheckId] [int] NOT NULL,
	[GoodId] [int] NOT NULL,
	[ExpectedQuantity] [int] NOT NULL,
	[ActualQuantity] [int] NOT NULL,
	[note] [nvarchar](max) NULL,
 CONSTRAINT [PK_InventoryCheckDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryChecks]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryChecks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[CheckDate] [datetime2](7) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_InventoryChecks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuredUnit](
	[MeasuredUnitId] [int] IDENTITY(1,1) NOT NULL,
	[MeasuredUnitName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_MeasuredUnit] PRIMARY KEY CLUSTERED 
(
	[MeasuredUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[TokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Token] [nvarchar](44) NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[ExpiredAt] [datetime2](7) NOT NULL,
	[IsRevoked] [bit] NOT NULL,
	[JwtId] [nvarchar](36) NOT NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[TokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnOrder]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnOrder](
	[ReturnOrderId] [int] IDENTITY(1,1) NOT NULL,
	[ReturnOrderCode] [nvarchar](50) NOT NULL,
	[ReturnedDate] [datetime2](7) NOT NULL,
	[ConfirmedDate] [datetime2](7) NULL,
	[WarehouseId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
 CONSTRAINT [PK_ReturnOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnOrderDetail]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnOrderDetail](
	[ReturnOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ReturnOrderId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Reason] [nvarchar](250) NOT NULL,
	[BatchCode] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ReturnOrderDetail] PRIMARY KEY CLUSTERED 
(
	[ReturnOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[roleId] [int] NOT NULL,
	[featureId] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[roleId] ASC,
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NOT NULL,
	[SupplierPhone] [nvarchar](15) NOT NULL,
	[StatusId] [int] NOT NULL,
	[SupplierEmail] [nvarchar](62) NULL,
	[Note] [nvarchar](250) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](62) NULL,
	[Password] [nvarchar](32) NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[UserName] [nvarchar](100) NULL,
	[UserCode] [nvarchar](24) NULL,
	[Address] [nvarchar](250) NULL,
	[Image] [nvarchar](max) NULL,
	[FullName] [nvarchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_Warehouse]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Warehouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
 CONSTRAINT [PK_User_Warehouse] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 8/20/2024 9:38:47 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseName] [nvarchar](100) NOT NULL,
	[WarehouseAddress] [nvarchar](100) NULL,
	[WarehousePhone] [varchar](20) NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240627133002_AddActualQuantity', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240628091405_AddCustomerAndUpdateExportOrder1', N'6.0.29')
GO
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (1, N'Nhập hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (2, N'Xuất hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (3, N'Sửa hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (4, N'Khởi tạo', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (5, N'Kiểm hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (6, N'Trả hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (7, N'Nhập hàng trả', NULL)
GO
SET IDENTITY_INSERT [dbo].[BatchDetails] ON 

INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (15, 24, N'MLH20240820080734', 30, 50, N'thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (16, 25, N'MLH20240820081031', 190, 200, N'thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (17, 26, N'MLH20240820080734', 50, 60, N'')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (18, 27, N'MLH20240820081031', 200, 200, N'')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (19, 28, N'MLH20240820080734', 60, 70, N'thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (20, 29, N'MLH20240820081031', 200, 200, N'đủ hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (21, 30, N'MLH20240820080734', 70, 100, N'thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (22, 31, N'MLH20240820081031', 200, 200, N'đủ hàng')
SET IDENTITY_INSERT [dbo].[BatchDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'Điện thoại di động', N'Danh mục chứa các điện thoại di động và smartphone của các hãng nổi tiếng như Apple, Samsung, Xiaomi, và Oppo.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'Máy tính xách tay', N'Danh mục chứa các máy tính xách tay với nhiều dòng sản phẩm từ các nhà sản xuất như Dell, HP, Lenovo, và Asus.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (3, N'Tivi', N'Danh mục chứa các sản phẩm tivi với các công nghệ hiển thị như LED, OLED, và QLED, và các kích thước màn hình từ 32 inch đến 75 inch.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (4, N'Máy ảnh', N'Danh mục chứa các máy ảnh kỹ thuật số DSLR và mirrorless từ các thương hiệu nổi tiếng như Canon, Nikon, Sony, và Fujifilm.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (5, N'Máy tính bảng', N'Danh mục chứa các máy tính bảng với hệ điều hành Android và iOS từ các nhà sản xuất như Samsung, Apple, Lenovo, và Huawei.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (6, N'Âm thanh', N'Danh mục chứa các sản phẩm âm thanh như tai nghe, loa di động, và hệ thống âm thanh gia đình từ các thương hiệu như Bose, Sony, JBL, và Harman Kardon.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (7, N'Đồ điện tử gia dụng', N'Danh mục chứa các sản phẩm điện tử gia dụng như máy giặt, tủ lạnh, máy lọc không khí, và máy hút bụi từ các nhà sản xuất như Samsung, LG, Panasonic, và Electrolux.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (8, N'Linh kiện điện tử', N'Danh mục chứa các linh kiện điện tử như vi xử lý, bộ nhớ, bo mạch chủ, và card đồ họa từ các nhà sản xuất như Intel, AMD, Corsair, và NVIDIA.')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (9, N'Máy chơi game', N'Danh mục chứa các máy chơi game như PlayStation, Xbox, Nintendo Switch, và máy tính chơi game cá nhân (PC Gaming).')
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (10, N'Đồng hồ thông minh', N'Danh mục chứa các đồng hồ thông minh từ các thương hiệu như Apple Watch, Samsung Galaxy Watch, Fitbit, và Xiaomi Mi Watch.')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (0, N'Vũ Thanh Tùng', N'Nam Định', N'0832574256', N'Thanhtung@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (1, N'Đỗ Tuấn Thành', N'Thái Bình', N'0927626526', N'Thanhdo@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (2, N'Đồng Đức Anh', N'Thái Bình', N'0927626525', N'Ducanh@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (3, N'Nguyễn Quang Huy', N'Thái Bình', N'0567608096', N'Quanghuy@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (4, N'Ngô Tiến Dũng', N'Sơn La', N'0567608178', N'Tiendung@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (6, N'Ninja Van', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (7, N'Kerry Express', 2)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailToken] ON 

INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (26, N'STs8MV8Mh5wjqAQD2xmz86LLMd64OjoKsQM0zmoo7nG6si6Px0tmiKC6GS78jrAv', 38, CAST(N'2024-08-02T00:49:23.8957091' AS DateTime2), CAST(N'2024-08-03T00:49:23.8957482' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (27, N'c99WgdKxBXwjdI8UI9F0DBnOrhNHKkFPbDC5TiAMvvH1Jl3dOlfslHkbJmP0SdMv', 39, CAST(N'2024-08-02T00:51:40.9669973' AS DateTime2), CAST(N'2024-08-03T00:51:40.9669977' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (28, N'WngEmqngBIsTZSxJTtUQQJmz9SLDTyensDYwVlZ5wZsuQTxXIIezqvxetfeynDVK', 39, CAST(N'2024-08-02T00:52:12.1408516' AS DateTime2), CAST(N'2024-08-03T00:52:12.1408521' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (29, N'lU490E1BIKV3muCVskEuwN18R5NvGVqfeHfsll2CRZdDCyNE2ytJOpaEzq5lLQ6P', 39, CAST(N'2024-08-02T08:30:30.2634415' AS DateTime2), CAST(N'2024-08-03T08:30:30.2635163' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (30, N'2STDU11Pp7Vie6jrqzMb80RSwKbX9zQEGmxFXsRQWsoJIdpjyq0y0OA6WjByBzMl', 37, CAST(N'2024-08-05T06:55:55.1182435' AS DateTime2), CAST(N'2024-08-06T06:55:55.1182988' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[EmailToken] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrder] ON 

INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (108, N'XH20240820081457', 15, 0, N'', 4, CAST(N'2024-08-20T08:14:57.5035736' AS DateTime2), CAST(N'2024-08-20T08:20:19.1280886' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, N'https://localhost:7033/uploads/8b167af653c2399dd93b952a48740620_aa13f266-e9fc-497e-8d5a-49bb6c01341c_d9329497-8167-4711-bd3a-79126cd7ee68.jpg', 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (109, N'XH20240820082015', 15, 0, N'', 4, CAST(N'2024-08-20T08:20:15.7746329' AS DateTime2), CAST(N'2024-08-20T08:20:23.2761677' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, N'https://localhost:7033/uploads/shipment8_34f7a1de-c310-4825-afe9-cb9ecc6816c7.jpg', 19, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (110, N'XH20240820082248', 15, 0, N'', 4, CAST(N'2024-08-20T08:22:48.1744419' AS DateTime2), CAST(N'2024-08-20T08:22:57.2436866' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, N'https://localhost:7033/uploads/shipment5_132595a6-754a-4b6d-9c76-34383cf13b06.jpg', 19, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (111, N'XH20240820082522', 15, 0, N'', 4, CAST(N'2024-08-20T08:25:22.2250749' AS DateTime2), CAST(N'2024-08-20T08:26:16.8447845' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, N'https://localhost:7033/uploads/shipment3_0b2ce887-3117-4315-aeb2-fb44ed6aa669.jpg', 19, 0, 2)
SET IDENTITY_INSERT [dbo].[ExportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] ON 

INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (115, 108, 0, 1, 100, 262)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (116, 108, 0, 2, 200, 273)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (117, 109, 0, 2, 100, 273)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (118, 109, 0, 2, 100, 278)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (119, 110, 0, 1, 100, 262)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (120, 110, 0, 2, 100, 273)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (121, 110, 0, 1, 100, 279)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (122, 110, 0, 2, 100, 278)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (123, 110, 0, 1, 100, 274)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (124, 111, 0, 2, 50, 273)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (125, 111, 0, 1, 200, 262)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (126, 111, 0, 2, 100, 278)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (127, 111, 0, 1, 200, 274)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (128, 111, 0, 1, 200, 279)
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'Samsung Galaxy S21', N'SSG21', 1, N'Sự đẳng cấp được Samsung gửi gắm thông qua chiếc smartphone Galaxy S21 Ultra 5G với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong, hứa hẹn đáp ứng trọn vẹn nhu cầu ngày càng cao của người dùng.', 2, N'Thùng', N'https://localhost:7033/uploads/hinh-anh-Galaxy-S21-Ultra-1_d48015cc-55e5-4f0a-9a3f-b1ec227def23.jpg', 1, 0, N'VN24SSG21', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy Z Flip6', N'SSGZ6', 1, N'Samsung Z Flip 6 là chiếc điện thoại gập vỏ sò chạy chip Snapdragon 8 Gen 3 for Galaxy mạnh mẽ bậc nhất hiện nay. Máy có cụm camera kép độ phân giải 50MP sắc nét. Đi kèm là bộ nhớ RAM 12GB và thời lượng pin được nâng cấp thêm 4 tiếng sử dụng.', 2, N'Thùng', N'https://localhost:7033/uploads/samsung-galaxy-z-flip6-didongmy_265c907f-3e2b-4788-8cce-ccba315afbe4.jpg', 1, 0, N'VN24SSGZ6', 10000, 10, CAST(N'2024-08-16T16:03:11.0395162' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 5, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3520-i5-n5i5052w1-thumb-600x600_0a813ea1-a1c1-4a35-b8db-88620ab68472.jpg', 1, 0, N'VN24DXPS13', 10000, 10, CAST(N'2024-08-16T16:03:11.0395162' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Sony A7 III', N'SA7III', 1, N'Máy ảnh Sony A7 III', 7, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_fc7c5f64-659f-45b7-a8a3-acb3d4568428.jpg', 1, 0, N'VN24SA7III', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11', 4, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_0f62e0bf-4d98-4823-9654-115184508cc3.jpg', 1, 0, N'VN24MI11', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360', 70, N'Thùng', N'https://localhost:7033/uploads/HP-Spectre-x360-15-01_c25e72cf-b402-41aa-b674-3551f419a853.jpg', 1, 0, N'VN24HPX360', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 2, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_caf1df26-e1ff-41cf-8560-e1d24c1df2f7.jpg', 1, 0, N'VN24LGTV', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R', 7, N'Thùng', N'https://localhost:7033/uploads/20210909_kD8KrfZF0AOeWFHdd5TYbs3S_9b6c6a29-244f-462b-9291-d44419b8d03a.jpg', 1, 0, N'VN24CEOSR', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7', 2, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_ac6d478a-f75f-4889-a861-6fb8d65b1f81.jpg', 1, 0, N'VN24SGTS7', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 4, N'Thùng', N'https://localhost:7033/uploads/710-02_bad6493e-feab-4522-b51f-8a686fb798a2.jpg', 1, 0, N'VN24BQC35', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic', 6, N'Thùng', N'https://localhost:7033/uploads/lg-inverter-374-lit-gn-d372bl-1.-600x600_265e473b-2481-4479-9b41-5b56351a8d52.jpg', 1, 0, N'VN24PRF', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9', 72, N'Thùng', N'https://localhost:7033/uploads/Z270M-Pro4_73c9bf16-b8d5-49ff-9d02-da63abb74696.png', 1, 0, N'VN24ICI9', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5', 7, N'Thùng', N'https://localhost:7033/uploads/9223-ps5-slim_f65f90b6-92a5-4191-8a2d-8bced7bc331a.jpg', 1, 0, N'VN24PS5', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6', 3, N'Thùng', N'https://localhost:7033/uploads/2023_8_9_638271911445546202_xiaomi-redmi-watch-3-active-xam-1_e9dbbede-dbde-4ea6-8009-3c297840f532.jpg', 1, 0, N'VN24AWS6', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (15, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'R50Z', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', 69, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_7f39cc98-17fb-4db3-8659-b7698a48ee1b.jpg', 1, 0, N'VN24R50Z', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (16, N'Astro A10', N'AS10', 2, N'tai nghe Gaming', 69, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_71bd4511-0554-43a4-8277-f199ba104e3b.jpg', 1, 0, N'VN24AS10', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (17, N'Logitech G102', N'LG102', 8, N'Chuột Gaming', 8, N'Thùng', N'https://localhost:7033/uploads/16401459675947_1132f6ed-2ab4-4767-b61b-c416d0726c6a.jpg', 1, 0, N'VN24LG102', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (18, N'Logi Dock', N'LD1', 6, N'loa thu âm', 2, N'Thùng', N'https://localhost:7033/uploads/Logi-Dock-09_6062fa05-dd97-4563-8a93-37aca63766c4.jpg', 1, 0, N'VN24LD1', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (19, N'Newsun HS-20', N'HS20', 7, N'Máy đánh bột HS20', 6, N'Thùng', N'https://localhost:7033/uploads/may-giat-toshiba-8kg-aw-m905bvmk_df9d62f8_eb35d992-7356-4e25-9f59-fcd0b18130e6.jpg', 1, 0, N'VN24HS20', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (20, N'Newsun B30B', N'B30B', 7, N'Máy đánh bột 30 lít', 6, N'Thùng', N'https://localhost:7033/uploads/1687514182_8118_bdad1454f9ae3b3dbe40fd75ec5cc403_1de6ace1-fce9-4e20-9bef-249429637a67.jpg', 1, 0, N'VN24B30B', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (21, N'KitchenAid Artisan', N'KA5', 7, N'Máy đánh bột', 6, N'Thùng', N'https://localhost:7033/uploads/máy-làm-bánh-2_d732c4a0-2403-4a1a-91f4-3e87c82a59c5.jpg', 1, 0, N'VN24KA5', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (22, N'Galaxy tab S9', N'GTS9', 1, N'máy tính bảng Galaxy tab S9', 2, N'Thùng', N'https://localhost:7033/uploads/samsung-galaxy-tab-s9-grey-thumbnew-600x600_8d214ecd-dcd9-43a2-938f-a6210538118c.jpg', 1, 0, N'VN24GTS9', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (23, N'Galaxy Z fold5', N'GZF5', 1, N'Galaxy Z fold5', 2, N'Thùng', N'https://localhost:7033/uploads/samsung-galaxy-z-flip6-didongmy_3c73ac10-82e8-4ce7-af71-75e90f9d20eb.jpg', 1, 0, N'VN24GZF5', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (24, N'Smart Tivi Samsung UHD85', N'ST1', 3, N'Smart Tivi Samsung UHD85', 2, N'Thùng', N'https://localhost:7033/uploads/10051659-smart-tivi-qled-samsung-4k-65-inch-qa65q60bakxxv-2_wcqk-zo_7bdac5ab-abfc-4fdf-81f6-ee87a6a2d108.jpg', 1, 0, N'VN24ST1', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (25, N'Asrock Z270M Pro 4', N'AZ4', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/Z270M-Pro4_9ab4cb35-f018-473c-b5c1-7456e9d50d58.png', 1, 0, N'VN24AZ4', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (26, N'Asus prime H610M', N'APH6', 8, N'Main máy tính', 72, N'Thùng', N'https://localhost:7033/uploads/tải xuống_853d0fcf-a862-43d2-a853-5bf6a62647c8.png', 1, 0, N'VN24APH6', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (27, N'TUF B760M', N'TB7', 8, N'Main máy tính', 72, N'Thùng', N'https://localhost:7033/uploads/tải xuống_636105e1-dac8-4b33-a9bd-a68346e30157.png', 1, 0, N'VN24TB7', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (28, N'LG inverter D372', N'LI3', 7, N'tủ lạnh thông minh LG', 70, N'Thùng', N'https://localhost:7033/uploads/lg-inverter-374-lit-gn-d372bl-1.-600x600_13c6d968-cb37-42a6-ae64-4427ab7d5115.jpg', 1, 0, N'VN24LI3', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (29, N'Garmin venu 3S', N'Gv3', 10, N'đồng hồ thông minh Garmin venu 3S', 4, N'Thùng', N'https://localhost:7033/uploads/2023_8_9_638271911445546202_xiaomi-redmi-watch-3-active-xam-1_78bda52c-12f2-409c-94e0-90d2e8c64923.jpg', 1, 0, N'VN24Gv3', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (30, N'Electrolux 2', N'EL2', 7, N'tủ lạnh thông minh LG', 6, N'Thùng', N'https://localhost:7033/uploads/264373-1-2-3-600x600_234f4b44-1fba-403a-a9a9-f0b3a304c12c.jpg', 1, 0, N'VN24EL2', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (31, N'Google Tivi Xiaomi A 32 inch L32M8-P2SEA', N'XA32', 3, N'Tivi xiaomi 4K', 4, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_21dcc0b2-59d8-4c7e-a470-cc4e89cf2d51.jpg', 1, 0, N'VN24XA32', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (32, N'Smart Tivi Samsung QLED 4K 55 inch 55QE1D', N'SQ4k', 3, N'ti vi samsug QHD4K', 2, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_c7550d9f-bf23-41e2-86d7-319877427cf2.jpg', 1, 0, N'VN24SQ4k', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (33, N'Loa Bluetooth Sony SRS-XP500 ', N'XP500', 6, N'Loa sony xp500', 7, N'Thùng', N'https://localhost:7033/uploads/unnamed_98223f77-376a-4521-bf6e-7e13d8ff119a.jpg', 1, 0, N'VN24XP500', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (34, N'Bộ loa thanh LG SN5R 520W', N'LG5', 6, N'Bộ loa thanh LG SN5R', 7, N'Thùng', N'https://localhost:7033/uploads/loa-bluetooth-jbl-pulse-5-1_25dc72ea-5ace-4205-a20b-3c578d44f7ac.jpg', 1, 0, N'VN24LG5', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (35, N'Máy hút bụi LG VK8320GHAUQ', N'VK8', 7, N'máy hút bụi Vk8', 70, N'Thùng', N'https://localhost:7033/uploads/264373-1-2-3-600x600_aefbb0d1-8b11-4aa1-9fd4-74bf3ab111b9.jpg', 1, 0, N'VN24VK8', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (36, N'Laptop Lenovo Ideapad Slim 3', N'LIS3', 2, N'Laptop Lenovo Ideapad Slim 3', 5, N'Thùng', N'https://localhost:7033/uploads/IMG_1398_cb7e0117-d10d-4bdd-ba58-ee6778d9974c.jpg', 1, 0, N'VN24', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (37, N'Màn hình LG 27MP500-B.ATV 27 inch', N'LG27', 8, N'Màn hình LG 27MP500-B.ATV 27 inch', 70, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd-65x75k-65-inch-google-tv_02b903cc_df4beec7-34f4-4043-89f5-7aff304a3933.jpg', 1, 0, N'VN24LG27', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (38, N'Máy tính bảng iPad Pro M4 11 inch WiFi 256GB', N'Ip4', 5, N'Máy tính bảng iPad Pro M4 11 inch WiFi 256GB', 3, N'Thùng', N'https://localhost:7033/uploads/111887_sp866-ipad-air-5gen_5639ebd6-757b-44fa-8931-a443ea671972.png', 1, 0, N'VN24Ip4', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (39, N' Xiaomi Redmi Pad Pro', N'XRP', 5, N' Xiaomi Redmi Pad Pro', 9, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_1a29d60e-d1a4-40ad-86ec-dd894f372d94.jpg', 1, 0, N'VN24XRP', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (40, N'Máy chơi game cầm tay Asus ROG Ally RC71L', N'ROG', 9, N'Máy chơi game cầm tay Asus ROG Ally RC71L', 72, N'Thùng', N'https://localhost:7033/uploads/1695685468662_c9fc325e-6fce-4529-9291-94cb7ba77c51.jpg', 1, 0, N'VN24ROG', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (41, N'Đồng hồ thông minh Huawei Watch GT 4 46mm', N'GT4', 10, N'Đồng hồ thông minh Huawei Watch GT 4 46mm', 4, N'Thùng', N'https://localhost:7033/uploads/2023_8_9_638271911445546202_xiaomi-redmi-watch-3-active-xam-1_838400b2-93d6-4988-b32a-f62b707a80a7.jpg', 1, 0, N'VN24GT4', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (42, N'Laptop Acer Gaming Nitro V ANV15', N'NTR5', 2, N'Laptop Acer Gaming Nitro V ANV15', 69, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_d82c3f7e-ee19-4f10-9d7e-7464120c4bde.jpg', 1, 0, N'VN24NTR5', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (43, N'Laptop Gaming Acer Aspire 7 A715', N'ASP7', 2, N'Laptop Gaming Acer Aspire 7 A715', 72, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_e6784e1a-d724-4524-98b5-cbd0e01b9301.jpg', 1, 0, N'VN24ASP7', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (44, N'Laptop Acer Predator Helios Neo PHN16-71-53M7', N'APH71', 2, N'Laptop Acer Predator Helios Neo PHN16-71-53M7', 69, N'Thùng', N'https://localhost:7033/uploads/IMG_1398_3249c8e1-6cee-42fd-b11f-9a570450e686.jpg', 1, 0, N'VN24APH71', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (45, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'AN16', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', 72, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_7cf12c40-1aea-4f1c-a4d4-a18a2d355997.jpg', 1, 0, N'VN24AN16', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (46, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN5T', 2, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', 72, N'Thùng', N'https://localhost:7033/uploads/e2581e1d2140ad913fa02b5076512a6d.png_720x720q80_626482ea-9c99-44d2-b65b-ac4abf655eb0.png', 1, 0, N'VN24AN5T', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (47, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', N'AN16P', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', 69, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_fe772b2b-0d6d-4980-ba4b-b105ea8c4c40.jpg', 1, 0, N'VN24AN16P', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (48, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', N'R60F', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', 72, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-5620-p117f001agr-1_8f8aadf1-d36e-4896-a2d7-e1625d96d3fc.jpg', 1, 0, N'VN24R60F', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (49, N'Nồi cơm cao tần Toshiba 1.8 lít RC-18IX1PV', N'TRC18L', 8, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 6, N'Thùng', N'https://localhost:7033/uploads/may-say-thong-hoi-toshiba-7kg-td-h80sevsk_d18c9516_4e4dee93-2a5e-4e13-9b14-541a96e42007.jpg', 1, 0, N'VN24TRC18L', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (50, N'Laptop Acer Predator Helios Neo PHN16-71-7460', N'PHN16', 2, N'Laptop Acer Predator Helios Neo PHN16-71-7460', 69, N'Thùng', N'https://localhost:7033/uploads/dell-vostro-3420-i5-v4i5702w1-thumb-new-600x600_60a1e55d-d9a5-408d-b248-6321876dd846.jpg', 1, 0, N'VN24PHN16', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (52, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', N'R76E', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 69, N'thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_0c687740-6ec1-438f-a3b3-1b59d745200e.jpg', 1, 0, N'VN24R76E', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (53, N'Laptop Acer Predator Helios Neo PHN16-71', N'547E', 2, N'Laptop Acer Predator Helios Neo PHN16-71', 69, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_551a2b0d-ce0c-4b45-9698-d4209d2f38af.jpg', 1, 0, N'VN24547E', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (54, N'Máy ảnh Fujifilm X100V', N'FX100V', 4, N'Máy ảnh Fujifilm X100V', 10, N'Thùng', N'https://localhost:7033/uploads/1607484175_9894e189-9ee6-47c8-850c-142371288477.jpg', 1, 0, N'VN24FX100V', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (55, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', N'72vs', 2, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', 69, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3520-i5-n5i5052w1-thumb-600x600_144bcab5-5d93-45d1-91a3-a6e5eda81df4.jpg', 1, 0, N'VN2472vs', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (56, N'Laptop Gaming Acer Aspire 7 A715-76G-5806', N'A715', 2, N'Laptop Gaming Acer Aspire 7 A715-76G-5806', 69, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-5620-p117f001agr-1_b0461012-9257-488a-a2e7-8a4126fad88d.jpg', 1, 0, N'VN24A715', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (57, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN515', 2, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', 69, N'Thùng', N'https://localhost:7033/uploads/2022_8_15_637961789064693741_acer-nitro-gaming-5-an515-45-den-1_4bf47be9-6bf9-4896-bfe6-e9246a712b7b.jpg', 1, 0, N'VN24AN515', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (58, N' Samsung Galaxy A15', N'A15', 1, N'Galaxy a15', 2, N'Thùng', N'https://localhost:7033/uploads/thumb-6b_47a2910e-fa94-4668-b2d9-9ff56385afed.png', 1, 0, N'VN24A15', 10000, 10, CAST(N'2024-06-25T21:13:28.9651682' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (59, N'Samsung Galaxy S23 Ultra 5G', N'S23', 1, N'Samsung Galaxy S23 Ultra 5G', 2, N'Thùng', N'https://localhost:7033/uploads/galaxy-s24-ultra-highlights-kv_4cc110ad-9183-4194-b29e-39d181c722ab.jpg', 1, 0, N'VN24S23', 10000, 10, CAST(N'2024-06-25T21:14:24.6493054' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (60, N'Samsung Galaxy Watch5 40mm dây silicone', N'GW5', 10, N'Samsung Galaxy Watch5 40mm dây silicone', 2, N'Thùng', N'https://localhost:7033/uploads/vong-deo-tay-thong-minh-Xiaomi-Band-8-hinh-1_6b6260e0-d5e9-4827-ac9b-7af2b3aed8a5.jpg', 1, 0, N'VN24GW5', 10000, 10, CAST(N'2024-06-25T21:15:56.9574661' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (61, N'Samsung Galaxy Fit3 dây silicone', N'FIT3', 10, N'Samsung Galaxy Fit3 dây silicone', 2, N'Thùng', N'https://localhost:7033/uploads/2023_8_9_638271911445546202_xiaomi-redmi-watch-3-active-xam-1_3be256c8-5a30-439c-9508-1dd1e61d205e.jpg', 1, 0, N'VN24FIT3', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (62, N'Samsung Galaxy A05s', N'A05s', 1, N'Samsung Galaxy A05s', 2, N'Thùng', N'https://localhost:7033/uploads/thumb-6b_aa480eb6-0e1c-4e96-92a6-3687a666cc41.png', 1, 0, N'VN24A05s', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (63, N'Samsung Galaxy S24 5G', N'GS24', 1, N'Samsung Galaxy S24 5G', 2, N'Thùng', N'https://localhost:7033/uploads/galaxy-s24-ultra-highlights-kv_bfbbba0f-e49d-4615-a61c-234e2474501b.jpg', 1, 0, N'VN24GS24', 10000, 10, CAST(N'2024-06-26T21:32:55.1922293' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (64, N'Samsung Galaxy A15', N'GA15', 1, N'Samsung Galaxy A15', 2, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_6eeef753-1d5b-4671-84dd-483f39cb9f03.jpg', 1, 0, N'VN24GA15', 10000, 10, CAST(N'2024-06-26T21:33:54.4490427' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (66, N'Samsung Galaxy Z Flip5 5G', N'ZFL5', 1, N'Samsung Galaxy Z Flip5 5G', 2, N'Thùng', N'https://localhost:7033/uploads/samsung-galaxy-z-flip6-didongmy_cc871558-a331-48cc-9e49-c1dbb13d0eb8.jpg', 1, 0, N'VN24ZFL5', 10000, 10, CAST(N'2024-06-26T21:37:53.1683165' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (67, N'Samsung Galaxy S23 FE 5G 8GB/256GB', N'GS23FE', 1, N'Samsung Galaxy S23 FE 5G 8GB/256GB', 2, N'Thùng', N'https://localhost:7033/uploads/hinh-anh-Galaxy-S21-Ultra-1_9f1694f2-b17c-49a9-86ae-d35872069e9f.jpg', 1, 0, N'VN24GS23FE', 10000, 10, CAST(N'2024-06-26T21:38:46.9274061' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (68, N'Asus Vivobook X1404ZA i3 1215U (NK246W)', N'X1404', 2, N'Asus Vivobook X1404ZA i3 1215U (NK246W)', 72, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_d96e28ef-d08f-4a7d-b522-964623947f04.jpg', 1, 0, N'VN24X1404', 10000, 10, CAST(N'2024-06-26T21:42:58.6124947' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (69, N'HP 15s fq5229TU i3 1215U (8U237PA)', N'HP15s', 2, N'HP 15s fq5229TU i3 1215U (8U237PA)', 5, N'Thùng', N'https://localhost:7033/uploads/IMG_1398_ab487cd4-dc4e-4366-8d1c-59fe9e960912.jpg', 1, 0, N'VN24HP15s', 10000, 10, CAST(N'2024-06-26T21:45:37.5391591' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (70, N'Acer Aspire Lite 14 51M 59BN i5 1235U', N'AAL14', 2, N'Acer Aspire Lite 14 51M 59BN i5 1235U', 69, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_ff93d94b-7586-498b-ad6a-24cefa018809.jpg', 1, 0, N'VN24AAL14', 10000, 10, CAST(N'2024-06-26T21:46:32.6240940' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (71, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', N'ISl3', 2, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', 69, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_c59b9464-1cee-47b2-868a-a815f8dceb83.jpg', 1, 0, N'VN24ISl3', 10000, 10, CAST(N'2024-06-26T21:47:27.2024068' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (72, N'HP 15 fd0234TU i5 1334U (9Q969PA)', N'HP15U', 2, N'Samsung Galaxy S23 FE 5G 8GB/256GB', 70, N'Thùng', N'https://localhost:7033/uploads/IMG_1398_ae136154-487b-4e72-a966-7c90b1b6385d.jpg', 1, 0, N'VN24HP15U', 10000, 10, CAST(N'2024-06-26T21:48:27.4329132' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (73, N'Acer Aspire Lite 15 51M 55NB i5 1155G7', N'AL55NB', 2, N'Acer Aspire Lite 15 51M 55NB i5 1155G7', 5, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3530-i5-n5i5791w1-thumb-1-600x600_fb6bf042-ba5e-474a-8003-12eafd8503b0.jpg', 1, 0, N'VN24AL55NB', 10000, 10, CAST(N'2024-06-26T21:49:45.3530118' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (74, N'Lenovo Ideapad 1 15ALC7 R7 5700U (82R400C1VN)', N'5ALC7', 2, N'Lenovo Ideapad 1 15ALC7 R7 5700U (82R400C1VN)', 5, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_71b07254-e3e2-4995-a7e3-03a537f140d6.jpg', 1, 0, N'VN245ALC7', 10000, 10, CAST(N'2024-06-26T21:53:15.1062126' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (75, N'Dell Vostro 15 3520 i5 1235U (i5U165W11GRU)', N'i5U165', 2, N'Dell Vostro 15 3520 i5 1235U (i5U165W11GRU)', 5, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_8d8b69ae-4daf-41ba-b94d-beff03cefd88.jpg', 1, 0, N'VN24i5U165', 10000, 10, CAST(N'2024-06-26T21:54:52.1712552' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (76, N'Asus Vivobook 16 X1605VA i5 1335U (MB360W)', N'MB360', 2, N'Asus Vivobook 16 X1605VA i5 1335U (MB360W)', 72, N'Thùng', N'https://localhost:7033/uploads/e2581e1d2140ad913fa02b5076512a6d.png_720x720q80_66ea0452-48da-4e06-8056-8076e0649ec6.png', 1, 0, N'VN24MB360', 10000, 10, CAST(N'2024-06-26T22:01:17.0758212' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (77, N'HP 245 G10 R5 7530U (A20TDPT)', N'HPGR10', 2, N'HP 245 G10 R5 7530U (A20TDPT)', 5, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_c0b805d8-1c79-4ed0-908d-0352010f4887.jpg', 1, 0, N'VN24HPGR10', 10000, 10, CAST(N'2024-06-26T22:02:14.8738309' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (78, N'HP 15 fd0234TU i5 1334U (9Q969PA)', N'9Q96', 2, N'HP 15 fd0234TU i5 1334U (9Q969PA)', 72, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_532fe85b-47df-4c86-9830-9635097d6867.jpg', 1, 0, N'VN249Q96', 10000, 10, CAST(N'2024-06-26T22:13:10.3586343' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (79, N'HP Pavilion 14 dv2073TU i5 1235U (7C0P2PA)', N'DV2073', 2, N'HP Pavilion 14 dv2073TU i5 1235U (7C0P2PA)', 69, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_22b19b9a-d0bb-46df-9044-6046af123a5e.jpg', 1, 0, N'VN24DV2073', 10000, 10, CAST(N'2024-06-26T22:24:06.8896648' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (80, N'Dell Inspiron 15 3520 i5 1235U (N5I5052W1)', N'N5I', 2, N'Dell Inspiron 15 3520 i5 1235U (N5I5052W1)', 5, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3530-i5-n5i5791w1-thumb-1-600x600_ac0d82e9-748d-4e62-af54-0f400d49ea35.jpg', 1, 0, N'VN24N5I', 10000, 10, CAST(N'2024-06-26T22:29:54.1657599' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (81, N'HP 15s fq5162TU i5 1235U (7C134PA)', N'7C1', 2, N'HP 15s fq5162TU i5 1235U (7C134PA)', 5, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-5620-p117f001agr-1_141a4c3e-9bde-4d9b-acc7-f6c8b3f0df5e.jpg', 1, 0, N'VN247C1', 10000, 10, CAST(N'2024-06-26T22:30:54.0309789' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (82, N'MSI Modern 15 B12MO i5 1235U (625VN)', N'625VN', 2, N'MSI Modern 15 B12MO i5 1235U (625VN)', 5, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3530-i5-n5i5791w1-thumb-1-600x600_59aa8661-23e2-45f3-85b1-7d69625d7921.jpg', 1, 0, N'VN24625VN', 10000, 10, CAST(N'2024-06-26T22:31:38.9516603' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (83, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', N'15AM', 2, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', 69, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_ac7b8261-8ad6-4c33-9b62-bab1d77e158b.jpg', 1, 0, N'VN2415AM', 10000, 10, CAST(N'2024-06-26T22:32:27.2726335' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (84, N'MacBook Air 15 inch M2 Sạc 70W', N'M2', 2, N'MacBook Air 15 inch M2 Sạc 70W', 3, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_0db8d46f-4825-4c1a-b35b-2c935f9c57a2.jpg', 1, 0, N'VN24M2', 10000, 10, CAST(N'2024-06-26T22:33:21.0382272' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (85, N'Samsung Galaxy M34 5G 8GB 128GB', N'M34', 1, N'Samsung Galaxy M34 5G 8GB 128GB', 2, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_83e3f49f-fbca-466e-9b66-972dfce60c3b.jpg', 1, 0, N'VN24M34', 10000, 10, CAST(N'2024-06-27T15:58:49.0937858' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (86, N'Samsung Galaxy A55 5G 8GB 128GB', N'A55', 1, N'Samsung Galaxy A55 5G 8GB 128GB', 2, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_a830c444-d375-4059-9b1e-db2c41f2cea1.jpg', 1, 0, N'VN24A55', 10000, 10, CAST(N'2024-06-27T15:59:39.1177489' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (87, N'Samsung Galaxy A54 5G 8GB 128GB', N'A54', 1, N'Samsung Galaxy A54 5G 8GB 128GB', 2, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_9cf193e0-7f91-4073-9430-7b4c82936993.jpg', 1, 0, N'VN24A54', 10000, 10, CAST(N'2024-06-27T16:00:32.9404042' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (88, N'Smart Tivi Samsung UHD 4K 43 inch UA43AU7002', N'UA4', 3, N'Smart Tivi Samsung UHD 4K 43 inch UA43AU7002', 2, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd55x86j-55-inch-android-tv-mVpUO0_a32b2229-459d-4667-b94f-13893a3fc6e2.jpg', 1, 0, N'VN24UA4', 10000, 10, CAST(N'2024-06-27T16:02:19.7857997' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (89, N'Smart Tivi Samsung 4K 55 inch UA55AU7002', N'UA55', 3, N'Smart Tivi Samsung 4K 55 inch UA55AU7002', 6, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_c39cc3ae-ffc6-4267-ac16-4a7b0afdcba3.jpg', 1, 0, N'VN24UA55', 10000, 10, CAST(N'2024-06-27T16:03:24.6023615' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (90, N' Smart Tivi Samsung QLED 55 inch 55Q60BAK', N'55Q6', 3, N'Smart Tivi Samsung QLED 55 inch 55Q60BAK', 6, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd-65x75k-65-inch-google-tv_02b903cc_86c233cb-4cf8-49b5-87b5-dd5906fa2d22.jpg', 1, 0, N'VN2455Q6', 10000, 10, CAST(N'2024-06-27T16:04:31.1188234' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (91, N'Smart Tivi Samsung Crystal UHD 4K 50 inch UA50AU7700KXXV', N'UA50', 3, N'Smart Tivi Samsung Crystal UHD 4K 50 inch UA50AU7700KXXV', 2, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_2ffc7391-64c0-4994-9f5e-af6bc6a7d973.jpg', 1, 0, N'VN24UA50', 10000, 10, CAST(N'2024-06-27T16:05:39.9719940' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (92, N'Loa tháp Samsung MX-T70', N'MXT7', 6, N'Loa tháp Samsung MX-T70', 2, N'Thùng', N'https://localhost:7033/uploads/loa-bluetooth-jbl-pulse-5-1_4722d9f8-d08b-48c1-8087-73c90200c6be.jpg', 1, 0, N'VN24MXT7', 10000, 10, CAST(N'2024-06-27T16:06:33.1661976' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (93, N'Loa thanh Samsung HW-Q600C/XV', N'HWQ6', 6, N'Loa thanh Samsung HW-Q600C/XV', 2, N'Thùng', N'https://localhost:7033/uploads/unnamed_80b60efa-3b9d-4e18-bdc1-ce0b8a812582.jpg', 1, 0, N'VN24HWQ6', 10000, 10, CAST(N'2024-06-27T16:07:22.5589905' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (94, N'Bàn phím + Bao da Samsung Galaxy Tab S9 Plus | S9 FE Plus chính hãng', N'TS9P', 8, N'Bàn phím + Bao da Samsung Galaxy Tab S9 Plus | S9 FE Plus chính hãng', 2, N'Thùng', N'https://localhost:7033/uploads/bao-da-kiem-ban-phim-galaxy-tab-s9-ultra-plus-chinh-hang_872d48be-32e2-4639-9df3-dd2454befbfb.jpg', 1, 0, N'VN24TS9P', 10000, 10, CAST(N'2024-06-27T16:08:53.4142275' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (95, N'Robot hút bụi Samsung JETBOT VR30T85513W/SV', N'VR30', 7, N'Robot hút bụi Samsung JETBOT VR30T85513W/SV', 2, N'Thùng', N'https://localhost:7033/uploads/264373-1-2-3-600x600_9a124eb8-7f48-4c49-b206-0086946c10d0.jpg', 1, 0, N'VN24VR30', 10000, 10, CAST(N'2024-06-27T16:10:02.2670207' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (96, N'Robot hút bụi Samsung Powerbot-E', N'PE1', 7, N'Robot hút bụi Samsung Powerbot-E', 2, N'Thùng', N'https://localhost:7033/uploads/samsung-vr05r5050wk-sv-100423-014048-600x600_cca2cc3a-7655-4fa4-bb0c-afff310de375.jpg', 1, 0, N'VN24PE1', 10000, 10, CAST(N'2024-06-27T16:11:23.4619697' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (97, N'Máy hút bụi cầm tay Samsung 3in1 VS03R6523J1/SV', N'VS03', 7, N'Máy hút bụi cầm tay Samsung 3in1 VS03R6523J1/SV', 6, N'Thùng', N'https://localhost:7033/uploads/samsung-vs03r6523j1-sv-1-600x600_ebfe6aba-a54a-40d0-b494-f693390e14d4.jpg', 1, 0, N'VN24VS03', 10000, 10, CAST(N'2024-06-27T16:12:41.0377615' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (98, N'Máy lọc không khí Samsung AX40R3030WM/SV', N'AX4', 7, N'Máy lọc không khí Samsung AX40R3030WM/SV', 2, N'Thùng', N'https://localhost:7033/uploads/may-loc-khong-khi-samsung-ax40r3030wm-sv-0_6b59cf0e-c889-4cfa-a1e9-73d54b73f89d.png', 1, 0, N'VN24AX4', 10000, 10, CAST(N'2024-06-27T16:13:36.2186231' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (99, N'Máy lọc không khí Samsung AX34R3020WW/SV', N'AX34', 7, N'Máy lọc không khí Samsung AX34R3020WW/SV', 7, N'Thùng', N'https://localhost:7033/uploads/may-loc-khong-khi-samsung-ax40r3030wm-sv-0_4683729f-e98e-4900-a953-fdda6dd27840.png', 1, 0, N'VN24AX34', 10000, 10, CAST(N'2024-06-27T16:14:23.2535500' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (100, N'Máy lọc không khí Samsung AX32BG3100GB/SV BE', N'AX32', 7, N'Máy lọc không khí Samsung AX32BG3100GB/SV BE', 2, N'Thùng', N'https://localhost:7033/uploads/may-loc-khong-khi-samsung-ax40r3030wm-sv-0_29cbf1bb-3879-4c16-9ae8-a0b71e0537f2.png', 1, 0, N'VN24AX32', 10000, 10, CAST(N'2024-06-27T16:15:03.9567899' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (101, N'Samsung Galaxy Watch4 40mm', N'GW4', 10, N'Samsung Galaxy Watch4 40mm', 2, N'Thùng', N'https://localhost:7033/uploads/content_1934af59-efed-4db3-aadb-dd88b6d0758a.png', 1, 0, N'VN24GW4', 10000, 10, CAST(N'2024-06-27T16:15:55.7687342' AS DateTime2), 12)
GO
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (102, N'Samsung Galaxy Watch6 Classic 43mm Bluetooth', N'GW6', 10, N'Samsung Galaxy Watch6 Classic 43mm Bluetooth', 7, N'Thùng', N'https://localhost:7033/uploads/content_b0b1e930-dccc-4a3f-bd9b-311002554543.png', 1, 0, N'VN24GW6', 10000, 10, CAST(N'2024-06-27T16:16:41.6713600' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (103, N'PC CPS Gaming G04 i5 12400F / 8GB - 256GB / GTX 1650', N'G04', 9, N'PC CPS Gaming G04 i5 12400F / 8GB - 256GB / GTX 1650', 8, N'Thùng', N'https://localhost:7033/uploads/pc-cps-gaming-g16_eff7e4b8-bb51-4be9-aeb1-c018925175f0.jpg', 1, 0, N'VN24G04', 10000, 10, CAST(N'2024-06-27T16:19:00.1892366' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (104, N'PC CPS Gaming G14', N'G14', 9, N'PC CPS Gaming G14', 8, N'Thùng', N'https://localhost:7033/uploads/pc-cps-gaming-g16_102242ed-4f86-4760-a00d-42ac6eb22e90.jpg', 1, 0, N'VN24G14', 10000, 10, CAST(N'2024-06-27T16:19:48.5778167' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (105, N'Máy tính All In One văn phòng MSI PRO-AP242-12M-213VN', N'AP242', 8, N'Máy tính All In One văn phòng MSI PRO-AP242-12M-213VN', 70, N'Thùng', N'https://localhost:7033/uploads/52701_may_tinh_all_in_one_msi_pro_ap242_12m_213vn_44411449-15de-46c7-aabd-8d10e16b15df.jpg', 1, 0, N'VN24AP242', 10000, 10, CAST(N'2024-06-27T16:21:20.6120077' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (106, N'PC CPS văn phòng S04 i5 12400 / 8GB - 240GB', N'S04', 8, N'PC CPS văn phòng S04 i5 12400 / 8GB - 240GB', 72, N'Thùng', N'https://localhost:7033/uploads/pc-cps-gaming-g16_52462a95-bb2f-452d-915c-348d11cd4d6d.jpg', 1, 0, N'VN24S04', 10000, 10, CAST(N'2024-06-27T16:22:11.1556119' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (107, N'PC CPS Gaming G06 i5 12400F / 8GB - 256GB / RTX 3060', N'G06', 9, N'PC CPS Gaming G06 i5 12400F / 8GB - 256GB / RTX 3060', 72, N'Thùng', N'https://localhost:7033/uploads/pc-cps-gaming-g16_b9a77013-836e-428f-be36-562d299be08f.jpg', 1, 0, N'VN24G06', 10000, 10, CAST(N'2024-06-27T16:23:12.4228428' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (108, N'Máy tính AIO ASUS A3402WBAK-WPC048W', N'A34', 2, N'Máy tính AIO ASUS A3402WBAK-WPC048W', 72, N'Thùng', N'https://localhost:7033/uploads/2022_8_15_637961789064693741_acer-nitro-gaming-5-an515-45-den-1_7c2e5878-fb9b-46b3-baa2-f34a5cf83c1b.jpg', 1, 0, N'VN24A34', 10000, 10, CAST(N'2024-06-27T16:24:00.9147358' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (109, N'Máy tính AIO ASUS A3402WBAK-WPC048W', N'WPC04', 2, N'Máy tính AIO ASUS A3402WBAK-WPC048W', 72, N'Thùng', N'https://localhost:7033/uploads/HP-Spectre-x360-15-01_a021ff07-799c-43cd-90b2-9cb2efb8ce72.jpg', 1, 0, N'VN24WPC04', 10000, 10, CAST(N'2024-06-27T16:25:20.0989850' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (110, N'Laptop Dell Vostro 3420(V4I5702W1) ', N'DV4157', 2, N'Với bộ vi xử lý Intel Core i5 thế hệ 12, chiếc laptop Dell Vostro 3420 i5 1235U (V4I5702W1) mang đến hiệu năng vượt trội, đáp ứng mọi nhu cầu công việc của người dùng.', 72, N'Thùng', N'https://localhost:7033/uploads/2022_8_15_637961789064693741_acer-nitro-gaming-5-an515-45-den-1_977874e8-ce82-43fb-8a1e-eb2ee5ce1560.jpg', 1, 0, N'VN24DV4157', 10000, 10, CAST(N'2024-06-27T16:26:17.5954514' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (111, N'Smart Tivi Samsung UHD 4K 65 INCH 2024', N'SSU4K', 3, N'Nâng tầm trải nghiệm xem UHD lên một tầm cao mới. Công nghệ Dynamic Crystal Color truyền tải tinh tế từng biến chuyển sắc màu, cho bạn thưởng thức mọi chi tiết dù là nhỏ nhất.', 2, N'Thùng', N'https://localhost:7033/uploads/10051659-smart-tivi-qled-samsung-4k-65-inch-qa65q60bakxxv-2_wcqk-zo_ae2c6ab7-0e27-4648-8904-a4c222ce58e4.jpg', 1, 0, N'VN24SSU4K', 10000, 10, CAST(N'2024-06-27T16:28:36.4140037' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (112, N'Case máy tính DeepCool Macube 110', N'M110', 9, N'Case máy tính DeepCool Macube 110', 72, N'Thùng', N'https://localhost:7033/uploads/1-112_309f8ec0-003b-4372-b86e-882ff80c00e8.jpg', 1, 0, N'VN24M110', 10000, 10, CAST(N'2024-06-27T16:30:06.3537078' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (113, N'RAM Laptop Samsung 8GB DDR4 3200MHz', N'SDR4', 8, N'RAM Laptop Samsung 8GB DDR4 3200MHz', 2, N'Thùng', N'https://localhost:7033/uploads/RAM-Laptop-Samsung-8GB-DDR4-3200_baf2c43e-4b25-47f0-b10e-32b7495acfcd.jpg', 1, 0, N'VN24SDR4', 10000, 10, CAST(N'2024-06-27T16:31:02.9746246' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (114, N'Ổ cứng di động Sandisk E61 Extreme V2 SSD 1TB USB 3.2', N'E61', 8, N'Ổ cứng di động Sandisk E61 Extreme V2 SSD 1TB USB 3.2', 8, N'Thùng', N'https://localhost:7033/uploads/extreme-usb-3-2-ssd-front.png.wd_1_917d0e9f-3d67-4ec6-9d1f-8588bdfe1996.png', 1, 0, N'VN24E61', 10000, 10, CAST(N'2024-06-27T16:31:50.9534315' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (115, N'CPU Intel Core i5 12400F', N'12F', 8, N'CPU Intel Core i5 12400F', 9, N'Thùng', N'https://localhost:7033/uploads/tải xuống_e09f611d-7abb-4875-a419-1d7503e7f468.png', 1, 0, N'VN2412F', 10000, 10, CAST(N'2024-06-27T16:32:52.2237744' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (116, N'Nguồn máy tính DeepCool PK750D 750W', N'PK75', 8, N'Nguồn máy tính DeepCool PK750D 750W', 69, N'Thùng', N'https://localhost:7033/uploads/Z270M-Pro4_9db51eab-435c-47ad-bcf7-2f3f0e16f4bd.png', 1, 0, N'VN24PK75', 10000, 10, CAST(N'2024-06-27T16:33:43.8820322' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (117, N'Card màn hình Gigabyte Geforce RTX 3060 Gaming OC 12GB', N'OC12', 9, N'Card màn hình Gigabyte Geforce RTX 3060 Gaming OC 12GB', 69, N'Thùng', N'https://localhost:7033/uploads/1-112_f982ec25-edc5-4be4-b031-9e4488c3fae6.jpg', 1, 0, N'VN24OC12', 10000, 10, CAST(N'2024-06-27T16:34:45.0175472' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (118, N'Mainboard Asus PRIME H610M-K D4', N'H610M', 8, N'Mainboard Asus PRIME H610M-K D4', 72, N'Thùng', N'https://localhost:7033/uploads/tải xuống_19d00b06-d310-41e0-b87c-cb9036037c2f.png', 1, 0, N'VN24H610M', 10000, 10, CAST(N'2024-06-27T16:35:43.9385776' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (119, N'Máy in Laser Brother HL-L2321D', N'L232', 7, N'Máy in Laser Brother HL-L2321D', 70, N'Thùng', N'https://localhost:7033/uploads/7173-may-in-brother-hl-l2321d-2_8f57b3e1-894a-4cef-9aec-c8157f6d53ab.png', 1, 0, N'VN24L232', 10000, 10, CAST(N'2024-06-27T16:37:00.5157033' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (120, N'Máy in Laser Brother DCP-B7535DW', N'DCP7', 7, N'Máy in Laser Brother DCP-B7535DW', 70, N'Thùng', N'https://localhost:7033/uploads/10041422-may-in-laser-brother-dcp-b7535dw-01_eacde307-2cea-4708-9841-e8f3d663d3c7.jpg', 1, 0, N'VN24DCP7', 10000, 10, CAST(N'2024-06-27T16:37:54.1617842' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (121, N'Máy ảnh Fujifilm Instax Mini Evo', N'FIME', 4, N'Máy ảnh Fujifilm Instax Mini Evo', 10, N'Thùng', N'https://localhost:7033/uploads/20210909_kD8KrfZF0AOeWFHdd5TYbs3S_aec01f20-1a92-4204-81ac-61849c1d6fb7.jpg', 1, 0, N'VN24FIME', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (122, N'ipad2024', N'ip2024', 5, N'ipad new', 3, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_10085126-149d-44ae-8809-5985d359107d.jpg', 1, 0, N'VN24ip2024', 10000, 10, CAST(N'2024-07-12T17:19:58.6983611' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (123, N'Máy ảnh Fujifilm GFX-50S II', N'FGFX50', 4, N'Máy ảnh Fujifilm GFX-50S II', 10, N'Thùng', N'https://localhost:7033/uploads/1677725136_1753966_e1ea6ae3-3b76-4055-a9fb-733db5f335d1.jpg', 1, 0, N'VN24FGFX50', 10000, 10, CAST(N'2024-07-14T10:50:17.8905169' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (124, N'Loa Bluetooth JBL Partybox 710', N'LBJP710', 6, N'Loa Bluetooth JBL Partybox 710', 9, N'Thùng', N'https://localhost:7033/uploads/710-02_6e22b304-8372-43ac-8a97-93f844e54ffa.jpg', 1, 0, N'VN24LBJP710', 10000, 10, CAST(N'2024-07-14T14:49:10.1907451' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (125, N'Bàn phím có dây Logitech K120', N'LK120', 8, N'Bàn phím có dây Logitech K120', 72, N'Thùng', N'https://localhost:7033/uploads/logitech-k120-usb-keyboard-500x500-1_c958c495-201c-4464-9744-36706ae04cbe.jpg', 1, 0, N'VN24LK120', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (126, N'Chuột Gaming Logitech G304 Lightspeed', N'LG302L', 8, N'Chuột Gaming Logitech G304 Lightspeed', 8, N'Thùng', N'https://localhost:7033/uploads/chuot-gaming-logitech-g-pro-x-superlight-2-01_f00c23e8-e89b-4d9e-a581-41902c6f1c21.jpg', 1, 0, N'VN24LG302L', 10000, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (127, N'ASUS ROG Ally Z1', N'ASAZ1', 9, N'ROG Ally Z1, mẫu máy chơi game cầm tay mới của Asus, sở hữu một cấu hình ấn tượng để người chơi có thể trải nghiệm được mọi tựa game AAA ở bất cứ nơi đâu.', 72, N'Thùng', N'https://localhost:7033/uploads/1695685468662_ee59e029-dc91-4bea-b12d-3fddabdc96fe.jpg', 1, 0, N'VN24ASAZ1', 10000, 10, CAST(N'2024-07-24T00:31:13.1527837' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (128, N'Apple Watch Series 9', N'AWS9', 10, N'Apple Watch Series 9 41mm sở hữu thiết kế khá hiện đại, sang trọng cùng khả năng xử lý nhanh chóng mọi tác vụ nhờ được trang bị chipset S9 SiP mạnh mẽ. Đồng thời, dòng Apple smartwatch này còn đi kèm với hàng loạt các tính năng theo dõi sức khỏe', 3, N'Thùng', N'https://localhost:7033/uploads/watchs9-1_dfc4829d-3dfc-44df-bff9-74549549efab.jpg', 1, 0, N'VN24AWS9', 10000, 10, CAST(N'2024-07-24T00:31:13.2234563' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (129, N'ASUS ROG Ally X', N'ASAX', 9, N'Máy chơi game cầm tay đang là sự lựa chọn hàng đầu cho game thủ khi nó sở hữu một ngoại hình nhỏ ,sức mạnh siêu khủng. Giờ đây, ông lớn này tại tiếp tục gia nhập đường đua máy chơi game cầm tay khi cho ra mắt siêu phẩm Asus ROG Ally', 72, N'Thùng', N'https://localhost:7033/uploads/8354031_8df75efed46cae0a56a6e948a1168c90_99f006e4-b70d-44f5-a784-a6272bc45674.jpg', 1, 0, N'VN24ASAX', 10000, 10, CAST(N'2024-07-24T00:31:13.2291873' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (130, N'iPad Air 5', N'IPA5', 5, N'Mỗi khi một chiếc iPad mới vừa ra lò như một cơn chấn động thật sự bùng nổ. Đến năm 2022, chúng ta lại tiếp tục bùng nổ với chiếc iPad mới mang tên iPad Air 5 với nhiều cải tiến đáng giá', 3, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_fd158cf1-642c-40c3-aa51-ba68b3744c94.jpg', 1, 0, N'VN24IPA5', 10000, 10, CAST(N'2024-07-24T00:31:13.2332660' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (131, N'Laptop Dell Inspiron 15', N'LDI15', 2, N'Laptop Dell Inspiron 15 trang bị, 8GB RAM nâng cấp tối đa đến 16GB thoải mái lưu trữ. Laptop Dell Inspiron 15 3520-5810BLK 102F0 cảm ứng với thiết kế nhỏ gọn, trọng lượng chỉ 1.9kg , màn hình 15.6 inch chất lượng Full HD cực rõ nét.', 5, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_9436a115-2db6-4fc5-b3f6-7a0d5b3af851.jpg', 1, 0, N'VN24LDI15', 10000, 10, CAST(N'2024-07-24T00:31:13.2370075' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (132, N'Laptop Dell Gaming G15', N'LDG15', 2, N'Laptop gaming nổi tiếng với khả năng thực hiện đa tác vụ nhờ một hiệu năng vượt trội. Với Dell Gaming G15 Ryzen Edition 5515 70266675 cũng không ngoại lệ, laptop sở hữu một thiết kế mạnh mẽ cùng hiệu năng sử dụng vượt trội.', 5, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_653c298c-bd47-4d84-8508-cab11db2f242.jpg', 1, 0, N'VN24LDG15', 10000, 10, CAST(N'2024-07-24T00:31:13.2402439' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (133, N'Smart Tivi Sony 4K 55 inch KD-55X86J VN3', N'TS4KD', 3, N'Smart Tivi Sony 4K 55 inch KD-55X86J VN3 là một trong những chiếc TV Smart 4K được rất nhiều người ưa chuộng. Chiếc tivi 55 inch này sở hữu nhiều tính năng độc đáo với diện mạo sang trọng, nâng tầm đẳng cấp cho không gian ngôi nhà của bạn. ', 7, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd-65x75k-65-inch-google-tv_02b903cc_45032559-c065-4818-9141-215c144fb1a0.jpg', 1, 0, N'VN24TS4KD', 10000, 10, CAST(N'2024-07-24T00:31:13.2444548' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (134, N'Google Tivi OLED Sony 4K 77 inch XR-77A95L', N'OS4XR', 3, N'Google tivi OLED Sony 4K 77 inch XR-77A95L được trang bị màn hình kích thước 77 inch cùng độ phân giải 4K mang lại khả năng hiển thị vượt trội.', 7, N'Thùng', N'https://localhost:7033/uploads/ck12718049-tivi-sony-xr-77a95l_3f506a0b-42d1-4a03-8778-58a8673212fd.jpg', 1, 0, N'VN24OS4XR', 10000, 10, CAST(N'2024-07-24T00:31:13.2476431' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (135, N'Máy ảnh Fujifilm X-H2S', N'FXH2S', 4, N'Không bao giờ bỏ lỡ một khoảnh khắc quyết định nào với máy ảnh Fujifilm X-H2S. Máy ảnh có cảm biến Stacked CMOS 26MP thế hệ 5 cho phép chụp liên tiếp lên đến 40fps. Hệ thống chống rung lên tới 7 stop', 10, N'Thùng', N'https://localhost:7033/uploads/20210909_kD8KrfZF0AOeWFHdd5TYbs3S_74e4114c-7b50-46c7-90fe-2f4e6a12f3f2.jpg', 1, 0, N'VN24FXH2S', 10000, 10, CAST(N'2024-07-24T00:31:13.2511618' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (136, N'Loa Bluetooth JBL Pulse 5', N'LBJP5', 6, N'Loa Bluetooth Pulse 5 là một sản phẩm mới nhất được thêm vào bộ sưu tập loa Pulse của thương hiệu JBL. Thiết bị loa bluetooth mới này nổi bật với chất âm sống động, thiết kế linh hoạt, cùng các hiệu ứng ánh sáng bắt mắt. ', 9, N'Thùng', N'https://localhost:7033/uploads/unnamed_039e5a99-1709-450f-a72d-82102578dbb2.jpg', 1, 0, N'VN24LBJP5', 10000, 10, CAST(N'2024-07-24T00:31:13.2554115' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (137, N'Xiaomi Redmi Pad Pro', N'XRP5G', 5, N'Máy tính bảng Xiaomi Redmi Pad Pro sở hữu màn hình 2,5K kích thước lên đến 12,1 inch hiển thị tốt mọi chi tiết với độ sắc nét cao. Tablet sở hữu một phần cứng mạnh với con chip Snapdragon® 7s Gen 2 cùng bộ nhớ 128GB cùng RAM 8GB', 4, N'Thùng', N'https://localhost:7033/uploads/Redmi-Pad-Pro-Tablet-12-1-inch-Tablet-8-128GB-Green-524403-0_538fba64-54ea-4bdc-a202-803259103119.jpg', 1, 0, N'VN24XRP5G', 10000, 10, CAST(N'2024-07-24T00:31:13.2595688' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (138, N'Máy ảnh Fujifilm X-T30 Mark II', N'FXT30', 4, N'Máy ảnh Fujifilm X-T30 Mark II Kit XC15-45mm F3.5.5.6 OIS PZ/ Bạc là máy ảnh không gương lật nhỏ gọn và nhẹ, có cảm biến X-Trans CMOS 4 26.1MP', 10, N'Thùng', N'https://localhost:7033/uploads/1607484175_64ccc36c-c199-44b3-9297-fd0d6497c848.jpg', 1, 0, N'VN24FXT30', 10000, 10, CAST(N'2024-07-25T15:59:54.5378184' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (139, N'ASUS ROG Phone 6 Mediatek', N'ARP6M', 1, N'ASUS ROG Phone 6 Mediatek', 72, N'Thùng', N'https://localhost:7033/uploads/thumb-6b_4c53a79b-2e3f-471d-aa5c-a90ca4e47798.png', 1, 0, N'VN24ARP6M', 10000, 10, CAST(N'2024-07-26T16:24:03.8593688' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (140, N'Smart Tivi Samsung QLED 65 inch 65Q60BAK', N'SSQ65Q', 3, N'Smart Tivi Samsung QLED 65 inch 65Q60BAK', 2, N'Thùng', N'https://localhost:7033/uploads/10051659-smart-tivi-qled-samsung-4k-65-inch-qa65q60bakxxv-2_wcqk-zo_3f90e03e-d9bd-4590-aad2-8ff5a29fefa8.jpg', 1, 0, N'VN24SSQ65Q', 10000, 10, CAST(N'2024-07-26T16:24:03.8729588' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (141, N'Quạt đứng Toshiba Inverter F-LSD10(W)VN', N'TIF10', 7, N'Quạt đứng Toshiba Inverter F-LSD10(W)VN', 6, N'Thùng', N'https://localhost:7033/uploads/c39d768cea422d620b0c6211b3bd4b7d_15975765-a3e0-47f9-95f2-da9351789cc2.jpg', 1, 0, N'VN24TIF10', 10000, 10, CAST(N'2024-07-28T14:10:34.5209828' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (142, N'Máy ảnh Fujifilm Instax Camera Mini 12', N'FIM12', 4, N'Máy ảnh Fujifilm Instax Camera Mini 12', 10, N'Thùng', N'https://localhost:7033/uploads/1607484175_30bece0a-021e-415b-a981-4009976f35f5.jpg', 1, 0, N'VN24FIM12', 10000, 10, CAST(N'2024-07-28T14:48:13.8442727' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (143, N'Bút trình chiếu Logitech R400', N'LR400', 8, N'Bút trình chiếu Logitech R400', 8, N'Thùng', N'https://localhost:7033/uploads/but-trinh-chieu-logitech-r400-1_1687965797_5f39f060-deb8-4625-bee8-f98ec1fb6807.jpg', 1, 0, N'VN24LR400', 10000, 10, CAST(N'2024-07-28T14:48:13.8600818' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (144, N'Tivi Sony Z9J | BRAVIA XR', N'SZ9J', 3, N'Xem hình ảnh 8K có chiều sâu, tự nhiên và chân thực. Bộ xử lý đột phá sử dụng dữ liệu phân tích góc nhìn của người để phân tích chéo và tối ưu hóa hàng trăm nghìn yếu tố trong chớp mắt', 7, N'Thùng', N'https://localhost:7033/uploads/Sony_Z9J_10_56223f41-af7b-4518-bded-58ee0f5f3b6b.png', 1, 0, N'VN24', 10000, 10, CAST(N'2024-07-28T14:48:13.8649814' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (145, N'Webcam Logitech C922 full HD 1080P', N'LC922', 8, N'Webcam Logitech C922 full HD 1080P', 8, N'Thùng', N'https://localhost:7033/uploads/1669012281.Webcam-Live-Stream-C922-Pro-FULL-HD-1_36f4f3f2-9921-4527-a214-8b769e08ef17.jpg', 1, 0, N'VN24LC922', 10000, 10, CAST(N'2024-07-28T14:48:13.8694834' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (146, N'Máy Chơi Game Sony PlayStation 5 Slim (PS5 Slim) Digital Edition', N'SPS5', 9, N'Máy Chơi Game Sony PlayStation 5 Slim (PS5 Slim) Digital Edition', 7, N'Thùng', N'https://localhost:7033/uploads/9223-ps5-slim_9c1c1ad3-08e5-41e9-b80d-7695b1d8abd4.jpg', 1, 0, N'VN24SPS5', 10000, 10, CAST(N'2024-07-28T14:48:13.8735164' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (147, N'Tai nghe Bluetooth True Wireless JBL Wave Beam', N'JBLWB', 6, N'Tai nghe Bluetooth True Wireless JBL Wave Beam', 9, N'Thùng', N'https://localhost:7033/uploads/tai-nghe-bluetooth-true-wireless-jbl-wave-beam-black-1_096af183-bc3c-4479-9c61-f92394644556.jpg', 1, 0, N'VN24JBLWB', 10000, 10, CAST(N'2024-07-28T14:48:13.8773057' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (148, N'Apple iPad Pro 11 2022 M2', N'AIP12M2', 5, N'Apple iPad Pro 11 2022 M2', 3, N'Thùng', N'https://localhost:7033/uploads/ipad-mini-6-wifi-starlight-1-600x600_8b4e8b01-9734-4021-b740-50ce51216cda.jpg', 1, 0, N'VN24AIP12M2', 10000, 10, CAST(N'2024-07-28T14:48:13.8810649' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (149, N'Máy ảnh Fujifilm X-T5 Kit XF16', N'FXT5', 4, N'Máy ảnh Fujifilm X-T5 Kit XF16', 10, N'Thùng', N'https://localhost:7033/uploads/1677725136_1753966_bce4fcbb-f1c2-452c-a83b-38682a466649.jpg', 1, 0, N'VN24FXT5', 10000, 10, CAST(N'2024-07-28T14:48:13.8840511' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (150, N'Máy ảnh Fujifilm GFX-50S II', N'FG50S', 4, N'Máy ảnh Fujifilm GFX-50S II', 10, N'Thùng', N'https://localhost:7033/uploads/fujifilm-X100V-1005-11_59c20c93-0b75-4ef3-8cc0-7e87c105c4cb.jpg', 1, 0, N'VN24FG50S', 10000, 10, CAST(N'2024-07-28T14:53:33.6667437' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (151, N'Bàn phím Logitech Pebble Keys 2 K380s', N'LPK2', 4, N'Loại sản phẩm: Bàn phím không dây Kết nối: Bluetooth Thời lượng pin: 36 tháng Dạng bàn phím: 79 phím Bảo hành 12 tháng', 9, N'Thùng', N'https://localhost:7033/uploads/ban-phim-co-logitech-g515-lightspeed-tkl-11_851f816f-28f9-4379-ae92-38150e43dbec.jpg', 1, 0, N'VN24LPK2', 10000, 10, CAST(N'2024-08-03T21:37:32.8403974' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (152, N'Loa Bluetooth JBL Charge 5', N'BJC5', 6, N'Tiếp nối sự thành công của người tiền nhiệm, dòng loa huyền thoại loa JBL Charge 5 với sự thay đổi mạnh mẽ cả về thiết kế lẫn công nghệ âm thanh mang đến chất lượng âm thanh vượt trội dù là ngoài trời hay trong nhà', 9, N'Thùng', N'https://localhost:7033/uploads/ien-tu-linh-anh_ffa2f95f-22d6-4873-8ff5-e51bae5e50f3.jpg', 1, 0, N'VN24BJC5', 10000, 10, CAST(N'2024-08-03T21:37:32.8965643' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (158, N'Máy ảnh Sony Alpha ILCE-6400 / A6400 Body/ Đen', N'A6400', 4, N'Máy ảnh Sony A6400 là chiếc máy ảnh mirrorless tiên tiến được thiết kế cho cả những người đam mê và chuyên nghiệp. Máy ảnh nổi bật với cảm biến APS-C 24MP, hệ thống lấy nét tự động hàng đầu và các tính năng video tuyệt vời.', 7, N'Thùng', N'https://localhost:7033/uploads/fujifilm_16568731_x_h1_mirrorless_digital_camera_1388297_ti6b-z9_pgmt-cu_ljxh-a4_xifw-ne_7dfr-bt_jtdc-pa__1__caf969e3-9837-4bb4-a1d2-717780e553c8.jpg', 1, 0, N'VN24A6400', 10000, 10, CAST(N'2024-08-03T21:37:32.8965643' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsHistory] ON 

INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (1, 56, 1, CAST(N'2024-06-28T16:36:36.4688111' AS DateTime2), 1.969E+07, N'-19689998', 2, N'2', NULL, N'IMPTUNGNGU123', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (2, 57, 1, CAST(N'2024-06-28T16:36:36.5276388' AS DateTime2), 2.569E+07, N'-25689998', 2, N'2', NULL, N'IMPTUNGNGU123', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (3, 27, 1, CAST(N'2024-06-28T16:42:59.4532488' AS DateTime2), 2700000, N'-2600000', 3000, N'3000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (4, 3, 1, CAST(N'2024-06-28T16:42:59.4584476' AS DateTime2), 3E+07, N'-29998000', 5300, N'5000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (5, 25, 1, CAST(N'2024-06-28T16:42:59.5113117' AS DateTime2), 1100000, N'-1000000', 2000, N'2000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (6, 27, 1, CAST(N'2024-06-28T16:42:59.6082002' AS DateTime2), 100000, NULL, 6000, N'3000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (7, 3, 1, CAST(N'2024-06-28T16:42:59.6190929' AS DateTime2), 2000, NULL, 10300, N'5000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (8, 25, 1, CAST(N'2024-06-28T16:42:59.6253661' AS DateTime2), 100000, NULL, 4000, N'2000', NULL, N'IMPDA', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (9, 1, 2, CAST(N'2024-07-03T20:40:43.5850399' AS DateTime2), 2E+07, NULL, 98, N'-2', NULL, N'XHFGG32142', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (10, 3, 2, CAST(N'2024-07-03T23:24:47.9085905' AS DateTime2), 2000, NULL, 10280, N'-20', NULL, N'XHHUYNGU4251', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (11, 3, 2, CAST(N'2024-07-03T23:54:12.4388601' AS DateTime2), 2000, NULL, 10260, N'-20', NULL, N'XHNGU34341', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (12, 1, 2, CAST(N'2024-07-04T00:12:35.8203254' AS DateTime2), 2E+07, NULL, 10, N'-40', NULL, N'XHVCC131', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (13, 1, 2, CAST(N'2024-07-04T11:27:48.0922606' AS DateTime2), 2E+07, NULL, 8, N'-2', NULL, N'XHKHD4255', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (14, 3, 2, CAST(N'2024-07-04T13:33:46.5319080' AS DateTime2), 2000, NULL, 97, N'-3', NULL, N'XHVVV213', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (15, 2, 2, CAST(N'2024-07-08T15:05:17.5182132' AS DateTime2), 1.8E+07, NULL, 148, N'-2', NULL, N'XHNVV321', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (16, 2, 2, CAST(N'2024-07-08T15:05:17.5812915' AS DateTime2), 1.8E+07, NULL, 146, N'-2', NULL, N'XHNVV321', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (17, 3, 2, CAST(N'2024-07-08T15:05:27.5229735' AS DateTime2), 2000, NULL, 94, N'-3', NULL, N'XHMMNN332211', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (18, 3, 2, CAST(N'2024-07-08T15:05:27.5398523' AS DateTime2), 2000, NULL, 91, N'-3', NULL, N'XHMMNN332211', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (19, 3, 2, CAST(N'2024-07-08T15:05:27.5517726' AS DateTime2), 2000, NULL, 88, N'-3', NULL, N'XHMMNN332211', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (20, 3, 2, CAST(N'2024-07-08T15:05:45.5896290' AS DateTime2), 2000, NULL, 10258, N'-2', NULL, N'XHBBB32221', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (21, 3, 2, CAST(N'2024-07-08T15:05:45.6032485' AS DateTime2), 2000, NULL, 10256, N'-2', NULL, N'XHBBB32221', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (22, 3, 2, CAST(N'2024-07-08T15:05:45.6125208' AS DateTime2), 2000, NULL, 10254, N'-2', NULL, N'XHBBB32221', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (23, 2, 2, CAST(N'2024-07-12T17:09:22.1031288' AS DateTime2), 1.8E+07, NULL, 126, N'-20', NULL, N'XHVDD331234', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (24, 2, 2, CAST(N'2024-07-12T17:09:22.2585689' AS DateTime2), 1.8E+07, NULL, 106, N'-20', NULL, N'XHVDD331234', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (25, 122, 1, CAST(N'2024-07-12T17:33:24.0240996' AS DateTime2), 0, N'78349', 2024, N'2024', NULL, N'IMPimportnew', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (26, 2, 2, CAST(N'2024-07-16T10:38:44.6536317' AS DateTime2), 1.8E+07, NULL, 86, N'-20', NULL, N'XHgfgdsad31312', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (27, 2, 2, CAST(N'2024-07-16T10:38:44.7026271' AS DateTime2), 1.8E+07, NULL, 66, N'-20', NULL, N'XHgfgdsad31312', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (28, 3, 1, CAST(N'2024-07-23T15:04:36.7130851' AS DateTime2), 0, NULL, 10354, N'100', NULL, N'IMP42342521', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (29, 1, 1, CAST(N'2024-07-24T18:08:07.5066655' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240724175332', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (30, 77, 1, CAST(N'2024-07-24T21:32:43.6915239' AS DateTime2), 11989999, N'-11989999', 400, N'100', NULL, N'IMP20240724163342', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (31, 128, 1, CAST(N'2024-07-25T16:06:27.2292398' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240725160611', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (32, 134, 1, CAST(N'2024-07-25T16:06:27.2478738' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240725160611', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (33, 1, 1, CAST(N'2024-07-25T16:41:26.0017237' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240725164055', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (34, 1, 2, CAST(N'2024-07-25T16:53:57.0397625' AS DateTime2), 0, NULL, 80, N'-20', NULL, N'XH20240725165337', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (35, 1, 2, CAST(N'2024-07-25T17:10:50.7320133' AS DateTime2), 0, NULL, 70, N'-10', NULL, N'XH20240725171022', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (36, 1, 2, CAST(N'2024-07-25T17:10:50.7436189' AS DateTime2), 0, NULL, 60, N'-10', NULL, N'XH20240725171022', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (37, 1, 1, CAST(N'2024-07-25T18:08:39.7356641' AS DateTime2), 0, NULL, 108, N'100', NULL, N'IMP20240725180804', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (38, 1, 1, CAST(N'2024-07-25T18:12:22.2464319' AS DateTime2), 0, NULL, 707, N'599', NULL, N'IMP20240725181211', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (39, 1, 1, CAST(N'2024-07-26T09:48:54.5556755' AS DateTime2), 0, NULL, 10060, N'10000', NULL, N'IMP20240726094844', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (40, 1, 1, CAST(N'2024-07-30T17:27:00.8719095' AS DateTime2), 0, NULL, 10236, N'200', NULL, N'IMP20240730171840', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (41, 141, 1, CAST(N'2024-07-30T17:27:00.8901627' AS DateTime2), 0, NULL, 200, N'200', NULL, N'IMP20240730171840', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (42, 1, 1, CAST(N'2024-07-30T17:28:00.4305704' AS DateTime2), 0, NULL, 10256, N'20', NULL, N'IMP20240730172748', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (43, 141, 1, CAST(N'2024-07-30T17:28:00.4325586' AS DateTime2), 0, NULL, 220, N'20', NULL, N'IMP20240730172748', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (44, 142, 1, CAST(N'2024-07-30T17:33:30.5990153' AS DateTime2), 0, NULL, 20, N'20', NULL, N'IMP20240730173242', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (45, 1, 2, CAST(N'2024-07-30T23:41:09.5392165' AS DateTime2), 0, NULL, 10254, N'-2', NULL, N'XH20240730234046', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (46, 1, 2, CAST(N'2024-07-30T23:41:09.5504895' AS DateTime2), 0, NULL, 10252, N'-2', NULL, N'XH20240730234046', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (47, 1, 2, CAST(N'2024-07-30T23:42:20.0168079' AS DateTime2), 0, NULL, 10249, N'-3', NULL, N'XH20240730232739', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (48, 1, 2, CAST(N'2024-07-30T23:42:20.0229542' AS DateTime2), 0, NULL, 10245, N'-4', NULL, N'XH20240730232739', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (49, 142, 2, CAST(N'2024-07-30T23:42:20.0253790' AS DateTime2), 0, NULL, 14, N'-6', NULL, N'XH20240730232739', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (50, 1, 2, CAST(N'2024-07-30T23:44:48.6547822' AS DateTime2), 0, NULL, 10241, N'-4', NULL, N'XH20240730232551', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (51, 1, 2, CAST(N'2024-07-30T23:44:48.6657413' AS DateTime2), 0, NULL, 10238, N'-3', NULL, N'XH20240730232551', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (52, 1, 1, CAST(N'2024-07-30T23:55:19.1404161' AS DateTime2), 0, NULL, 10439, N'201', NULL, N'IMP20240730163841', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (53, 142, 1, CAST(N'2024-07-30T23:55:36.1891753' AS DateTime2), 0, NULL, 17, N'3', NULL, N'IMP20240730212258', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (54, 1, 2, CAST(N'2024-08-02T10:37:32.7610255' AS DateTime2), 0, NULL, 10217, N'-222', NULL, N'XH20240802103628', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (55, 1, 2, CAST(N'2024-08-02T10:37:32.7946565' AS DateTime2), 0, NULL, 10207, N'-10', NULL, N'XH20240802103628', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (56, 1, 2, CAST(N'2024-08-02T10:37:32.7981741' AS DateTime2), 0, NULL, 10197, N'-10', NULL, N'XH20240802103628', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (57, 1, 2, CAST(N'2024-08-02T11:38:58.1286197' AS DateTime2), 0, NULL, 10015, N'-182', NULL, N'XHsfdfs', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (58, 142, 1, CAST(N'2024-08-02T15:39:34.4299146' AS DateTime2), 0, NULL, 200, N'200', NULL, N'IMP20240802153915', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (59, 142, 2, CAST(N'2024-08-02T15:41:16.3449989' AS DateTime2), 0, NULL, 81, N'-119', NULL, N'XH20240802154106', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (60, 1, 1, CAST(N'2024-08-02T16:26:08.8995616' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240802162500', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (61, 1, 2, CAST(N'2024-08-02T16:30:36.4109716' AS DateTime2), 0, NULL, 79, N'-21', NULL, N'XH20240802162941', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (62, 1, 2, CAST(N'2024-08-02T16:32:55.8832768' AS DateTime2), 0, NULL, 67, N'-12', NULL, N'XH20240802163212', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (63, 141, 1, CAST(N'2024-08-03T23:28:00.6211229' AS DateTime2), 0, NULL, 232, N'12', NULL, N'IMP20240803232750', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (64, 1, 1, CAST(N'2024-08-03T23:28:00.6391703' AS DateTime2), 0, NULL, 79, N'12', NULL, N'IMP20240803232750', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (65, 1, 1, CAST(N'2024-08-03T23:38:33.8632203' AS DateTime2), 0, NULL, 5, N'5', NULL, N'IMP20240803233804', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (66, 1, 1, CAST(N'2024-08-04T16:05:32.6436583' AS DateTime2), 0, NULL, 103, N'5', NULL, N'IMP20240804160521', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (67, 1, 1, CAST(N'2024-08-07T19:46:33.5956259' AS DateTime2), 0, NULL, 91, N'12', NULL, N'IMP20240807194622', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (68, 1, 1, CAST(N'2024-08-08T12:29:09.8008684' AS DateTime2), 0, NULL, 195, N'104', NULL, N'IMP20240808122845', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (69, 1, 1, CAST(N'2024-08-08T12:35:31.6065468' AS DateTime2), 0, NULL, 10, N'10', NULL, N'IMP20240808123506', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (70, 1, 2, CAST(N'2024-08-08T12:45:01.1508474' AS DateTime2), 0, NULL, 185, N'-10', NULL, N'XH20240808124431', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (71, 1, 2, CAST(N'2024-08-08T12:52:11.8724234' AS DateTime2), 0, NULL, 185, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (72, 1, 2, CAST(N'2024-08-08T12:52:11.8791134' AS DateTime2), 0, NULL, 185, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (73, 1, 2, CAST(N'2024-08-08T12:52:11.8818685' AS DateTime2), 0, NULL, 185, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (74, 1, 2, CAST(N'2024-08-08T12:52:11.8864807' AS DateTime2), 0, NULL, 175, N'-10', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (75, 1, 2, CAST(N'2024-08-08T12:52:11.8910210' AS DateTime2), 0, NULL, 175, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (76, 1, 2, CAST(N'2024-08-08T12:52:11.8934696' AS DateTime2), 0, NULL, 175, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (77, 1, 2, CAST(N'2024-08-08T12:52:11.8957219' AS DateTime2), 0, NULL, 175, N'-0', NULL, N'XH20240808125150', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (78, 127, 1, CAST(N'2024-08-18T10:26:43.9691781' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240818102616', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (79, 133, 1, CAST(N'2024-08-18T10:26:44.0052213' AS DateTime2), 0, NULL, 100, N'100', NULL, N'IMP20240818102616', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (80, 26, 1, CAST(N'2024-08-18T17:11:47.3694740' AS DateTime2), 0, NULL, 1250, N'1200', NULL, N'IMP20240818171124', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (81, 2, 1, CAST(N'2024-08-18T20:47:16.7881687' AS DateTime2), 0, NULL, 220, N'220', NULL, N'IMP20240818204703', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (82, 127, 1, CAST(N'2024-08-18T23:05:24.2749624' AS DateTime2), 0, NULL, 1100, N'1100', NULL, N'IMP20240818230438', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (83, 139, 1, CAST(N'2024-08-18T23:07:04.2007887' AS DateTime2), 0, NULL, 1000, N'1000', NULL, N'IMP20240818230657', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (84, 140, 1, CAST(N'2024-08-18T23:08:47.4238413' AS DateTime2), 0, NULL, 1100, N'1100', NULL, N'IMP20240818230842', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (85, 130, 1, CAST(N'2024-08-18T23:10:32.2439681' AS DateTime2), 0, NULL, 1000, N'1000', NULL, N'IMP20240818231025', 16)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (86, 140, 1, CAST(N'2024-08-19T21:12:56.2800030' AS DateTime2), 0, NULL, 1600, N'500', NULL, N'IMP20240819194702', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (87, 1, 1, CAST(N'2024-08-19T21:13:21.6409750' AS DateTime2), 0, NULL, 675, N'500', NULL, N'IMP20240819211247', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (88, 58, 1, CAST(N'2024-08-20T07:54:24.9441923' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240820075351', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (89, 59, 1, CAST(N'2024-08-20T07:54:24.9672967' AS DateTime2), 0, NULL, 550, N'550', NULL, N'IMP20240820075351', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (90, 1, 1, CAST(N'2024-08-20T07:54:24.9687316' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240820075351', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (91, 24, 1, CAST(N'2024-08-20T07:54:24.9698475' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240820075351', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (92, 2, 1, CAST(N'2024-08-20T07:54:24.9708568' AS DateTime2), 0, NULL, 1000, N'1000', NULL, N'IMP20240820075351', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (93, 128, 1, CAST(N'2024-08-20T07:56:00.9087107' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820075548', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (94, 1, 1, CAST(N'2024-08-20T08:03:30.6155577' AS DateTime2), 0, NULL, 1000, N'1000', NULL, N'IMP20240820080310', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (95, 24, 1, CAST(N'2024-08-20T08:03:30.6170672' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240820080310', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (96, 95, 1, CAST(N'2024-08-20T08:03:30.6183624' AS DateTime2), 0, NULL, 1000, N'1000', NULL, N'IMP20240820080310', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (97, 58, 1, CAST(N'2024-08-20T08:03:30.6195866' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820080310', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (98, 2, 1, CAST(N'2024-08-20T08:06:04.3256311' AS DateTime2), 0, NULL, 3000, N'3000', NULL, N'IMP20240820080454', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (99, 1, 1, CAST(N'2024-08-20T08:06:04.3269309' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820080454', 15)
GO
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (100, 61, 1, CAST(N'2024-08-20T08:06:04.3281075' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820080454', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (101, 60, 1, CAST(N'2024-08-20T08:06:04.3292057' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820080454', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (102, 122, 1, CAST(N'2024-08-20T08:06:06.6103973' AS DateTime2), 0, NULL, 2000, N'2000', NULL, N'IMP20240820080556', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (103, 148, 1, CAST(N'2024-08-20T08:06:06.6116995' AS DateTime2), 0, NULL, 5000, N'5000', NULL, N'IMP20240820080556', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (104, 113, 1, CAST(N'2024-08-20T08:09:11.1548472' AS DateTime2), 0, NULL, 5500, N'5500', NULL, N'IMP20240820080807', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (105, 2, 1, CAST(N'2024-08-20T08:09:11.1588875' AS DateTime2), 0, NULL, 500, N'500', NULL, N'IMP20240820080807', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (106, 1, 1, CAST(N'2024-08-20T08:09:11.1622902' AS DateTime2), 0, NULL, 6000, N'5000', NULL, N'IMP20240820080807', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (107, 24, 1, CAST(N'2024-08-20T08:09:11.1643475' AS DateTime2), 0, NULL, 1000, N'500', NULL, N'IMP20240820080807', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (108, 24, 1, CAST(N'2024-08-20T08:11:15.7993773' AS DateTime2), 0, NULL, 1500, N'500', NULL, N'IMP20240820081106', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (109, 2, 1, CAST(N'2024-08-20T08:11:15.8007234' AS DateTime2), 0, NULL, 1000, N'500', NULL, N'IMP20240820081106', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (110, 1, 1, CAST(N'2024-08-20T08:11:15.8018355' AS DateTime2), 0, NULL, 6500, N'500', NULL, N'IMP20240820081106', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (111, 58, 1, CAST(N'2024-08-20T08:11:15.8031742' AS DateTime2), 0, NULL, 5500, N'500', NULL, N'IMP20240820081106', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (112, 1, 2, CAST(N'2024-08-20T08:20:19.1492716' AS DateTime2), 0, NULL, 6400, N'-100', NULL, N'XH20240820081457', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (113, 2, 2, CAST(N'2024-08-20T08:20:19.1557231' AS DateTime2), 0, NULL, 800, N'-200', NULL, N'XH20240820081457', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (114, 2, 2, CAST(N'2024-08-20T08:20:23.2842436' AS DateTime2), 0, NULL, 700, N'-100', NULL, N'XH20240820082015', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (115, 2, 2, CAST(N'2024-08-20T08:20:23.2871849' AS DateTime2), 0, NULL, 600, N'-100', NULL, N'XH20240820082015', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (116, 1, 2, CAST(N'2024-08-20T08:22:57.2568089' AS DateTime2), 0, NULL, 6300, N'-100', NULL, N'XH20240820082248', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (117, 2, 2, CAST(N'2024-08-20T08:22:57.2632163' AS DateTime2), 0, NULL, 500, N'-100', NULL, N'XH20240820082248', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (118, 1, 2, CAST(N'2024-08-20T08:22:57.2659625' AS DateTime2), 0, NULL, 6200, N'-100', NULL, N'XH20240820082248', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (119, 2, 2, CAST(N'2024-08-20T08:22:57.2684125' AS DateTime2), 0, NULL, 400, N'-100', NULL, N'XH20240820082248', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (120, 1, 2, CAST(N'2024-08-20T08:22:57.2707387' AS DateTime2), 0, NULL, 6100, N'-100', NULL, N'XH20240820082248', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (121, 2, 2, CAST(N'2024-08-20T08:26:16.8538000' AS DateTime2), 0, NULL, 350, N'-50', NULL, N'XH20240820082522', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (122, 1, 2, CAST(N'2024-08-20T08:26:16.8603576' AS DateTime2), 0, NULL, 5900, N'-200', NULL, N'XH20240820082522', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (123, 2, 2, CAST(N'2024-08-20T08:26:16.8634190' AS DateTime2), 0, NULL, 250, N'-100', NULL, N'XH20240820082522', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (124, 1, 2, CAST(N'2024-08-20T08:26:16.8658384' AS DateTime2), 0, NULL, 5700, N'-200', NULL, N'XH20240820082522', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (125, 1, 2, CAST(N'2024-08-20T08:26:16.8690718' AS DateTime2), 0, NULL, 5500, N'-200', NULL, N'XH20240820082522', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (126, 1, 1, CAST(N'2024-08-20T08:41:55.6820980' AS DateTime2), 0, NULL, 5600, N'600', NULL, N'IMP20240820082907', 15)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (127, 2, 1, CAST(N'2024-08-20T08:41:55.6835320' AS DateTime2), 0, NULL, 3150, N'150', NULL, N'IMP20240820082907', 15)
SET IDENTITY_INSERT [dbo].[GoodsHistory] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 5500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 5600)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 2, 3150)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (15, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (16, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (17, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (18, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (19, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (20, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (21, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (22, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (23, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (24, 1, 1500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (27, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (27, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (28, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (30, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (31, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (32, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (33, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (34, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (35, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (36, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (37, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (38, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (39, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (41, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (42, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (43, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (44, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (45, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (46, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (47, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (48, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (49, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (50, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (53, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (54, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (55, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (56, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (56, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (58, 1, 5500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (59, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (60, 2, 5000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (61, 2, 5000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (63, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (64, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (66, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (67, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (68, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (69, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (70, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (71, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (72, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (73, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (74, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (75, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (76, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (77, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (78, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (79, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (80, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (81, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (83, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (84, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (85, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (86, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (87, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (88, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (89, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (90, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (91, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (92, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (93, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (94, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (95, 1, 1000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (96, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (97, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (98, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (99, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (100, 4, 0)
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (101, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (102, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (103, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (104, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (105, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (106, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (107, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (108, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (109, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (110, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (111, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (112, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (113, 1, 5500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (114, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (115, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (116, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (117, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (118, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (118, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (119, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (119, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (120, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (120, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (121, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (122, 3, 2000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (123, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (124, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (125, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (126, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (127, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (128, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (128, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (128, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (129, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (129, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (129, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (130, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (130, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (130, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (131, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (131, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (131, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (132, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (132, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (132, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (133, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (133, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (133, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (134, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (134, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (134, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (135, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (135, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (135, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (136, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (136, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (136, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (136, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (136, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (137, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (137, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (138, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (139, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (140, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (141, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (143, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (143, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (143, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (143, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (143, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (144, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (145, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (146, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (146, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (146, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (146, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (147, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (147, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (147, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (147, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (148, 3, 5000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (148, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (148, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (148, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (149, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (149, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (149, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (149, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (150, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (151, 3, 0)
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (151, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (151, 11, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (152, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (152, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (152, 11, 0)
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (96, 15, 2, 0, N'', CAST(N'2024-08-20T08:03:10.6866620' AS DateTime2), CAST(N'2024-08-20T08:03:30.6110787' AS DateTime2), 4, N'IMP20240820080310', 1, 1, N'https://localhost:7033/uploads/shipment5_f7d4023e-7a5a-4a0a-8d2a-8e77ad97bf9e.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (97, 15, 2, 0, N'', CAST(N'2024-08-20T08:04:54.0216118' AS DateTime2), CAST(N'2024-08-20T08:06:04.3209724' AS DateTime2), 4, N'IMP20240820080454', 2, 1, N'https://localhost:7033/uploads/shipment7_05af6ccf-ee3f-4971-998d-fe1bb6ce2724.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (98, 15, 3, 0, N'', CAST(N'2024-08-20T08:05:56.3945112' AS DateTime2), CAST(N'2024-08-20T08:06:06.6092374' AS DateTime2), 4, N'IMP20240820080556', 3, 1, N'https://localhost:7033/uploads/shipment5_f7d4023e-7a5a-4a0a-8d2a-8e77ad97bf9e_5b27440c-ae8d-48ee-a596-7f1d0e01e109.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (99, 15, 2, 0, N'', CAST(N'2024-08-20T08:08:07.0423239' AS DateTime2), CAST(N'2024-08-20T08:09:11.1506978' AS DateTime2), 4, N'IMP20240820080807', 1, 1, N'https://localhost:7033/uploads/shipment3_09c4c959-524b-4ad8-9278-0393fb27dd7b.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (100, 15, 2, 0, N'', CAST(N'2024-08-20T08:08:55.4292237' AS DateTime2), CAST(N'2024-08-20T08:09:02.7714850' AS DateTime2), 5, N'IMP20240820080855', 5, 1, N'https://localhost:7033/uploads/images_a0334085-e56d-4444-a50d-2b91cdcb3365.jpg', 19, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (101, 15, 2, 0, N'', CAST(N'2024-08-20T08:11:06.2672611' AS DateTime2), CAST(N'2024-08-20T08:11:15.7958162' AS DateTime2), 4, N'IMP20240820081106', 1, 1, N'https://localhost:7033/uploads/kho-may-giat-samsung-25_690870e2-7372-46c8-bfb1-fe66aadc492f_e9b1203f-27e3-45a8-ba09-9d90483afcbd.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (102, 15, 1, 0, N'', CAST(N'2024-08-20T08:29:07.9795119' AS DateTime2), CAST(N'2024-08-20T08:41:55.6761055' AS DateTime2), 4, N'IMP20240820082907', 2, 1, N'https://localhost:7033/uploads/shipment6_44721b15-b3d7-4fd3-a0ec-2868cc03edd4.jpg', 15, NULL)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (262, N'MLH20240820080156', 96, 1, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-27T00:00:00.0000000' AS DateTime2), 1000, 600)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (263, N'MLH20240820080226', 96, 24, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 500, 500)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (264, N'MLH20240820080304', 96, 95, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-24T00:00:00.0000000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (265, N'MLH20240820080241', 96, 58, 0, CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (266, N'MLH20240820080416', 97, 2, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 3000, 3000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (267, N'MLH20240820080358', 97, 1, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-06T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (268, N'MLH20240820080447', 97, 61, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-30T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (269, N'MLH20240820080432', 97, 60, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-30T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (270, N'MLH20240820080522', 98, 122, 0, CAST(N'2024-08-06T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-08T00:00:00.0000000' AS DateTime2), 2000, 2000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (271, N'MLH20240820080547', 98, 148, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-24T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (272, N'MLH20240820080746', 99, 113, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-30T00:00:00.0000000' AS DateTime2), 5500, 5500)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (273, N'MLH20240820080734', 99, 2, 0, CAST(N'2024-08-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 500, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (274, N'MLH20240820080713', 99, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-29T00:00:00.0000000' AS DateTime2), 5000, 4700)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (275, N'MLH20240820080758', 99, 24, 0, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-08T00:00:00.0000000' AS DateTime2), 500, 500)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (276, N'MLH20240820080835', 100, 2, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-24T00:00:00.0000000' AS DateTime2), 5000, 5000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (277, N'MLH20240820081042', 101, 24, 0, CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), 500, 500)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (278, N'MLH20240820081031', 101, 2, 0, CAST(N'2024-08-10T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-24T00:00:00.0000000' AS DateTime2), 500, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (279, N'MLH20240820081020', 101, 1, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-30T00:00:00.0000000' AS DateTime2), 500, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (280, N'MLH20240820081059', 101, 58, 0, CAST(N'2024-08-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), 500, 500)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (281, N'MLH20240820082836', 102, 1, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-06T00:00:00.0000000' AS DateTime2), 600, 600)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (282, N'MLH20240820082900', 102, 2, 0, CAST(N'2024-08-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-09-01T00:00:00.0000000' AS DateTime2), 150, 150)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryCheckDetails] ON 

INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (24, 16, 2, 30, 50, N'thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (25, 16, 2, 190, 200, N'thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (26, 17, 2, 50, 60, N'')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (27, 17, 2, 200, 200, N'')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (28, 18, 2, 60, 70, N'thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (29, 18, 2, 200, 200, N'đủ hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (30, 19, 2, 70, 100, N'thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (31, 19, 2, 200, 200, N'đủ hàng')
SET IDENTITY_INSERT [dbo].[InventoryCheckDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryChecks] ON 

INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (16, 1, CAST(N'2024-08-20T09:13:55.4539056' AS DateTime2), 4)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (17, 1, CAST(N'2024-08-20T09:19:17.7112131' AS DateTime2), 4)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (18, 1, CAST(N'2024-08-20T09:22:50.6437624' AS DateTime2), 4)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (19, 1, CAST(N'2024-08-20T09:32:29.2442638' AS DateTime2), 4)
SET IDENTITY_INSERT [dbo].[InventoryChecks] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (192, 38, N'yqz1Airp5EduLU/MhwaK/5WcQ8HTADfbwc5rRP1RzKU=', CAST(N'2024-08-02T00:54:41.8292174' AS DateTime2), CAST(N'2024-09-02T00:54:41.8292177' AS DateTime2), 0, N'3761923b-0cc2-4010-8382-4a77fba7f594')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (193, 39, N'FiA+YCX6IeLE7Aijx4q1wQ1BnY5kh4yZu3HJ5Qe3HIE=', CAST(N'2024-08-02T08:30:47.4199027' AS DateTime2), CAST(N'2024-09-02T08:30:47.4199789' AS DateTime2), 0, N'5bbeec84-9f2b-45fa-8f46-0d042991df4a')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (206, 15, N'7PJClI6atK94O3fubwoSqKlF1Mbtf4CIh1hxZJNR7m8=', CAST(N'2024-08-05T11:14:40.2521847' AS DateTime2), CAST(N'2024-09-05T11:14:40.2521848' AS DateTime2), 0, N'3d8353de-5764-4d0f-8cfc-25c6166b7494')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnOrder] ON 

INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (33, N'ROMTH20240820084206', CAST(N'2024-08-20T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 2, 5, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (34, N'ROMTH20240820084448', CAST(N'2024-08-20T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (35, N'ROMTH20240820084707', CAST(N'2024-08-20T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 1, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (36, N'ROMTH20240820084813', CAST(N'2024-08-20T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-20T08:49:47.5008436' AS DateTime2), 1, 2, 4, 15, 19)
SET IDENTITY_INSERT [dbo].[ReturnOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnOrderDetail] ON 

INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (22, 34, 1, 50, N'bị hỏng', N'MLH20240820080713')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (23, 34, 1, 50, N'hỏng', N'MLH20240820080156')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (24, 35, 1, 50, N'hỏng hàng', N'MLH20240820080156')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (25, 35, 1, 50, N'bị lỗi', N'MLH20240820080713')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (26, 35, 1, 50, N'', N'MLH20240820081020')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (27, 36, 2, 10, N'lỗi hàng', N'MLH20240820081031')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (28, 36, 2, 20, N'lỗi hàng', N'MLH20240820080734')
SET IDENTITY_INSERT [dbo].[ReturnOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Warehouse Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Accountant')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (2, N'Inactive')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (3, N'On Progress')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (4, N'Completed')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (5, N'Cancel')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (1, N'Kho Nội bộ', N'0987654321', 1, N'asus@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Samsung', N'0912345678', 1, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Apple', N'0993225653', 1, N'apple@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Xiaomi', N'0912345678', 1, N'xiaomi@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Dell', N'0912345678', 1, N'dell@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Toshiba', N'0987654321', 1, N'toshiba@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'Sony', N'0912345678', 1, N'sony@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Logitech', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'JBL', N'0987654321', 1, N'jbl@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (10, N'Fujifilm', N'0912345678', 1, N'fujifilm@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (69, N'Acer', N'0912345678', 2, N'acer@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (70, N'LG', N'0912345678', 2, N'lg@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (72, N'Asus', N'0832574256', 1, N'Asus@example.com', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (11, N'thanhdo@gmail.com', N'ZRYaSSd3CJo=', N'0332802172', 1, 1, N'ad', N'Administrator', N'SO 48 LE DAI HANH, HA BA TRUNG, HA NOI', N'https://localhost:7033/uploads/ánhduowng_5a0f4cf3-94f7-4aee-ab5d-f8927c5607a7.jpg', N'Administrator')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (12, N'pm@gmail.com', N'+gLa4tZK2hw=', N'0966666888', 2, 1, N'pm', N'ProjectManager', N'101 MAI HAC DE, BUI THI XUAN, H.B.T, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Warehouse Manager')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (13, N'sk@gmail.com', N'cXSmyS8Q7Ns=', N'0912345678', 3, 1, N'sk', N'Storekeeper', N'26 TUE TINH, BUI THI XUAN, HAI BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Staff')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (14, N'ac@gmail.com', N'YjBRio6ltvA=', N'0106713191', 4, 1, N'ac', N'Accountant', N'2 NHA CHUNG, HANG TRONG, HOAN KIEM, HA NOI ', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Accountant')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (15, N'fakerdopakhan@gmail.com', N'iByd0i0/I/o=', N'0943444121', 1, 1, N'admin', N'admin', N'string', N'https://localhost:7033/uploads/a_fce85517-c067-4352-af20-5961ac936447.jfif', N'admin')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (16, N'quanghuytb1111@gmail.comm', N'ZB4Zu2lZTgg=', N'0943124532', 2, 1, N'whHN', N'whHN', N'HN', N'https://localhost:7033/uploads/ánhduowng_885bea8a-f5c1-4654-91a0-563e97cbd3fe.jpg', N'whHN')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (17, N'quanghuytb111@gmail.comm', N'neP4byMYXwo=', N'0943222111', 3, 1, N'StaffHN', N'StaffHN', N'HN', N'https://localhost:7033/uploads/a_0e06f15e-6ecd-473a-a3c6-b814db48dda6.jfif', N'StaffHN')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (18, N'quanghuytb111@gmail.comm', N'AUZio6acfSJ9A5FPAGQ/SQ==', N'0943444222', 2, 1, N'huy2', N'WarehouseManager', N'HN', N'https://localhost:7033/uploads/a_dfcbeadb-8004-4116-a559-f7b43665a4f9.jfif', N'huy2')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (19, N'quanghuytb111@gmail.com', N'BTmbhffNXnh9A5FPAGQ/SQ==', N'string', 2, 1, N'staffHN1', N'WHM0001', N'string', N'string', N'string')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (20, N'quanghuytb1111@gmail.com', N'ctVGGn6VoS99A5FPAGQ/SQ==', N'0943222111', 2, 1, N'StaffHN2', N'WHM0002', N'HaLong', N'https://localhost:7033/uploads/a_dbd15a8f-1d93-46b0-b31e-aab8c5fcd1ea.jfif', N'StaffHN2')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (21, N'quanghuytb111@gmail.com', N'EaotHmuYPZMiXBKmD5d8Gg==', N'0943132111', 3, 1, N'StaffTB24', N'HDFF14', N'TB', N'https://localhost:7033/uploads/a_77cd74ae-86ea-4d44-85ef-b2617495dd3e.jfif', N'StaffTB24')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (22, N'quanghuytb1111@gmail.com', N'b9EWFVd2oPB9A5FPAGQ/SQ==', N'0943111319', 2, 1, N'vdna', N'HFd43512', N'DN', N'string', N'Nguyen van V')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (23, N'quanghuytb1111@gmail.com', N'xApSfc+TTPB9A5FPAGQ/SQ==', N'0943111319', 2, 1, N'vdnaHsd31', N'WHM43513', N'DN', N'string', N'Nguyen van V')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (24, N'quanghuytb11111@gmail.com', N'bHGdt/l0WnB9A5FPAGQ/SQ==', N'0943111319', 2, 1, N'vdnaHsd32', N'WHM43514', N'DN', N'string', N'Nguyen van H')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (25, N'quanghuytb11111@gmail.com', N'B0jPqV54UfF9A5FPAGQ/SQ==', N'0943111319', 2, 1, N'vdnaHsd33', N'WHM43515', N'DN', N'string', N'Nguyen van CC')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (26, N'quanghuytb111@gmail.com', N'UUhS5gf8+ax9A5FPAGQ/SQ==', N'0943111319', 4, 1, N'kdsd314', N'ACC0001', N'DN', N'string', N'Nguyen van CC')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (27, N'quanghuytb11111@gmail.com', N'q32R2UlGRZR9A5FPAGQ/SQ==', N'0953225774', 2, 1, N'kDN', N'WHM43516', N'DN', N'https://localhost:7033/uploads/a_eb1c244f-11b5-4c57-8919-530b85017888.jfif', N'Vanh Vân K')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (28, N'thanhdo@gmail.com', N'ZwvguAgrMOt9A5FPAGQ/SQ==', N'0795743785', 2, 1, N'wmhp', N'WHM43517', N'sàd', N'https://localhost:7033/uploads/ánhduowng_f8fd61db-e088-498c-9563-93aeb7dc946d.jpg', N'Chủ Lò Gạch')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (29, N'thanhdo@gmail.com', N'4kSBzU/uhTh9A5FPAGQ/SQ==', N'0795743785', 2, 1, N'wmhn', N'WHM43518', N'sàd', N'https://localhost:7033/uploads/ánhduowng_6939bc87-5e4e-4d9f-99dc-6853c75bad6a.jpg', N'Chủ Lò Gạch')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (30, N'thanhdo@gmail.com', N'+OizIzT0RM99A5FPAGQ/SQ==', N'0795743785', 2, 1, N'wmtb', N'WHM43519', N'sàd', N'https://localhost:7033/uploads/ánhduowng_6939bc87-5e4e-4d9f-99dc-6853c75bad6a.jpg', N'Chủ Lò Gạch')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (31, N'thanhdo@gmail.com', N'62akWa5zK419A5FPAGQ/SQ==', N'0332821271', 3, 1, N'staffhd', N'STF0001', N'thai binh', N'https://localhost:7033/uploads/ánhduowng_d6508e07-9a51-48f2-be23-2118bc65e5ad.jpg', N'thanhdo')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (32, N'thanhdo@gmail.com', N'uKM9auiNz0p9A5FPAGQ/SQ==', N'0332821271', 2, 1, N'staffdn', N'WHM43520', N'thai binh', N'https://localhost:7033/uploads/ánhduowng_d6508e07-9a51-48f2-be23-2118bc65e5ad.jpg', N'thanhdo')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (33, N'thanhdthe150750@gmail.com', N'eiPBN1crL3l9A5FPAGQ/SQ==', N'0332802172', 2, 1, N'wmhcm', N'WHM43521', N'ho chi minh', N'https://localhost:7033/uploads/ánhduowng_08196613-2927-422d-bb5b-d289c1e63c19.jpg', N'wmhcm')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (34, N'thanhdthe150750@gmail.com', N'zH0mhl1L0lJ9A5FPAGQ/SQ==', N'0332802172', 2, 1, N'wmhp1', N'WHM43522', N'Hải Phòng', N'https://localhost:7033/uploads/ánhduowng_6dd19594-ee9a-4f2a-9346-b3989fcf2826.jpg', N'wmhp')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (35, N'thanhdthe150750@gmail.com', N'KfKZUmcYQHp9A5FPAGQ/SQ==', N'0332802172', 2, 1, N'wmhcm1', N'WHM43523', N'hồ chí minh city', N'https://localhost:7033/uploads/ánhduowng_66f32452-c05c-4e6a-8389-39fdb9198c15.jpg', N'đỗ tuấn thanh')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (36, N'thanhdthe150750@gmail.com', N'vEc3stzvMup9A5FPAGQ/SQ==', N'0332802172', 3, 1, N'staffhcm', N'STF0002', N'HCM', N'https://localhost:7033/uploads/ánhduowng_42625b4b-8d06-4a14-9ff3-07dc7e09a080.jpg', N'Staff hcm')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (37, N'fakerdopakhan@gmail.com', N'6CkOpmE1mSM=', N'0332802179', 2, 1, N'wmcm', N'WHM43524', N'Cà Mau', N'https://localhost:7033/uploads/ánhduowng_8639eb18-4889-4dfe-a3d6-d37ae0dc2b03.jpg', N'Đỗ Tuấn Thành')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (38, N'thanhdthe150750@gmail.com', N'IlAth2MwgXd9A5FPAGQ/SQ==', N'0332802172', 2, 2, N'wmkh', N'WHM43525', N'Khanh hoa', N'https://localhost:7033/uploads/ánhduowng_e81eff2e-d9a2-42f9-800c-401ba21898a6.jpg', N'Chủ Kho Khánh Hoà')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (39, N'', N'', N'', 2, 2, N'', N'', N'', N'', N'')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (40, N'', N'', N'', 2, 2, N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 11, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 12, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 13, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 14, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (5, 11, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (6, 15, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (7, 16, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (8, 17, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (9, 18, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (10, 19, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (11, 20, 4)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (12, 21, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (13, 22, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (14, 23, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (15, 24, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (16, 25, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (17, 26, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (18, 27, 5)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (19, 28, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (20, 29, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (21, 30, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (22, 31, 6)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (23, 32, 5)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (24, 33, 7)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (25, 34, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (26, 35, 7)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (27, 36, 7)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (28, 37, 8)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (29, 38, 10)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (30, 39, 11)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (31, 40, 11)
SET IDENTITY_INSERT [dbo].[User_Warehouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0564371456')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0987452608')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Thái Bình', N'Thành phố Thái Bình', N'0782450393')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hạ Long', N'Thành phố Hạ Long', N'0851418261')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (5, N'Nam Định', N'Thành phố Nam Định', N'0559495116')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (6, N'Hải Dương', N'Thành Phố Hải Dương', N'0564243269')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (7, N'TP Hồ Chí Minh', N'Thành phố Hồ Chì Minh', N'0879005046')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (8, N'Khánh Hòa', N'Thành phố Nha Trang', N'0879005054')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (9, N'Cà Mau', N'Thành phố Cà Mau', N'0318716466')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (10, N'Quảng Bình', N'Thành phố Quảng Bình', N'0923535175')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (11, N'Đà Nẵng', N'Thành phố Đà Nẵng', N'0923535175')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
ALTER TABLE [dbo].[InventoryChecks] ADD  DEFAULT ((0)) FOR [StatusId]
GO
ALTER TABLE [dbo].[RefreshToken] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRevoked]
GO
ALTER TABLE [dbo].[ReturnOrder] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [ReturnedDate]
GO
ALTER TABLE [dbo].[ReturnOrder] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [ConfirmedDate]
GO
ALTER TABLE [dbo].[User] ADD  DEFAULT (CONVERT([bit],(0))) FOR [StatusId]
GO
ALTER TABLE [dbo].[AvailableForReturns]  WITH CHECK ADD  CONSTRAINT [FK_AvailableForReturns_ExportOrder_ExportId] FOREIGN KEY([ExportId])
REFERENCES [dbo].[ExportOrder] ([ExportId])
GO
ALTER TABLE [dbo].[AvailableForReturns] CHECK CONSTRAINT [FK_AvailableForReturns_ExportOrder_ExportId]
GO
ALTER TABLE [dbo].[AvailableForReturns]  WITH CHECK ADD  CONSTRAINT [FK_AvailableForReturns_Goods_GoodsId] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[AvailableForReturns] CHECK CONSTRAINT [FK_AvailableForReturns_Goods_GoodsId]
GO
ALTER TABLE [dbo].[AvailableForReturns]  WITH CHECK ADD  CONSTRAINT [FK_AvailableForReturns_ImportOrder_ImportId] FOREIGN KEY([ImportId])
REFERENCES [dbo].[ImportOrder] ([ImportId])
GO
ALTER TABLE [dbo].[AvailableForReturns] CHECK CONSTRAINT [FK_AvailableForReturns_ImportOrder_ImportId]
GO
ALTER TABLE [dbo].[BatchDetails]  WITH CHECK ADD  CONSTRAINT [FK_BatchDetails_InventoryCheckDetails_InventoryCheckDetailId] FOREIGN KEY([InventoryCheckDetailId])
REFERENCES [dbo].[InventoryCheckDetails] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BatchDetails] CHECK CONSTRAINT [FK_BatchDetails_InventoryCheckDetails_InventoryCheckDetailId]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNote_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_StocktakeNote_Status]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNote_Storage_StorageId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_StocktakeNote_Storage_StorageId]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNote_User_CreatedId] FOREIGN KEY([CreatedId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_StocktakeNote_User_CreatedId]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNote_User_UpdatedId] FOREIGN KEY([UpdatedId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_StocktakeNote_User_UpdatedId]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNoteDetail_Goods_GoodsId] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_StocktakeNoteDetail_Goods_GoodsId]
GO
ALTER TABLE [dbo].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_StocktakeNoteDetail_StocktakeNote_StocktakeId] FOREIGN KEY([BillId])
REFERENCES [dbo].[Bill] ([BillId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BillDetail] CHECK CONSTRAINT [FK_StocktakeNoteDetail_StocktakeNote_StocktakeId]
GO
ALTER TABLE [dbo].[Delivery]  WITH CHECK ADD  CONSTRAINT [FK_Delivery_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Delivery] CHECK CONSTRAINT [FK_Delivery_Status]
GO
ALTER TABLE [dbo].[EmailToken]  WITH CHECK ADD  CONSTRAINT [FK_EmailToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmailToken] CHECK CONSTRAINT [FK_EmailToken_User_UserId]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Customer_CustomerId]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Delivery] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Delivery]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Status]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Storage_StorageId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Storage_StorageId]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_User_UserId]
GO
ALTER TABLE [dbo].[ExportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrderDetail_ExportOrder_ExportId] FOREIGN KEY([ExportId])
REFERENCES [dbo].[ExportOrder] ([ExportId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportOrderDetail] CHECK CONSTRAINT [FK_ExportOrderDetail_ExportOrder_ExportId]
GO
ALTER TABLE [dbo].[ExportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrderDetail_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ExportOrderDetail] CHECK CONSTRAINT [FK_ExportOrderDetail_Goods]
GO
ALTER TABLE [dbo].[ExportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrderDetail_ImportOrderDetail] FOREIGN KEY([ImportOrderDetailId])
REFERENCES [dbo].[ImportOrderDetail] ([DetailId])
GO
ALTER TABLE [dbo].[ExportOrderDetail] CHECK CONSTRAINT [FK_ExportOrderDetail_ImportOrderDetail]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Category_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Category_CategoryId]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Status]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[GoodsHistory]  WITH CHECK ADD  CONSTRAINT [FK_GoodsHistory_ActionType_ActionId] FOREIGN KEY([ActionId])
REFERENCES [dbo].[ActionType] ([ActionId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsHistory] CHECK CONSTRAINT [FK_GoodsHistory_ActionType_ActionId]
GO
ALTER TABLE [dbo].[GoodsHistory]  WITH CHECK ADD  CONSTRAINT [FK_GoodsHistory_Goods_GoodsId] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsHistory] CHECK CONSTRAINT [FK_GoodsHistory_Goods_GoodsId]
GO
ALTER TABLE [dbo].[GoodsHistory]  WITH CHECK ADD  CONSTRAINT [FK_GoodsHistory_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[GoodsHistory] CHECK CONSTRAINT [FK_GoodsHistory_User_UserId]
GO
ALTER TABLE [dbo].[GoodsWarehouses]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouses_Goods_GoodsId] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
GO
ALTER TABLE [dbo].[GoodsWarehouses] CHECK CONSTRAINT [FK_GoodsWarehouses_Goods_GoodsId]
GO
ALTER TABLE [dbo].[GoodsWarehouses]  WITH CHECK ADD  CONSTRAINT [FK_GoodsWarehouses_Warehouse_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[GoodsWarehouses] CHECK CONSTRAINT [FK_GoodsWarehouses_Warehouse_WarehouseId]
GO
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_Delivery] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveyId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportOrder] CHECK CONSTRAINT [FK_ImportOrder_Delivery]
GO
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ImportOrder] CHECK CONSTRAINT [FK_ImportOrder_Status]
GO
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_Storage_StorageId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[ImportOrder] CHECK CONSTRAINT [FK_ImportOrder_Storage_StorageId]
GO
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[ImportOrder] CHECK CONSTRAINT [FK_ImportOrder_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ImportOrder] CHECK CONSTRAINT [FK_ImportOrder_User]
GO
ALTER TABLE [dbo].[ImportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrderDetail_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportOrderDetail] CHECK CONSTRAINT [FK_ImportOrderDetail_Goods]
GO
ALTER TABLE [dbo].[ImportOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrderDetail_ImportOrder_ImportId] FOREIGN KEY([ImportId])
REFERENCES [dbo].[ImportOrder] ([ImportId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportOrderDetail] CHECK CONSTRAINT [FK_ImportOrderDetail_ImportOrder_ImportId]
GO
ALTER TABLE [dbo].[InventoryCheckDetails]  WITH CHECK ADD  CONSTRAINT [FK_InventoryCheckDetails_Goods_GoodId] FOREIGN KEY([GoodId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryCheckDetails] CHECK CONSTRAINT [FK_InventoryCheckDetails_Goods_GoodId]
GO
ALTER TABLE [dbo].[InventoryCheckDetails]  WITH CHECK ADD  CONSTRAINT [FK_InventoryCheckDetails_InventoryChecks_InventoryCheckId] FOREIGN KEY([InventoryCheckId])
REFERENCES [dbo].[InventoryChecks] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryCheckDetails] CHECK CONSTRAINT [FK_InventoryCheckDetails_InventoryChecks_InventoryCheckId]
GO
ALTER TABLE [dbo].[InventoryChecks]  WITH CHECK ADD  CONSTRAINT [FK_InventoryCheck_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[InventoryChecks] CHECK CONSTRAINT [FK_InventoryCheck_Status]
GO
ALTER TABLE [dbo].[InventoryChecks]  WITH CHECK ADD  CONSTRAINT [FK_InventoryChecks_Warehouse_WarehouseId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryChecks] CHECK CONSTRAINT [FK_InventoryChecks_Warehouse_WarehouseId]
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_User_UserId]
GO
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_ApprovedByUser] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_ApprovedByUser]
GO
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_CreatedByUser] FOREIGN KEY([CreatedBy])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_CreatedByUser]
GO
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_Status]
GO
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_Supplier]
GO
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_Warehouse] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_Warehouse]
GO
ALTER TABLE [dbo].[ReturnOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrderDetail_Goods] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnOrderDetail] CHECK CONSTRAINT [FK_ReturnOrderDetail_Goods]
GO
ALTER TABLE [dbo].[ReturnOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrderDetail_ReturnOrder] FOREIGN KEY([ReturnOrderId])
REFERENCES [dbo].[ReturnOrder] ([ReturnOrderId])
GO
ALTER TABLE [dbo].[ReturnOrderDetail] CHECK CONSTRAINT [FK_ReturnOrderDetail_ReturnOrder]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Features] FOREIGN KEY([featureId])
REFERENCES [dbo].[Features] ([featureId])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Features]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([roleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Status]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role_RoleId]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Status]
GO
ALTER TABLE [dbo].[User_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK__User_Ware__UserI__68487DD7] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[User_Warehouse] CHECK CONSTRAINT [FK__User_Ware__UserI__68487DD7]
GO
ALTER TABLE [dbo].[User_Warehouse]  WITH CHECK ADD  CONSTRAINT [FK__User_Ware__Wareh__693CA210] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[User_Warehouse] CHECK CONSTRAINT [FK__User_Ware__Wareh__693CA210]
GO
USE [master]
GO
ALTER DATABASE [iSmart] SET  READ_WRITE 
GO
