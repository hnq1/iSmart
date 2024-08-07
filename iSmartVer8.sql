USE [master]
GO
/****** Object:  Database [iSmartVer7]    Script Date: 7/13/2024 8:45:12 PM ******/
CREATE DATABASE [iSmartVer7]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iSmartVer7', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TUANTHANH\MSSQL\DATA\iSmartVer7.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'iSmartVer7_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.TUANTHANH\MSSQL\DATA\iSmartVer7_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [iSmartVer7] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iSmartVer7].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iSmartVer7] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iSmartVer7] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iSmartVer7] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iSmartVer7] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iSmartVer7] SET ARITHABORT OFF 
GO
ALTER DATABASE [iSmartVer7] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [iSmartVer7] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iSmartVer7] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iSmartVer7] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iSmartVer7] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iSmartVer7] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iSmartVer7] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iSmartVer7] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iSmartVer7] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iSmartVer7] SET  ENABLE_BROKER 
GO
ALTER DATABASE [iSmartVer7] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iSmartVer7] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iSmartVer7] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iSmartVer7] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iSmartVer7] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iSmartVer7] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [iSmartVer7] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iSmartVer7] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [iSmartVer7] SET  MULTI_USER 
GO
ALTER DATABASE [iSmartVer7] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iSmartVer7] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iSmartVer7] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iSmartVer7] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iSmartVer7] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [iSmartVer7] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [iSmartVer7] SET QUERY_STORE = ON
GO
ALTER DATABASE [iSmartVer7] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [iSmartVer7]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ActionType]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[AvailableForReturns]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Bill]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[BillDetail]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Category]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Customers]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Delivery]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[EmailToken]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ExportOrder]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ExportOrderDetail]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Features]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Goods]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[GoodsHistory]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[GoodsWarehouses]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ImportOrder]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ImportOrderDetail]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[MeasuredUnit]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ReturnsOrder]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[ReturnsOrderDetail]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[User_Warehouse]    Script Date: 7/13/2024 8:45:13 PM ******/
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
/****** Object:  Table [dbo].[Warehouse]    Script Date: 7/13/2024 8:45:13 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240608100305_AddStatusForDelivery', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240610080832_AddAttributeForGoodWarehouse', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240618155402_fixDeliveryId', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622185405_AddWarehouseDestinationToImportOrder', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622190226_UpdateNullforSupplierToImportOrder', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240622192626_UpdateNullforSupplierToImportOrderAgain', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240627133002_AddActualQuantity', N'6.0.31')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240628091405_AddCustomerAndUpdateExportOrder1', N'6.0.31')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240701092500_AddWarehouseDestinationForExport', N'6.0.31')
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
INSERT [dbo].[Category] ([CategoryId], [CategoryName], [Description]) VALUES (11, N' ', N' ')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'test', 2)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (6, N'fdsgfdsg', 1)
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

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'iPhone 13', N'IP13', 1, N'Diện thoại di động Apple iPhone 13', 2, N'Cái', N'https://example.com/image1.png', 1, 2E+07, N'0123456789012', 200, 10, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy S21', N'SG21', 1, N'Diện thoại di động Samsung Galaxy S21', 2, N'Cái', N'https://example.com/image2.png', 1, 1.8E+07, N'0123456789013', 150, 15, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 4, N'Cái', N'https://example.com/image3.png', 1, 3E+07, N'0123456789014', 100, 5, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Sony A7 III', N'SA7III', 4, N'Máy ảnh Sony A7 III', 5, N'Cái', N'https://example.com/image4.png', 1, 5E+07, N'0123456789015', 50, 5, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11', 2, N'Cái', N'https://example.com/image5.png', 1, 1.5E+07, N'0123456789016', 300, 20, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360', 4, N'Cái', N'https://example.com/image6.png', 1, 2.5E+07, N'0123456789017', 100, 10, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 8, N'Cái', N'https://example.com/image7.png', 1, 4E+07, N'0123456789018', 50, 5, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R', 1, N'Cái', N'https://example.com/image8.png', 1, 6E+07, N'0123456789019', 50, 5, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7', 2, N'Cái', N'https://example.com/image9.png', 1, 1.8E+07, N'0123456789020', 100, 10, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 2, N'Cái', N'https://example.com/image10.png', 1, 8000000, N'0123456789021', 200, 20, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic', 4, N'Cái', N'https://example.com/image11.png', 1, 3E+07, N'0123456789022', 30, 2, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9', 1, N'Cái', N'https://example.com/image12.png', 1, 1E+07, N'0123456789023', 150, 10, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5', 2, N'Cái', N'https://example.com/image13.png', 1, 1.5E+07, N'0123456789024', 70, 5, CAST(N'2024-06-23T02:29:54.6200000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6', 4, N'Cái', N'https://example.com/image14.png', 1, 2000000, N'0123456789025', 200, 20, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (15, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'string', 2, N'string', 1, N'string', N'string', 1, 1200000, N'string', 200, 1, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (16, N'Astro A10', N'AS10', 6, N'tai nghe Gaming', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_4ab1c6ae-57b6-4013-8b5a-2a7a8c732f2d.jpg', 1, 700000, NULL, 200, 4, CAST(N'2024-06-25T18:08:02.5672420' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (17, N'Logitech G102', N'LG102', 9, N'Chuột Gaming', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e1ef0a72-9788-4a6a-8b22-5043a97373c2.jpg', 1, 250000, NULL, 200, 4, CAST(N'2024-06-25T18:16:42.5918040' AS DateTime2), 2)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (18, N'Logi Dock', N'LD1', 6, N'loa thu âm', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_ff49f048-3e0d-43fa-9ae5-8e379a75acb2.jpg', 1, 300000, NULL, 1000, 1000, CAST(N'2024-06-25T18:21:30.8735657' AS DateTime2), 11)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (19, N'Newsun HS-20', N'HS20', 7, N'Máy đánh bột HS20', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_97f6e816-b1af-4d7c-90f7-1351d891db81.jpg', 1, 1.3E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:23:09.4026236' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (20, N'Newsun B30B', N'B30B', 7, N'Máy đánh bột 30 lít', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_774c8a7c-34f0-4656-add3-b8aa0ac3b586.jpg', 1, 2.5E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:26:28.8264496' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (21, N'KitchenAid Artisan', N'KA5', 7, N'Máy đánh bột', 1, N'Kg', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_09c7e358-462b-4ed6-92f3-eea8c9e88363.jpg', 1, 1E+07, NULL, 1000, 1000, CAST(N'2024-06-25T18:28:33.7015150' AS DateTime2), 4)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (22, N'Galaxy tab S9', N'GTS9', 1, N'máy tính bảng', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_117e9038-bf44-47fe-956f-9bd397e0a756.jpg', 1, 1.7E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:30:16.5440622' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (23, N'Galaxy Z fold5', N'GZF5', 1, N'smart phone', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_818d6731-cd6a-4d9e-a595-64d6c23126ba.jpg', 1, 4.5E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:31:50.9289135' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (24, N'Smart Tivi Samsung UHD85', N'ST1', 3, N'smart TV', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_bc7e14b8-f4e2-4c47-8ba9-56c64a242b01.jpg', 1, 2.7E+07, NULL, 100, 1000, CAST(N'2024-06-25T18:33:16.7751334' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (25, N'Asrock Z270M Pro 4', N'AZ4', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_8c3b4ddd-ef9a-48cd-83ef-8a6fdcfefa15.jpg', 1, 1100000, NULL, 100, 1000, CAST(N'2024-06-25T18:37:47.1561154' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (26, N'Asus prime H610M', N'AP6', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_201159a6-4a31-46c6-b0d8-515f72538ee9.jpg', 1, 1900000, NULL, 10, 998, CAST(N'2024-06-25T18:41:31.8866574' AS DateTime2), 3)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (27, N'TUF B760M', N'TB7', 8, N'Main máy tính', 4, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_25e8e5c9-042c-4578-b16a-99351c29e1e4.jpg', 1, 2700000, NULL, 10, 998, CAST(N'2024-06-25T18:43:39.3732035' AS DateTime2), 4)
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
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (45, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', N'AN16', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R50Z', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_eb3d8a13-5801-4f89-8452-d33824ba7aea.jpg', 1, 2800000, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (46, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN5T', 2, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_15066f7e-7c0d-41cd-afa5-3b1f6db01113.jpg', 1, 2.579E+07, NULL, 200, 2, CAST(N'2024-06-25T20:35:00.8606326' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (47, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', N'AN16P', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R3SM', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_1ecb02d2-4345-4162-aa50-72ce3778cc71.jpg', 1, 3.299E+07, NULL, 200, 2, CAST(N'2024-06-25T20:36:17.8593834' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (48, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', N'R60F', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_cb92f379-c602-4671-bd9e-e548b5cc04ca.jpg', 1, 2.899E+07, NULL, 200, 2, CAST(N'2024-06-25T20:40:10.7823276' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (49, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', N'R76E', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_e1cec681-f3f9-45fb-9fac-7521e766ed1b.jpg', 1, 3.699E+07, NULL, 200, 2, CAST(N'2024-06-25T20:41:47.9181910' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (50, N'Laptop Acer Predator Helios Neo PHN16-71-7460', N'PHN16', 2, N'Laptop Acer Predator Helios Neo PHN16-71-7460', 1, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_0a7c08f9-9d2b-4f4a-8246-d3c15bce1766.jpg', 1, 3.699E+07, NULL, 200, 2, CAST(N'2024-06-25T20:42:38.4080838' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (52, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', N'R76E', 2, N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R76E', 2, N'thùng', NULL, 1, 4.9E+07, NULL, 200, 2, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (53, N'Laptop Acer Predator Helios Neo PHN16-71', N'547E', 2, N'Laptop Acer Predator Helios Neo PHN16-71', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_fe462908-739b-48c9-ab2d-532aa1980e75.jpg', 1, 3.799E+07, NULL, 200, 2, CAST(N'2024-06-25T21:01:28.9799784' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (54, N'Laptop Acer Gaming Nitro V ANV15-51-75GS', N'ANV15', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_29e76b46-c646-4864-98d5-d079cb8f745f.jpg', 1, 2.799E+07, NULL, 200, 2, CAST(N'2024-06-25T21:02:53.3552550' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (55, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', N'72vs', 2, N'Laptop Acer Gaming Nitro V ANV15-51-72VS', 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_59efd52f-7b96-43ac-a76c-a362a433a870.jpg', 1, 2.399E+07, NULL, 200, 2, CAST(N'2024-06-25T21:03:54.7032711' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (56, N'Laptop Gaming Acer Aspire 7 A715-76G-5806', N'A715', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_6790bbbc-0e0e-4145-b82c-b846bdb59576.jpg', 1, 1.969E+07, NULL, 200, 2, CAST(N'2024-06-25T21:05:05.7112730' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (57, N'Laptop Gaming Acer Nitro 5 Tiger AN515-58-5935', N'AN515', 2, NULL, 2, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_157d0f65-ef04-4b21-91b5-7c8ffe43e2c5.jpg', 1, 2.569E+07, NULL, 200, 2, CAST(N'2024-06-25T21:06:31.1913538' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (58, N' Samsung Galaxy A15', N'A15', 1, N'Galaxy a15', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_a0a998b5-c0c8-446e-98b6-80d4cc747578.jpg', 1, 6900000, NULL, 200, 2, CAST(N'2024-06-25T21:13:28.9651682' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (59, N'Samsung Galaxy S23 Ultra 5G', N'S23', 1, N'Samsung Galaxy S23 Ultra 5G', 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_12f7b92c-9268-4f63-b504-9ffc445c7e9b.jpg', 1, 2.49E+07, NULL, 200, 2, NULL, 12)
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
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (77, N'HP 245 G10 R5 7530U (A20TDPT)', N'GR10', 2, NULL, 5, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_f1558460-439e-4559-8e36-2a4bf140527a.jpg', 1, 11989999, NULL, 200, 2, CAST(N'2024-06-26T22:02:14.8738309' AS DateTime2), 12)
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
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (120, N'Máy in Laser Brother DCP-B7535DW', N'DCP7', 7, N'Máy in Laser Brother DCP-B7535DW', 9, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_9942a629-8727-44ad-92fb-864f21ad93d0.jpg', 1, 5690000, NULL, 200, 3, NULL, 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (121, N'Aiport pro', N'AIR3', 6, NULL, 3, N'Thùng', N'https://localhost:7033/uploads/avatar-meo-cute-de-thuong-02_c41dcb66-f6eb-46b3-9a9a-63b5f24570be.jpg', 1, 1200000, NULL, 200, 2, CAST(N'2024-06-27T19:59:18.6667625' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 2, 150)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 2, 100)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (25, 2, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (26, 1, 50)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (56, 4, 50)
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
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (77, 1, 300)
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
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (112, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (113, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (114, 1, 400)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (115, 2, 56)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (116, 2, 38)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (117, 3, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (118, 4, 59)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (119, 4, 60)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (120, 4, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (121, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (1, 11, 1, 500, N'Ghi chú cho đơn hàng 1', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 1, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (2, 12, 2, 200000, N'Ghi chú cho đơn hàng 2', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 1, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (3, 13, 3, 320.5, N'Ghi chú cho đơn hàng 3', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 1, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (4, 14, 4, 450.75, N'Ghi chú cho đơn hàng 4', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 1, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (5, 11, 1, 500, N'Ghi chú cho đơn hàng 5', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 1, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (6, 12, 2, 750, N'Ghi chú cho đơn hàng 6', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 1, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (7, 13, 3, 320.5, N'Ghi chú cho đơn hàng 7', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 1, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (8, 14, 4, 450.75, N'Ghi chú cho đơn hàng 8', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 1, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (9, 11, 1, 500, N'Ghi chú cho đơn hàng 9', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 1, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (10, 12, 2, 750, N'Ghi chú cho đơn hàng 10', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 1, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (11, 13, 3, 320.5, N'Ghi chú cho đơn hàng 11', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 1, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (12, 14, 4, 450.75, N'Ghi chú cho đơn hàng 12', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 1, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (15, 11, 69, 0, N'string', CAST(N'2024-06-23T02:34:46.7677098' AS DateTime2), CAST(N'2024-06-22T19:34:15.9910000' AS DateTime2), 3, N'IMPstring', 1, 2, N'string', 12, 4)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (16, 24, 69, 0, N'', CAST(N'2024-07-04T15:27:52.5397262' AS DateTime2), CAST(N'2024-07-04T15:41:22.3702426' AS DateTime2), 5, N'IMPh1', 1, 1, N'https://localhost:7033/uploads/logo4_bc5b5394-b93c-4c5e-86cc-6ef109ee8c75.png', NULL, 2)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (17, 24, 69, 0, N'', CAST(N'2024-07-04T15:35:50.2600807' AS DateTime2), CAST(N'2024-07-04T15:41:18.4099553' AS DateTime2), 5, N'IMPk1', 1, 2, N'https://localhost:7033/uploads/logo4_5c44a6cf-c795-4f8f-b278-b9a951baa27c.png', NULL, 2)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (18, 24, 69, 0, N'', CAST(N'2024-07-04T15:39:51.9667844' AS DateTime2), CAST(N'2024-07-04T15:40:44.3412163' AS DateTime2), 5, N'IMPl1', 1, 1, N'https://localhost:7033/uploads/logo4_86823098-19b6-45fa-8ac9-d1290081849a.png', NULL, 2)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (19, 24, 2, 0, N'', CAST(N'2024-07-04T15:45:07.3910054' AS DateTime2), CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), 3, N'IMPp1', 1, 3, N'https://localhost:7033/uploads/logo4_642f0aff-45ea-477c-a548-adb00702a998.png', 25, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (20, 24, 69, 0, N'', CAST(N'2024-07-04T16:10:27.4747339' AS DateTime2), CAST(N'2024-07-04T00:00:00.0000000' AS DateTime2), 3, N'IMPy1', 1, 3, NULL, 25, NULL)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (82, 13, N'3KfkBfUNJTthmFJ5C2zdbSUFR3lm076IGh74UlEvPkg=', CAST(N'2024-04-23T17:32:19.1145504' AS DateTime2), CAST(N'2024-05-23T17:32:19.1145704' AS DateTime2), 0, N'f6c7d3c9-a190-4eef-bdfd-68c3a9dfc1e8')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (102, 24, N'tTfrKVyn69r0V2ctZqj7Eq/o0Zc8ccL1x/fzmbQhrsI=', CAST(N'2024-07-04T13:02:30.5349548' AS DateTime2), CAST(N'2024-08-04T13:02:30.5349553' AS DateTime2), 0, N'9aeec1c4-de15-4acf-91b6-6fbd649b6fbc')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (105, 25, N'UOOWbMiyzj059XciWFWCPCkMDbMEBOXLEPwTeKGZQO4=', CAST(N'2024-07-11T10:03:05.8977291' AS DateTime2), CAST(N'2024-08-11T10:03:05.8977298' AS DateTime2), 0, N'388f29ad-2ae7-4b79-83fd-fc15648731fa')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (107, 33, N'hDTT+NZYFcHTNVdTgW5PaVekZTLM4Yh4FRmUn79L9yE=', CAST(N'2024-07-13T09:45:16.7768803' AS DateTime2), CAST(N'2024-08-13T09:45:16.7768804' AS DateTime2), 0, N'43727290-430f-4f3e-9258-f08ff45278ce')
INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (109, 31, N'OGXKaXIIh1js/i5OVDOfKrnoqPWgJFPWG8cDhAnpVI0=', CAST(N'2024-07-13T13:30:11.7795010' AS DateTime2), CAST(N'2024-08-13T13:30:11.7795012' AS DateTime2), 0, N'6d8d1fa4-4ed2-4f21-813b-185799eb6418')
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
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (69, N'Kho nội bộ', N'0123456789', 1, N'logitech@example.com', NULL)
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
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (24, N'thanhtunga933@gmail.com', N'4xjDpBAK5nV9A5FPAGQ/SQ==', N'0832574256', 3, 1, N'tung123', N'staff', N'string', N'string', N'vu thanh tung')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (25, N'sogelsu0303@gmail.com', N'RZrPrCPP0sh9A5FPAGQ/SQ==', N'0832574256', 2, 1, N'tung0303', N'string', N'string', N'string', N'string')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (26, N'staff1@gmail.com', N'Rb9cQnsu5fd9A5FPAGQ/SQ==', N'0795743785', 3, 1, N'staff1', N'NVK1', N'Hải Dương', N'string', N'nhân viên kho 1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (27, N'admin1@gmail.com', N'1Ld690sbMEt9A5FPAGQ/SQ==', N'0795743885', 1, 1, N'admin1', N'AD1', N'Hải Dương', N'string', N'Admin 1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (28, N'warehousemanager1@gmail.com', N'6MZUAmCRI3B9A5FPAGQ/SQ==', N'0795743895', 2, 1, N'manager1', N'mng1', N'Hải Dương', N'string', N'Manager 1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (29, N'accountant1@gmail.com', N'8ZpFvKcYxl59A5FPAGQ/SQ==', N'0795744895', 4, 1, N'accountant1', N'acc1', N'Hải Dương', N'string', N'accountant 1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (30, N'fakerdopakhan@gmail.com', N'RNKQGJY7BMl9A5FPAGQ/SQ==', N'0795744895', 1, 1, N'adminfaker', N'admin', N'Hải Dương', N'string', N'admin 1')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (31, N' ', N'5OP365rusCt9A5FPAGQ/SQ==', N'', 1, 1, N' ', N' ', N' ', NULL, N' ')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (32, N'thanhdthe150750@gmail.com', N'hP/fwmf8aoF9A5FPAGQ/SQ==', N'0795744895', 2, 1, N'ManagerThanhdo', N'ManagerThanhdo', N'Hải Dương', N'string', N'Mng thando')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (33, N'thanhdthe150750@gmail.com', N'R7WYV1CxCZB9A5FPAGQ/SQ==', N'0795744895', 3, 1, N'StaffThanhdo', N'StaffThanhdo', N'Hải Dương', N'string', N'StaffThanhdo')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (34, N'thanhdthe150750@gmail.com', N'DEmJEV90ciJ9A5FPAGQ/SQ==', N'0795744895', 4, 1, N'AccThanhdo', N'AccThanhdo', N'Hải Dương', N'string', N'AccThanhdo')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 11, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (5, 11, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 12, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 13, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 14, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (15, 24, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (16, 25, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (17, 26, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (18, 27, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (19, 28, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (20, 29, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (21, 30, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (22, 31, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (23, 32, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (24, 33, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (25, 34, 1)
SET IDENTITY_INSERT [dbo].[User_Warehouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Thái Bình', N'Thành phố tb', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hạ Long', N'Thành phố HL', N'0369999999')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
/****** Object:  Index [IX_AvailableForReturns_ExportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ExportId] ON [dbo].[AvailableForReturns]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_GoodsId] ON [dbo].[AvailableForReturns]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_AvailableForReturns_ImportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_AvailableForReturns_ImportId] ON [dbo].[AvailableForReturns]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_CreatedId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_CreatedId] ON [dbo].[Bill]
(
	[CreatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_StatusId] ON [dbo].[Bill]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_UpdatedId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_UpdatedId] ON [dbo].[Bill]
(
	[UpdatedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Bill_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Bill_WarehouseId] ON [dbo].[Bill]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_BillId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_BillId] ON [dbo].[BillDetail]
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BillDetail_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_BillDetail_GoodsId] ON [dbo].[BillDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Delivery_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Delivery_StatusId] ON [dbo].[Delivery]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_EmailToken_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_EmailToken_UserId] ON [dbo].[EmailToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_CustomerId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_CustomerId] ON [dbo].[ExportOrder]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_DeliveryId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_DeliveryId] ON [dbo].[ExportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_StatusId] ON [dbo].[ExportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_UserId] ON [dbo].[ExportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrder_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrder_WarehouseId] ON [dbo].[ExportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_ExportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_ExportId] ON [dbo].[ExportOrderDetail]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_GoodsId] ON [dbo].[ExportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ExportOrderDetail_ImportOrderDetailId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ExportOrderDetail_ImportOrderDetailId] ON [dbo].[ExportOrderDetail]
(
	[ImportOrderDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_CategoryId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_CategoryId] ON [dbo].[Goods]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_StatusId] ON [dbo].[Goods]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Goods_SupplierId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Goods_SupplierId] ON [dbo].[Goods]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_ActionId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_ActionId] ON [dbo].[GoodsHistory]
(
	[ActionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_GoodsId] ON [dbo].[GoodsHistory]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsHistory_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsHistory_UserId] ON [dbo].[GoodsHistory]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_GoodsWarehouses_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_GoodsWarehouses_WarehouseId] ON [dbo].[GoodsWarehouses]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_DeliveryId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_DeliveryId] ON [dbo].[ImportOrder]
(
	[DeliveryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_StatusId] ON [dbo].[ImportOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_SupplierId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_SupplierId] ON [dbo].[ImportOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_UserId] ON [dbo].[ImportOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrder_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrder_WarehouseId] ON [dbo].[ImportOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_GoodsId] ON [dbo].[ImportOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ImportOrderDetail_ImportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportOrderDetail_ImportId] ON [dbo].[ImportOrderDetail]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RefreshToken_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_RefreshToken_UserId] ON [dbo].[RefreshToken]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_ExportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_ExportId] ON [dbo].[ReturnsOrder]
(
	[ExportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_ImportId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_ImportId] ON [dbo].[ReturnsOrder]
(
	[ImportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_StatusId] ON [dbo].[ReturnsOrder]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_SupplierId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_SupplierId] ON [dbo].[ReturnsOrder]
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_UserId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_UserId] ON [dbo].[ReturnsOrder]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrder_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrder_WarehouseId] ON [dbo].[ReturnsOrder]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrderDetail_GoodsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrderDetail_GoodsId] ON [dbo].[ReturnsOrderDetail]
(
	[GoodsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ReturnsOrderDetail_ReturnsId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_ReturnsOrderDetail_ReturnsId] ON [dbo].[ReturnsOrderDetail]
(
	[ReturnsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleFeature_featureId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_RoleFeature_featureId] ON [dbo].[RoleFeature]
(
	[featureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Supplier_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_Supplier_StatusId] ON [dbo].[Supplier]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleId] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_StatusId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_StatusId] ON [dbo].[User]
(
	[StatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Warehouse_WarehouseId]    Script Date: 7/13/2024 8:45:13 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Warehouse_WarehouseId] ON [dbo].[User_Warehouse]
(
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__User_War__95E846B211E0D37C]    Script Date: 7/13/2024 8:45:13 PM ******/
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
ALTER DATABASE [iSmartVer7] SET  READ_WRITE 
GO
