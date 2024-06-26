USE [master]
GO
/****** Object:  Database [iSmartVer4]    Script Date: 6/9/2024 5:27:51 PM ******/
CREATE DATABASE [iSmartVer5]
GO
USE [iSmartVer5]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[ActionType]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[EmailToken]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[ProjectId] [int] NOT NULL,
	[CancelDate] [datetime2](7) NULL,
	[DeliveryId] [int] NOT NULL,
	[image] [varchar](max) NULL,
	[StaffId] [int] NULL,
	[Customer] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_ExportOrder] PRIMARY KEY CLUSTERED 
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 6/9/2024 5:27:52 PM ******/
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
 CONSTRAINT [PK_ExportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 6/9/2024 5:27:52 PM ******/
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
	[InStock] [int] NOT NULL,
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
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[GoodsWarehouses]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
 CONSTRAINT [PK_ImportOrder] PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 6/9/2024 5:27:52 PM ******/
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
 CONSTRAINT [PK_ImportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeasuredUnit](
	[MeasuredUnitId] [int] IDENTITY(1,1) NOT NULL,
	[MeasuredUnitName] [nvarchar](100) NOT NULL,
	[MeasuredUnitValue] [int] NOT NULL,
 CONSTRAINT [PK_MeasuredUnit] PRIMARY KEY CLUSTERED 
(
	[MeasuredUnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[ReturnsOrder]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnsOrder](
	[ReturnsId] [int] IDENTITY(1,1) NOT NULL,
	[ImportId] [int] NOT NULL,
	[ExportId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Note] [nvarchar](250) NULL,
	[image] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[ReturnsCode] [nvarchar](50) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[TotalPrice] [real] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ImportedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_ReturnsOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnsOrderDetail]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnsOrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ReturnsId] [int] NOT NULL,
	[GoodsId] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_ReturnsOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[User_Warehouse]    Script Date: 6/9/2024 5:27:52 PM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 6/9/2024 5:27:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (1, N'Nhập hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (2, N'Xuất hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (3, N'Sửa hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (4, N'Khởi tạo', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (5, N'Kiểm hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (6, N'Trả hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (7, N'Nhập hàng trả', NULL)
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
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailToken] ON 

INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (7, N'Wo4r2SFAJsKaMY2atkndfwAwYlzQUtjEkRRe7FvZ8HJo04v6HuUCw0TFMSxr72cE', 11, CAST(N'2024-04-19T13:38:42.7983638' AS DateTime2), CAST(N'2024-04-20T13:38:42.7983977' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (8, N'OGqkoSt9jkD6DCv1iQIhLyrCVv8yURmyUVTByNDldwlFgpmswLwUpsw2IaySSm8G', 12, CAST(N'2024-04-19T13:41:57.4011619' AS DateTime2), CAST(N'2024-04-20T13:41:57.4011620' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (9, N'aSVDaqTTNAhtospVmMcpEdIVLmxKi68PMi2b6KSBkfQyocUsV13TB7DjJ99tevId', 13, CAST(N'2024-04-19T13:42:13.7504234' AS DateTime2), CAST(N'2024-04-20T13:42:13.7504234' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (10, N'cVZ8SdgkjgFnPGH7XfkWOThGKycvYhnZVCBj1gXkGt3fsk8mGxFx0OSllwRauCmh', 14, CAST(N'2024-04-19T13:42:28.0331631' AS DateTime2), CAST(N'2024-04-20T13:42:28.0331632' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[EmailToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'iPhone 13', N'IP13', 1, N'Diện thoại di động Apple iPhone 13', 2, N'Cái', 100, N'https://example.com/image1.png', 1, 2E+07, N'0123456789012', 200, 10, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy S21', N'SG21', 1, N'Diện thoại di động Samsung Galaxy S21', 3, N'Cái', 150, N'https://example.com/image2.png', 1, 1.8E+07, N'0123456789013', 150, 15, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 4, N'Cái', 50, N'https://example.com/image3.png', 1, 3E+07, N'0123456789014', 100, 5, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Sony A7 III', N'SA7III', 4, N'Máy ảnh Sony A7 III', 5, N'Cái', 20, N'https://example.com/image4.png', 1, 5E+07, N'0123456789015', 50, 5, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11', 6, N'Cái', 200, N'https://example.com/image5.png', 1, 1.5E+07, N'0123456789016', 300, 20, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360', 7, N'Cái', 80, N'https://example.com/image6.png', 1, 2.5E+07, N'0123456789017', 100, 10, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 8, N'Cái', 40, N'https://example.com/image7.png', 1, 4E+07, N'0123456789018', 50, 5, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R', 9, N'Cái', 30, N'https://example.com/image8.png', 1, 6E+07, N'0123456789019', 50, 5, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7', 3, N'Cái', 60, N'https://example.com/image9.png', 1, 1.8E+07, N'0123456789020', 100, 10, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 2, N'Cái', 150, N'https://example.com/image10.png', 1, 8000000, N'0123456789021', 200, 20, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic', 5, N'Cái', 20, N'https://example.com/image11.png', 1, 3E+07, N'0123456789022', 30, 2, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9', 4, N'Cái', 100, N'https://example.com/image12.png', 1, 1E+07, N'0123456789023', 150, 10, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5', 6, N'Cái', 50, N'https://example.com/image13.png', 1, 1.5E+07, N'0123456789024', 70, 5, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6', 3, N'Cái', 120, N'https://example.com/image14.png', 1, 1.2E+07, N'0123456789025', 200, 20, CAST(N'2024-06-09T17:22:48.1466667' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 2, 150)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 2, 100)
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (1, 11, 1, 500, N'Ghi chú cho đơn hàng 1', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 1, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (2, 12, 2, 750, N'Ghi chú cho đơn hàng 2', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 1, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (3, 13, 3, 320.5, N'Ghi chú cho đơn hàng 3', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 1, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (4, 14, 4, 450.75, N'Ghi chú cho đơn hàng 4', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 1, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (1, N'Batch001', 1, 1, 10.5, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-30T00:00:00.0000000' AS DateTime2), 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (2, N'Batch002', 1, 2, 12.75, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 150)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (3, N'Batch003', 4, 3, 8.99, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T00:00:00.0000000' AS DateTime2), 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (4, N'Batch004', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (5, N'Batch004', 3, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity]) VALUES (6, N'Batch005', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 140)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (82, 13, N'3KfkBfUNJTthmFJ5C2zdbSUFR3lm076IGh74UlEvPkg=', CAST(N'2024-04-23T17:32:19.1145504' AS DateTime2), CAST(N'2024-05-23T17:32:19.1145704' AS DateTime2), 0, N'f6c7d3c9-a190-4eef-bdfd-68c3a9dfc1e8')
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

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (1, N'Fama Technologies, Inc.', N'0912345678', 1, N'famatechnologies@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Logitech', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Samsung', N'0987654321', 2, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Crystal-Optech Co., Ltd', N'0912345678', 1, N'crystaloptech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Delta Electronics Incorporated', N'0123456789', 1, N'deltaelectronics@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Arist Benefex', N'0987654321', 1, N'aristbenefex@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'BrightHR', N'0912345678', 1, N'brighthr@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Engagedly Inc.', N'0123456789', 1, N'engagedly@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'EY Skills Foundry', N'0987654321', 1, N'eyskillsfoundry@example.com', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (11, N'ad@gmail.com', N'ZRYaSSd3CJo=', N'02823456789', 1, 1, N'ad', N'Administrator', N'SO 48 LE DAI HANH, HA BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Administrator')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (12, N'pm@gmail.com', N'+gLa4tZK2hw=', N'0966666888', 2, 1, N'pm', N'ProjectManager', N'101 MAI HAC DE, BUI THI XUAN, H.B.T, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Warehouse Manager')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (13, N'sk@gmail.com', N'cXSmyS8Q7Ns=', N'0912345678', 3, 1, N'sk', N'Storekeeper', N'26 TUE TINH, BUI THI XUAN, HAI BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Staff')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (14, N'ac@gmail.com', N'YjBRio6ltvA=', N'0106713191', 4, 1, N'ac', N'Accountant', N'2 NHA CHUNG, HANG TRONG, HOAN KIEM, HA NOI ', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Accountant')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 11, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (5, 11, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 12, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 13, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 14, 2)
SET IDENTITY_INSERT [dbo].[User_Warehouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Hải Phòng', N'Thành phố tb', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hà Nội', N'Thành phố HL', N'0369999999')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
/****** Object:  Index [IX_AvailableForReturns_ExportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ExportId] ON [dbo].[AvailableForReturns]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_GoodsId] ON [dbo].[AvailableForReturns]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_ImportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ImportId] ON [dbo].[AvailableForReturns]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_CreatedId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_CreatedId] ON [dbo].[Bill]
(
	[CreatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_StatusId] ON [dbo].[Bill]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_UpdatedId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_UpdatedId] ON [dbo].[Bill]
(
	[UpdatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_WarehouseId] ON [dbo].[Bill]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_BillId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_BillId] ON [dbo].[BillDetail]
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_GoodsId] ON [dbo].[BillDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Delivery_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Delivery_StatusId] ON [dbo].[Delivery]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailToken_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmailToken_UserId] ON [dbo].[EmailToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_DeliveryId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_DeliveryId] ON [dbo].[ExportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_StatusId] ON [dbo].[ExportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_UserId] ON [dbo].[ExportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_WarehouseId] ON [dbo].[ExportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_ExportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_ExportId] ON [dbo].[ExportOrderDetail]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_GoodsId] ON [dbo].[ExportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_CategoryId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_CategoryId] ON [dbo].[Goods]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_StatusId] ON [dbo].[Goods]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_SupplierId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_SupplierId] ON [dbo].[Goods]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_ActionId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_ActionId] ON [dbo].[GoodsHistory]
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_GoodsId] ON [dbo].[GoodsHistory]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_UserId] ON [dbo].[GoodsHistory]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsWarehouses_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsWarehouses_WarehouseId] ON [dbo].[GoodsWarehouses]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_DeliveryId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_DeliveryId] ON [dbo].[ImportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_StatusId] ON [dbo].[ImportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_SupplierId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_SupplierId] ON [dbo].[ImportOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_UserId] ON [dbo].[ImportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_WarehouseId] ON [dbo].[ImportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_GoodsId] ON [dbo].[ImportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_ImportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_ImportId] ON [dbo].[ImportOrderDetail]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshToken_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshToken_UserId] ON [dbo].[RefreshToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_ExportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_ExportId] ON [dbo].[ReturnsOrder]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_ImportId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_ImportId] ON [dbo].[ReturnsOrder]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_StatusId] ON [dbo].[ReturnsOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_SupplierId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_SupplierId] ON [dbo].[ReturnsOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_UserId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_UserId] ON [dbo].[ReturnsOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_WarehouseId] ON [dbo].[ReturnsOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrderDetail_GoodsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrderDetail_GoodsId] ON [dbo].[ReturnsOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrderDetail_ReturnsId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrderDetail_ReturnsId] ON [dbo].[ReturnsOrderDetail]
(
	[ReturnsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleFeature_featureId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleFeature_featureId] ON [dbo].[RoleFeature]
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_StatusId] ON [dbo].[Supplier]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleId] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_StatusId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_StatusId] ON [dbo].[User]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Warehouse_WarehouseId]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Warehouse_WarehouseId] ON [dbo].[User_Warehouse]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__User_War__95E846B211E0D37C]    Script Date: 6/9/2024 5:27:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__User_War__95E846B211E0D37C] ON [dbo].[User_Warehouse]
(
	[UserId] ASC,
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RefreshToken] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRevoked]
GO
ALTER TABLE [dbo].[ReturnsOrder] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
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
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_User_UserId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_ExportOrder_ExportId] FOREIGN KEY([ExportId])
REFERENCES [dbo].[ExportOrder] ([ExportId])
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_ExportOrder_ExportId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_ImportOrder_ImportId] FOREIGN KEY([ImportId])
REFERENCES [dbo].[ImportOrder] ([ImportId])
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_ImportOrder_ImportId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([StatusId])
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_Status]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_Storage_StorageId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_Storage_StorageId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_Supplier_SupplierId] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_User_UserId]
GO
ALTER TABLE [dbo].[ReturnsOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrderDetail_Goods_GoodsId] FOREIGN KEY([GoodsId])
REFERENCES [dbo].[Goods] ([GoodsId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReturnsOrderDetail] CHECK CONSTRAINT [FK_ReturnsOrderDetail_Goods_GoodsId]
GO
ALTER TABLE [dbo].[ReturnsOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrderDetail_ReturnsOrder_ReturnsId] FOREIGN KEY([ReturnsId])
REFERENCES [dbo].[ReturnsOrder] ([ReturnsId])
GO
ALTER TABLE [dbo].[ReturnsOrderDetail] CHECK CONSTRAINT [FK_ReturnsOrderDetail_ReturnsOrder_ReturnsId]
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
ALTER DATABASE [iSmartVer4] SET  READ_WRITE 
GO
