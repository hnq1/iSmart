USE [master]
GO
/****** Object:  Database [iSmart]    Script Date: 8/9/2024 12:07:24 AM ******/
CREATE DATABASE [iSmart]
GO
USE [iSmart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ActionType]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[BatchDetails]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[EmailToken]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Features]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[GoodsWarehouses]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[InventoryCheckDetails]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[InventoryChecks]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ReturnOrder]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[ReturnOrderDetail]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[User_Warehouse]    Script Date: 8/9/2024 12:07:24 AM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 8/9/2024 12:07:24 AM ******/
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

INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (1, 10, N'MLH20240804160511', 12, 12, N'note')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (2, 11, N'MLH20240808122837', 104, 85, N'Thiếu hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (3, 12, N'MLH20240808122837', 104, 87, N'Thiếu hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (4, 13, N'MLH20240808122837', 104, 87, N'Thiếu hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (5, 14, N'MLH20240803232740', 12, 14, N'Thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (6, 15, N'MLH20240808122837', 104, 90, N'Thiếu hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (7, 16, N'MLH20240808122837', 104, 90, N'Thiếu hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (8, 17, N'MLH20240808122837', 104, 88, N'Thừa hàng')
INSERT [dbo].[BatchDetails] ([Id], [InventoryCheckDetailId], [BatchCode], [ExpectedQuantity], [ActualQuantity], [Note]) VALUES (9, 18, N'MLH20240803232740', 12, 17, N'Thừa hàng')
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

INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (0, N'Xuat kho noi bo', N'123 Ðu?ng ABC, Qu?n 1, TP.HCM', N'0901234567', N'nguyenvana@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (1, N'Đức Anh Ngu', N'HN', N'0943111222', N'a@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (2, N'Tùng ngu ', N'Nam Định', N'0943122333', N'tung@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (3, N'Thành Ngu 123', N'Thái Bình', N'0943332222', N'thanh@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (4, N'HUy ngu 04', N'Thái Bình', N'0943111222', N'huy@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 2)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (6, N'123 giao', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (7, N'3333333333', 2)
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

INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (1, N'XHFGG32142', 15, 0, N'string', 4, CAST(N'2024-07-02T01:50:04.1932768' AS DateTime2), CAST(N'2024-07-03T20:40:43.4963387' AS DateTime2), 1, CAST(N'2024-07-01T18:27:36.1520000' AS DateTime2), 1, N'string', NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (2, N'XHKSF4256', 15, 0, N'', 5, CAST(N'2024-07-02T23:05:53.1853250' AS DateTime2), CAST(N'2024-07-26T17:30:28.1150252' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (3, N'XHFGFGH3425', 15, 0, N'', 3, CAST(N'2024-07-03T14:12:33.3366147' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 2, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (4, N'XHHUY142255', 15, 0, N'', 3, CAST(N'2024-07-03T14:17:36.7431414' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 2, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (5, N'XHGSG4242', 15, 0, N'', 3, CAST(N'2024-07-03T14:27:31.3700835' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (6, N'XHDCC', 15, 0, N'', 3, CAST(N'2024-07-03T14:30:08.5479975' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 2, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (29, N'XHGDG42425', 15, 0, N'string', 4, CAST(N'2024-07-03T21:39:16.7826472' AS DateTime2), CAST(N'2024-07-03T21:45:53.4570677' AS DateTime2), 2, CAST(N'2024-07-03T13:20:12.2640000' AS DateTime2), 1, N'string', NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (33, N'XHHKS42451134', 15, 0, N'string', 3, CAST(N'2024-07-03T22:10:20.7058310' AS DateTime2), CAST(N'2024-07-03T15:03:45.3890000' AS DateTime2), 1, CAST(N'2024-07-03T15:03:45.3890000' AS DateTime2), 1, N'string', NULL, 0, 2)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (34, N'XHKHSF32352', 15, 0, N'string', 4, CAST(N'2024-07-03T22:10:44.5471420' AS DateTime2), CAST(N'2024-07-03T23:43:35.0686769' AS DateTime2), 1, CAST(N'2024-07-03T15:03:45.3890000' AS DateTime2), 1, N'string', NULL, 0, 2)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (35, N'XHDGFHS425', 15, 0, N'', 3, CAST(N'2024-07-03T22:47:53.4101219' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 2, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 0, 1)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (36, N'XHHUYNGU312', 15, 0, N'', 5, CAST(N'2024-07-03T22:50:59.2363392' AS DateTime2), CAST(N'2024-07-03T23:08:29.0826913' AS DateTime2), 4, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 0, 1)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (37, N'XHHUYNGU4251', 15, 0, N'', 4, CAST(N'2024-07-03T23:10:51.9660980' AS DateTime2), CAST(N'2024-07-03T23:24:47.8586166' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (38, N'XHHUY3SO53456', 15, 0, N'', 3, CAST(N'2024-07-03T23:27:58.7946236' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (39, N'XHHUYABC314', 15, 0, N'', 3, CAST(N'2024-07-03T23:34:27.0017775' AS DateTime2), CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (40, N'XHNGU34341', 15, 0, N'', 4, CAST(N'2024-07-03T23:53:08.7974775' AS DateTime2), CAST(N'2024-07-03T23:54:12.4131314' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (41, N'XHKHS42356', 15, 0, N'', 3, CAST(N'2024-07-04T00:06:11.1391474' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (42, N'XHKHS5362', 15, 0, N'', 3, CAST(N'2024-07-04T00:07:49.4149643' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (43, N'XHVCC131', 15, 0, N'', 4, CAST(N'2024-07-04T00:09:17.2706222' AS DateTime2), CAST(N'2024-07-04T00:12:35.7968893' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (44, N'XHKHD4255', 15, 0, N'', 4, CAST(N'2024-07-04T11:27:10.9202959' AS DateTime2), CAST(N'2024-07-04T11:27:48.0313528' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (45, N'XHVVV213', 15, 0, N'', 4, CAST(N'2024-07-04T13:33:17.9610883' AS DateTime2), CAST(N'2024-07-04T13:33:46.4958442' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (46, N'XHEEE321', 15, 0, N'', 3, CAST(N'2024-07-04T15:14:40.1919757' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (47, N'XHHHH321', 15, 0, N'', 3, CAST(N'2024-07-04T15:24:09.4253593' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (48, N'XHHGHG321', 15, 0, N'', 3, CAST(N'2024-07-04T15:29:52.8329482' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (49, N'XHBV312', 15, 0, N'', 3, CAST(N'2024-07-04T15:31:00.2361550' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (50, N'XHBBB321', 15, 0, N'', 3, CAST(N'2024-07-04T19:45:45.8700532' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (51, N'XHVVVC312', 15, 0, N'', 3, CAST(N'2024-07-04T19:57:11.7092018' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (52, N'XHGGGS3123', 15, 0, N'', 3, CAST(N'2024-07-07T02:13:10.8670795' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (53, N'XHVS321', 15, 0, N'', 3, CAST(N'2024-07-07T02:35:12.3151259' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (54, N'XHBBB32122', 15, 0, N'', 3, CAST(N'2024-07-07T15:14:26.9452572' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (55, N'XHMM321', 15, 0, N'', 3, CAST(N'2024-07-07T15:20:01.0598854' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (56, N'XHHDD321', 15, 0, N'', 3, CAST(N'2024-07-07T15:32:53.6443041' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (57, N'XHVVSASF', 15, 0, N'', 3, CAST(N'2024-07-07T15:58:11.8671462' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (58, N'XHCCC321', 15, 0, N'', 3, CAST(N'2024-07-07T16:00:47.6310137' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (59, N'XHHUY321222', 15, 0, N'', 3, CAST(N'2024-07-07T16:02:32.4145927' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (60, N'XHBBB32221', 15, 0, N'', 4, CAST(N'2024-07-07T22:51:37.1237464' AS DateTime2), CAST(N'2024-07-08T15:05:45.5741185' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, 2)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (61, N'XHBBVVVCC3231', 15, 0, N'', 3, CAST(N'2024-07-08T12:56:53.1760086' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (62, N'XHMMNN332211', 15, 0, N'', 4, CAST(N'2024-07-08T14:21:20.4882503' AS DateTime2), CAST(N'2024-07-08T15:05:27.5060185' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (63, N'XHBBBXXX321', 15, 0, N'', 3, CAST(N'2024-07-08T14:22:52.1729677' AS DateTime2), CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, NULL, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (64, N'XHNVV321', 15, 0, N'', 4, CAST(N'2024-07-08T14:24:02.9868673' AS DateTime2), CAST(N'2024-07-08T15:05:17.4619921' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (65, N'XHHUYNGUUUU3', 15, 0, N'string', 3, CAST(N'2024-07-08T14:31:21.7346392' AS DateTime2), CAST(N'2024-07-08T14:24:02.9868673' AS DateTime2), 2, CAST(N'2024-07-08T07:29:53.0410000' AS DateTime2), 1, N'string', NULL, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (66, N'XHZZXX33322', 15, 0, N'', 3, CAST(N'2024-07-08T14:34:22.4083677' AS DateTime2), CAST(N'2024-07-08T00:00:00.0000000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (67, N'XHVDD331234', 15, 0, N'', 4, CAST(N'2024-07-12T16:07:18.9582832' AS DateTime2), CAST(N'2024-07-12T17:09:21.8555727' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (68, N'XHgfgdsad31312', 15, 0, N'', 4, CAST(N'2024-07-16T10:31:40.0442153' AS DateTime2), CAST(N'2024-07-16T10:38:44.6116347' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (69, N'XHfdgdgd3141', 15, 0, N'', 3, CAST(N'2024-07-17T10:30:32.1836425' AS DateTime2), CAST(N'2024-07-17T00:00:00.0000000' AS DateTime2), 2, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 1, NULL, NULL, 0, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (70, N'XH20240724175917', 15, 0, N'', 3, CAST(N'2024-07-24T17:59:17.3315410' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 1, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 3, N'https://localhost:7033/uploads/ánhduowng_192864e9-deec-4636-876c-722df5d761d3.jpg', 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (71, N'XH20240724182338', 15, 0, N'', 3, CAST(N'2024-07-24T18:23:38.4076341' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 7, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 5, NULL, 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (72, N'XH20240724193809', 15, 0, N'', 3, CAST(N'2024-07-24T19:38:09.1282255' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 7, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (73, N'XH20240725161659', 15, 0, N'', 3, CAST(N'2024-07-25T16:16:59.8215421' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 7, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_a7b71a69-d4eb-491d-95f3-eafdc9c44efc.jpg', 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (74, N'XHdsflkfj', 15, 0, N'', 5, CAST(N'2024-07-25T16:44:03.1142875' AS DateTime2), CAST(N'2024-07-25T16:45:09.6027719' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 0, 1)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (75, N'XH20240725164452', 15, 0, N'', 5, CAST(N'2024-07-25T16:44:52.9528984' AS DateTime2), CAST(N'2024-08-02T08:49:14.5794028' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 6, N'https://localhost:7033/uploads/ánhduowng_5a8efd85-90f6-465f-8dd2-35b75a61225b.jpg', 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (76, N'XH20240725165043', 15, 0, N'', 3, CAST(N'2024-07-25T16:50:43.3278775' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 5, N'https://localhost:7033/uploads/ánhduowng_35fc2a58-6870-4af4-908b-64f42358bf62.jpg', 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (77, N'XH20240725165203', 15, 0, N'', 3, CAST(N'2024-07-25T16:52:03.2916231' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 5, N'https://localhost:7033/uploads/ánhduowng_91497951-83a0-4f8f-b6d7-7e4048295c68.jpg', 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (78, N'XH20240725165254', 15, 0, N'', 3, CAST(N'2024-07-25T16:52:54.0588736' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_91497951-83a0-4f8f-b6d7-7e4048295c68.jpg', 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (79, N'XH20240725165337', 15, 0, N'', 4, CAST(N'2024-07-25T16:53:37.8207482' AS DateTime2), CAST(N'2024-07-25T16:53:57.0237342' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (80, N'XH20240725170534', 15, 0, N'', 3, CAST(N'2024-07-25T17:05:34.0346953' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_8eef3eb8-e5e4-43b5-9b5d-36f52c5eb43a.jpg', 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (81, N'XH20240725171022', 15, 0, N'', 4, CAST(N'2024-07-25T17:10:22.5190645' AS DateTime2), CAST(N'2024-07-25T17:10:50.7222913' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 4, N'https://localhost:7033/uploads/ánhduowng_fc04eaca-c55e-4b0f-aacb-30c3ccd28c1f.jpg', 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (82, N'XHfaadsfdasf', 15, 0, N'', 3, CAST(N'2024-07-25T17:22:17.2200126' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_87fcc6f5-41c6-440a-b41e-734c421abfd0.jpg', 19, 0, 7)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (83, N'XH20240730231750', 15, 0, N'', 4, CAST(N'2024-07-30T23:17:50.3003345' AS DateTime2), CAST(N'2024-07-30T23:50:07.1943637' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (84, N'XH20240730231840', 15, 0, N'', 4, CAST(N'2024-07-30T23:18:40.3026444' AS DateTime2), CAST(N'2024-07-30T23:48:38.0311189' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (85, N'XH20240730232551', 15, 0, N'', 4, CAST(N'2024-07-30T23:25:51.4253969' AS DateTime2), CAST(N'2024-07-30T23:44:48.6390666' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_c7d4d957-8f27-466c-95c0-58545b046246.jpg', 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (86, N'XH20240730232739', 15, 0, N'', 4, CAST(N'2024-07-30T23:27:39.7198679' AS DateTime2), CAST(N'2024-07-30T23:42:20.0086927' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 3, N'https://localhost:7033/uploads/ánhduowng_e017760d-899b-4500-8830-7b5d9fd122f0.jpg', 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (87, N'XH20240730234046', 15, 0, N'', 4, CAST(N'2024-07-30T23:40:46.4487949' AS DateTime2), CAST(N'2024-07-30T23:41:09.5070569' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 4, N'https://localhost:7033/uploads/ánhduowng_431c4e48-d852-4954-b985-451c8df889bd.jpg', 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (88, N'XH20240802084655', 15, 0, N'', 5, CAST(N'2024-08-02T08:46:55.0336544' AS DateTime2), CAST(N'2024-08-02T08:51:54.6509270' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 3, N'https://localhost:7033/uploads/ánhduowng_cf8fa835-f6c8-48c2-826e-7cbf15e6887a.jpg', 19, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (89, N'XH20240802084824', 15, 0, N'', 5, CAST(N'2024-08-02T08:48:24.2658073' AS DateTime2), CAST(N'2024-08-02T08:49:12.7187522' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_773b3bba-65fc-47b5-ad42-53cc06b24e07.jpg', 19, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (90, N'XH20240802084940', 15, 0, N'', 5, CAST(N'2024-08-02T08:49:40.0863891' AS DateTime2), CAST(N'2024-08-02T08:52:10.1042170' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, N'https://localhost:7033/uploads/ánhduowng_0920a9e2-87be-40d9-ab31-24a0f8af0827.jpg', 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (91, N'XH20240802085043', 15, 0, N'', 5, CAST(N'2024-08-02T08:50:43.7932855' AS DateTime2), CAST(N'2024-08-02T08:51:44.6166826' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 5, N'https://localhost:7033/uploads/ánhduowng_a34555fb-2a64-442b-8826-946d1bac44c5.jpg', 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (92, N'XH20240802085251', 15, 0, N'', 5, CAST(N'2024-08-02T08:52:51.2124927' AS DateTime2), CAST(N'2024-08-02T08:53:13.0961239' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 6, N'https://localhost:7033/uploads/ánhduowng_a34555fb-2a64-442b-8826-946d1bac44c5.jpg', 19, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (93, N'XH20240802090038', 15, 0, N'', 5, CAST(N'2024-08-02T09:00:38.2278920' AS DateTime2), CAST(N'2024-08-02T10:36:48.7023440' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 4, NULL, 19, 3, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (94, N'XHdf', 15, 0, N'', 3, CAST(N'2024-08-02T09:35:47.4986200' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 10, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 3, NULL, 19, 0, 8)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (95, N'XHdfẻ', 15, 0, N'', 3, CAST(N'2024-08-02T09:38:45.2682880' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 10, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 3, NULL, 19, 0, 8)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (96, N'XHquanghai', 15, 0, N'', 3, CAST(N'2024-08-02T10:05:58.5336681' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 10, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 4, NULL, 19, 0, 8)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (97, N'XHdeaj', 15, 0, N'', 3, CAST(N'2024-08-02T10:11:46.6419613' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 5, N'https://localhost:7033/uploads/ánhduowng_33bb836c-3bf0-4dec-a2e0-26f1d10e6a29.jpg', 19, 0, 10)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (98, N'XH20240802101542', 15, 0, N'', 3, CAST(N'2024-08-02T10:15:42.4831045' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (99, N'XH20240802102215', 15, 0, N'', 3, CAST(N'2024-08-02T10:22:15.3945193' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (100, N'XH20240802103628', 15, 0, N'', 4, CAST(N'2024-08-02T10:36:28.7766578' AS DateTime2), CAST(N'2024-08-02T10:37:32.7440272' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (101, N'XH20240802113114', 15, 0, N'', 3, CAST(N'2024-08-02T11:31:14.5415919' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (102, N'XHsfdfs', 15, 0, N'', 4, CAST(N'2024-08-02T11:38:32.3446824' AS DateTime2), CAST(N'2024-08-02T11:38:58.1167845' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 0, 10)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (103, N'XH20240802154106', 15, 0, N'', 4, CAST(N'2024-08-02T15:41:06.3581018' AS DateTime2), CAST(N'2024-08-02T15:41:16.3256694' AS DateTime2), 11, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (104, N'XH20240802162941', 15, 0, N'', 4, CAST(N'2024-08-02T16:29:41.7530997' AS DateTime2), CAST(N'2024-08-02T16:30:36.3955708' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 0, 10)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (105, N'XH20240802163212', 15, 0, N'', 4, CAST(N'2024-08-02T16:32:12.7758803' AS DateTime2), CAST(N'2024-08-02T16:32:55.8707546' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (106, N'XH20240808124431', 15, 0, N'', 4, CAST(N'2024-08-08T12:44:32.0035360' AS DateTime2), CAST(N'2024-08-08T12:45:01.1299865' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 0, 10)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (107, N'XH20240808125150', 15, 0, N'', 4, CAST(N'2024-08-08T12:51:50.2350611' AS DateTime2), CAST(N'2024-08-08T12:52:11.8607234' AS DateTime2), 8, CAST(N'2024-07-03T16:51:26.3390000' AS DateTime2), 2, NULL, 19, 1, NULL)
SET IDENTITY_INSERT [dbo].[ExportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] ON 

INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (3, 1, 0, 1, 2, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (5, 2, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (6, 5, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (7, 6, 0, 1, 60, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (8, 35, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (9, 36, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (10, 37, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (12, 39, 0, 3, 30, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (13, 40, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (14, 41, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (15, 42, 0, 3, 20, 16)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (16, 43, 0, 1, 40, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (17, 44, 0, 1, 2, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (18, 45, 0, 3, 3, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (24, 59, 0, 3, 2, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (25, 59, 0, 3, 2, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (26, 59, 0, 3, 2, 25)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (27, 60, 0, 3, 2, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (28, 60, 0, 3, 2, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (29, 60, 0, 3, 2, 25)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (30, 61, 0, 3, 2, 25)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (31, 61, 0, 3, 2, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (32, 61, 0, 3, 2, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (33, 62, 0, 3, 3, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (34, 62, 0, 3, 3, 25)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (35, 62, 0, 3, 3, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (36, 63, 0, 2, 2, 8)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (37, 63, 0, 2, 2, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (38, 64, 0, 2, 2, 8)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (39, 64, 0, 2, 2, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (40, 66, 0, 3, 2, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (41, 66, 0, 3, 2, 25)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (42, 66, 0, 3, 2, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (43, 67, 0, 2, 20, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (44, 67, 0, 2, 20, 8)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (45, 68, 0, 2, 20, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (46, 68, 0, 2, 20, 8)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (47, 69, 0, 1, 1, 7)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (48, 69, 0, 3, 2, 9)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (49, 69, 0, 2, 2, 8)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (50, 69, 0, 1, 1, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (51, 69, 0, 3, 2, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (52, 69, 0, 2, 2, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (53, 71, 0, 1, 4, 102)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (54, 71, 0, 1, 3, 102)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (55, 72, 0, 1, 6, 102)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (56, 73, 0, 134, 12, 107)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (58, 77, 0, 1, 20, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (59, 77, 0, 1, 20, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (60, 78, 0, 1, 10, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (61, 79, 0, 1, 20, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (62, 80, 0, 1, 20, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (63, 81, 0, 1, 10, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (64, 81, 0, 1, 10, 108)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (65, 82, 0, 134, 10, 107)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (66, 82, 0, 1, 22, 102)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (67, 85, 0, 1, 4, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (68, 85, 0, 1, 3, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (69, 86, 0, 1, 3, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (70, 86, 0, 1, 4, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (71, 86, 0, 142, 6, 202)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (72, 87, 0, 1, 2, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (73, 87, 0, 1, 2, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (74, 88, 0, 142, 3, 203)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (76, 89, 0, 142, 3, 202)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (77, 89, 0, 142, 2, 203)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (78, 90, 0, 142, 1, 202)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (79, 90, 0, 142, 2, 203)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (84, 93, 0, 142, 3, 202)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (85, 93, 0, 142, 3, 203)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (86, 95, 0, 1, 6, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (87, 95, 0, 1, 4, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (88, 96, 0, 1, 1, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (89, 96, 0, 1, 3, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (90, 97, 0, 1, 1, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (91, 97, 0, 1, 2, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (92, 97, 0, 1, 1, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (93, 98, 0, 1, 10, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (94, 98, 0, 1, 20, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (95, 98, 0, 1, 10, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (96, 99, 0, 1, 200, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (97, 99, 0, 1, 1, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (98, 99, 0, 1, 1, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (99, 100, 0, 1, 222, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (100, 100, 0, 1, 10, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (101, 100, 0, 1, 10, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (102, 101, 0, 1, 182, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (103, 102, 0, 1, 182, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (104, 103, 0, 142, 119, 204)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (105, 104, 0, 1, 21, 205)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (106, 105, 0, 1, 12, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (107, 106, 0, 1, 10, 236)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (108, 107, 0, 1, 0, 200)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (109, 107, 0, 1, 0, 198)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (110, 107, 0, 1, 0, 197)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (111, 107, 0, 1, 10, 236)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (112, 107, 0, 1, 0, 230)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (113, 107, 0, 1, 0, 205)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (114, 107, 0, 1, 0, 235)
GO
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'iPhone 13', N'ip24', 1, N'Diện thoại di động Apple iPhone 13', 2, N'Cái', N'https://example.com/image1.png', 1, 0, N'0123456789012', 200, 10, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy S21', N'SG21', 1, N'Diện thoại di động Samsung Galaxy S21', 2, N'Cái', N'https://example.com/image2.png', 1, 0, N'0123456789013', 150, 15, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 4, N'Cái', N'https://example.com/image3.png', 1, 0, N'0123456789014', 100, 5, NULL, 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Sony A7 III', N'SA7III', 4, N'Máy ảnh Sony A7 III', 5, N'Cái', N'https://example.com/image4.png', 1, 5E+07, N'0123456789015', 50, 5, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11', 2, N'Cái', N'https://example.com/image5.png', 1, 0, N'0123456789016', 300, 20, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360', 4, N'Cái', N'https://example.com/image6.png', 1, 2.5E+07, N'0123456789017', 100, 10, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 8, N'Thùng', N'https://example.com/image7.png', 1, 0, N'0123456789018', 50, 5, NULL, 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R', 1, N'Cái', N'https://example.com/image8.png', 1, 0, N'0123456789019', 50, 5, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7', 2, N'Cái', N'https://example.com/image9.png', 1, 1.8E+07, N'0123456789020', 100, 10, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 2, N'Cái', N'https://example.com/image10.png', 1, 8000000, N'0123456789021', 200, 20, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic', 4, N'Cái', N'https://example.com/image11.png', 1, 3E+07, N'0123456789022', 30, 2, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9', 1, N'Cái', N'https://example.com/image12.png', 1, 1E+07, N'0123456789023', 150, 10, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5', 2, N'Cái', N'https://example.com/image13.png', 1, 0, N'0123456789024', 70, 5, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6', 4, N'Cái', N'https://example.com/image14.png', 1, 1.2E+07, N'0123456789025', 200, 20, CAST(N'2024-06-28T16:20:24.7200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (15, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'string', 2, N'string', 1, N'string', N'string', 1, 0, N'stri ng', 200, 1, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (16, N'Astro A10', N'AS10', 6, N'tai nghe Gaming', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4ab1c6ae-57b6-4013-8b5a-2a7a8c732f2d.jpg', 1, 700000, NULL, 200, 4, CAST(N'2024-06-25T18:08:02.5672420' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (17, N'Logitech G102', N'LG102', 9, N'Chuột Gaming', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e1ef0a72-9788-4a6a-8b22-5043a97373c2.jpg', 1, 250000, NULL, 200, 4, CAST(N'2024-06-25T18:16:42.5918040' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (18, N'Logi Dock', N'LD1', 6, N'loa thu âm', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_ff49f048-3e0d-43fa-9ae5-8e379a75acb2.jpg', 1, 300000, NULL, 1000, 1000, CAST(N'2024-06-25T18:21:30.8735657' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (19, N'Newsun HS-20', N'HS20', 7, N'Máy đánh bột HS20', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_97f6e816-b1af-4d7c-90f7-1351d891db81.jpg', 1, 1.3E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:23:09.4026236' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (20, N'Newsun B30B', N'B30B', 7, N'Máy đánh bột 30 lít', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_774c8a7c-34f0-4656-add3-b8aa0ac3b586.jpg', 1, 2.5E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:26:28.8264496' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (21, N'KitchenAid Artisan', N'KA5', 7, N'Máy đánh bột', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_09c7e358-462b-4ed6-92f3-eea8c9e88363.jpg', 1, 1E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:28:33.7015150' AS DateTime2), 4)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (22, N'Galaxy tab S9', N'GTS9', 1, N'máy tính bảng', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_117e9038-bf44-47fe-956f-9bd397e0a756.jpg', 1, 1.7E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:30:16.5440622' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (23, N'Galaxy Z fold5', N'GZF5', 1, N'smart phone', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_818d6731-cd6a-4d9e-a595-64d6c23126ba.jpg', 1, 4.5E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:31:50.9289135' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (24, N'Smart Tivi Samsung UHD85', N'ST1', 3, N'smart TV', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_bc7e14b8-f4e2-4c47-8ba9-56c64a242b01.jpg', 1, 2.7E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:33:16.7751334' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (25, N'Asrock Z270M Pro 4', N'AZ4', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_8c3b4ddd-ef9a-48cd-83ef-8a6fdcfefa15.jpg', 1, 100000, NULL, 100, 1000, CAST(N'2024-06-25T18:37:47.1561154' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (26, N'Asus prime H610M', N'AP6', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_201159a6-4a31-46c6-b0d8-515f72538ee9.jpg', 1, 1900000, NULL, 10, 998, CAST(N'2024-06-25T18:41:31.8866574' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (27, N'TUF B760M', N'TB7', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_25e8e5c9-042c-4578-b16a-99351c29e1e4.jpg', 1, 100000, NULL, 10, 998, CAST(N'2024-06-25T18:43:39.3732035' AS DateTime2), 4)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (28, N'LG inverter D372', N'LI3', 7, N'tủ lạnh thông minh LG', 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_36745baf-398f-41df-bbe0-b7093886fc3a.jpg', 1, 9900000, NULL, 100, 2, CAST(N'2024-06-25T18:45:36.9672064' AS DateTime2), 5)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (29, N'Garmin venu 3S', N'Gv3', 10, N'đồng hồ thông minh', 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_f7016846-5408-4b7d-a579-19f90998272e.jpg', 1, 1.1E+07, NULL, 100, 2, CAST(N'2024-06-25T18:46:46.5403671' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (30, N'Electrolux 2', N'EL2', 7, N'tủ lạnh thông minh LG', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0d1f6735-70f9-444b-bc8d-d9aa0fffb2a5.jpg', 1, 12999999, NULL, 100, 2, CAST(N'2024-06-25T18:47:58.9874810' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (31, N'Google Tivi Xiaomi A 32 inch L32M8-P2SEA', N'XA32', 3, N'Tivi xiaomi 4K', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_5a27a63a-2513-4083-8463-f558b2785991.jpg', 1, 3500000, NULL, 100, 2, CAST(N'2024-06-25T18:52:25.6687053' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (32, N'Smart Tivi Samsung QLED 4K 55 inch 55QE1D', N'SQ4k', 3, N'ti vi samsug QHD4K', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_40581309-138c-4581-bf29-a0f77bac199a.jpg', 1, 1.19E+07, NULL, 100, 2, CAST(N'2024-06-25T18:53:52.9274631' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (33, N'Loa Bluetooth Sony SRS-XP500 ', N'XP500', 6, N'Loa sony xp500', 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_268eab41-6403-4417-845d-4d228bbc4cd6.jpg', 1, 5900000, NULL, 100, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (34, N'Bộ loa thanh LG SN5R 520W', N'LG5', 6, N'Bộ loa thanh LG SN5R', 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_b8dc04f0-60eb-47bf-a734-ecb4624cff21.jpg', 1, 2500000, NULL, 100, 2, CAST(N'2024-06-25T18:56:59.5417815' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (35, N'Máy hút bụi LG VK8320GHAUQ', N'VK8', 7, N'máy hút bụi Vk8', 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_2d253f24-4485-4b56-8936-585079b16d6e.jpg', 1, 1500000, NULL, 100, 2, CAST(N'2024-06-25T18:58:40.5037501' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (36, N'Laptop Lenovo Ideapad Slim 3', N'LIS3', 2, NULL, 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_43ec1db2-98c5-4880-84b7-64f43e3a4456.jpg', 1, 1.389E+07, NULL, 100, 2, CAST(N'2024-06-25T19:04:39.1835706' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (37, N'Màn hình LG 27MP500-B.ATV 27 inch', N'LG27', 8, N'Màn hình LG 27MP500-B.ATV 27 inch', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4e3a00a2-c233-4cf0-8796-8c2e7b5fe140.jpg', 1, 2990000, NULL, 100, 2, CAST(N'2024-06-25T19:06:26.0726345' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (38, N'Máy tính bảng iPad Pro M4 11 inch WiFi 256GB', N'Ip4', 5, N'Máy tính bảng iPad Pro M4 11 inch WiFi 256GB', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_99ea9331-383d-40f1-ae19-c120078825d1.jpg', 1, 2.889E+07, NULL, 100, 2, CAST(N'2024-06-25T19:07:41.4272280' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (39, N' Xiaomi Redmi Pad Pro', N'XRP', 5, N' Xiaomi Redmi Pad Pro', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_7e290b1e-820e-40b0-8f6f-e3273a33fa20.jpg', 1, 7289999, NULL, 100, 2, CAST(N'2024-06-25T19:09:23.2995149' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (40, N'Máy chơi game cầm tay Asus ROG Ally RC71L', N'ROG', 9, NULL, 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_fd87f3db-e097-4bd9-a722-d4404a4f4383.jpg', 1, 1.799E+07, NULL, 100, 2, CAST(N'2024-06-25T19:10:47.2870358' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (41, N'Đồng hồ thông minh Huawei Watch GT 4 46mm', N'GT4', 10, NULL, 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_5edfd2e8-b371-41d0-9731-eef3c415b941.jpg', 1, 4790000, NULL, 100, 2, CAST(N'2024-06-25T19:12:02.6421458' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (42, N'Laptop Acer Gaming Nitro V ANV15', N'NTR5', 2, N'Laptop Acer Gaming Nitro V ANV15', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_2cade092-4a0a-4b0f-ae86-52c4097503aa.jpg', 1, 1.949E+07, NULL, 200, 2, CAST(N'2024-06-25T20:28:35.8510514' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (43, N'Laptop Gaming Acer Aspire 7 A715', N'ASP7', 2, N'Laptop Gaming Acer Aspire 7 A715', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_96f6ecde-a952-4937-8aa1-1e5f8680a56a.jpg', 1, 1.699E+07, NULL, 200, 2, CAST(N'2024-06-25T20:29:55.4746338' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (44, N'Laptop Acer Predator Helios Neo PHN16-71-53M7', N'APH71', 2, N'Laptop Acer Predator Helios Neo PHN16-71-53M7', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_d96e66a6-39ae-424d-abf3-214e92dd5331.jpg', 1, 3.579E+07, NULL, 200, 2, CAST(N'2024-06-25T20:31:11.8828796' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (45, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'AN16', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_eb3d8a13-5801-4f89-8452-d33824ba7aea.jpg', 1, 280, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (46, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN5T', 2, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_15066f7e-7c0d-41cd-afa5-3b1f6db01113.jpg', 1, 2.579E+07, NULL, 200, 2, CAST(N'2024-06-25T20:35:00.8606326' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (47, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', N'AN16P', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_1ecb02d2-4345-4162-aa50-72ce3778cc71.jpg', 1, 3.299E+07, NULL, 200, 2, CAST(N'2024-06-25T20:36:17.8593834' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (48, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', N'R60F', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_cb92f379-c602-4671-bd9e-e548b5cc04ca.jpg', 1, 2.899E+07, NULL, 200, 2, CAST(N'2024-06-25T20:40:10.7823276' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (49, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', N'R76E', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e1cec681-f3f9-45fb-9fac-7521e766ed1b.jpg', 1, 3.699E+07, NULL, 200, 2, CAST(N'2024-06-25T20:41:47.9181910' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (50, N'Laptop Acer Predator Helios Neo PHN16-71-7460', N'PHN16', 2, N'Laptop Acer Predator Helios Neo PHN16-71-7460', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0a7c08f9-9d2b-4f4a-8246-d3c15bce1766.jpg', 1, 3.699E+07, NULL, 200, 2, CAST(N'2024-06-25T20:42:38.4080838' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (52, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', N'R76E', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 2, N'thùng', NULL, 1, 4.9E+07, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (53, N'Laptop Acer Predator Helios Neo PHN16-71', N'547E', 2, N'Laptop Acer Predator Helios Neo PHN16-71', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_fe462908-739b-48c9-ab2d-532aa1980e75.jpg', 1, 3.799E+07, NULL, 200, 2, CAST(N'2024-06-25T21:01:28.9799784' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (54, N'Laptop Acer Gaming Nitro V ANV15-51-75GS', N'ANV15', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_29e76b46-c646-4864-98d5-d079cb8f745f.jpg', 1, 2.799E+07, NULL, 200, 2, CAST(N'2024-06-25T21:02:53.3552550' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (55, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', N'72vs', 2, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_59efd52f-7b96-43ac-a76c-a362a433a870.jpg', 1, 2.399E+07, NULL, 200, 2, CAST(N'2024-06-25T21:03:54.7032711' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (56, N'Laptop Gaming Acer Aspire 7 A715-76G-5806', N'A715', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_6790bbbc-0e0e-4145-b82c-b846bdb59576.jpg', 1, 2, NULL, 200, 2, CAST(N'2024-06-25T21:05:05.7112730' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (57, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN515', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_157d0f65-ef04-4b21-91b5-7c8ffe43e2c5.jpg', 1, 2, NULL, 200, 2, CAST(N'2024-06-25T21:06:31.1913538' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (58, N' Samsung Galaxy A15', N'A15', 1, N'Galaxy a15', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_a0a998b5-c0c8-446e-98b6-80d4cc747578.jpg', 1, 6900000, NULL, 200, 2, CAST(N'2024-06-25T21:13:28.9651682' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (59, N'Samsung Galaxy S23 Ultra 5G', N'S23', 1, N'Samsung Galaxy S23 Ultra 5G', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_12f7b92c-9268-4f63-b504-9ffc445c7e9b.jpg', 1, 2.49E+08, NULL, 200, 2, CAST(N'2024-06-25T21:14:24.6493054' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (60, N'Samsung Galaxy Watch5 40mm dây silicone', N'GW5', 10, NULL, 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_607bb973-4761-4d2b-9596-905fe208fdf4.jpg', 1, 4900000, NULL, 200, 2, CAST(N'2024-06-25T21:15:56.9574661' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (61, N'Samsung Galaxy Fit3 dây silicone', N'Fit3', 10, NULL, 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_1213fdfa-a571-4c95-bea3-001cc30ad9bd.jpg', 1, 1E+07, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (62, N'Samsung Galaxy A05s', N'A05s', 1, NULL, 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_c96eb2b8-6e8d-4a56-9a76-78f3f717d706.jpg', 1, 890, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (63, N'Samsung Galaxy S24 5G', N'GS24', 1, N'Samsung Galaxy S24 5G', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_137eb77f-6ec5-4920-b6e2-5b12feaecc64.jpg', 1, 2.699E+07, NULL, 200, 2, CAST(N'2024-06-26T21:32:55.1922293' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (64, N'Samsung Galaxy A15', N'GA15', 1, N'Samsung Galaxy A15', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0989fd97-5abb-412d-9439-a279c2f47ac9.jpg', 1, 6590000, NULL, 200, 2, CAST(N'2024-06-26T21:33:54.4490427' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (66, N'Samsung Galaxy Z Flip5 5G', N'ZFL5', 1, N'Samsung Galaxy Z Flip5 5G', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_ab940b09-e9f0-405f-99cc-14198a49928a.jpg', 1, 1.659E+07, NULL, 200, 2, CAST(N'2024-06-26T21:37:53.1683165' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (67, N'Samsung Galaxy S23 FE 5G 8GB/256GB', N'GS23FE', 1, NULL, 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_12953e61-5ce0-4cff-a454-9c4861c630e8.jpg', 1, 1.759E+07, NULL, 200, 2, CAST(N'2024-06-26T21:38:46.9274061' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (68, N'Asus Vivobook X1404ZA i3 1215U (NK246W)', N'X1404', 2, NULL, 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_39322138-e734-4d85-b345-d3f398bc83a3.jpg', 1, 9589997, NULL, 200, 2, CAST(N'2024-06-26T21:42:58.6124947' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (69, N'HP 15s fq5229TU i3 1215U (8U237PA)', N'HP15s', 2, N'HP 15s fq5229TU i3 1215U (8U237PA)', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_24bf74ed-44fa-4abc-b6ed-6bc96b5b0202.jpg', 1, 10589997, NULL, 200, 2, CAST(N'2024-06-26T21:45:37.5391591' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (70, N'Acer Aspire Lite 14 51M 59BN i5 1235U', N'AAL14', 2, N'Acer Aspire Lite 14 51M 59BN i5 1235U', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_5d6d979b-3bd0-4a56-a091-886f2441b83f.jpg', 1, 13589997, NULL, 200, 2, CAST(N'2024-06-26T21:46:32.6240940' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (71, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', N'ISl3', 2, NULL, 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_a286451f-500e-45bd-a608-11242b8782c6.jpg', 1, 11589997, NULL, 200, 2, CAST(N'2024-06-26T21:47:27.2024068' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (72, N'HP 15 fd0234TU i5 1334U (9Q969PA)', N'HP15U', 2, NULL, 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_6aa75b4f-4bbc-435b-b22a-420fbe150dcb.jpg', 1, 16589999, NULL, 200, 2, CAST(N'2024-06-26T21:48:27.4329132' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (73, N'Acer Aspire Lite 15 51M 55NB i5 1155G7', N'AL55NB', 2, NULL, 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e51f9138-d284-45e0-93a1-343de0d26560.jpg', 1, 16589999, NULL, 200, 2, CAST(N'2024-06-26T21:49:45.3530118' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (74, N'Lenovo Ideapad 1 15ALC7 R7 5700U (82R400C1VN)', N'5ALC7', 2, NULL, 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_a93afc73-4af3-43a1-8439-d36343a04b92.jpg', 1, 12389999, NULL, 200, 2, CAST(N'2024-06-26T21:53:15.1062126' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (75, N'Dell Vostro 15 3520 i5 1235U (i5U165W11GRU)', N'1235U', 2, N'Dell Vostro 15 3520 i5 1235U (i5U165W11GRU)', 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_997bbe75-5760-46c4-93cd-9916f22c33c2.jpg', 1, 16389999, NULL, 200, 2, CAST(N'2024-06-26T21:54:52.1712552' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (76, N'Asus Vivobook 16 X1605VA i5 1335U (MB360W)', N'MB360', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4276b7be-7d07-403f-a60c-d6fc37a16ece.jpg', 1, 15789999, NULL, 200, 2, CAST(N'2024-06-26T22:01:17.0758212' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (77, N'HP 245 G10 R5 7530U (A20TDPT)', N'GR10', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_f1558460-439e-4559-8e36-2a4bf140527a.jpg', 1, 0, NULL, 200, 2, CAST(N'2024-06-26T22:02:14.8738309' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (78, N'HP 15 fd0234TU i5 1334U (9Q969PA)', N'9Q96', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_2eb70284-ea54-417c-8c87-00a6a2d295ac.jpg', 1, 1.679E+07, NULL, 200, 2, CAST(N'2024-06-26T22:13:10.3586343' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (79, N'HP Pavilion 14 dv2073TU i5 1235U (7C0P2PA)', N'dv2073', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_29c1c68d-a2a7-4499-b6e4-71c0e7935095.jpg', 1, 1.719E+07, NULL, 200, 2, CAST(N'2024-06-26T22:24:06.8896648' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (80, N'Dell Inspiron 15 3520 i5 1235U (N5I5052W1)', N'N5I', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_14ec6d7a-8281-4d16-85ff-13cbc7a631cc.jpg', 1, 1.649E+07, NULL, 200, 2, CAST(N'2024-06-26T22:29:54.1657599' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (81, N'HP 15s fq5162TU i5 1235U (7C134PA)', N'7C1', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_f074707d-590d-44eb-9312-18b3698ef54e.jpg', 1, 1.499E+07, NULL, 200, 2, CAST(N'2024-06-26T22:30:54.0309789' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (82, N'MSI Modern 15 B12MO i5 1235U (625VN)', N'625VN', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_6861d7bf-8897-4025-aa0d-14ad921ae8b3.jpg', 1, 11990001, NULL, 200, 2, CAST(N'2024-06-26T22:31:38.9516603' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (83, N'Lenovo Ideapad Slim 3 15AMN8 R5 7520U', N'15AM', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_d2cc894f-8bd4-49e7-b4d7-67d4ea8cd69b.jpg', 1, 1.169E+07, NULL, 200, 2, CAST(N'2024-06-26T22:32:27.2726335' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (84, N'MacBook Air 15 inch M2 Sạc 70W', N'M2', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_2f716985-50ec-45e9-bfbf-1929e079ab3a.jpg', 1, 1.599E+07, NULL, 200, 2, CAST(N'2024-06-26T22:33:21.0382272' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (85, N'Samsung Galaxy M34 5G 8GB 128GB', N'M34', 1, N'Samsung Galaxy M34 5G 8GB 128GB', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_1421961e-f6ac-4e41-b07f-a952dbefbaf0.jpg', 1, 5790000, NULL, 200, 3, CAST(N'2024-06-27T15:58:49.0937858' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (86, N'Samsung Galaxy A55 5G 8GB 128GB', N'A55', 1, NULL, 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_934ce41f-7ade-415b-858b-7d7e3906d417.jpg', 1, 9.679E+07, NULL, 200, 3, CAST(N'2024-06-27T15:59:39.1177489' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (87, N'Samsung Galaxy A54 5G 8GB 128GB', N'A54', 1, NULL, 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_bfbab7ed-1a42-480d-8aa8-7472e3f57be1.jpg', 1, 9090000, NULL, 200, 3, CAST(N'2024-06-27T16:00:32.9404042' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (88, N'Smart Tivi Samsung UHD 4K 43 inch UA43AU7002', N'UA4', 3, NULL, 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_32f6de42-08f4-46bd-b7dd-781e24b9506d.jpg', 1, 6290000, NULL, 200, 3, CAST(N'2024-06-27T16:02:19.7857997' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (89, N'Smart Tivi Samsung 4K 55 inch UA55AU7002', N'UA55', 3, N'Smart Tivi Samsung 4K 55 inch UA55AU7002', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_6a9c9a44-9891-4d42-8217-00e7df3d3ed0.jpg', 1, 7890000, NULL, 200, 3, CAST(N'2024-06-27T16:03:24.6023615' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (90, N' Smart Tivi Samsung QLED 55 inch 55Q60BAK', N'55Q6', 3, N'Smart Tivi Samsung QLED 55 inch 55Q60BAK', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_79b33228-0e06-445b-b8a5-ebb76edba6ac.jpg', 1, 1.149E+07, NULL, 200, 3, CAST(N'2024-06-27T16:04:31.1188234' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (91, N'Smart Tivi Samsung Crystal UHD 4K 50 inch UA50AU7700KXXV', N'UA50', 3, N'Smart Tivi Samsung Crystal UHD 4K 50 inch UA50AU7700KXXV', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_3a01fb94-c3ae-496d-817c-1e0311fc9d28.jpg', 1, 8690000, NULL, 200, 3, CAST(N'2024-06-27T16:05:39.9719940' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (92, N'Loa tháp Samsung MX-T70', N'MXT7', 6, N'Loa tháp Samsung MX-T70', 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e9e9288a-12e6-45ce-8066-be028515edfb.jpg', 1, 4690000, NULL, 200, 3, CAST(N'2024-06-27T16:06:33.1661976' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (93, N'Loa thanh Samsung HW-Q600C/XV', N'HWQ6', 6, NULL, 6, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_c3ca7aeb-50dd-49fb-a295-e84b7fbaea21.jpg', 1, 4390000, NULL, 200, 3, CAST(N'2024-06-27T16:07:22.5589905' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (94, N'Bàn phím + Bao da Samsung Galaxy Tab S9 Plus | S9 FE Plus chính hãng', N'TS9P', 8, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_c1be5671-93b8-4057-b438-b0f9d0d5bfc0.jpg', 1, 3590000, NULL, 200, 3, CAST(N'2024-06-27T16:08:53.4142275' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (95, N'Robot hút bụi Samsung JETBOT VR30T85513W/SV', N'VR30', 7, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_95aa59b4-58ac-4959-b247-b1800be5e3de.jpg', 1, 1.199E+07, NULL, 200, 3, CAST(N'2024-06-27T16:10:02.2670207' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (96, N'Robot hút bụi Samsung Powerbot-E', N'PE1', 7, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_08b24865-938b-4f20-a0fc-b61c5af86e82.jpg', 1, 4990000, NULL, 200, 3, CAST(N'2024-06-27T16:11:23.4619697' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (97, N'Máy hút bụi cầm tay Samsung 3in1 VS03R6523J1/SV', N'VS03', 7, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_73b452dc-6e38-4839-8709-27e6c4893740.jpg', 1, 3690000, NULL, 200, 3, CAST(N'2024-06-27T16:12:41.0377615' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (98, N'Máy lọc không khí Samsung AX40R3030WM/SV', N'Ã4', 7, N'Máy lọc không khí Samsung AX40R3030WM/SV', 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_28b1883b-2354-40df-8e83-ec84a4a1ce29.jpg', 1, 4690000, NULL, 200, 3, CAST(N'2024-06-27T16:13:36.2186231' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (99, N'Máy lọc không khí Samsung AX34R3020WW/SV', N'AX34', 7, N'Máy lọc không khí Samsung AX34R3020WW/SV', 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_b16e03c5-fc45-4fe8-a8c0-883e2572bb10.jpg', 1, 3690000, NULL, 200, 3, CAST(N'2024-06-27T16:14:23.2535500' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (100, N'Máy lọc không khí Samsung AX32BG3100GB/SV BE', N'AX32', 7, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_7a57987b-e70c-4aaf-92f7-17948bd53b99.jpg', 1, 4390000, NULL, 200, 3, CAST(N'2024-06-27T16:15:03.9567899' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (101, N'Samsung Galaxy Watch4 40mm', N'GW4', 10, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_fbad68fc-f94e-4804-a485-63ba9187cb5a.jpg', 1, 3290000, NULL, 200, 3, CAST(N'2024-06-27T16:15:55.7687342' AS DateTime2), 6)
GO
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (102, N'Samsung Galaxy Watch6 Classic 43mm Bluetooth', N'GW6', 10, NULL, 7, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4b1eeb10-4d12-4205-bb86-c2516af33cba.jpg', 1, 7489999, NULL, 200, 3, CAST(N'2024-06-27T16:16:41.6713600' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (103, N'PC CPS Gaming G04 i5 12400F / 8GB - 256GB / GTX 1650', N'G04', 9, NULL, 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_427c8a73-d305-4f39-b95b-729b2892c0c8.jpg', 1, 11789999, NULL, 200, 3, CAST(N'2024-06-27T16:19:00.1892366' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (104, N'PC CPS Gaming G14', N'G14', 9, N'PC CPS Gaming G14', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e9ff6890-0c07-4575-b18e-abe6f60d3d37.jpg', 1, 10789999, NULL, 200, 3, CAST(N'2024-06-27T16:19:48.5778167' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (105, N'Máy tính All In One văn phòng MSI PRO-AP242-12M-213VN', N'AP242', 9, NULL, 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_d4a54dc4-1e33-4416-ad39-6d46c3ed6f69.jpg', 1, 13789999, NULL, 200, 3, CAST(N'2024-06-27T16:21:20.6120077' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (106, N'PC CPS văn phòng S04 i5 12400 / 8GB - 240GB', N'S04', 9, N'PC CPS văn phòng S04 i5 12400 / 8GB - 240GB', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_09ca9bad-ed11-4324-aeb1-5d574800b1ab.jpg', 1, 8789999, NULL, 200, 3, CAST(N'2024-06-27T16:22:11.1556119' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (107, N'PC CPS Gaming G06 i5 12400F / 8GB - 256GB / RTX 3060', N'G06', 9, NULL, 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_d0b00568-12be-4686-b513-779f4f059981.jpg', 1, 1.879E+07, NULL, 200, 3, CAST(N'2024-06-27T16:23:12.4228428' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (108, N'Máy tính AIO ASUS A3402WBAK-WPC048W', N'A34', 9, N'Máy tính AIO ASUS A3402WBAK-WPC048W', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0005209b-0130-4a5a-b6be-217a9dbf5a4f.jpg', 1, 1.379E+07, NULL, 200, 3, CAST(N'2024-06-27T16:24:00.9147358' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (109, N'Máy tính AIO ASUS A3402WBAK-WPC048W', N'WPC04', 9, N'Máy tính AIO ASUS A3402WBAK-WPC048W', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_31cd1823-884e-4905-bd97-3ff0aa4055d7.jpg', 1, 790000, N'', 200, 3, CAST(N'2024-06-27T16:25:20.0989850' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (110, N'Ổ cứng di động SSD Kingston XS1000 USB 3.2 Gen 2 1TB', N'XS1000', 9, N'Ổ cứng di động SSD Kingston XS1000 USB 3.2 Gen 2 1TB', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_28b4a1d0-a5ab-4022-9e6a-2266a66dc815.jpg', 1, 2090000, NULL, 200, 3, CAST(N'2024-06-27T16:26:17.5954514' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (111, N'Ổ cứng SSD Kingston NV2 M.2 PCIe Gen4 NVMe 1TB', N'NV2M', 9, N'Ổ cứng SSD Kingston NV2 M.2 PCIe Gen4 NVMe 1TB', 8, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_7c86c246-ebcd-4067-a410-c4f5b5019b70.jpg', 1, 1790000, NULL, 200, 3, CAST(N'2024-06-27T16:28:36.4140037' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (112, N'Case máy tính DeepCool Macube 110', N'M110', 9, N'Case máy tính DeepCool Macube 110', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_86d179d8-c22b-454b-815a-abaaefd137cf.jpg', 1, 950000, NULL, 200, 3, CAST(N'2024-06-27T16:30:06.3537078' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (113, N'RAM Laptop Samsung 8GB DDR4 3200MHz', N'SDR4', 9, N'RAM Laptop Samsung 8GB DDR4 3200MHz', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4672fc59-58eb-4316-abaf-1c01283c8460.jpg', 1, 590000, NULL, 200, 3, CAST(N'2024-06-27T16:31:02.9746246' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (114, N'Ổ cứng di động Sandisk E61 Extreme V2 SSD 1TB USB 3.2', N'E61', 9, N'Ổ cứng di động Sandisk E61 Extreme V2 SSD 1TB USB 3.2', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_926b1bd5-115b-468b-a661-ce8ef6604e0a.jpg', 1, 2.859E+07, NULL, 200, 3, CAST(N'2024-06-27T16:31:50.9534315' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (115, N'CPU Intel Core i5 12400F', N'12F', 9, N'CPU Intel Core i5 12400F', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_755d11c4-e081-4c1b-8873-3e45507c2456.jpg', 1, 3590000, NULL, 200, 3, CAST(N'2024-06-27T16:32:52.2237744' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (116, N'Nguồn máy tính DeepCool PK750D 750W', N'PK75', 9, N'Nguồn máy tính DeepCool PK750D 750W', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_702f6bbe-81b3-40b6-82e2-83ffb664bba1.jpg', 1, 1490000, NULL, 200, 3, CAST(N'2024-06-27T16:33:43.8820322' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (117, N'Card màn hình Gigabyte Geforce RTX 3060 Gaming OC 12GB', N'OC12', 9, N'Card màn hình Gigabyte Geforce RTX 3060 Gaming OC 12GB', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_8b36ceef-2e97-4a32-b7d8-e895835dcf44.jpg', 1, 8490000, NULL, 200, 3, CAST(N'2024-06-27T16:34:45.0175472' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (118, N'Mainboard Asus PRIME H610M-K D4', N'H610M', 9, N'Mainboard Asus PRIME H610M-K D4', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0362199c-8816-413d-86e6-1c12c9517c0c.jpg', 1, 1990000, NULL, 200, 3, CAST(N'2024-06-27T16:35:43.9385776' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (119, N'Máy in Laser Brother HL-L2321D', N'L232', 7, N'Máy in Laser Brother HL-L2321D', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_7e6f340f-bdd8-483d-98f2-e7178f082dd9.jpg', 1, 2990000, NULL, 200, 3, CAST(N'2024-06-27T16:37:00.5157033' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (120, N'Máy in Laser Brother DCP-B7535DW', N'DCP7', 7, N'Máy in Laser Brother DCP-B7535DW', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_9942a629-8727-44ad-92fb-864f21ad93d0.jpg', 1, 5690000, NULL, 200, 3, CAST(N'2024-06-27T16:37:54.1617842' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (121, N'BBBB321', N'BBBB321', 2, N'BBBB321', 2, N'Thùng', N'https://localhost:7033/uploads/a_311fd0c9-aae8-4b30-9893-7bbccc72c3e7.jfif', 1, 0, N'BBBB321', 150, 10, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (122, N'ipad2024', N'ip2024', 5, N'ipad new', 3, N'Thùng', N'https://localhost:7033/uploads/a_05e65bff-29b9-4de6-b5a9-cfaca296329d.jfif', 1, 78349, N'sadfas', 98, 1000, CAST(N'2024-07-12T17:19:58.6983611' AS DateTime2), 7)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (123, N'VVVV321', N'VD3213', 1, N'SFFG', 4, N'Thùng', N'https://localhost:7033/uploads/a_c1b1fa21-e757-4480-9366-0cece9257068.jfif', 1, 0, N'5612469777', 5000, 10, CAST(N'2024-07-14T10:50:17.8905169' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (124, N'Ví Da cao cấp', N'VDCC333', 2, N'Ví Da cao cấp', 5, N'Thùng', N'https://localhost:7033/uploads/a_ebdc61c2-d81d-443d-bf0d-1d03744b8bd3.jfif', 1, 0, N'893200179919', 1000, 10, CAST(N'2024-07-14T14:49:10.1907451' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (125, N'TiVi TàuV3', N'TVV3', 3, N'GGGGGGGGGGGGGGGGGGGGGGGG', 9, N'Kg', N'https://localhost:7033/uploads/a_0d326fac-71aa-425b-a402-32f14de8d3c1.jfif', 1, 0, N'893200114929', 1000, 10, NULL, 32)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (126, N'ASANZO           3', N'AS        3', 2, N'sssssssssssssssssss', 4, N'Thùng', N'https://localhost:7033/uploads/a_ec59002e-9cd7-4f84-a984-1e6365101e3a.jfif', 1, 0, N'893200115874', 10000, 10, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (127, N'Tivi Sony', N'MH370', 3, N'fsd', 3, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.1527837' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (128, N'Tivi Sony1', N'MH371', 4, N'fsd', 4, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2234563' AS DateTime2), 4)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (129, N'Tivi Sony2', N'MH372', 5, N'fsd', 5, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2291873' AS DateTime2), 5)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (130, N'Tivi Sony3', N'MH373', 6, N'fsd', 6, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2332660' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (131, N'Tivi Sony4', N'MH374', 7, N'fsd', 7, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2370075' AS DateTime2), 7)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (132, N'Tivi Sony', N'MH375', 3, N'fsd', 8, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2402439' AS DateTime2), 8)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (133, N'Tivi Sony5', N'MH376', 4, N'fsd', 3, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2444548' AS DateTime2), 9)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (134, N'Tivi Sony6', N'MH377', 5, N'fsd', 4, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2476431' AS DateTime2), 10)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (135, N'Tivi Sony7', N'MH378', 6, N'fsd', 5, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2511618' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (136, N'Tivi Sony88', N'MH391', 7, N'fsd', 6, N'Thùng', N'https://localhost:7033/uploads/ánhduowng_a2768c56-4345-4891-85cc-088e3ce7946b.jpg', 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2554115' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (137, N'Tivi Sony', N'dfsajl', 3, N'fsd', 7, N'Thùng', N'https://localhost:7033/uploads/ánhduowng_46ca5ca1-e6b1-4b17-afc6-23edaea42538.jpg', 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-24T00:31:13.2595688' AS DateTime2), 13)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (138, N'Tivi Ultral', N'TVUL', 3, N'fdsaf', 4, N'Thùng', N'https://localhost:7033/uploads/ánhduowng_1678e545-6e39-4cd8-a7b7-26eb79e9c6d5.jpg', 1, 0, NULL, 4, 1, CAST(N'2024-07-25T15:59:54.5378184' AS DateTime2), 1)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (139, N'Tivi Sony8', N'MH379', 7, N'fsd', 6, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-26T16:24:03.8593688' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (140, N'Tivi Sony', N'MH380', 3, N'fsd', 7, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-26T16:24:03.8729588' AS DateTime2), 13)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (141, N'Cur hanfh', N'cuhanh', 8, N'sfdsfa', 2, N'Kg', N'https://localhost:7033/uploads/ánhduowng_72e167dd-0461-4350-a084-76815acaeabb.jpg', 1, 0, NULL, 5, 1, CAST(N'2024-07-28T14:10:34.5209828' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (142, N'Tivi Sony', N'MH381', 3, N'fsd', 3, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8442727' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (143, N'Tivi Sony', N'MH382', 4, N'fsd', 4, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8600818' AS DateTime2), 4)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (144, N'Tivi Sony', N'MH383', 5, N'fsd', 5, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8649814' AS DateTime2), 5)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (145, N'Tivi Sony', N'MH384', 6, N'fsd', 6, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8694834' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (146, N'Tivi Sony', N'MH385', 7, N'fsd', 7, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8735164' AS DateTime2), 7)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (147, N'Tivi Sony', N'MH386', 8, N'fsd', 8, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8773057' AS DateTime2), 8)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (148, N'Tivi Sony', N'MH387', 9, N'fsd', 9, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8810649' AS DateTime2), 9)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (149, N'Tivi Sony', N'MH388', 10, N'fsd', 10, N'Thùng', NULL, 1, 0, N'sfdsdf', 200, 4, CAST(N'2024-07-28T14:48:13.8840511' AS DateTime2), 10)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (150, N'mì tôm', N'omc1', 1, N'dsfa', 2, N'Thùng', N'https://localhost:7033/uploads/ánhduowng_08ad99ce-c265-464e-9f50-c068cc76802d.jpg', 1, 0, N'893-24-omc1', 5, 1, CAST(N'2024-07-28T14:53:33.6667437' AS DateTime2), 5)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (151, N'Tivi Sony', N'MH389', 4, N'fsd', 9, N'Thùng', NULL, 1, 0, N'VN24MH389', 200, 4, CAST(N'2024-08-03T21:37:32.8403974' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (152, N'Tivi Sony', N'MH390', 5, N'fsd', 9, N'Thùng', NULL, 1, 0, N'VN24MH390', 200, 4, CAST(N'2024-08-03T21:37:32.8965643' AS DateTime2), 12)
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
SET IDENTITY_INSERT [dbo].[GoodsHistory] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 103)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 707)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 7, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 8, 175)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 10, 5)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 11, 10)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 2, 66)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 10000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 2, 88)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (15, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (16, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (17, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (18, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (19, 4, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (20, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (21, 2, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (22, 3, 500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (23, 4, 600)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (24, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 1, 4000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 2, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 1, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (27, 1, 6000)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (27, 2, 30)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (28, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 4, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (30, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (31, 2, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (32, 4, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (33, 1, 500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (34, 2, 600)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (35, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (36, 1, 20)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (37, 2, 30)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (38, 4, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (39, 2, 70)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (41, 3, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (42, 1, 500)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (43, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (44, 2, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (45, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (46, 3, 70)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (47, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (48, 3, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (49, 4, 34)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (50, 4, 55)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (53, 3, 120)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (54, 3, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (55, 4, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (56, 1, 2)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (56, 4, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 1, 2)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 4, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (58, 1, 70)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (59, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (60, 2, 101)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (61, 2, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 2, 20)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (63, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (64, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (66, 4, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (67, 4, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (68, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (69, 3, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (70, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (71, 3, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (72, 4, 53)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (73, 4, 46)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (74, 4, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (75, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (76, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (77, 1, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (78, 2, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (79, 2, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (80, 2, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (81, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 3, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (83, 4, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (84, 4, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (85, 1, 79)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (86, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (87, 2, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (88, 2, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (89, 3, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (90, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (91, 3, 56)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (92, 4, 27)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (93, 4, 64)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (94, 1, 36)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (95, 1, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (96, 2, 79)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (97, 2, 10)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (98, 3, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (99, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (100, 4, 200)
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (101, 4, 43)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (102, 4, 57)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (103, 1, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (104, 1, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (105, 2, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (106, 2, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (107, 3, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (108, 3, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (109, 3, 56)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (110, 4, 55)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (111, 4, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (112, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (113, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (114, 1, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (115, 2, 56)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (116, 2, 38)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (117, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (118, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (118, 4, 59)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (119, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (119, 4, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (120, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (120, 4, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (121, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (122, 3, 2024)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (134, 7, 80)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (141, 8, 232)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 8, 17)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (142, 11, 81)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (148, 3, 0)
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

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (1, 15, 1, 0, N'', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 3, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (2, 15, 2, 0, N'', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T16:06:27.3141600' AS DateTime2), 5, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (3, 15, 3, 0, N'', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 3, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (4, 15, 4, 0, N'', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 3, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (5, 11, 1, 500, N'Ghi chú cho đơn hàng 5', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 4, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (6, 12, 2, 750, N'Ghi chú cho đơn hàng 6', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 4, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (7, 13, 3, 320.5, N'Ghi chú cho đơn hàng 7', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 4, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (8, 14, 4, 450.75, N'Ghi chú cho đơn hàng 8', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 4, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (9, 11, 1, 500, N'Ghi chú cho đơn hàng 9', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 4, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (10, 12, 2, 750, N'Ghi chú cho đơn hàng 10', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 4, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (11, 13, 3, 320.5, N'Ghi chú cho đơn hàng 11', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 4, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (12, 14, 4, 450.75, N'Ghi chú cho đơn hàng 12', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 4, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (13, 15, 69, 0, N'', CAST(N'2024-06-28T16:27:19.4455423' AS DateTime2), CAST(N'2024-06-28T16:36:36.4316659' AS DateTime2), 3, N'IMPTUNGNGU123', 1, 1, N'https://localhost:7033/uploads/a_4c42ac5f-6168-4309-aa02-fb7315ad4f6d.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (14, 15, 69, 2E+08, N'', CAST(N'2024-06-28T16:42:03.3549866' AS DateTime2), CAST(N'2024-06-28T16:42:59.6008924' AS DateTime2), 4, N'IMPDA', 1, 1, NULL, 16, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (15, 15, 4, 0, N'', CAST(N'2024-06-30T13:56:50.3952776' AS DateTime2), CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), 4, N'IMPHKS34124', 1, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (16, 15, 69, 0, N'', CAST(N'2024-06-30T14:34:05.7679946' AS DateTime2), CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), 4, N'IMPHKS31424', 1, 1, NULL, NULL, 4)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (17, 15, 5, 4, N'', CAST(N'2024-06-30T14:47:39.8608749' AS DateTime2), CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), 4, N'IMPHKS4255', 3, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (18, 15, 4, 6, N'', CAST(N'2024-07-01T13:36:18.7447509' AS DateTime2), CAST(N'2024-07-14T00:00:00.0000000' AS DateTime2), 4, N'IMPHKS42425', 4, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (19, 15, 5, 54756, N'', CAST(N'2024-07-01T13:37:50.0696222' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPHS31253', 1, 1, N'https://localhost:7033/uploads/a_f29caa13-9fe4-47d7-a4af-9900dfa7205f.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (20, 15, 5, 6, N'', CAST(N'2024-07-01T13:40:04.2876811' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPHKS32561', 4, 1, N'https://localhost:7033/uploads/a_f29caa13-9fe4-47d7-a4af-9900dfa7205f.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (21, 15, 4, 4, N'', CAST(N'2024-07-01T13:46:07.9194952' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPKXg4235', 4, 1, N'https://localhost:7033/uploads/a_f29caa13-9fe4-47d7-a4af-9900dfa7205f.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (22, 15, 4, 84, N'', CAST(N'2024-07-01T13:49:02.2451026' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPkaaaa34425', 4, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (23, 15, 4, 4, N'', CAST(N'2024-07-01T13:51:48.3799438' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPSFS34255', 3, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (24, 16, 4, -28, N'', CAST(N'2024-07-01T13:54:32.1818764' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 3, N'IMPVKS42552', 2, 3, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (25, 15, 4, 4, N'', CAST(N'2024-07-01T14:18:37.1777050' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPVBS42352', 3, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (26, 15, 4, 4, N'', CAST(N'2024-07-01T14:21:09.2795781' AS DateTime2), CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), 4, N'IMPVNXSD4235', 3, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (28, 16, 4, -200, N'', CAST(N'2024-07-03T14:22:11.4890446' AS DateTime2), CAST(N'2024-07-03T00:00:00.0000000' AS DateTime2), 3, N'IMPDGG256', 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (29, 15, 3, 1.585784E+08, N'', CAST(N'2024-07-12T17:29:34.9461107' AS DateTime2), CAST(N'2024-07-12T17:33:24.0048407' AS DateTime2), 4, N'IMPimportnew', 3, 1, NULL, 16, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (30, 15, 4, 0, N'', CAST(N'2024-07-15T14:41:38.4353875' AS DateTime2), CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), 3, N'IMPBNVS1415', 2, 1, N'https://localhost:7033/uploads/a_43979d1f-4484-4ce1-af0f-980c5048190b.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (31, 17, 4, 0, N'', CAST(N'2024-07-15T22:37:06.9415279' AS DateTime2), CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), 3, N'IMPfsdfs', 2, 1, N'https://localhost:7033/uploads/a_e2a84687-c2c9-4100-8489-adc2d15dd1f9.jfif', 12, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (32, 15, 69, 0, N'', CAST(N'2024-07-16T09:39:56.0305096' AS DateTime2), CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), 3, N'IMPdfsffsf', 1, 1, N'https://localhost:7033/uploads/a_582d1f6f-2c7a-474e-9b1f-e506c5b13720.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (33, 16, 69, 0, N'', CAST(N'2024-07-16T09:56:17.2101487' AS DateTime2), CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), 3, N'IMPsadadaf', 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (34, 15, 69, 0, N'', CAST(N'2024-07-16T09:57:35.1044689' AS DateTime2), CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), 3, N'IMPdbdasgdffsd32', 2, 1, N'https://localhost:7033/uploads/a_831a7470-7a9e-47da-b38d-6558eb644c68.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (35, 15, 69, 0, N'', CAST(N'2024-07-16T10:02:36.4639057' AS DateTime2), CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), 3, N'IMPlsdddada32341', 1, 1, N'https://localhost:7033/uploads/a_c76e9fbf-5be9-4817-a202-eee1cc1b454e.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (36, 15, 4, 0, N'', CAST(N'2024-07-17T10:37:38.7749311' AS DateTime2), CAST(N'2024-07-17T00:00:00.0000000' AS DateTime2), 3, N'IMPfdsfsfs3414', 2, 1, N'https://localhost:7033/uploads/a_6e48adfd-337e-4197-8c05-4c6000f1967e.jfif', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (37, 17, 4, 0, N'', CAST(N'2024-07-21T14:06:15.3069030' AS DateTime2), CAST(N'2024-07-21T00:00:00.0000000' AS DateTime2), 3, N'IMPfsdf1314', 2, 1, NULL, 12, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (38, 15, 4, 0, N'', CAST(N'2024-07-21T14:14:21.8637420' AS DateTime2), CAST(N'2024-07-21T00:00:00.0000000' AS DateTime2), 3, N'IMPfsdfs4351', 2, 1, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (39, 15, 4, 0, N'', CAST(N'2024-07-22T13:14:17.5831859' AS DateTime2), CAST(N'2024-07-22T13:14:30.3099346' AS DateTime2), 4, N'IMPKFd23311', 1, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (40, 15, 4, 0, N'', CAST(N'2024-07-23T15:03:45.3257409' AS DateTime2), CAST(N'2024-07-23T15:04:36.7018242' AS DateTime2), 4, N'IMP42342521', 1, 2, N'https://localhost:7033/uploads/a_8007cd27-0a41-4bf8-b754-9aa0e512e631.jfif', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (41, 15, 4, 0, N'', CAST(N'2024-07-23T21:57:12.8648762' AS DateTime2), CAST(N'2024-07-23T00:00:00.0000000' AS DateTime2), 3, N'IMP20240530001	', 1, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (42, 15, 5, 0, N'', CAST(N'2024-07-24T16:33:42.0338376' AS DateTime2), CAST(N'2024-07-24T21:32:43.6796068' AS DateTime2), 4, N'IMP20240724163342', 1, 2, N'https://localhost:7033/uploads/ánhduowng_f170020f-e530-46a7-85f9-0a4f012c85c8.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (43, 15, 1, 0, N'', CAST(N'2024-07-24T17:53:32.3381777' AS DateTime2), CAST(N'2024-07-24T18:08:07.4865400' AS DateTime2), 4, N'IMP20240724175332', 7, 2, N'https://localhost:7033/uploads/ánhduowng_3dcf71e5-b9f9-4fa2-b49b-f3c4d15d6893.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (44, 15, 1, 0, N'', CAST(N'2024-07-24T18:08:40.9789042' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 3, N'IMP20240724180840', 6, 2, NULL, 19, 7)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (45, 15, 4, 0, N'', CAST(N'2024-07-24T21:30:24.8358118' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 3, N'IMP20240724213024', 7, 2, N'https://localhost:7033/uploads/ánhduowng_1fe06602-eacc-4087-afd7-7d73dbb466e2.jpg', 19, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (46, 15, 4, 0, N'', CAST(N'2024-07-24T21:31:56.0975069' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 3, N'IMP20240724213156', 1, 2, N'https://localhost:7033/uploads/ánhduowng_1fe06602-eacc-4087-afd7-7d73dbb466e2.jpg', 19, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (47, 15, 4, 0, N'', CAST(N'2024-07-25T16:06:11.5144405' AS DateTime2), CAST(N'2024-07-25T16:06:27.2174474' AS DateTime2), 4, N'IMP20240725160611', 7, 2, N'https://localhost:7033/uploads/ánhduowng_e2415583-51d5-4766-aad7-7a3f519e300a.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (48, 15, 1, 0, N'', CAST(N'2024-07-25T16:40:55.1697426' AS DateTime2), CAST(N'2024-07-30T17:15:00.1149026' AS DateTime2), 5, N'IMP20240725164055', 8, 2, N'https://localhost:7033/uploads/ánhduowng_5b0a2336-01cb-4126-b922-11eccbe5481b.jpg', NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (49, 15, 2, 0, N'', CAST(N'2024-07-25T18:08:04.1458687' AS DateTime2), CAST(N'2024-07-25T18:08:39.7320994' AS DateTime2), 4, N'IMP20240725180804', 2, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (50, 15, 2, 0, N'', CAST(N'2024-07-25T18:12:11.2066734' AS DateTime2), CAST(N'2024-07-25T18:12:22.2419381' AS DateTime2), 4, N'IMP20240725181211', 2, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (51, 37, 2, 0, N'', CAST(N'2024-07-26T09:34:06.4734941' AS DateTime2), CAST(N'2024-07-29T10:21:15.3649217' AS DateTime2), 5, N'IMP20240726093406', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (52, 15, 2, 0, N'', CAST(N'2024-07-26T09:48:44.2588531' AS DateTime2), CAST(N'2024-07-26T09:48:54.5444794' AS DateTime2), 3, N'IMP20240726094844', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (53, 15, 2, 0, N'', CAST(N'2024-07-30T16:27:19.3899539' AS DateTime2), CAST(N'2024-07-30T16:28:35.2376766' AS DateTime2), 5, N'IMP20240730162719', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (54, 15, 1, 0, N'', CAST(N'2024-07-30T16:38:41.1626803' AS DateTime2), CAST(N'2024-07-30T23:55:19.1362760' AS DateTime2), 4, N'IMP20240730163841', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (55, 15, 2, 0, N'', CAST(N'2024-07-30T17:18:40.1615039' AS DateTime2), CAST(N'2024-07-30T17:27:00.8605182' AS DateTime2), 4, N'IMP20240730171840', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (56, 15, 2, 0, N'', CAST(N'2024-07-30T17:27:49.0172741' AS DateTime2), CAST(N'2024-07-30T17:28:00.4265761' AS DateTime2), 4, N'IMP20240730172748', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (57, 15, 3, 0, N'', CAST(N'2024-07-30T17:31:13.6304723' AS DateTime2), CAST(N'2024-07-30T17:33:34.5768144' AS DateTime2), 5, N'IMP20240730173113', 8, 2, NULL, 19, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (58, 15, 3, 0, N'', CAST(N'2024-07-30T17:32:42.3465155' AS DateTime2), CAST(N'2024-07-30T17:33:30.5953938' AS DateTime2), 4, N'IMP20240730173242', 8, 2, N'https://localhost:7033/uploads/ánhduowng_f4db3aec-ef95-4f19-8f91-cf0f104e1b8c.jpg', 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (59, 15, 3, 0, N'', CAST(N'2024-07-30T21:22:58.1735393' AS DateTime2), CAST(N'2024-07-30T23:55:36.1881116' AS DateTime2), 4, N'IMP20240730212258', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (60, 15, 3, 0, N'', CAST(N'2024-08-02T15:39:15.2532342' AS DateTime2), CAST(N'2024-08-02T15:39:34.4162293' AS DateTime2), 4, N'IMP20240802153915', 11, 2, NULL, 39, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (61, 15, 2, 0, N'', CAST(N'2024-08-02T16:25:00.9232131' AS DateTime2), CAST(N'2024-08-02T16:26:08.8959606' AS DateTime2), 4, N'IMP20240802162500', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (62, 15, 2, 0, N'', CAST(N'2024-08-02T18:44:13.1047691' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, N'IMP20240802184413', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (63, 15, 1, 0, N'', CAST(N'2024-08-02T20:43:54.7370048' AS DateTime2), CAST(N'2024-08-02T21:16:25.9001801' AS DateTime2), 5, N'IMP20240802204354', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (64, 15, 1, 0, N'', CAST(N'2024-08-02T20:46:33.8860534' AS DateTime2), CAST(N'2024-08-02T21:16:27.8628811' AS DateTime2), 5, N'IMP20240802204633', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (65, 15, 1, 0, N'', CAST(N'2024-08-02T20:47:23.9007261' AS DateTime2), CAST(N'2024-08-02T21:16:32.6597083' AS DateTime2), 5, N'IMP20240802204723', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (66, 15, 1, 0, N'', CAST(N'2024-08-02T20:47:58.8645121' AS DateTime2), CAST(N'2024-08-02T21:16:34.5705477' AS DateTime2), 5, N'IMP20240802204758', 10, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (67, 15, 1, 0, N'', CAST(N'2024-08-02T21:08:37.2182757' AS DateTime2), CAST(N'2024-08-02T21:16:36.1594612' AS DateTime2), 5, N'IMP20240802210837', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (68, 15, 1, 0, N'', CAST(N'2024-08-02T21:10:57.4918477' AS DateTime2), CAST(N'2024-08-02T21:16:38.0967937' AS DateTime2), 5, N'IMP20240802211057', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (69, 15, 1, 0, N'', CAST(N'2024-08-02T21:12:16.8534392' AS DateTime2), CAST(N'2024-08-02T21:16:40.1494903' AS DateTime2), 5, N'IMP20240802211216', 10, 3, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (70, 15, 1, 0, N'', CAST(N'2024-08-02T21:13:41.0680693' AS DateTime2), CAST(N'2024-08-02T21:16:41.9817556' AS DateTime2), 5, N'IMP20240802211341', 10, 2, NULL, 19, 8)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (71, 15, 1, 0, N'', CAST(N'2024-08-02T21:16:16.5098543' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, N'IMP20240802211616', 10, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (72, 15, 1, 0, N'', CAST(N'2024-08-02T21:18:00.3983886' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, N'IMP20240802211800', 10, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (73, 15, 1, 0, N'', CAST(N'2024-08-02T21:52:00.1048367' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, N'IMP20240802215200', 10, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (74, 15, 2, 0, N'', CAST(N'2024-08-03T21:46:00.8331928' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 3, N'IMP20240803214600', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (75, 15, 2, 0, N'', CAST(N'2024-08-03T23:27:50.0689169' AS DateTime2), CAST(N'2024-08-03T23:28:00.6108630' AS DateTime2), 4, N'IMP20240803232750', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (76, 15, 2, 0, N'', CAST(N'2024-08-03T23:29:37.8046843' AS DateTime2), CAST(N'2024-08-03T23:36:47.5195439' AS DateTime2), 5, N'IMP20240803232937', 8, 2, NULL, NULL, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (77, 15, 1, 0, N'', CAST(N'2024-08-03T23:38:04.5816333' AS DateTime2), CAST(N'2024-08-03T23:38:33.8598293' AS DateTime2), 4, N'IMP20240803233804', 10, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (78, 15, 2, 0, N'', CAST(N'2024-08-04T16:05:21.5594633' AS DateTime2), CAST(N'2024-08-04T16:05:32.6209134' AS DateTime2), 4, N'IMP20240804160521', 1, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (79, 15, 2, 0, N'', CAST(N'2024-08-07T19:46:22.6598476' AS DateTime2), CAST(N'2024-08-07T19:46:33.5844957' AS DateTime2), 4, N'IMP20240807194622', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (80, 15, 2, 0, N'', CAST(N'2024-08-08T12:28:45.1807591' AS DateTime2), CAST(N'2024-08-08T12:29:09.7896837' AS DateTime2), 4, N'IMP20240808122845', 8, 2, NULL, 15, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (81, 15, 1, 0, N'', CAST(N'2024-08-08T12:35:06.9534661' AS DateTime2), CAST(N'2024-08-08T12:35:31.5950917' AS DateTime2), 4, N'IMP20240808123506', 11, 2, NULL, 15, NULL)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (1, N'Batch001', 1, 1, 0, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-30T00:00:00.0000000' AS DateTime2), 124, 124)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (2, N'Batch002', 1, 2, 12.75, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 150, 150)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (3, N'Batch003', 4, 3, 0, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T00:00:00.0000000' AS DateTime2), 201, 201)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (4, N'Batch004', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 181, 181)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (6, N'Batch005', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 140, 140)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (7, N'Batch006', 1, 1, 10.5, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-30T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (8, N'Batch007', 1, 2, 12.75, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 150, 150)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (9, N'Batch008', 4, 3, 8.99, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (10, N'Batch009', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 180, 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (12, N'Batch0011', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 140, 140)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (13, N'SF4151', 13, 56, 0, CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 5, 5)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (14, N'GS4251', 13, 57, 0, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-06T00:00:00.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (15, N'KHS315445', 14, 27, 100000, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 3000, 3000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (16, N'HKS31545', 14, 3, 2000, CAST(N'2024-06-09T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 5000, 4616)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (17, N'HS31415', 14, 25, 100000, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 2000, 2000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (18, N'FSS3145', 17, 82, 2, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2024-06-29T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (19, N'Se153', 18, 74, 2, CAST(N'2024-07-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (20, N'FD42356', 19, 77, 234, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-12T00:00:00.0000000' AS DateTime2), 234, 234)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (21, N'Sdf3145', 20, 83, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (22, N'fSD45', 21, 73, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-12T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (23, N'sf334', 22, 72, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 42, 42)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (24, N'Sfd31', 23, 69, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-12T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (25, N'Sd2144', 24, 3, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-03T00:00:00.0000000' AS DateTime2), 2, -3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (26, N'DF314', 25, 70, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-12T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (27, N'SD31511', 26, 69, 2, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-12T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (28, N'FSG4256', 28, 3, 1, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (29, N'batch0712', 29, 122, 78349, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), 2024, 2024)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (31, N'GSD45125', 30, 25, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 20, 20)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (32, N'HDF31513', 31, 123, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (33, N'Gdfs3', 32, 25, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2000, 2000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (34, N'Gsad', 32, 3, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2000, 2000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (35, N'sadasffaf', 33, 25, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (36, N'fsfsgs', 33, 3, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (37, N'rwerewr', 34, 26, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 206, 206)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (38, N'lklk1', 34, 3, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (41, N'fdf321', 36, 123, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (42, N'Sd233', 36, 25, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2000, 2000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (43, N'Sd214', 36, 27, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2558, 2558)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (44, N'sssdd32', 36, 3, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-20T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (92, N'fsfsgs1', 33, 3, 0, CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 1001, 1001)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (93, N'sadasffaf', 33, 25, 0, CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (95, N'fds3141', 33, 25, 0, CAST(N'2024-07-21T06:59:58.2950000' AS DateTime2), CAST(N'2024-07-21T06:59:58.2950000' AS DateTime2), 0, 0)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (96, N'sada3', 37, 3, 0, CAST(N'2024-03-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (97, N'dsa314', 38, 25, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-27T00:00:00.0000000' AS DateTime2), 2909, 2909)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (98, N'dsa3143', 38, 25, 0, CAST(N'2024-05-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), 2910, 2910)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (99, N'dss', 40, 3, 0, CAST(N'2024-06-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), 100, 90)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (100, N'fdas', 41, 3, 0, CAST(N'2024-07-18T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (101, N'dsfa', 42, 77, 0, CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (102, N'fgfgds', 43, 1, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (103, N'cád', 44, 1, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (104, N'đâf', 45, 128, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (105, N'ssad', 46, 128, 0, CAST(N'2024-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (106, N'fsdaf', 47, 128, 0, CAST(N'2024-07-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 100, 0)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (107, N'sdfadfa', 47, 134, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 100, 80)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (108, N'fgdsfgfsd', 48, 1, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 103, 103)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (109, N'dfdsdsf', 49, 1, 0, CAST(N'2024-07-08T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (110, N'gfdsfdgs', 50, 1, 0, CAST(N'2024-07-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), 599, 599)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (111, N'dsfaf', 51, 1, 0, CAST(N'2024-07-24T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (114, N'dsfafdsffsdf', 51, 1, 0, CAST(N'2024-07-26T02:43:00.2680000' AS DateTime2), CAST(N'2024-07-26T02:43:00.2680000' AS DateTime2), 1000, 1000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (115, N'MLH20240802205457', 52, 1, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 6, 6)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (196, N'dsfsdfdf', 53, 141, 0, CAST(N'2024-07-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 3000, 3000)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (197, N'string', 54, 1, 0, CAST(N'2024-07-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), 201, -12)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (198, N'dsaf', 55, 1, 0, CAST(N'2024-07-23T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 200, 0)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (199, N'dfas', 55, 141, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (200, N'sfdf', 56, 1, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 20, 0)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (201, N'sdf', 56, 141, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 20, 20)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (202, N'fdsfds', 58, 142, 0, CAST(N'2024-07-16T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 20, 14)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (203, N'retr', 59, 142, 0, CAST(N'2024-07-22T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (204, N'ádfdasf', 60, 142, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 200, 81)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (205, N'sdff', 61, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 100, 79)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (208, N'fdgfd', 62, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (209, N'MLH20240802204305', 63, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (210, N'MLH20240802204612', 64, 1, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 6, 6)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (211, N'MLH20240802204627', 64, 141, 0, CAST(N'2024-07-31T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 5, 5)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (212, N'MLH20240802204717', 65, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (213, N'MLH20240802204753', 66, 141, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (214, N'MLH20240802204741', 66, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (215, N'MLH20240802210748', 67, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 7, 7)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (216, N'MLH20240802211050', 68, 141, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (217, N'MLH20240802211036', 68, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 4, 4)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (218, N'retrte', 69, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (219, N'ẻt', 69, 141, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (220, N'fgdfg', 70, 1, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 3, 3)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (221, N'MLH20240802211555', 71, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 7, 7)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (223, N'MLH20240802211754', 72, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-02T00:00:00.0000000' AS DateTime2), 5, 5)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (227, N'MLH20240803214543', 74, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 2, 2)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (229, N'MLH20240803232740', 75, 141, 0, CAST(N'2024-07-29T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 12, 17)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (230, N'MLH20240803232727', 75, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 12, 12)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (232, N'MLH20240803233743', 77, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-03T00:00:00.0000000' AS DateTime2), 5, 5)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (234, N'MLH20240804160511', 78, 1, 0, CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-04T00:00:00.0000000' AS DateTime2), 5, 5)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (235, N'MLH20240807194614', 79, 1, 0, CAST(N'2024-08-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-07T00:00:00.0000000' AS DateTime2), 12, 12)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (236, N'MLH20240808122837', 80, 1, 0, CAST(N'2024-08-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-10T00:00:00.0000000' AS DateTime2), 104, 88)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (237, N'MLH20240808123455', 81, 1, 0, CAST(N'2024-08-05T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), 10, 10)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryCheckDetails] ON 

INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (1, 1, 1, 100, 90, N'mất hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (2, 1, 2, 296, 300, N'thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (3, 2, 1, 100, 90, N'string 1')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (4, 2, 2, 296, 300, N'string 2')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (5, 3, 1, 50, 49, N'string 1')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (6, 3, 2, 50, 51, N'string 2')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (7, 4, 1, 67, 66, N'string')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (8, 6, 1, 79, 80, N'string')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (9, 7, 1, 79, 85, N'string')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (10, 8, 1, 12, 12, N'string')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (11, 9, 1, 104, 85, N'Thiếu hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (12, 10, 1, 104, 87, N'Thiếu hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (13, 11, 1, 104, 87, N'Thiếu hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (14, 11, 141, 12, 14, N'Thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (15, 12, 1, 104, 90, N'Thiếu hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (16, 13, 1, 104, 90, N'Thiếu hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (17, 14, 1, 104, 88, N'Thừa hàng')
INSERT [dbo].[InventoryCheckDetails] ([Id], [InventoryCheckId], [GoodId], [ExpectedQuantity], [ActualQuantity], [note]) VALUES (18, 14, 141, 12, 17, N'Thừa hàng')
SET IDENTITY_INSERT [dbo].[InventoryCheckDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[InventoryChecks] ON 

INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (1, 1, CAST(N'2024-07-30T05:38:28.8370000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (2, 1, CAST(N'2024-07-30T05:52:28.9670000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (3, 2, CAST(N'2024-07-30T13:01:17.5479219' AS DateTime2), 5)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (4, 8, CAST(N'2024-08-08T21:07:01.1279817' AS DateTime2), 5)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (6, 8, CAST(N'2024-08-05T11:11:15.9970000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (7, 1, CAST(N'2024-08-05T11:11:15.9970000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (8, 8, CAST(N'2024-08-07T09:11:15.6720000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (9, 8, CAST(N'2024-08-08T21:53:38.9383138' AS DateTime2), 4)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (10, 8, CAST(N'2024-08-08T20:54:05.9775690' AS DateTime2), 5)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (11, 8, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), 4)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (12, 8, CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), 3)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (13, 8, CAST(N'2024-08-08T23:26:15.1925194' AS DateTime2), 5)
INSERT [dbo].[InventoryChecks] ([Id], [WarehouseId], [CheckDate], [StatusId]) VALUES (14, 8, CAST(N'2024-08-08T23:41:36.5826585' AS DateTime2), 4)
SET IDENTITY_INSERT [dbo].[InventoryChecks] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (192, 38, N'yqz1Airp5EduLU/MhwaK/5WcQ8HTADfbwc5rRP1RzKU=', CAST(N'2024-08-02T00:54:41.8292174' AS DateTime2), CAST(N'2024-09-02T00:54:41.8292177' AS DateTime2), 0, N'3761923b-0cc2-4010-8382-4a77fba7f594')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (193, 39, N'FiA+YCX6IeLE7Aijx4q1wQ1BnY5kh4yZu3HJ5Qe3HIE=', CAST(N'2024-08-02T08:30:47.4199027' AS DateTime2), CAST(N'2024-09-02T08:30:47.4199789' AS DateTime2), 0, N'5bbeec84-9f2b-45fa-8f46-0d042991df4a')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (206, 15, N'nm0ZaU1PmVH0gLm7AQohqtlDA+KPqBiS6UMQlc7HAMw=', CAST(N'2024-08-05T11:14:40.2521847' AS DateTime2), CAST(N'2024-09-05T11:14:40.2521848' AS DateTime2), 0, N'703b05d7-af40-49eb-aa69-98ad9b827848')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnOrder] ON 

INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (1, N'RO001', CAST(N'2024-07-21T17:47:57.9600342' AS DateTime2), NULL, 1, 1, 4, 11, 12)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (2, N'RO002', CAST(N'2023-07-11T09:30:00.0000000' AS DateTime2), NULL, 2, 2, 1, 12, 13)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (3, N'RO003', CAST(N'2023-07-12T14:45:00.0000000' AS DateTime2), NULL, 3, 3, 5, 13, 11)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (5, N'ROsasdf', CAST(N'2024-07-11T17:14:14.1870000' AS DateTime2), NULL, 1, 2, 1, 11, 12)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (6, N'ROtest1', CAST(N'2024-07-21T07:18:29.2670000' AS DateTime2), NULL, 2, 3, 5, 11, 13)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (7, N'ROstring', CAST(N'2024-07-21T18:47:48.3109344' AS DateTime2), NULL, 2, 2, 4, 11, 11)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (8, N'ROopio', CAST(N'2024-07-21T16:59:37.3080000' AS DateTime2), NULL, 1, 1, 1, 21, NULL)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (9, N'ROfdsfsfdsfa', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T16:09:23.2352497' AS DateTime2), 7, 4, 4, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (10, N'ROdfsafds', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 7, 4, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (11, N'ROghdffd', CAST(N'2024-07-25T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-25T16:25:43.7673309' AS DateTime2), 7, 4, 4, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (12, N'ROsdffsd', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (13, N'ROdsf', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (14, N'ROsdeewr', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (15, N'ROabc', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (16, N'ROabcd', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (17, N'ROqqq', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (18, N'ROqqq435', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (19, N'ROsgfdg', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (20, N'ROfgsf', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (21, N'ROdfssfda', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (22, N'ROẻt435', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (23, N'ROqqqqq', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (24, N'ROdsffds', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (25, N'ROqưqe', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (26, N'RO123', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-26T16:14:33.5636904' AS DateTime2), 8, 2, 4, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (27, N'RO1234', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (28, N'RO12345', CAST(N'2024-07-26T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
INSERT [dbo].[ReturnOrder] ([ReturnOrderId], [ReturnOrderCode], [ReturnedDate], [ConfirmedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy]) VALUES (29, N'ROdfasfda', CAST(N'2024-08-08T00:00:00.0000000' AS DateTime2), CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 8, 2, 3, 15, 19)
SET IDENTITY_INSERT [dbo].[ReturnOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ReturnOrderDetail] ON 

INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (1, 1, 2, 10, N'Damaged goods', N'Batch001')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (2, 1, 2, 5, N'Incorrect item', N'BATCH002')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (3, 2, 3, 10, N'Expired goods', N'BATCH003')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (4, 3, 1, 15, N'Faulty product', N'BATCH004')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (5, 5, 1, 999, N'hong', N'asdfasd')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (7, 7, 25, 100, N'string', N'7823hweijf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (8, 9, 128, 50, N'k oke', N'fsdaf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (11, 10, 128, 500, N'fdsaf', N'fsdaf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (12, 11, 128, 50, N'fgsdg', N'fsdaf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (13, 11, 134, 20, N'ffdsg', N'sdfadfa')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (14, 15, 1, 400, N'fsdf', N'dfasdasf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (15, 26, 1, 24, N'jhgj', N'dfasdasf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (16, 27, 1, 36, N'hfghfhg', N'dfasdasf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (17, 28, 1, 76, N'hong hang', N'dfasdasf')
INSERT [dbo].[ReturnOrderDetail] ([ReturnOrderDetailId], [ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode]) VALUES (18, 29, 1, 12, N'hỏng', N'sdff')
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

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (1, N'Kho nội bộ123', N'0123456789', 2, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Logitech', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Samsung', N'0987654321', 1, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Crystal-Optech Co., Ltd', N'0912345678', 1, N'crystaloptech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Delta Electronics Incorporated', N'0123456789', 1, N'deltaelectronics@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Arist Benefex', N'0987654321', 1, N'aristbenefex@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'BrightHR', N'0912345678', 1, N'brighthr@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Engagedly Inc.', N'0123456789', 1, N'engagedly@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'EY Skills Foundry', N'0987654321', 1, N'eyskillsfoundry@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (10, N'Fama Technologies, Inc.', N'0912345678', 1, N'famatechnologies@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (69, N'Kho Nội bộ', N'0912345678', 1, N'famatechnologies@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (70, N'fsdfsfs2314', N'0993225653', 2, N'bdssad2314@gmail.com', N'')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (11, N'thanhdo@gmail.com', N'ZRYaSSd3CJo=', N'0332802172', 1, 1, N'ad', N'Administrator', N'SO 48 LE DAI HANH, HA BA TRUNG, HA NOI', N'https://localhost:7033/uploads/ánhduowng_5a0f4cf3-94f7-4aee-ab5d-f8927c5607a7.jpg', N'  32')
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
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (38, N'thanhdthe150750@gmail.com', N'IlAth2MwgXd9A5FPAGQ/SQ==', N'0332802172', 2, 1, N'wmkh', N'WHM43525', N'Khanh hoa', N'https://localhost:7033/uploads/ánhduowng_e81eff2e-d9a2-42f9-800c-401ba21898a6.jpg', N'Chủ Kho Khánh Hoà')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (39, N'thanhdthe150750@gmail.com', N'Pw9rp5RukB59A5FPAGQ/SQ==', N'0332802172', 2, 1, N'wmtp', N'WHM43526', N'tienphong', N'https://localhost:7033/uploads/ánhduowng_e81eff2e-d9a2-42f9-800c-401ba21898a6.jpg', N'Chủ Kho Tiền Phong')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (40, N'thanhdthe150750@gmail.com', N'Kxoaldr0sK19A5FPAGQ/SQ==', N'0332802172', 3, 1, N'stafftp', N'STF0003', N'tien phogn', N'https://localhost:7033/uploads/ánhduowng_e81eff2e-d9a2-42f9-800c-401ba21898a6.jpg', N'nhân viên tiền phong')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 11, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (5, 11, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 12, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 13, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 14, 2)
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

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0322111333')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Thái Bình', N'Thành phố tb', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hạ Long', N'Thành phố HL', N'0943111341')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (5, N'Đồng Nai', N'Đồng Nai', N'0943111333')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (6, N'Hải Dương', N'Thành Phố Hải Dương', N'0332822112')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (7, N'TP Hồ Chí Minh', N'Hồ Chì Minh', N'0332802172')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (8, N'Cà Mau', N'Cà Mau', N'0332802179')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (9, N'Quảng Bình', N'Quảng Bình', N'0332802172')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (10, N'Khánh Hoà', N'Khánh Hoà', N'0987654321')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (11, N'Tiền Phong', N'Tiền Phong', N'0332802172')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
/****** Object:  Index [IX_AvailableForReturns_ExportId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ExportId] ON [dbo].[AvailableForReturns]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_GoodsId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_GoodsId] ON [dbo].[AvailableForReturns]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_ImportId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ImportId] ON [dbo].[AvailableForReturns]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_CreatedId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_CreatedId] ON [dbo].[Bill]
(
	[CreatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_StatusId] ON [dbo].[Bill]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_UpdatedId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_UpdatedId] ON [dbo].[Bill]
(
	[UpdatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_WarehouseId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_WarehouseId] ON [dbo].[Bill]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_BillId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_BillId] ON [dbo].[BillDetail]
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_GoodsId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_GoodsId] ON [dbo].[BillDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Delivery_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Delivery_StatusId] ON [dbo].[Delivery]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailToken_UserId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_EmailToken_UserId] ON [dbo].[EmailToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_CustomerId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_CustomerId] ON [dbo].[ExportOrder]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_DeliveryId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_DeliveryId] ON [dbo].[ExportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_StatusId] ON [dbo].[ExportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_UserId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_UserId] ON [dbo].[ExportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_WarehouseId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_WarehouseId] ON [dbo].[ExportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_ExportId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_ExportId] ON [dbo].[ExportOrderDetail]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_GoodsId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_GoodsId] ON [dbo].[ExportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_ImportOrderDetailId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_ImportOrderDetailId] ON [dbo].[ExportOrderDetail]
(
	[ImportOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_CategoryId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_CategoryId] ON [dbo].[Goods]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_StatusId] ON [dbo].[Goods]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_SupplierId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_SupplierId] ON [dbo].[Goods]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_ActionId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_ActionId] ON [dbo].[GoodsHistory]
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_GoodsId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_GoodsId] ON [dbo].[GoodsHistory]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_UserId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_UserId] ON [dbo].[GoodsHistory]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsWarehouses_WarehouseId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsWarehouses_WarehouseId] ON [dbo].[GoodsWarehouses]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_DeliveryId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_DeliveryId] ON [dbo].[ImportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_StatusId] ON [dbo].[ImportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_SupplierId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_SupplierId] ON [dbo].[ImportOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_UserId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_UserId] ON [dbo].[ImportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_WarehouseId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_WarehouseId] ON [dbo].[ImportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_GoodsId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_GoodsId] ON [dbo].[ImportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_ImportId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_ImportId] ON [dbo].[ImportOrderDetail]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshToken_UserId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshToken_UserId] ON [dbo].[RefreshToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleFeature_featureId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_RoleFeature_featureId] ON [dbo].[RoleFeature]
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_StatusId] ON [dbo].[Supplier]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleId] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_StatusId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_StatusId] ON [dbo].[User]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Warehouse_WarehouseId]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_Warehouse_WarehouseId] ON [dbo].[User_Warehouse]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__User_War__95E846B211E0D37C]    Script Date: 8/9/2024 12:07:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__User_War__95E846B211E0D37C] ON [dbo].[User_Warehouse]
(
	[UserId] ASC,
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
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
