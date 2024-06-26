USE [iSmart]
GO
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (1, N'Nhập hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (2, N'Xuất hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (3, N'Sửa hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (4, N'Khởi tạo', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (5, N'Kiểm hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (6, N'Trả hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (7, N'Nhập hàng trả', NULL)
GO
SET IDENTITY_INSERT [dbo].[Category] ON;
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
SET IDENTITY_INSERT [dbo].[Category] OFF;
GO
SET IDENTITY_INSERT [dbo].[Status] ON;

INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (2, N'Inactive')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (3, N'On Progress')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (4, N'Completed')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (5, N'Cancel')
SET IDENTITY_INSERT [dbo].[Status] OFF;
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON;

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Thái Bình', N'Thành phố tb', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hạ Long', N'Thành phố HL', N'0369999999')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF;

GO
SET IDENTITY_INSERT [dbo].[Supplier] ON;
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (1, N'Kho nội bộ', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (2, N'Logitech', N'0123456789', 1, N'logitech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (3, N'Samsung', N'0987654321', 2, N'samsung@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (4, N'Crystal-Optech Co., Ltd', N'0912345678', 1, N'crystaloptech@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (5, N'Delta Electronics Incorporated', N'0123456789', 1, N'deltaelectronics@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (6, N'Arist Benefex', N'0987654321', 1, N'aristbenefex@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (7, N'BrightHR', N'0912345678', 1, N'brighthr@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (8, N'Engagedly Inc.', N'0123456789', 1, N'engagedly@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (9, N'EY Skills Foundry', N'0987654321', 1, N'eyskillsfoundry@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (10, N'Fama Technologies, Inc.', N'0912345678', 1, N'famatechnologies@example.com', NULL)
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (69, N'Kho Nội bộ', N'0912345678', 1, N'famatechnologies@example.com', NULL)
SET IDENTITY_INSERT [dbo].[Supplier] OFF;

GO

SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Warehouse Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Accountant')
SET IDENTITY_INSERT [dbo].[Role] OFF
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
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO

SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (82, 13, N'3KfkBfUNJTthmFJ5C2zdbSUFR3lm076IGh74UlEvPkg=', CAST(N'2024-04-23T17:32:19.1145504' AS DateTime2), CAST(N'2024-05-23T17:32:19.1145704' AS DateTime2), 0, N'f6c7d3c9-a190-4eef-bdfd-68c3a9dfc1e8')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailToken] ON 

INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (7, N'Wo4r2SFAJsKaMY2atkndfwAwYlzQUtjEkRRe7FvZ8HJo04v6HuUCw0TFMSxr72cE', 11, CAST(N'2024-04-19T13:38:42.7983638' AS DateTime2), CAST(N'2024-04-20T13:38:42.7983977' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (8, N'OGqkoSt9jkD6DCv1iQIhLyrCVv8yURmyUVTByNDldwlFgpmswLwUpsw2IaySSm8G', 12, CAST(N'2024-04-19T13:41:57.4011619' AS DateTime2), CAST(N'2024-04-20T13:41:57.4011620' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (9, N'aSVDaqTTNAhtospVmMcpEdIVLmxKi68PMi2b6KSBkfQyocUsV13TB7DjJ99tevId', 13, CAST(N'2024-04-19T13:42:13.7504234' AS DateTime2), CAST(N'2024-04-20T13:42:13.7504234' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (10, N'cVZ8SdgkjgFnPGH7XfkWOThGKycvYhnZVCBj1gXkGt3fsk8mGxFx0OSllwRauCmh', 14, CAST(N'2024-04-19T13:42:28.0331631' AS DateTime2), CAST(N'2024-04-20T13:42:28.0331632' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[EmailToken] OFF
GO

SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT INTO [dbo].[Goods] (
    [GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], 
    [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], 
    [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]
) VALUES 
(1, N'iPhone 13', N'IP13', 1, N'Diện thoại di động Apple iPhone 13', 2, N'Cái', N'https://example.com/image1.png', 1, 20000000, N'0123456789012', 200, 10, GETDATE(), 12),
(2, N'Samsung Galaxy S21', N'SG21', 1, N'Diện thoại di động Samsung Galaxy S21',2,N'Cái', N'https://example.com/image2.png', 1, 18000000, N'0123456789013', 150, 15, GETDATE(), 12),
(3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 4, N'Cái', N'https://example.com/image3.png', 1, 30000000, N'0123456789014', 100, 5, GETDATE(), 24),
(4, N'Sony A7 III', N'SA7III', 4, N'Máy ảnh Sony A7 III', 5, N'Cái', N'https://example.com/image4.png', 1, 50000000, N'0123456789015', 50, 5, GETDATE(), 12),
(5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11',2, N'Cái', N'https://example.com/image5.png', 1, 15000000, N'0123456789016', 300, 20, GETDATE(), 12),
(6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360',4, N'Cái', N'https://example.com/image6.png', 1, 25000000, N'0123456789017', 100, 10, GETDATE(), 24),
(7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 8, N'Cái', N'https://example.com/image7.png', 1, 40000000, N'0123456789018', 50, 5, GETDATE(), 36),
(8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R',1, N'Cái', N'https://example.com/image8.png', 1, 60000000, N'0123456789019', 50, 5, GETDATE(), 12),
(9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7',2, N'Cái', N'https://example.com/image9.png', 1, 18000000, N'0123456789020', 100, 10, GETDATE(), 12),
(10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 2, N'Cái',  N'https://example.com/image10.png', 1, 8000000, N'0123456789021', 200, 20, GETDATE(), 12),
(11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic',4, N'Cái', N'https://example.com/image11.png', 1, 30000000, N'0123456789022', 30, 2, GETDATE(), 36),
(12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9',1, N'Cái', N'https://example.com/image12.png', 1, 10000000, N'0123456789023', 150, 10, GETDATE(), 24),
(13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5',2, N'Cái', N'https://example.com/image13.png', 1, 15000000, N'0123456789024', 70, 5, GETDATE(), 12),
(14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6',4, N'Cái', N'https://example.com/image14.png', 1, 12000000, N'0123456789025', 200, 20, GETDATE(), 12)

SET IDENTITY_INSERT [dbo].[Goods] OFF

GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) 
VALUES 
(1, 11, 1), -- Administrator gắn với Hải Phòng
(2, 12, 2), -- Project Manager gắn với Hà Nội
(3, 13, 1), -- Storekeeper gắn với Hải Phòng
(4, 14, 2), -- Accountant gắn với Hà Nội
(5, 11, 2);
SET IDENTITY_INSERT [dbo].[User_Warehouse] OFF

GO

-- Thêm sản phẩm vào kho
INSERT INTO [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) 
VALUES 
(1, 1, 100), -- Sản phẩm 1 vào kho 1 với số lượng 100
(1, 2, 50),  -- Sản phẩm 1 vào kho 2 với số lượng 50
(2, 1, 200), -- Sản phẩm 2 vào kho 1 với số lượng 200
(2, 2, 150), -- Sản phẩm 2 vào kho 2 với số lượng 150
(3, 1, 300), -- Sản phẩm 3 vào kho 1 với số lượng 300
(3, 2, 100); -- Sản phẩm 3 vào kho 2 với số lượng 100

SET IDENTITY_INSERT [dbo].[ImportOrder] ON

  INSERT INTO [dbo].[ImportOrder] 
    ([ImportId] ,[UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId])
VALUES 
    (1, 11, 1, 500.00, N'Ghi chú cho đơn hàng 1', '2024-05-30 08:00:00', '2024-05-30 08:30:00', 1, 'IMP20240530001', 2, 1, 'https://example.com/image1.jpg', 3),
    (2, 12, 2, 750.00, N'Ghi chú cho đơn hàng 2', '2024-05-31 09:00:00', '2024-05-31 09:30:00', 1, 'IMP20240531002', 1, 2, 'https://example.com/image2.jpg', 4),
    (3, 13, 3, 320.50, N'Ghi chú cho đơn hàng 3', '2024-06-01 10:00:00', '2024-06-01 10:30:00', 1, 'IMP20240601001', 3, 1, 'https://example.com/image3.jpg', 5),
    (4, 14, 4, 450.75, N'Ghi chú cho đơn hàng 4', '2024-06-02 11:00:00', '2024-06-02 11:30:00', 1, 'IMP20240602001', 2, 3, 'https://example.com/image4.jpg', 6),
	(5, 11, 1, 500.00, N'Ghi chú cho đơn hàng 5', '2024-05-30 08:00:00', '2024-05-30 08:30:00', 1, 'IMP20240530001', 2, 1, 'https://example.com/image1.jpg', 3),
    (6, 12, 2, 750.00, N'Ghi chú cho đơn hàng 6', '2024-05-31 09:00:00', '2024-05-31 09:30:00', 1, 'IMP20240531002', 1, 2, 'https://example.com/image2.jpg', 4),
    (7, 13, 3, 320.50, N'Ghi chú cho đơn hàng 7', '2024-06-01 10:00:00', '2024-06-01 10:30:00', 1, 'IMP20240601001', 3, 1, 'https://example.com/image3.jpg', 5),
    (8, 14, 4, 450.75, N'Ghi chú cho đơn hàng 8', '2024-06-02 11:00:00', '2024-06-02 11:30:00', 1, 'IMP20240602001', 2, 3, 'https://example.com/image4.jpg', 6),
	(9, 11, 1, 500.00, N'Ghi chú cho đơn hàng 9', '2024-05-30 08:00:00', '2024-05-30 08:30:00', 1, 'IMP20240530001', 2, 1, 'https://example.com/image1.jpg', 3),
    (10, 12, 2, 750.00, N'Ghi chú cho đơn hàng 10', '2024-05-31 09:00:00', '2024-05-31 09:30:00', 1, 'IMP20240531002', 1, 2, 'https://example.com/image2.jpg', 4),
    (11, 13, 3, 320.50, N'Ghi chú cho đơn hàng 11', '2024-06-01 10:00:00', '2024-06-01 10:30:00', 1, 'IMP20240601001', 3, 1, 'https://example.com/image3.jpg', 5),
    (12, 14, 4, 450.75, N'Ghi chú cho đơn hàng 12', '2024-06-02 11:00:00', '2024-06-02 11:30:00', 1, 'IMP20240602001', 2, 3, 'https://example.com/image4.jpg', 6);
	SET IDENTITY_INSERT [dbo].[ImportOrder] OFF

	INSERT INTO [dbo].[ImportOrderDetail]
    ([BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate] , [Quantity], ActualQuantity)
VALUES
    ('Batch001', 1, 1, 10.5, '2024-05-30', '2025-05-30', 100,100),
    ('Batch002', 1, 2, 12.75, '2024-06-01', '2025-06-01', 150,150),
    ('Batch003', 4, 3, 8.99, '2024-06-02', '2025-06-02', 200,200),
    ('Batch004', 2, 4, 9.5, '2024-06-03', '2025-06-03', 180,180),
	('Batch004', 3, 4, 9.5, '2024-06-03', '2025-06-03', 180,180),
	('Batch005', 2, 4, 9.5, '2024-06-03', '2025-06-03', 140,140),
	('Batch006', 1, 1, 10.5, '2024-05-30', '2025-05-30', 100,100),
    ('Batch007', 1, 2, 12.75, '2024-06-01', '2025-06-01', 150,150),
    ('Batch008', 4, 3, 8.99, '2024-06-02', '2025-06-02', 200,200),
    ('Batch009', 2, 4, 9.5, '2024-06-03', '2025-06-03', 180,180),
	('Batch0010', 3, 4, 9.5, '2024-06-03', '2025-06-03', 180,180),
	('Batch0011', 2, 4, 9.5, '2024-06-03', '2025-06-03', 140,140)
