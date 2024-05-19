USE [master]
GO
CREATE DATABASE [iSmartVer2]
GO
USE [iSmartVer2]
GO
/****** Object:  Table [dbo].[ActionType]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AvailableForReturns](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImportId] [int] NULL,
	[ExportId] [int] NULL,
	[GoodsId] [int] NOT NULL,
	[Available] [int] NOT NULL,
 CONSTRAINT [PK_AvailableForReturns] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery](
	[DeliveyId] [int] IDENTITY(1,1) NOT NULL,
	[DeliveryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Delivery] PRIMARY KEY CLUSTERED 
(
	[DeliveyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailToken]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 4/24/2024 12:33:43 AM ******/
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
	[ProjectId] [int] NOT NULL,
	[CancelDate] [datetime2](7) NULL,
	[DeliveryId] [int] NULL,
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
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExportOrderDetail](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[ExportId] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[GoodsId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ExportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 4/24/2024 12:33:43 AM ******/
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
	[StatusId] [int] NULL,
	[StockPrice] [real] NOT NULL,
	[Barcode] [nvarchar](24) NULL,
	[WarehouseId] [int] NOT NULL,
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
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 4/24/2024 12:33:43 AM ******/
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
	[DeliveryId] [int] NULL,
	[image] [varchar](max) NULL,
	[StaffId] [int] NULL,
 CONSTRAINT [PK_ImportOrder] PRIMARY KEY CLUSTERED 
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportOrderDetail](
	[ImportId] [int] NOT NULL,
	[CostPrice] [real] NOT NULL,
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[GoodsId] [int] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ImportOrderDetail] PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Project]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[ReturnsOrder]    Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnsOrder](
	[ReturnsId] [int] IDENTITY(1,1) NOT NULL,
	[ImportId] [int] NULL,
	[ExportId] [int] NULL,
	[SupplierId] [int] NULL,
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
/****** Object:  Table [dbo].[ReturnsOrderDetail]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[[Bill]]    Script Date: 4/24/2024 12:33:43 AM ******/
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
 CONSTRAINT [PK_StocktakeNote] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[[BillDetail]]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[Warehouse]   Script Date: 4/24/2024 12:33:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[WarehouseId] [int] IDENTITY(1,1) NOT NULL,
	[WarehouseName] [nvarchar](100) NOT NULL,
	[WarehouseAddress] [nvarchar](100) NULL,
	[WarehousePhone] [varchar](20) NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 4/24/2024 12:33:43 AM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 4/24/2024 12:33:43 AM ******/
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
CREATE TABLE User_Warehouse (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    [WarehouseId] INT NOT NULL,
    FOREIGN KEY (UserId) REFERENCES [User](UserId),
    FOREIGN KEY ([WarehouseId]) REFERENCES Warehouse([WarehouseId]),
    UNIQUE(UserId, [WarehouseId])  -- Đảm bảo không có bản ghi trùng lặp
);
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

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName]) VALUES (1, N'Giao hàng tiết kiệm')
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName]) VALUES (2, N'Giao hàng nhanh')
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName]) VALUES (3, N'Bưu điện Việt Nam')
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName]) VALUES (4, N'Viettel Post')
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName]) VALUES (5, N'JT Express')
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailToken] ON 

INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (7, N'Wo4r2SFAJsKaMY2atkndfwAwYlzQUtjEkRRe7FvZ8HJo04v6HuUCw0TFMSxr72cE', 11, CAST(N'2024-04-19T13:38:42.7983638' AS DateTime2), CAST(N'2024-04-20T13:38:42.7983977' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (8, N'OGqkoSt9jkD6DCv1iQIhLyrCVv8yURmyUVTByNDldwlFgpmswLwUpsw2IaySSm8G', 12, CAST(N'2024-04-19T13:41:57.4011619' AS DateTime2), CAST(N'2024-04-20T13:41:57.4011620' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (9, N'aSVDaqTTNAhtospVmMcpEdIVLmxKi68PMi2b6KSBkfQyocUsV13TB7DjJ99tevId', 13, CAST(N'2024-04-19T13:42:13.7504234' AS DateTime2), CAST(N'2024-04-20T13:42:13.7504234' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (10, N'cVZ8SdgkjgFnPGH7XfkWOThGKycvYhnZVCBj1gXkGt3fsk8mGxFx0OSllwRauCmh', 14, CAST(N'2024-04-19T13:42:28.0331631' AS DateTime2), CAST(N'2024-04-20T13:42:28.0331632' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[EmailToken] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrder] ON 

INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [ProjectId], [CancelDate], [DeliveryId], [image], [StaffId], [Customer], [Address]) VALUES (10, N'XH32', 12, 1728, N'', 4, CAST(N'2024-04-24T00:21:11.2008216' AS DateTime2), CAST(N'2024-04-24T00:29:43.5883685' AS DateTime2), 1, 1, NULL, 1, N'https://ik.imagekit.io/warehousesystemsp24/Tím_Hi?n_d?i_Logo_Công_ngh?___Trò_choi_Mt9CFi-MM.png', 13, NULL, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [ProjectId], [CancelDate], [DeliveryId], [image], [StaffId], [Customer], [Address]) VALUES (11, N'XH5354', 11, 104312936, N'', 3, CAST(N'2024-04-24T00:31:16.7375210' AS DateTime2), CAST(N'2024-04-26T00:00:00.0000000' AS DateTime2), 1, 1, CAST(N'2024-03-24T08:47:56.2430000' AS DateTime2), 1, N'https://ik.imagekit.io/warehousesystemsp24/37667_mouse-dell-ms116-usb-black_bWbMg1qgt.jpg', NULL, NULL, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [ProjectId], [CancelDate], [DeliveryId], [image], [StaffId], [Customer], [Address]) VALUES (12, N'XH24234', 11, 2.19016218E+09, N'', 4, CAST(N'2024-04-24T00:31:49.6524245' AS DateTime2), CAST(N'2024-04-24T00:32:27.9621619' AS DateTime2), 1, 1, NULL, 3, N'https://ik.imagekit.io/warehousesystemsp24/Honeywell_voyager1450g__77086_zo_9QU204EMR.jpg', 13, NULL, NULL)
SET IDENTITY_INSERT [dbo].[ExportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] ON 

INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity]) VALUES (1, 10, 432, 6, 4)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity]) VALUES (2, 11, 4535345, 6, 23)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity]) VALUES (3, 12, 234234, 6, 54)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity]) VALUES (4, 12, 40324324, 8, 54)
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'iPhone 14 Pro Max', N'IP14PM', 1, N'Ði?n tho?i cao c?p Apple', 3, N'Chiếc', 43, N'https://ik.imagekit.io/warehousesystemsp24/iphone-14-pro-max-tim-thumb-600x600_fGWxR2TqT.jpg
', 1, 3.299E+07, N'IP14PM001', 1, 100, 20, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy S23 Ultra', N'SGS23U', 1, N'Ði?n tho?i flagship Samsung', 3, N'Chiếc', 23, N'https://ik.imagekit.io/warehousesystemsp24/s23-ultra-vang-1_c54eca3d92334ea_volZa3uyQ.png
', 2, 2.699E+07, N'SGS23U001', 1, 80, 15, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Laptop cao c?p Dell', 4, N'Chiếc', 54, N'https://ik.imagekit.io/warehousesystemsp24/dell-xps-13-9310-thinkpro_5Rtc7tiz-.png
', 1, 3.999E+07, N'DXPS13001', 2, 50, 10, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Loa Bluetooth JBL', N'JBLBT', 6, N'Loa di d?ng JBL', 6, N'Chiếc', 119, N'https://ik.imagekit.io/warehousesystemsp24/jbl-flip-essential-2-3-4-right-3_99vX_47eG.png
', 1, 87678, N'JBLBT001', 1, 200, 30, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Máy Lọc Không Khí LG', N'LGAIR', 7, N'Máy l?c không khí LG', 3, N'Chiếc', 54, N'https://ik.imagekit.io/warehousesystemsp24/10049653-may-loc-khong-khi-lg-pu_gX4drd0VT.png
', 2, 7990000, N'LGAIR001', 2, 75, 15, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'Sony Alpha A7 IV', N'SNYA7IV', 4, N'Máy ?nh mirrorless full-frame', 2, N'Chiếc', 4256, N'https://ik.imagekit.io/warehousesystemsp24/sony-alpha-a7m4-12-500x500_w85jmOGxN.jpg
', 2, 42344, N'SNYA7IV001', 1, 30, 5, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'iPad Pro 12.9" (2022)', N'IPD129', 5, N'Máy tính b?ng cao c?p Apple', 3, N'Chiếc', 5, N'https://ik.imagekit.io/warehousesystemsp24/ipad-pro-13-select-wifi-spacegra_IsLRlIFAT.jpg
', 1, 2.799E+07, N'IPD129001', 2, 60, 10, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Tai Nghe Sony WH-1000XM5', N'SNWH1000', 6, N'Tai nghe ch?ng ?n cao c?p', 2, N'Chiếc', 78, N'https://ik.imagekit.io/warehousesystemsp24/10052467-tai-nghe-khong-day-sony_SzAf7xLLM.jpg
', 1, 213423, N'SNWH1000001', 1, 100, 20, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 21)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Tủ Lạnh Samsung Side-by-Side', N'SSSBS', 7, N'T? l?nh side-by-side l?n', 3, N'Chiếc', 4290, N'https://ik.imagekit.io/warehousesystemsp24/samsung-rs64t5f01b4-sv-1.-600x60_Zkhsm_gZq.jpg
', 1, 23423, N'SSSBS001', 2, 40, 8, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 43)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'CPU Intel Core i9-13900K', N'INTI9K', 8, N'CPU flagship Intel th? h? 13', 5, N'Chiếc', 3, N'https://ik.imagekit.io/warehousesystemsp24/68378_cpu_intel_core_i9_13900__3_x153Ix6Qv.jpg
', 1, 1.299E+07, N'INTI9K001', 1, 80, 15, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 54)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'PlayStation 5', N'PS5', 9, N'Máy choi game th? h? m?i', 2, N'Chiếc', 4, N'https://ik.imagekit.io/warehousesystemsp24/77517_may_choi_game_sony_playsta_3L7_lQRba.jpg
', 2, 2222222, N'PS5001', 2, 60, 10, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Apple Watch Series 8', N'AWTS8', 10, N'Ð?ng h? thông minh Apple cao c?p', 3, N'Chiếc', 12, N'https://ik.imagekit.io/warehousesystemsp24/apple-watch-series-8-44-500x500_GQEiEQryi.jpg
', 1, 432543, N'AWTS8001', 1, NULL, NULL, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'Máy Giặt LG AI DD', N'LGAIDD', 7, N'Máy gi?t s?y LG AI DD', 3, N'Chiếc', 8, N'https://ik.imagekit.io/warehousesystemsp24/may-git-sy-lg-inverter-ai-dd-15k_y4Cip4UrC.jpg
', 2, 1.999E+07, N'LGAIDD001', 2, 50, 10, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 45)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Ổ Cứng SSD Samsung 980 Pro', N'SS980P', 8, N'? c?ng SSD NVMe cao c?p', 3, N'Chiếc', 68, N'https://ik.imagekit.io/warehousesystemsp24/ng-980-pro-250gb-m-2-nvme-mz-v8p_T38vhgSDo.jpg
', 2, 534653, N'SS980P001', 1, 150, 30, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 56)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (15, N'Nintendo Switch OLED', N'NSWOLED', 9, N'Máy choi game Nintendo Switch OLED', 7, N'Chiếc', 23, N'https://ik.imagekit.io/warehousesystemsp24/76148_may_choi_game_nintendo_swi_TcfxkU2KC.jpg
', 2, 9990000, N'NSWOLED001', 2, 75, 15, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (21, N'Cáp HDMI dài 15m Y-C143
', N'VT00003
', 2, N'Cáp HDMI dài 15m Y-C143
', 4, N'Cái', 32, N'https://ik.imagekit.io/warehousesystemsp24/2470911_c__p_hdmi_unitek_y_c143_bKjix7Gcm.jpg
', 1, 100000, N'VT00003
', 1, 23, 1, CAST(N'2023-08-01T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (25, N'Máy đọc mã vạch Honeywell 1900GHD-2USB, cáp USB
', N'VT00111
', 4, N'Máy đọc mã vạch Honeywell 1900GHD-2USB, cáp USB
', 6, N'Chiếc', 17, N'https://ik.imagekit.io/warehousesystemsp24/Honeywell_voyager1450g__77086_zo_tUSGzHLZT.jpg
', 1, 7658678, N'VT00111
', 1, 45, 2, CAST(N'2024-11-02T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (32, N'Máy tính xách tay ASUS VivoBook X515EA', N'AS001', 1, N'Máy tính xách tay ASUS VivoBook X515EA v?i CPU Intel Core i3-1115G4, RAM 4GB, SSD 256GB, VGA Intel UHD Graphics, 15.6" FHD, Windows 10 Home', 2, N'Chiếc', 50, N'https://ik.imagekit.io/warehousesystemsp24/x515ja-212-v15bb-1_2FbQ6hOzi.jpg
', 1, 1.499E+07, N'8935238715149', 1, 100, 10, CAST(N'2022-03-15T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (33, N'Màn hình máy tính Dell P2319H 23" IPS', N'DL002', 2, N'Màn hình máy tính Dell P2319H 23" IPS, Full HD (1920 x 1080), 60Hz, 5ms, 250 nits, HDMI, VGA, DisplayPort', 2, N'Chiếc', 20, N'https://ik.imagekit.io/warehousesystemsp24/7376-p2319h_FEiMepMVE.jpg
', 1, 3990000, N'4718644516363', 2, 50, 5, CAST(N'2023-01-20T00:00:00.0000000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (34, N'Chuột không dây Logitech M171', N'LG003', 3, N'Chu?t không dây Logitech M171 v?i thi?t k? nh? g?n, d?u nh?n tín hi?u USB nano, pin AA dùng du?c 12 tháng', 3, N'Chiếc', 123, N'https://ik.imagekit.io/warehousesystemsp24/chupercentagee1percentagebbper-a_6eyScL4Qj.jpg
', 1, 565463, N'7391063717318', 1, 200, 20, CAST(N'2022-09-01T00:00:00.0000000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (35, N'Loa thanh SoundBar Samsung HW-Q60T', N'SM004', 4, N'Loa thanh SoundBar Samsung HW-Q60T, công su?t 340W, Dolby Digital 5.1, DTS Virtual:X, Bluetooth, HDMI, Optical, USB', 4, N'Chiếc', 55, N'https://ik.imagekit.io/warehousesystemsp24/loa-thanh-samsung-hw-q60t-le-thi_BcJ4mIeQ-.jpg
', 1, 1224423, N'8806092668377', 2, 60, 10, CAST(N'2023-02-10T00:00:00.0000000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [InStock], [Image], [StatusId], [StockPrice], [Barcode], [WarehouseId], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (36, N'Máy in don nang Canon Pixma E477', N'CN005', 5, N'Máy in don nang Canon Pixma E477, in, scan, copy, in phun màu, kh? A4, USB 2.0', 5, N'Chiếc', 15, N'https://ik.imagekit.io/warehousesystemsp24/e56af9f225764244a56e7058ab6cf967_jRwHV9yzE.jpg
', 1, 1990000, N'4549292168723', 1, 30, 5, CAST(N'2022-07-20T00:00:00.0000000' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[GoodsHistory] ON 

INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (3, 8, 1, CAST(N'2024-04-24T00:28:32.9900392' AS DateTime2), 8990000, N'-6676877', 89, N'2', NULL, N'NHed', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (4, 35, 1, CAST(N'2024-04-24T00:28:34.8992934' AS DateTime2), 6990000, N'-5868688', 42, N'12', NULL, N'NH124', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (5, 35, 1, CAST(N'2024-04-24T00:28:34.9008686' AS DateTime2), 1121312, N'103111', 55, N'13', NULL, N'NH124', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (6, 12, 1, CAST(N'2024-04-24T00:29:29.1654114' AS DateTime2), 0, N'432543', 12, N'12', NULL, N'NH21', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (7, 34, 1, CAST(N'2024-04-24T00:29:29.1670415' AS DateTime2), 199000, N'366463', 123, N'23', NULL, N'NH21', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (8, 14, 1, CAST(N'2024-04-24T00:29:29.1684222' AS DateTime2), 4990000, N'-4455347', 68, N'23', NULL, N'NH21', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (9, 25, 1, CAST(N'2024-04-24T00:29:30.5512575' AS DateTime2), 943000, N'6715678', 17, N'5', NULL, N'NH12231', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (10, 4, 1, CAST(N'2024-04-24T00:29:30.5529469' AS DateTime2), 1690000, N'-1602322', 119, N'87', NULL, N'NH12231', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (11, 6, 2, CAST(N'2024-04-24T00:29:43.5915183' AS DateTime2), 12, NULL, 76, N'-4', NULL, N'XH32', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (12, 8, 1, CAST(N'2024-04-24T00:32:23.5965601' AS DateTime2), 2313123, N'-2099700', 132, N'43', NULL, N'NH4234', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (13, 6, 1, CAST(N'2024-04-24T00:32:23.5987359' AS DateTime2), 12, N'42332', 4310, N'4234', NULL, N'NH4234', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (14, 9, 1, CAST(N'2024-04-24T00:32:24.7382422' AS DateTime2), 2.999E+07, N'-29966576', 4290, N'4234', NULL, N'NH535345', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (15, 6, 2, CAST(N'2024-04-24T00:32:27.9637898' AS DateTime2), 42344, NULL, 4256, N'-54', NULL, N'XH24234', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (16, 8, 2, CAST(N'2024-04-24T00:32:27.9655786' AS DateTime2), 213423, NULL, 78, N'-54', NULL, N'XH24234', 13)
SET IDENTITY_INSERT [dbo].[GoodsHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (10, 12, 2, 4626246, N'', CAST(N'2024-04-23T22:05:06.7700340' AS DateTime2), CAST(N'2024-04-24T00:28:32.9649679' AS DateTime2), 4, N'NHed', 1, 1, N'https://ik.imagekit.io/warehousesystemsp24/76148_may_choi_game_nintendo_swi_G42BopE4f.jpg', 13)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (11, 12, 3, 30493184, N'', CAST(N'2024-04-23T23:39:56.7589141' AS DateTime2), CAST(N'2024-04-24T00:29:29.1628610' AS DateTime2), 4, N'NH21', 1, 2, N'https://ik.imagekit.io/warehousesystemsp24/loa-thanh-samsung-hw-q60t-le-thi_pOHSFbEUn.jpg', 13)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (12, 12, 4, 29373244, N'', CAST(N'2024-04-23T23:40:48.7295688' AS DateTime2), CAST(N'2024-04-24T00:28:34.8974121' AS DateTime2), 4, N'NH124', 2, 4, N'https://ik.imagekit.io/warehousesystemsp24/loa-thanh-samsung-hw-q60t-le-thi_pOHSFbEUn.jpg', 13)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (13, 12, 5, 3582754, N'', CAST(N'2024-04-23T23:42:59.6518124' AS DateTime2), CAST(N'2024-04-25T00:00:00.0000000' AS DateTime2), 3, N'NH124', 1, 5, N'https://ik.imagekit.io/warehousesystemsp24/dell-xps-13-9310-thinkpro_iQtALI59v.png', NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (14, 12, 6, 45921376, N'', CAST(N'2024-04-23T23:43:48.1214005' AS DateTime2), CAST(N'2024-04-24T00:29:30.5496618' AS DateTime2), 4, N'NH12231', 1, 3, N'https://ik.imagekit.io/warehousesystemsp24/dell-xps-13-9310-thinkpro_iQtALI59v.png', 13)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (15, 12, 2, 3682812, N'', CAST(N'2024-04-23T23:44:27.8358529' AS DateTime2), CAST(N'2024-04-24T00:20:53.4485697' AS DateTime2), 5, N'NH53453', 1, 1, N'https://ik.imagekit.io/warehousesystemsp24/dell-xps-13-9310-thinkpro_iQtALI59v.png', NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (16, 11, 3, 99172984, N'', CAST(N'2024-04-23T23:45:30.0522975' AS DateTime2), CAST(N'2024-04-24T00:32:24.7366284' AS DateTime2), 4, N'NH535345', 2, 3, NULL, 13)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId]) VALUES (17, 11, 2, 188461680, N'', CAST(N'2024-04-24T00:30:56.2176917' AS DateTime2), CAST(N'2024-04-24T00:32:23.5941179' AS DateTime2), 4, N'NH4234', 1, 2, N'https://ik.imagekit.io/warehousesystemsp24/o3sC-_N7y7_W_rzaXfZgq4.jpg', 13)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (10, 2313123, 4, 8, 2)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (11, 432543, 5, 12, 12)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (11, 565463, 6, 34, 23)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (11, 534653, 7, 14, 23)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (12, 1121312, 8, 35, 12)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (12, 1224423, 9, 35, 13)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (13, 44234, 10, 10, 23)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (13, 12044, 11, 36, 213)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (14, 7658678, 12, 25, 5)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (14, 87678, 13, 4, 87)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (15, 87686, 14, 8, 42)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (16, 23423, 15, 9, 4234)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (17, 213423, 16, 8, 43)
INSERT [dbo].[ImportOrderDetail] ([ImportId], [CostPrice], [DetailId], [GoodsId], [Quantity]) VALUES (17, 42344, 17, 6, 4234)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Project] ON 

INSERT [dbo].[Project] ([ProjectId], [ProjectName]) VALUES (1, N'Lắp đặt máy tính                                                                                    ')
SET IDENTITY_INSERT [dbo].[Project] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (82, 13, N'3KfkBfUNJTthmFJ5C2zdbSUFR3lm076IGh74UlEvPkg=', CAST(N'2024-04-23T17:32:19.1145504' AS DateTime2), CAST(N'2024-05-23T17:32:19.1145704' AS DateTime2), 0, N'f6c7d3c9-a190-4eef-bdfd-68c3a9dfc1e8')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Project Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Storekeeper')
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
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF

GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Logitech', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Samsung', N'0987654321', 2, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Crystal-Optech Co., Ltd', N'0912345678', 1, N'crystaloptech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Delta Electronics Incorporated', N'0123456789', 1, N'deltaelectronics@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Arist Benefex', N'0987654321', 1, N'aristbenefex@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'BrightHR', N'0912345678', 1, N'brighthr@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Engagedly Inc.', N'0123456789', 1, N'engagedly@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'EY Skills Foundry', N'0987654321', 1, N'eyskillsfoundry@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (10, N'Fama Technologies, Inc.', N'0912345678', 1, N'famatechnologies@example.com', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (11, N'ad@gmail.com', N'ZRYaSSd3CJo=', N'02823456789', 1, 1, N'ad', N'Administrator', N'SO 48 LE DAI HANH, HA BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Administrator')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (12, N'pm@gmail.com', N'+gLa4tZK2hw=', N'0966666888', 2, 1, N'pm',  N'ProjectManager', N'101 MAI HAC DE, BUI THI XUAN, H.B.T, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Project Manager')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (13, N'sk@gmail.com', N'cXSmyS8Q7Ns=', N'0912345678', 3, 1, N'sk',  N'Storekeeper', N'26 TUE TINH, BUI THI XUAN, HAI BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Storekeeper')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (14, N'ac@gmail.com', N'YjBRio6ltvA=', N'0106713191', 4, 1, N'ac',  N'Accountant', N'2 NHA CHUNG, HANG TRONG, HOAN KIEM, HA NOI ', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Accountant')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[ExportOrder] ADD  CONSTRAINT [DF__ExportOrd__Stora__0E04126B]  DEFAULT ((0)) FOR [WarehouseId]
GO
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF__Goods__InStock__534D60F1]  DEFAULT ((0)) FOR [InStock]
GO
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF__Goods__StockPric__5441852A]  DEFAULT (CONVERT([real],(0))) FOR [StockPrice]
GO
ALTER TABLE [dbo].[Goods] ADD  CONSTRAINT [DF__Goods__StorageId__5629CD9C]  DEFAULT ((0)) FOR [WarehouseId]
GO
ALTER TABLE [dbo].[GoodsHistory] ADD  DEFAULT ((0)) FOR [UserId]
GO
ALTER TABLE [dbo].[ImportOrder] ADD  CONSTRAINT [DF__ImportOrd__Stora__11D4A34F]  DEFAULT ((0)) FOR [WarehouseId]
GO
ALTER TABLE [dbo].[RefreshToken] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsRevoked]
GO
ALTER TABLE [dbo].[ReturnsOrder] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [CreatedDate]
GO
ALTER TABLE [dbo].[ReturnsOrder] ADD  DEFAULT ((0)) FOR [WarehouseId]
GO
ALTER TABLE [dbo].[ReturnsOrder] ADD  DEFAULT (CONVERT([real],(0))) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[ReturnsOrder] ADD  DEFAULT ((0)) FOR [StatusId]
GO
ALTER TABLE [dbo].[ReturnsOrderDetail] ADD  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Bill] ADD  DEFAULT ((0)) FOR [CreatedId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__RoleId__619B8048]  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF__User__Status__628FA481]  DEFAULT (CONVERT([bit],(0))) FOR [StatusId]
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
ALTER TABLE [dbo].[EmailToken]  WITH CHECK ADD  CONSTRAINT [FK_EmailToken_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EmailToken] CHECK CONSTRAINT [FK_EmailToken_User_UserId]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Delivery] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveyId])
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Delivery]
GO
ALTER TABLE [dbo].[ExportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ExportOrder_Project] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Project] ([ProjectId])
GO
ALTER TABLE [dbo].[ExportOrder] CHECK CONSTRAINT [FK_ExportOrder_Project]
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
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Status]
GO
ALTER TABLE [dbo].[Goods]  WITH CHECK ADD  CONSTRAINT [FK_Goods_Storage_StorageId] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([WarehouseId])
GO
ALTER TABLE [dbo].[Goods] CHECK CONSTRAINT [FK_Goods_Storage_StorageId]
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
ALTER TABLE [dbo].[ImportOrder]  WITH CHECK ADD  CONSTRAINT [FK_ImportOrder_Delivery] FOREIGN KEY([DeliveryId])
REFERENCES [dbo].[Delivery] ([DeliveyId])
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
GO
ALTER TABLE [dbo].[ReturnsOrder] CHECK CONSTRAINT [FK_ReturnsOrder_Supplier_SupplierId]
GO
ALTER TABLE [dbo].[ReturnsOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnsOrder_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
ON DELETE CASCADE
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
ON DELETE CASCADE
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

USE [master]
GO
ALTER DATABASE [iSmartVer2] SET  READ_WRITE 
GO
