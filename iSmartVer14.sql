Create database iSmart
GO
USE [iSmart]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ActionType]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[BatchDetails]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[EmailToken]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Features]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[GoodsWarehouses]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[InventoryCheckDetails]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[InventoryChecks]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ReturnOrder]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[ReturnOrderDetail]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[User_Warehouse]    Script Date: 17/08/2024 6:28:35 CH ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 17/08/2024 6:28:35 CH ******/
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

INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (1, N'Vũ Thanh Tùng', N'Nam Định', N'0832574256', N'Thanhtung@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (2, N'Đỗ Tuấn Thành', N'Thái Bình', N'0927626526', N'Thanhdo@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (3, N'Đồng Đức Anh', N'Thái Bình', N'0927626525', N'Ducanh@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (4, N'Nguyễn Quang Huy', N'Thái Bình', N'0567608096', N'Quanghuy@gmail.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (5, N'Ngô Tiến Dũng', N'Sơn La', N'0567608178', N'Tiendung@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'Samsung Galaxy S21', N'SSG21', 1, N'Sự đẳng cấp được Samsung gửi gắm thông qua chiếc smartphone Galaxy S21 Ultra 5G với hàng loạt sự nâng cấp và cải tiến không chỉ ngoại hình bên ngoài mà còn sức mạnh bên trong, hứa hẹn đáp ứng trọn vẹn nhu cầu ngày càng cao của người dùng.', 3, N'Thùng', N'https://localhost:7033/uploads/hinh-anh-Galaxy-S21-Ultra-1_d48015cc-55e5-4f0a-9a3f-b1ec227def23.jpg', 1, 0, N'VN24SSG21', 100, 10, CAST(N'2024-08-16T15:50:14.6669044' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Samsung Galaxy Z Flip6', N'SSGZ6', 1, N'Samsung Z Flip 6 là chiếc điện thoại gập vỏ sò chạy chip Snapdragon 8 Gen 3 for Galaxy mạnh mẽ bậc nhất hiện nay. Máy có cụm camera kép độ phân giải 50MP sắc nét. Đi kèm là bộ nhớ RAM 12GB và thời lượng pin được nâng cấp thêm 4 tiếng sử dụng.', 3, N'Thùng', N'https://localhost:7033/uploads/samsung-galaxy-z-flip6-didongmy_265c907f-3e2b-4788-8cce-ccba315afbe4.jpg', 1, 0, N'VN24SSGZ6', 100, 10, CAST(N'2024-08-16T16:03:11.0395162' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'ASUS ROG Ally Z1', N'ASAZ1', 9, N'ROG Ally Z1, mẫu máy chơi game cầm tay mới của Asus, sở hữu một cấu hình ấn tượng để người chơi có thể trải nghiệm được mọi tựa game AAA ở bất cứ nơi đâu.', 2, N'Thùng', N'https://localhost:7033/uploads/1695685468662_91d5cbe1-9958-4596-8c42-17118ecd2dd0.jpg', 1, 0, N'VN24ASAZ1', 100, 10, CAST(N'2024-08-16T16:12:33.8445115' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'ASUS ROG Ally X', N'ASAX', 9, N'Máy chơi game cầm tay đang là sự lựa chọn hàng đầu cho game thủ khi nó sở hữu một ngoại hình nhỏ ,sức mạnh siêu khủng. Giờ đây, ông lớn này tại tiếp tục gia nhập đường đua máy chơi game cầm tay khi cho ra mắt siêu phẩm Asus ROG Ally', 2, N'Thùng', N'https://localhost:7033/uploads/8354031_8df75efed46cae0a56a6e948a1168c90_401ebec0-e1a3-44b3-8789-2ccf16d6d40b.jpg', 1, 0, N'VN24ASAX', 100, 10, CAST(N'2024-08-16T16:19:26.8711873' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Apple Watch Series 9', N'AWS9', 10, N'Apple Watch Series 9 41mm sở hữu thiết kế khá hiện đại, sang trọng cùng khả năng xử lý nhanh chóng mọi tác vụ nhờ được trang bị chipset S9 SiP mạnh mẽ. Đồng thời, dòng Apple smartwatch này còn đi kèm với hàng loạt các tính năng theo dõi sức khỏe', 4, N'Thùng', N'https://localhost:7033/uploads/watchs9-1_01b5d112-c427-4dd3-9de8-7f8562a3f822.jpg', 1, 0, N'VN24AWS9', 1000, 10, CAST(N'2024-08-16T16:22:56.4077839' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'iPad Air 5', N'IPA5', 5, N'Mỗi khi một chiếc iPad mới vừa ra lò như một cơn chấn động thật sự bùng nổ. Đến năm 2022, chúng ta lại tiếp tục bùng nổ với chiếc iPad mới mang tên iPad Air 5 với nhiều cải tiến đáng giá', 4, N'Thùng', N'https://localhost:7033/uploads/111887_sp866-ipad-air-5gen_5ee1cfe9-5e5e-4de1-93cd-f8ef6e2d048d.png', 1, 0, N'VN24IPA5', 1000, 10, CAST(N'2024-08-16T16:29:49.0924775' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (16, N'Laptop Dell Inspiron 15', N'LDI15', 2, N'Laptop Dell Inspiron 15 trang bị, 8GB RAM nâng cấp tối đa đến 16GB thoải mái lưu trữ. Laptop Dell Inspiron 15 3520-5810BLK 102F0 cảm ứng với thiết kế nhỏ gọn, trọng lượng chỉ 1.9kg , màn hình 15.6 inch chất lượng Full HD cực rõ nét.', 6, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3530-i5-n5i5791w1-thumb-1-600x600_0ea7a087-4e0c-43c2-857f-ee8cc25f4fcc.jpg', 1, 0, N'VN24LDI15', 1000, 10, CAST(N'2024-08-16T16:43:23.6838389' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (17, N'Laptop Dell Gaming G15', N'LDG15', 2, N'Laptop gaming nổi tiếng với khả năng thực hiện đa tác vụ nhờ một hiệu năng vượt trội. Với Dell Gaming G15 Ryzen Edition 5515 70266675 cũng không ngoại lệ, laptop sở hữu một thiết kế mạnh mẽ cùng hiệu năng sử dụng vượt trội.', 6, N'Thùng', N'https://localhost:7033/uploads/dell-gaming-g15-5515-r5-p105f004cgr-291121-115616-600x600_86f3b1f0-b7f0-4a3d-8b7d-ba793750b8ef.jpg', 1, 0, N'VN24LDG15', 1000, 10, CAST(N'2024-08-16T16:48:18.9572063' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (19, N'Google Tivi OLED Sony 4K 77 inch XR-77A95L', N'OS4XR', 3, N'Google tivi OLED Sony 4K 77 inch XR-77A95L được trang bị màn hình kích thước 77 inch cùng độ phân giải 4K mang lại khả năng hiển thị vượt trội.', 8, N'Thùng', N'https://localhost:7033/uploads/ck12718049-tivi-sony-xr-77a95l_9aa35657-f15b-4b07-9f38-a6942b07f8af.jpg', 1, 0, N'VN24OS4XR', 1000, 10, CAST(N'2024-08-16T16:52:13.6420393' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (20, N'Smart Tivi Sony 4K 55 inch KD-55X86J VN3', N'TS4KD', 3, N'Smart Tivi Sony 4K 55 inch KD-55X86J VN3 là một trong những chiếc TV Smart 4K được rất nhiều người ưa chuộng. Chiếc tivi 55 inch này sở hữu nhiều tính năng độc đáo với diện mạo sang trọng, nâng tầm đẳng cấp cho không gian ngôi nhà của bạn. ', 8, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd55x86j-55-inch-android-tv-mVpUO0_eb7bc45b-eaba-4188-961c-053f59419d94.jpg', 1, 0, N'VN24TS4KD', 1000, 10, CAST(N'2024-08-16T16:56:17.0520855' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (22, N'Máy ảnh Fujifilm X-H2S', N'FXH2S', 4, N'Không bao giờ bỏ lỡ một khoảnh khắc quyết định nào với máy ảnh Fujifilm X-H2S. Máy ảnh có cảm biến Stacked CMOS 26MP thế hệ 5 cho phép chụp liên tiếp lên đến 40fps. Hệ thống chống rung lên tới 7 stop', 11, N'Thùng', N'https://localhost:7033/uploads/fujifilm_16568731_x_h1_mirrorless_digital_camera_1388297_ti6b-z9_pgmt-cu_ljxh-a4_xifw-ne_7dfr-bt_jtdc-pa__1__7e3227c1-dade-4083-b72a-18847049ffd4.jpg', 1, 0, N'VN24FXH2S', 1000, 10, CAST(N'2024-08-16T16:59:11.1773458' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (24, N'Máy ảnh Fujifilm X-T30 Mark II', N'FXT30', 4, N'Máy ảnh Fujifilm X-T30 Mark II Kit XC15-45mm F3.5.5.6 OIS PZ/ Bạc là máy ảnh không gương lật nhỏ gọn và nhẹ, có cảm biến X-Trans CMOS 4 26.1MP', 11, N'Thùng', N'https://localhost:7033/uploads/1607484175_2fcdaf19-503d-4211-a902-50df67a3f1aa.jpg', 1, 0, N'VN24FXT30', 1000, 10, CAST(N'2024-08-16T17:02:09.0539298' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (25, N'Máy ảnh Fujifilm GFX-50S II', N'FGFX50', 4, N'Máy ảnh dòng medium format là chiếc máy ảnh dành cho sự sắp đặt. Nơi mà các nhiếp ảnh gia chuyên nghiệp cùng với cộng sự của mình tiêu tốn hàng giờ để set up từng bối cảnh. Nhưng máy ảnh Fujifilm GFX 50s mark II là một sự tiến bộ đầy kinh ngạc', 11, N'Thùng', N'https://localhost:7033/uploads/20210909_kD8KrfZF0AOeWFHdd5TYbs3S_319cf145-13c9-4a4f-b74f-e278b8b5ec88.jpg', 1, 0, N'VN24FGFX50', 1000, 10, CAST(N'2024-08-16T17:04:51.1235088' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (26, N'Xiaomi Redmi Pad Pro', N'XRP5G', 5, N'Máy tính bảng Xiaomi Redmi Pad Pro sở hữu màn hình 2,5K kích thước lên đến 12,1 inch hiển thị tốt mọi chi tiết với độ sắc nét cao. Tablet sở hữu một phần cứng mạnh với con chip Snapdragon® 7s Gen 2 cùng bộ nhớ 128GB cùng RAM 8GB', 5, N'Thùng', N'https://localhost:7033/uploads/Redmi-Pad-Pro-Tablet-12-1-inch-Tablet-8-128GB-Green-524403-0_e9e173ef-0267-4d28-b006-e285a7014578.jpg', 1, 0, N'VN24XRP5G', 1000, 10, CAST(N'2024-08-16T17:08:35.5112792' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (29, N'Loa Bluetooth JBL Pulse 5', N'LBJP5', 6, N'Loa Bluetooth Pulse 5 là một sản phẩm mới nhất được thêm vào bộ sưu tập loa Pulse của thương hiệu JBL. Thiết bị loa bluetooth mới này nổi bật với chất âm sống động, thiết kế linh hoạt, cùng các hiệu ứng ánh sáng bắt mắt. ', 10, N'Thùng', N'https://localhost:7033/uploads/loa-bluetooth-jbl-pulse-5-1_e2eb8a49-489b-42aa-8c2f-2ff3a09ab9e5.jpg', 1, 0, N'VN24LBJP5', 1000, 10, CAST(N'2024-08-16T17:12:38.2285143' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (31, N'Loa Bluetooth JBL Partybox 710', N'LBJP710', 6, N'Loa Bluetooth JBL PartyBox 710 sở hữu thiết kế ấn tượng nhờ kết hợp đèn LED và đèn nháy cực đẹp. Cùng với đó là chất lượng âm thanh mạnh mẽ với công suất 800W cho âm trầm sâu hơn và còn nhiều nét nổi trội khác', 10, N'Thùng', N'https://localhost:7033/uploads/710-02_ee15a197-f052-494c-a060-7eeb0a075440.jpg', 1, 0, N'VN24LBJP710', 1000, 10, CAST(N'2024-08-16T17:14:48.1082564' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (33, N'Tủ lạnh Toshiba Inverter 253L GR-RT329WE-PMV', N'TI253L', 7, N'Tủ lạnh Toshiba Inverter 253 lít GR-RT329WE-PMV(52) được trang bị ngăn Cooling Zone 0°C, cho phép bạn chế biến thực phẩm tươi sống nhanh chóng mà không cần chờ rã đông.', 7, N'Thùng', N'https://localhost:7033/uploads/tu-lanh-toshiba-inverter-253l-gr-rt329we-pmv52_de11aded_4fa9a41b-3952-4be6-98c8-de21cb139c4e.jpg', 1, 0, N'VN24TI253L', 100, 10, CAST(N'2024-08-16T17:18:38.9692936' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (35, N'Máy giặt Toshiba 8Kg AW-M905BV', N'TAWM9', 7, N'Máy giặt Toshiba 8kg AW-M905BV(MK) thuộc kiểu máy giặt cửa trên – lồng đứng sang trọng', 7, N'Thùng', N'https://localhost:7033/uploads/may-giat-toshiba-8kg-aw-m905bvmk_df9d62f8_9f5c5756-efa2-4fd9-9fa2-a6035000890a.jpg', 1, 0, N'VN24TAWM9', 100, 10, CAST(N'2024-08-16T17:21:43.0559459' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (37, N'Chuột Gaming Logitech G502 Hero', N'LG502H', 8, N'Chuột được trang bị cảm biến quang học HERO mang lại hiệu suất ổn định và chính xác vượt trội với khả năng làm mượt, lọc và tăng tốc lên tới 25.600 DPI', 9, N'Thùng', N'https://localhost:7033/uploads/16401459675947_0b6ef4ba-2cd1-4370-a07b-07cb087aa918.jpg', 1, 0, N'VN24LG502H', 1000, 10, CAST(N'2024-08-16T17:25:18.9337673' AS DateTime2), 6)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (39, N'Chuột Gaming Logitech G304 Lightspeed', N'LG302L', 8, N'Chuột gaming không dây Logitech G304 Lightspeed là sản phẩm đang làm mưa làm gió trên thị trường với nhiều tính năng đặc biệt nổi bật. Với nhiều công phá mới trong thiết kế cùng mức giá thành tương đối rẻ.', 9, N'Thùng', N'https://localhost:7033/uploads/f4b362706c8d18a3c6233fe419035610_7db95ab9-f498-4066-9d94-8cf29480d89d.png', 1, 0, N'VN24LG302L', 1000, 10, CAST(N'2024-08-16T17:27:55.0215641' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (40, N'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active', N'XRW3', 10, N'Đồng hồ thông minh Xiaomi Redmi Watch 3 Active được làm với kiểu dáng khá giống với Apple Watch. Với dạng mặt chữ nhật cùng nhiều tính năng hiện đại mới, hứa hẹn sẽ là chọn lựa của nhiều người dùng đó nhé', 5, N'Thùng', N'https://localhost:7033/uploads/2023_8_9_638271911445546202_xiaomi-redmi-watch-3-active-xam-1_1263d5d3-5c5a-42f9-98c9-01132adaf06a.jpg', 1, 0, N'VN24XRW3', 1000, 10, CAST(N'2024-08-16T17:30:31.3722517' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (42, N'Vòng đeo tay thông minh Mi Band 8 Pro', N'MB8P', 10, N'Mi Band 8 Pro là thế hệ smartband tiếp theo được nhà Xiaomi cho ra mắt. Với nhiều cải tiến về thiết kế, màn hình lớn mở rộng không gian hiển thị, khả năng định vị độc lập.', 5, N'Thùng', N'https://localhost:7033/uploads/vong-deo-tay-thong-minh-Xiaomi-Band-8-hinh-1_821f64f5-ed1b-412b-a399-e600ec6d1c8f.jpg', 1, 0, N'VN24MB8P', 1000, 10, CAST(N'2024-08-16T20:57:29.6402455' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (43, N'Máy chơi game ASUS ROG Ally Z1 Extreme', N'ARAZ1E', 9, N'ROG Ally là giải pháp thay thế hoàn hảo nếu bạn đã cảm thấy chán khi chiến game trên laptop hay PC. Máy chơi game thế hệ mới của Asus tương thích với đa dạng tựa game hiện nay và được trang bị màn hình vô cùng sắc nét', 2, N'Thùng', N'https://localhost:7033/uploads/e2581e1d2140ad913fa02b5076512a6d.png_720x720q80_1eb602ca-d06e-4bfb-824c-64c0a69693ff.png', 1, 0, N'VN24ARAZ1E', 1000, 10, CAST(N'2024-08-16T21:02:12.7884961' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (46, N'Chuột gaming Logitech Pro X Superlight 2 Lightspeed', N'LPXS2', 8, N'Chuột Gaming Logitech Pro X Superlight 2 sở hữu khối lượng siêu nhẹ dưới 63g, cùng thiết kế hiện đại nhờ trang bị cảm biến HERO 25K cùng hệ thống switch Hybrid Lightforce.', 9, N'Thùng', N'https://localhost:7033/uploads/chuot-gaming-logitech-g-pro-x-superlight-2-01_53ad7e93-5419-49c2-81b7-b586fce2b400.jpg', 1, 0, N'VN24LPXS2', 1000, 10, CAST(N'2024-08-16T21:05:28.9070433' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (47, N'Bàn phím có dây Logitech K120', N'LK120', 8, N'Bàn phím thiết kế đầy đủ phím bấm kèm bàn phím số tích hợp hỗ trợ nhập dữ liệu, tính toán và điều hướng diễn ra nhanh chóng
Trang bị dây USB kết nối dài 1.5m chỉ cần cắm vào cổng USB máy tính để sử dụng', 9, N'Thùng', N'https://localhost:7033/uploads/logitech-k120-usb-keyboard-500x500-1_7a88f0b6-6563-47a6-b0be-a26beffa2fe6.jpg', 1, 0, N'VN24LK120', 1000, 10, CAST(N'2024-08-16T21:07:47.9720592' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (48, N'Quạt đứng Toshiba Inverter F-LSD10(W)VN', N'TIF10', 7, N'Quạt đứng Toshiba Inverter F-LSD10-W-VN được trang bị 9 cánh quạt 40cm với công suất 30W - 26 mức gió điều chỉnh dễ dàng theo nhu cầu bằng nút xoay. Chức năng Inverter giúp tối ưu năng lượng sử dụng tới 70% so với các dòng quạt đứng thông thường.', 7, N'Thùng', N'https://localhost:7033/uploads/c39d768cea422d620b0c6211b3bd4b7d_68593ef1-ca19-49b9-9280-33687f4799e9.jpg', 1, 0, N'VN24TIF10', 1000, 10, CAST(N'2024-08-16T21:10:23.9468442' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (50, N'Máy Sấy Toshiba 7Kg TD-H80SEV', N'TTDH80', 7, N'Máy Sấy Toshiba 7Kg TD-H80SEV(WK) được lấy cảm hứng từ lối sống tối giản để tạo nên điểm nhấn hoàn hảo cho không gian sống. Sản phẩm với thiết kế cửa 2 lớp tròn đều.', 7, N'Thùng', N'https://localhost:7033/uploads/may-say-thong-hoi-toshiba-7kg-td-h80sevsk_d18c9516_cf1dda28-46a1-4674-a57d-187975638a1e.jpg', 1, 0, N'VN24TTDH80', 1000, 10, CAST(N'2024-08-16T21:13:48.4252361' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (51, N'Loa Bluetooth JBL Flip 6', N'BJF6', 6, N'Loa bluetooth JBL Flip 6 gây ấn tượng với vẻ ngoài hiện đại, chất lượng âm thanh tuyệt vời để đồng hành cùng bạn trên mọi chặng đường. Sở hữu nhiều ưu điểm nổi bật, loa JBL Flip 6 hứa hẹn sẽ mang đến cho người dùng những trải nghiệm âm thanh đáng nhớ', 10, N'Thùng', N'https://localhost:7033/uploads/unnamed_417deb9e-6493-4e7a-80e4-17ffed4f7dc6.jpg', 1, 0, N'VN24BJF6', 1000, 10, CAST(N'2024-08-16T21:16:33.9027249' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (52, N'iPad 10.2 2021 WiFi ', N'IP102', 5, N'Sau sự thành công của chiếc iPad Gen 8 cùng với iPad Air 4, Apple lại tiếp tục rục rịch cho ra mắt thêm sản phẩm mới. Thiết bị mang tên iPad Gen 9, kế thừa đặc trưng của dòng nhưng được nâng cấp thêm về hiệu năng cũng như camera.', 4, N'Thùng', N'https://localhost:7033/uploads/8396-3d91c418c952c8bad2fb52e7d34eb2c8_8fb78e89-b3ca-4e22-a87a-768e567173ed.jpg', 1, 0, N'VN24IP102', 1000, 10, CAST(N'2024-08-16T21:19:44.2931240' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (53, N'Máy ảnh Fujifilm Instax Mini Evo', N'FIME', 4, N'Máy ảnh kỹ thuật số Fujifilm Instax mini Evo là chiếc máy chụp ảnh công nghệ mới cho phép bạn thỏa sức sáng tạo ra các mẫu ảnh đẹp xuất sắc. Bạn có thể chụp và in ngay lập tức ảnh từ máy ảnh hoặc in trực tiếp từ điện thoại thông minh nếu muốn.', 11, N'Thùng', N'https://localhost:7033/uploads/8ac428470826a90caa8536fe08f2dc3f.jpg_720x720q80_1225aa9f-0698-44a7-b4ce-973fb981e97f.jpg', 1, 0, N'VN24FIME', 1000, 10, CAST(N'2024-08-16T21:22:02.3168473' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (55, N'Smart Tivi Sony 4K 50 inch KD-50X75K VN3', N'SKD50X', 3, N'Thỏa sức đắm chìm vào những bộ phim “bom tấn” đình đám trên Smart TV Sony 4K 50 inch KD-50X75K VN3 - chiếc TV 50 inch thông minh do Sony phát triển nhằm mang đến hình ảnh 4K với màu sắc chân thực', 8, N'Thùng', N'https://localhost:7033/uploads/10051997-google-tivi-sony-4k-43-inch-kd-43x75k-vn3-3_5ha9-of_3f95e467-f6c7-4646-9aff-f8f479e8efb5.jpg', 1, 0, N'VN24SKD50X', 1000, 10, CAST(N'2024-08-16T21:24:53.1742927' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (57, N'Smart Tivi Sony 4K 65 inch KD-65X75K VN3', N'SKD65X', 3, N'Smart TV Sony 4K 65 inch ra lệnh giọng nói 65X75K VN3 có thiết kế sắc sảo từ các đường nét được cắt gọt cẩn thận. Chân đế chữ V úp ngược tạo thế vững chãi giữ vững tivi trên bề mặt phẳng.', 8, N'Thùng', N'https://localhost:7033/uploads/smart-tivi-4k-sony-kd-65x75k-65-inch-google-tv_02b903cc_d3248a18-8d44-414e-885b-39d40a3faa4b.jpg', 1, 0, N'VN24SKD65X', 1000, 10, CAST(N'2024-08-16T21:27:11.0653337' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (59, N'Laptop Dell Vostro 3520 F0V0V256', N'DV35F0', 2, N'Laptop Dell Vostro 3520 F0V0V256 là một máy tính xách tay mạnh mẽ và đa năng với bộ vi xử lý Intel Core i5-1235U và RAM 8GB giúp xử lý tác vụ mượt mà và chạy nhiều ứng dụng cùng lúc.', 6, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-3520-f0v0v-a02-i5-1235u-16gb-ram-512gb-ssd-152_945b9b16-553d-4f34-a319-e8cc70af866e.jpg', 1, 0, N'VN24DV35F0', 1000, 10, CAST(N'2024-08-16T21:29:33.6266811' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (61, N'Laptop Dell XPS 13 9305', N'DXPS13', 2, N'Sở hữu thiết kế cực kỳ sang chảnh với nhôm nguyên khối vô cùng chắc chắn.
Laptop có tính cơ động cao, thuận tiện cho việc di chuyển với trọng lượng chỉ 1.29 kg.', 6, N'Thùng', N'https://localhost:7033/uploads/2031_xps2_3c00c45d-927f-4d5a-87bc-ca3c3fc1895e.jpg', 1, 0, N'VN24DXPS13', 1000, 10, CAST(N'2024-08-16T21:33:40.7987874' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (62, N'Điện thoại Samsung Galaxy A55 5G', N'AGA55', 1, N'Samsung Galaxy A55 5G, mẫu điện thoại mới của dòng Galaxy A, ra mắt với nhiều công nghệ tiên phong kèm theo kết nối 5G nhanh chóng. Được giới thiệu như một lựa chọn đa năng, chất lượng cao nhưng có mức giá hợp lý', 3, N'Thùng', N'https://localhost:7033/uploads/dien-thoai-samsung-galaxy-a55-5g-a556e-8128g-tim_dc6b788f_e43707da-bf82-4655-bc6e-e32f99b6f31f.jpg', 1, 0, N'VN24AGA55', 1000, 10, CAST(N'2024-08-16T21:35:28.7295102' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (64, N'Samsung Galaxy S24 Ultra', N'SG24U', 1, N'Samsung Galaxy S24 Ultra 1TB là chiếc smartphone flagship mới của nhà Samsung với màn hình Dynamic AMOLED 2X, mang đến trải nghiệm giải trí đỉnh cao. Máy cũng được trang bị con chip Snapdragon 8 Gen 3 for Galaxy.', 3, N'Thùng', N'https://localhost:7033/uploads/galaxy-s24-ultra-highlights-kv_d482b109-cd2d-47c8-bbea-44d02769cdf8.jpg', 1, 0, N'VN24SG24U', 1000, 10, CAST(N'2024-08-16T21:42:31.9255351' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (65, N'Laptop Dell Vostro 5620', N'DV562', 2, N'Hiệu năng vượt trội, xử lý tốt các tác vụ hằng ngày - Intel Core i5 thế hệ 12
16GB ram cho phép mở cùng lúc nhiều tab trình duyệt
512GB SSD, mở ứng dụng nhanh hơn - thoải mái lưu trữ', 6, N'Thùng', N'https://localhost:7033/uploads/laptop-dell-vostro-5620-p117f001agr-1_f6c6ce7a-2a75-4f41-bde1-9b5f7edbaaa2.jpg', 1, 0, N'VN24DV562', 1000, 10, CAST(N'2024-08-16T21:45:44.2195688' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (69, N'Laptop Dell Inspirion N5515', N'DIN551', 2, N'AMD Ryzen 7-5700U - AMD Radeon™ Graphics: làm các tác vụ hằng ngày, giải trí trên các tựa game nhẹ nhàng
Ram 8GB (1 khe 8GB + 1 khe rời) - khả năng nâng cấp tối đa lên đến 32GB, đa nhiệm mượt mà hơn', 6, N'Thùng', N'https://localhost:7033/uploads/IMG_1398_361cfa3d-627d-4179-ab2e-c24fe5c91aab.jpg', 1, 0, N'VN24DIN551', 1000, 1, CAST(N'2024-08-16T21:49:11.9746304' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (70, N'Tivi Sony Z9J | BRAVIA XR', N'SZ9J', 3, N'Xem hình ảnh 8K có chiều sâu, tự nhiên và chân thực. Bộ xử lý đột phá sử dụng dữ liệu phân tích góc nhìn của người để phân tích chéo và tối ưu hóa hàng trăm nghìn yếu tố trong chớp mắt', 8, N'Thùng', N'https://localhost:7033/uploads/Sony_Z9J_10_347adbf2-7afd-4152-b1a2-26e5c4c8c084.png', 1, 0, N'VN24SZ9J', 1000, 10, CAST(N'2024-08-16T21:58:44.9220033' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (72, N'Máy ảnh Fujifilm Instax Camera Mini 12', N'FIM12', 4, N'Máy ảnh Fujifilm Instax Camera Mini 12 sẽ tiếp nối các thế hệ tiền nhiệm để trở thành thiết bị chụp hình lấy ngay rất đáng sở hữu trong thời gian tới. Ngoài việc được thừa hưởng thiết kế trẻ trung, dễ sử dụng.', 11, N'Thùng', N'https://localhost:7033/uploads/1677725136_1753966_e8e8f66a-0975-4518-8c76-1b502ab63a8c.jpg', 1, 0, N'VN24FIM12', 1000, 10, CAST(N'2024-08-16T22:01:28.9881500' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (73, N'Máy ảnh Fujifilm X100V', N'FX100V', 4, N'Máy ảnh Fujifilm X100V có cảm biến thế hệ thứ IV với ống kính 23mm cùng khẩu độ F2.0 đem đến chất lượng bức ảnh JPEG cực kỳ tốt. Đồng thời, cảm biến X-Trans hoạt động giúp mang lại hình ảnh với độ biến dạng thấp', 11, N'Thùng', N'https://localhost:7033/uploads/fujifilm-X100V-1005-11_17110355-d930-405b-9329-1f6e72c609ca.jpg', 1, 0, N'VN24FX100V', 1000, 10, CAST(N'2024-08-16T22:05:35.4887043' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (74, N'iPad mini 6 WiFi ', N'IPM6W', 5, N'Với sự thành công của các thế hệ iPad mini trước iPad mini 6 là sản phẩm kế nhiệm mới với nhiều tính năng hiện kèm nhiều sự nâng cấp đáng chú ý dành cho người dùng trong năm nay', 4, N'Thùng', N'https://localhost:7033/uploads/ipad-mini-6-wifi-starlight-1-600x600_f2eb3262-7e4a-4f60-9daa-a4e87b64f2e3.jpg', 1, 0, N'VN24IPM6W', 1000, 1, CAST(N'2024-08-16T22:28:28.1321602' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (75, N'Loa Bluetooth JBL Charge 5', N'BJC5', 6, N'Tiếp nối sự thành công của người tiền nhiệm, dòng loa huyền thoại loa JBL Charge 5 với sự thay đổi mạnh mẽ cả về thiết kế lẫn công nghệ âm thanh mang đến chất lượng âm thanh vượt trội dù là ngoài trời hay trong nhà', 10, N'Thùng', N'https://localhost:7033/uploads/loa-bluetooth-jbl-charge-5_3f5152ff_96794a27-c116-4bc5-9911-43a139c892a3.jpg', 1, 0, N'VN24BJC5', 1000, 10, CAST(N'2024-08-16T22:30:17.5381488' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (76, N'Quạt treo tường Toshiba 3 cánh F-WSA20(H)VN 55W', N'TFWSA2', 7, N'Quạt treo tường Toshiba F-WSA20(H)VN có kích thước 45.2x35x54cm, nặng 3.6kg, màu trắng trang nhã. Sản phẩm quạt treo tường này có công suất 55W, 3 cánh tạo luồng gió mạnh, 3 mức gió, 3 chế độ gió, dễ dàng điều khiển với remote từ xa.', 7, N'Thùng', N'https://localhost:7033/uploads/2021_10_14_637698020581238080_quat-treo-toshiba-f-wsa20hvn-dd_934d4351-f939-4544-854a-53d486fbd7b9.jpg', 1, 0, N'VN24TFWSA2', 1000, 10, CAST(N'2024-08-16T22:33:04.2696136' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (77, N'Nồi cơm cao tần Toshiba 1.8 lít RC-18IX1PV', N'TRC18L', 7, N'Nồi cơm điện cao tần Toshiba RC-18IX1PV thiết kế bắt mắt, màu sắc đơn giản mà hài hòa tạo nét sang trọng cho không gian bếp của gia đình', 7, N'Thùng', N'https://localhost:7033/uploads/noi-com-cao-tan-toshiba-rc-18ix1pv-1l-14_450e93c7-802b-4f8b-8ef1-d77e9e077a87.jpg', 1, 0, N'VN24TRC18L', 1000, 10, CAST(N'2024-08-16T22:35:09.0121534' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (78, N'Bàn phím Logitech Pebble Keys 2 K380s', N'LPK2', 8, N'Loại sản phẩm: Bàn phím không dây
Kết nối: Bluetooth
Thời lượng pin: 36 tháng
Dạng bàn phím: 79 phím
Bảo hành 12 tháng', 9, N'Thùng', N'https://localhost:7033/uploads/52562_ban_phim_khong_day_bluetooth_logitech_pebble_keys_2_k380s_mau_den_1_7b049901-a46b-4ae8-8a69-047077977c1c.jpg', 1, 0, N'VN24LPK2', 1000, 10, CAST(N'2024-08-16T22:38:55.3904608' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (79, N'Bàn phím cơ Logitech G515 Lightspeed TKL', N'LG515', 8, N'Loại bàn phím: Bàn phím cơ Low-Profile không dây
Layout bàn phím: TKL
Chuẩn kết nối: Detachable Wired USB-C, Wireless 2.4GHz, Bluetooth
Màu sắc: Black, White
Hệ điều hành hỗ trợ: Windows 10/11, MacOS, Linux, iOS/iPadOS, Android', 9, N'Thùng', N'https://localhost:7033/uploads/ban-phim-co-logitech-g515-lightspeed-tkl-11_2a57f814-1fc3-453f-aa84-a44baab2cc89.jpg', 1, 0, N'VN24LG515', 1000, 10, CAST(N'2024-08-16T22:41:44.1811988' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (80, N'Webcam Logitech C922 full HD 1080P', N'LC922', 8, N'Kết nối với sự rõ nét ưu việt mỗi lần bạn phát trực tiếp trên các kênh như Twitch và YouTube. Được thiết kế cho những Streamer. Truyền trực tuyến mọi thứ bạn muốn với lựa chọn Full 1080p ở 30 fps hay siêu nhanh HD 720p ở 60 fps.', 9, N'Thùng', N'https://localhost:7033/uploads/1669012281.Webcam-Live-Stream-C922-Pro-FULL-HD-1_6950e383-db83-4e66-a9ea-270961b97cab.jpg', 1, 0, N'VN24LC922', 1000, 10, CAST(N'2024-08-17T13:40:28.8367635' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (82, N'Bút trình chiếu Logitech R400', N'LR400', 8, N'Bút trình chiếu Logitech R400 
Bút trình chiếu Logitech R400 được tích hợp khả năng kết nối không dây với sóng 2.4Ghz mạng mẽ và phạm vi kết nối lên đến 15m, cho người dụng được thoải mái di chuyển quanh phòng.', 9, N'Thùng', N'https://localhost:7033/uploads/but-trinh-chieu-logitech-r400-1_1687965797_7d4ebaa9-8026-453f-8162-92f240b0db7b.jpg', 1, 0, N'VN24LR400', 1000, 10, CAST(N'2024-08-17T13:44:34.2325555' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (83, N'ASUS ROG Phone 6', N'ARP6', 1, N'Hiệu năng dẫn đầu mọi trận đấu - Chip Snapdragon® 8+ Gen 1 mạnh mẽ cùng RAM 12GB
Chất lượng hiển thị đúng chuẩn gaming - Màn hình 6.78 inches, FullHD+, HDR10+ cùng tần số quét 165Hz', 2, N'Thùng', N'https://localhost:7033/uploads/h42frihcxzudn_83fd759d-ded9-4518-83c2-0621d94d943f.jpg', 1, 0, N'VN24ARP6', 1000, 10, CAST(N'2024-08-17T13:51:07.5930867' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (84, N'ASUS ROG Phone 6 Mediatek', N'ARP6M', 1, N'Hiệu năng dẫn đầu mọi trận đấu - Chip MediaTek Dimensity 7000 mạnh mẽ cùng RAM 12GB
Chất lượng hiển thị đúng chuẩn gaming - Màn hình 6.78 inches, FullHD+, HDR10+ cùng tần số quét 165Hz', 2, N'Thùng', N'https://localhost:7033/uploads/thumb-6b_8e698630-c8cf-4c3c-9389-6d2a37f9ec36.png', 1, 0, N'VN24ARP6M', 1000, 10, CAST(N'2024-08-17T13:52:37.7905011' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (85, N'Laptop Dell Vostro 3420(V4I5702W1) ', N'DV4157', 2, N'Với bộ vi xử lý Intel Core i5 thế hệ 12, chiếc laptop Dell Vostro 3420 i5 1235U (V4I5702W1) mang đến hiệu năng vượt trội, đáp ứng mọi nhu cầu công việc của người dùng.', 6, N'Thùng', N'https://localhost:7033/uploads/dell-vostro-3420-i5-v4i5702w1-thumb-new-600x600_fc3ee743-b3d6-41d4-aedc-fe18b8c244f9.jpg', 1, 0, N'VN24DV4157', 1000, 10, CAST(N'2024-08-17T13:55:37.1668251' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (86, N'Laptop Dell Inspiron 15 (N5I5052W1)', N'DIN55I5', 2, N'Laptop Dell Inspiron 15 3520 i5 1235U (N5I5052W1) là sản phẩm tầm trung hoàn hảo cho đối tượng người dùng văn phòng, học sinh, sinh viên và những ai cần một thiết bị di động để giải trí và làm việc cơ bản', 6, N'Thùng', N'https://localhost:7033/uploads/dell-inspiron-15-3520-i5-n5i5052w1-thumb-600x600_ed33990b-18cb-44be-a482-94b91bab406f.jpg', 1, 0, N'VN24DIN55I5', 1000, 10, CAST(N'2024-08-17T14:00:47.7390596' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (88, N'Smart Tivi Samsung QLED 65 inch 65Q60BAK', N'SSQ65Q', 3, N'Chiếc Smart TV được bổ sung công nghệ hiện đại nhất hiện nay. Nó mang trên mình công nghệ đỉnh Quantum Dot là công nghệ giúp hiển thị tối đa dải mà lên đến 100%. Từ đó giúp chiếc TV đạt được độ chân thực của hình ảnh 1 cách cao nhất', 3, N'Thùng', N'https://localhost:7033/uploads/10051659-smart-tivi-qled-samsung-4k-65-inch-qa65q60bakxxv-2_wcqk-zo_1798fad8-5493-4ef8-8c75-d7d0487974b8.jpg', 1, 0, N'VN24SSQ65Q', 1000, 10, CAST(N'2024-08-17T14:03:37.8386314' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (91, N'Smart Tivi Samsung UHD 4K 65 INCH 2024', N'SSU4K', 3, N'Nâng tầm trải nghiệm xem UHD lên một tầm cao mới.
Công nghệ Dynamic Crystal Color truyền tải tinh tế từng biến chuyển sắc màu, cho bạn thưởng thức mọi chi tiết dù là nhỏ nhất.', 3, N'Thùng', N'https://localhost:7033/uploads/55b6f3fe-b7fb-4194-b46d-520681da9c67_32c50fe3-11e4-4a4e-b18d-8a369335ce1f.png', 1, 0, N'VN24SSU4K', 1000, 10, CAST(N'2024-08-17T14:14:30.8418283' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (92, N'Máy ảnh Fujifilm GFX-50S II', N'FG50S', 4, N'Ổn định trong cơ thể cung cấp hiệu chỉnh lên đến 6,5EV
Màn hình cảm ứng phía sau 3,2 "với độ nghiêng hai trục
Kính ngắm OLED 3,69M điểm với độ phóng đại 0,77x (tương đương) Màn hình LCD trạng thái trên cùng', 11, N'Thùng', N'https://localhost:7033/uploads/may-anh-fujifilm-gfx-50s_e2b5632f-5a62-4ac2-8ef8-67686de9cd6b.jpg', 1, 0, N'VN24FG50S', 1000, 10, CAST(N'2024-08-17T15:38:51.6870327' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (93, N'Máy ảnh Fujifilm X-T5 Kit XF16', N'FXT5', 4, N'Cảm biến X-Trans CMOS 5 HR BSI 40.2 MP
- Bộ xử lý hình ảnh X-Processor 5
- Chụp liên tục 15fps với màn trập cơ và 20fps với màn trập điện tử
- Hệ thống chống rung trong thân máy (IBIS) lên đến 7-stops', 11, N'Thùng', N'https://localhost:7033/uploads/may-anh-fujifilm-x-t5-voi-ong-kinh-xf-16-80mm-silver-3_a0b92e57-bcab-48bd-b956-fb6a61080fe3.jpg', 1, 0, N'VN24FXT5', 1000, 10, CAST(N'2024-08-17T15:40:48.5919707' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (94, N'Apple iPad Pro 11 2022 M2', N'AIP12M2', 5, N'iPad Pro M2 có một diện mạo cao cấp với mặt lưng làm từ kim loại chắc chắn, đi kèm với độ mỏng chỉ 5.9 mm giúp cho tổng thể thiết bị thêm phần sang trọng', 4, N'Thùng', N'https://localhost:7033/uploads/ipad-pro-m2-11-inch-2022-wifi-256gb-cu-2_ab03ef2a-2469-45d6-9079-566e3489d90f.jpg', 1, 0, N'VN24AIP12M2', 1000, 10, CAST(N'2024-08-17T15:44:06.2941835' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (96, N'JBL Go 4', N'JBLG4', 6, N'Loa Bluetooth JBL Go 4 sở hữu âm thanh JBL Pro Sound mang lại âm trầm mạnh mẽ cùng viên pin cho thời gian sử dụng lên đến 7 giờ. Cùng với đó sản phẩm loa JBL còn được trang bị chuẩn kháng nước IP67', 10, N'Thùng', N'https://localhost:7033/uploads/ien-tu-linh-anh_72ac3b3a-deaa-43b4-9579-db88c290b5ce.jpg', 1, 0, N'VN24JBLG4', 1000, 10, CAST(N'2024-08-17T15:48:38.8635674' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (97, N'Tai nghe Bluetooth True Wireless JBL Wave Beam', N'JBLWB', 6, N'Tai nghe JBL Wave Beam được trang bị trình điều kiển 8mm mang lại âm thanh vượt trội với âm bass sâu kết hợp với thiết kế đóng kín giúp tăng cường hiệu suất âm thanh.', 10, N'Thùng', N'https://localhost:7033/uploads/tai-nghe-bluetooth-true-wireless-jbl-wave-beam-black-1_7a004c71-8260-4c5f-9cbd-c461483dfd55.jpg', 1, 0, N'VN24JBLWB', 1000, 10, CAST(N'2024-08-17T15:50:38.8805433' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (98, N'Máy hút bụi Toshiba VC-BL160F', N'TBL160F', 7, N'Công nghệ lọc bụi HEPA giúp loại bỏ 99% các loại hạt có hại, dị ứng
- Phụ kiện: Đầu hút đa năng MB07/ đầu hút rèm cửa/ đầu hút góc, cạnh/ đầu hút rèm cửa nhựa', 7, N'Thùng', N'https://localhost:7033/uploads/May-hut-bui-Toshiba-VC-BL160F(K)-1-1694780612_5f010305-943e-4075-90c2-e0f305d22380.jpg', 1, 0, N'VN24TBL160F', 1000, 10, CAST(N'2024-08-17T16:00:46.6665638' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (99, N'Máy Chơi Game Sony PlayStation 5 Slim (PS5 Slim) Digital Edition', N'SPS5', 9, N' 

Máy Chơi Game Sony PS5 Slim có thiết kế mới gọn hơn 30%, nhẹ hơn lần lượt 18% và 24% so với phiên bản trước đó. PS5 Slim hoàn toàn có thể cân được các tựa game có đồ họa khủng ở độ phân giải 4k.', 8, N'Thùng', N'https://localhost:7033/uploads/9223-ps5-slim_d0404844-3a78-4f03-9057-3f8d3bb03a0e.jpg', 1, 0, N'VN24SPS5', 1000, 10, CAST(N'2024-08-17T16:03:17.9290894' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (100, N'ASUS ROG Ally Z', N'ASAZ', 9, N'Máy chơi game cầm tay đang là sự lựa chọn hàng đầu cho game thủ khi nó sở hữu một ngoại hình nhỏ ,sức mạnh siêu khủng. Giờ đây, ông lớn này tại tiếp tục gia nhập đường đua máy chơi game cầm tay khi cho ra mắt siêu phẩm Asus ROG Ally', 2, N'Thùng', N'https://localhost:7033/uploads/2021_10_14_637698020581238080_quat-treo-toshiba-f-wsa20hvn-dd_66f663e0-eeb3-4400-8685-6afed01e7c9e.jpg', 1, 0, N'VN24ASAX	', 1000, 10, CAST(N'2024-08-17T16:38:40.8798358' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (4, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (9, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (12, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (12, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (13, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (16, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (17, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (17, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (17, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (19, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (19, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (19, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (20, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (20, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (20, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (22, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (22, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (24, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (29, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (31, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (31, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (31, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (33, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (33, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (33, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (35, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (37, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (37, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (37, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (39, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (39, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 1, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (40, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (42, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (42, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (43, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (43, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (46, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (46, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (46, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (47, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (47, 5, 0)
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (47, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (48, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (48, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (50, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (50, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (50, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (51, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (51, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (51, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (51, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (52, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (52, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (52, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (52, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (52, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (53, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (53, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (55, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (55, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (55, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (57, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (59, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (59, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (59, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (61, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (61, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 2, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (62, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (64, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (64, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (65, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (65, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (65, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (69, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (70, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (70, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (72, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (72, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (73, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (73, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (74, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (74, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (75, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (75, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (75, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (76, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (77, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (77, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (78, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (79, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (79, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (79, 8, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (80, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (80, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (80, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 3, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 9, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (82, 10, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (83, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (84, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (85, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (86, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (86, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (88, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (88, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (88, 7, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (91, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (92, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (93, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (93, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (94, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (96, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (96, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (97, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (98, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (99, 4, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (99, 5, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (99, 6, 0)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (100, 6, 0)
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (1, 16, 3, 0, N'', CAST(N'2024-08-17T18:24:19.4246497' AS DateTime2), CAST(N'2024-08-17T00:00:00.0000000' AS DateTime2), 3, N'IMP20240817182419', 1, 1, N'https://localhost:7033/uploads/kho-tivi-samsung-004_f11fa867-c456-4b98-98f7-95843e6a6f8c.jpg', 16, NULL)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (1, N'MLH20240817182407', 1, 1, 0, CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-31T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (2, N'MLH20240817182325', 1, 3, 0, CAST(N'2024-08-01T00:00:00.0000000' AS DateTime2), CAST(N'2024-08-25T00:00:00.0000000' AS DateTime2), 1000, 1000)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (8, 16, N'VnQOhIIzmpBN/h/zT0/PXNZE17r6Kpugctn86kEaTfI=', CAST(N'2024-08-17T09:16:14.4158465' AS DateTime2), CAST(N'2024-09-17T09:16:14.4158467' AS DateTime2), 0, N'090f3740-5e82-4eee-b0e6-c47c6fc913af')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
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

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Asus', N'0987654321', 1, N'asus@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Samsung', N'0912345678', 1, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Apple', N'0993225653', 1, N'apple@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Xiaomi', N'0912345678', 1, N'xiaomi@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Dell', N'0912345678', 1, N'dell@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'Toshiba', N'0987654321', 1, N'toshiba@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Sony', N'0912345678', 1, N'sony@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'Logitech', N'0925608857', 1, N'logitech@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (10, N'JBL', N'0912345678', 1, N'jbl@example.com', N'')
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (11, N'Fujifilm', N'0923634925', 1, N'fujifilm@example.com', N'')
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (16, N'thanhtunga933@gmail.com', N'iByd0i0/I/o=', N'0832574256', 1, 1, N'admin', N'ADM0001', N'Nam Định', N'https://localhost:7033/uploads/8b167af653c2399dd93b952a48740620_aa13f266-e9fc-497e-8d5a-49bb6c01341c.jpg', N'Admin')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (17, N'thanhtunga933@gmail.com', N'iByd0i0/I/o=', N'0927629032', 2, 1, N'manager', N'WHM0001', N'Thái Bình', N'https://localhost:7033/uploads/822726_user_512x512_9b6d55fa-b514-4d3b-bb5c-b1936aa6a6de.png', N'Manager')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (18, N'thanhtunga933@gmail.com', N'iByd0i0/I/o=', N'0925608857', 3, 1, N'staff', N'STF0001', N'Sơn La', N'https://localhost:7033/uploads/png-clipart-computer-icons-avatar-mover-business-flat-design-corporate-elderly-care-microphone-heroes_b0f0095f-94db-4b80-843a-d32984c56f8f.png', N'Staff')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (19, N'thanhtunga933@gmail.com', N'iByd0i0/I/o=', N'0927629032', 4, 1, N'accountant', N'ACC0001', N'Thái Bình', N'https://localhost:7033/uploads/png-clipart-computer-icons-avatar-mover-business-flat-design-corporate-elderly-care-microphone-heroes_dcd32157-442e-42eb-8593-18db6543a621.png', N'Accountant')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 16, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 17, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 18, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 19, 1)
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
