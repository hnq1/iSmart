USE [iSmart]
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
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (1, N'Active')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (2, N'Inactive')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (3, N'On Progress')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (4, N'Completed')
INSERT [dbo].[Status] ([StatusId], [StatusType]) VALUES (5, N'Cancel')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Supplier] ON 

INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [SupplierPhone], [StatusId], [SupplierEmail], [Note]) VALUES (1, N'Kho nội bộ', N'0123456789', 1, N'logitech@example.com', NULL)
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
SET IDENTITY_INSERT [dbo].[Goods] ON 

INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (1, N'iPhone 13', N'IP13', 1, N'Diện thoại di động Apple iPhone 13', 2, N'Cái', N'https://example.com/image1.png', 1, 2E+07, N'0123456789012', 200, 10, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (2, N'Samsung Galaxy S21', N'SG21', 1, N'Diện thoại di động Samsung Galaxy S21', 2, N'Cái', N'https://example.com/image2.png', 1, 1.8E+07, N'0123456789013', 150, 15, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (3, N'Dell XPS 13', N'DXPS13', 2, N'Máy tính xách tay Dell XPS 13', 4, N'Cái', N'https://example.com/image3.png', 1, 3E+07, N'0123456789014', 100, 5, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (4, N'Sony A7 III', N'SA7III', 4, N'Máy ảnh Sony A7 III', 5, N'Cái', N'https://example.com/image4.png', 1, 5E+07, N'0123456789015', 50, 5, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (5, N'Xiaomi Mi 11', N'MI11', 1, N'Diện thoại di động Xiaomi Mi 11', 2, N'Cái', N'https://example.com/image5.png', 1, 1.5E+07, N'0123456789016', 300, 20, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (6, N'HP Spectre x360', N'HPX360', 2, N'Máy tính xách tay HP Spectre x360', 4, N'Cái', N'https://example.com/image6.png', 1, 2.5E+07, N'0123456789017', 100, 10, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (7, N'LG OLED TV', N'LGTV', 3, N'Tivi LG OLED', 8, N'Cái', N'https://example.com/image7.png', 1, 4E+07, N'0123456789018', 50, 5, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (8, N'Canon EOS R', N'CEOSR', 4, N'Máy ảnh Canon EOS R', 1, N'Cái', N'https://example.com/image8.png', 1, 6E+07, N'0123456789019', 50, 5, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (9, N'Samsung Galaxy Tab S7', N'SGTS7', 5, N'Máy tính bảng Samsung Galaxy Tab S7', 2, N'Cái', N'https://example.com/image9.png', 1, 1.8E+07, N'0123456789020', 100, 10, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (10, N'Bose QC 35', N'BQC35', 6, N'Tai nghe Bose QC 35', 2, N'Cái', N'https://example.com/image10.png', 1, 8000000, N'0123456789021', 200, 20, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (11, N'Panasonic Refrigerator', N'PRF', 7, N'Tủ lạnh Panasonic', 4, N'Cái', N'https://example.com/image11.png', 1, 3E+07, N'0123456789022', 30, 2, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 36)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (12, N'Intel Core i9', N'ICI9', 8, N'Vi xử lý Intel Core i9', 1, N'Cái', N'https://example.com/image12.png', 1, 1E+07, N'0123456789023', 150, 10, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 24)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (13, N'PlayStation 5', N'PS5', 9, N'Máy chơi game PlayStation 5', 2, N'Cái', N'https://example.com/image13.png', 1, 1.5E+07, N'0123456789024', 70, 5, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
INSERT [dbo].[Goods] ([GoodsId], [GoodsName], [GoodsCode], [CategoryId], [Description], [SupplierId], [MeasuredUnit], [Image], [StatusId], [StockPrice], [Barcode], [MaxStock], [MinStock], [CreatedDate], [WarrantyTime]) VALUES (14, N'Apple Watch Series 6', N'AWS6', 10, N'Đồng hồ thông minh Apple Watch Series 6', 4, N'Cái', N'https://example.com/image14.png', 1, 1.2E+07, N'0123456789025', 200, 20, CAST(N'2024-06-26T01:47:08.3300000' AS DateTime2), 12)
SET IDENTITY_INSERT [dbo].[Goods] OFF
GO
SET IDENTITY_INSERT [dbo].[Warehouse] ON 

INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (1, N'Hải Phòng', N'Thành phố Hải Phòng', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (2, N'Hà Nội', N'Thành phố Hà Nội', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (3, N'Hải Phòng', N'Thành phố tb', N'0369999999')
INSERT [dbo].[Warehouse] ([WarehouseId], [WarehouseName], [WarehouseAddress], [WarehousePhone]) VALUES (4, N'Hà Nội', N'Thành phố HL', N'0369999999')
SET IDENTITY_INSERT [dbo].[Warehouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Delivery] ON 

INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (1, N'Giao hàng tiết kiệm', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (2, N'Giao hàng nhanh', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (3, N'Bưu điện Việt Nam', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (4, N'Viettel Post', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (5, N'JT Express', 1)
INSERT [dbo].[Delivery] ([DeliveyId], [DeliveryName], [StatusId]) VALUES (7, N'string', 1)
SET IDENTITY_INSERT [dbo].[Delivery] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'Administrator')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Warehouse Manager')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Staff')
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'Accountant')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (11, N'anhddhe170353@fpt.edu.vn', N'ZRYaSSd3CJo=', N'02823456789', 1, 1, N'ad', N'Administrator', N'SO 48 LE DAI HANH, HA BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Administrator')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (12, N'anhdd16.cdc@gmail.com', N'+gLa4tZK2hw=', N'0966666888', 2, 1, N'pm', N'ProjectManager', N'101 MAI HAC DE, BUI THI XUAN, H.B.T, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Warehouse Manager')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (13, N'sk@gmail.com', N'cXSmyS8Q7Ns=', N'0912345678', 3, 1, N'sk', N'Storekeeper', N'26 TUE TINH, BUI THI XUAN, HAI BA TRUNG, HA NOI', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Staff')
INSERT [dbo].[User] ([UserId], [Email], [Password], [Phone], [RoleId], [StatusId], [UserName], [UserCode], [Address], [Image], [FullName]) VALUES (14, N'ac@gmail.com', N'YjBRio6ltvA=', N'0106713191', 4, 1, N'ac', N'Accountant', N'2 NHA CHUNG, HANG TRONG, HOAN KIEM, HA NOI ', N'https://ik.imagekit.io/warehousesystemsp24/3d-illustration-person-with-sung_ywpoWo05i.png
', N'Accountant')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrder] ON 

INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (1, 11, 1, 500, N'Ghi chú cho đơn hàng 1', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 4, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (2, 12, 2, 750, N'Ghi chú cho đơn hàng 2', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 4, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (3, 13, 3, 320.5, N'Ghi chú cho đơn hàng 3', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 4, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (4, 14, 4, 450.75, N'Ghi chú cho đơn hàng 4', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 4, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (5, 11, 1, 500, N'Ghi chú cho đơn hàng 5', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 3, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (6, 12, 2, 750, N'Ghi chú cho đơn hàng 6', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 3, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (7, 13, 3, 320.5, N'Ghi chú cho đơn hàng 7', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 4, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (8, 14, 4, 450.75, N'Ghi chú cho đơn hàng 8', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 1, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (9, 11, 1, 500, N'Ghi chú cho đơn hàng 9', CAST(N'2024-05-30T08:00:00.0000000' AS DateTime2), CAST(N'2024-05-30T08:30:00.0000000' AS DateTime2), 2, N'IMP20240530001', 2, 1, N'https://example.com/image1.jpg', 3, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (10, 12, 2, 750, N'Ghi chú cho đơn hàng 10', CAST(N'2024-05-31T09:00:00.0000000' AS DateTime2), CAST(N'2024-05-31T09:30:00.0000000' AS DateTime2), 4, N'IMP20240531002', 1, 2, N'https://example.com/image2.jpg', 4, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (11, 13, 3, 320.5, N'Ghi chú cho đơn hàng 11', CAST(N'2024-06-01T10:00:00.0000000' AS DateTime2), CAST(N'2024-06-01T10:30:00.0000000' AS DateTime2), 4, N'IMP20240601001', 3, 1, N'https://example.com/image3.jpg', 5, NULL)
INSERT [dbo].[ImportOrder] ([ImportId], [UserId], [SupplierId], [TotalCost], [Note], [CreatedDate], [ImportedDate], [StatusId], [ImportCode], [WarehouseId], [DeliveryId], [image], [StaffId], [WarehouseDestinationId]) VALUES (12, 14, 4, 450.75, N'Ghi chú cho đơn hàng 12', CAST(N'2024-06-02T11:00:00.0000000' AS DateTime2), CAST(N'2024-06-02T11:30:00.0000000' AS DateTime2), 4, N'IMP20240602001', 2, 3, N'https://example.com/image4.jpg', 6, NULL)
SET IDENTITY_INSERT [dbo].[ImportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] ON 

INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (1, N'Batch001', 1, 2, 10.5, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-30T00:00:00.0000000' AS DateTime2), 100, 40)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (2, N'Batch002', 6, 2, 9000, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 150, 107)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (3, N'Batch003', 6, 2, 8.99, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T00:00:00.0000000' AS DateTime2), 145, 97)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (4, N'Batch004', 2, 2, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-06T00:00:00.0000000' AS DateTime2), 120, 80)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (5, N'Batch004', 3, 2, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-12T00:00:00.0000000' AS DateTime2), 180, 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (6, N'Batch005', 2, 2, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 140, 85)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (7, N'Batch006', 5, 1, 10.5, CAST(N'2024-05-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-30T00:00:00.0000000' AS DateTime2), 100, 100)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (8, N'Batch007', 1, 2, 12.75, CAST(N'2024-06-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 150, 150)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (9, N'Batch008', 4, 3, 8.99, CAST(N'2024-06-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T00:00:00.0000000' AS DateTime2), 200, 200)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (10, N'Batch009', 12, 2, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 180, 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (11, N'Batch0010', 10, 2, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 180, 180)
INSERT [dbo].[ImportOrderDetail] ([DetailId], [BatchCode], [ImportId], [GoodsId], [CostPrice], [ManufactureDate], [ExpiryDate], [Quantity], [ActualQuantity]) VALUES (12, N'Batch0011', 2, 4, 9.5, CAST(N'2024-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 140, 140)
SET IDENTITY_INSERT [dbo].[ImportOrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (0, N'Xuat kho noi bo', N'123 Ðu?ng ABC, Qu?n 1, TP.HCM', N'0901234567', N'nguyenvana@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (1, N'Nguy?n Van A', N'123 Ðu?ng ABC, Qu?n 1, TP.HCM', N'0901234567', N'nguyenvana@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (2, N'Tr?n Th? B', N'456 Ðu?ng XYZ, Qu?n 2, TP.HCM', N'0912345678', N'tranthib@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (3, N'Lê Van C', N'789 Ðu?ng DEF, Qu?n 3, TP.HCM', N'0923456789', N'levanc@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (4, N'Ph?m Th? D', N'321 Ðu?ng GHI, Qu?n 4, TP.HCM', N'0934567890', N'phamthid@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (5, N'Vu Van E', N'654 Ðu?ng JKL, Qu?n 5, TP.HCM', N'0945678901', N'vuvane@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (6, N'Hoàng Th? F', N'987 Ðu?ng MNO, Qu?n 6, TP.HCM', N'0956789012', N'hoangthif@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (7, N'Ð? Van G', N'147 Ðu?ng PQR, Qu?n 7, TP.HCM', N'0967890123', N'dovang@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (8, N'Bùi Th? H', N'258 Ðu?ng STU, Qu?n 8, TP.HCM', N'0978901234', N'buithih@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (9, N'Ngô Van I', N'369 Ðu?ng VWX, Qu?n 9, TP.HCM', N'0989012345', N'ngovani@example.com')
INSERT [dbo].[Customers] ([CustomerId], [CustomerName], [CustomerAddress], [CustomerPhone], [CustomerEmail]) VALUES (10, N'Phan Th? K', N'159 Ðu?ng YZ, Qu?n 10, TP.HCM', N'0990123456', N'phanthik@example.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrder] ON 

INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (1, N'XHstring', 11, 0, N'string', 3, CAST(N'2024-06-27T00:53:10.4232165' AS DateTime2), CAST(N'2024-06-26T17:52:58.3800000' AS DateTime2), 1, CAST(N'2024-06-26T17:52:58.3800000' AS DateTime2), 1, N'string', 12, 2, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (2, N'XHstring2', 11, 0, N'string', 4, CAST(N'2024-06-27T01:10:38.5647344' AS DateTime2), CAST(N'2024-06-27T22:17:29.9362363' AS DateTime2), 2, CAST(N'2024-06-26T17:59:31.9920000' AS DateTime2), 1, N'string', 12, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (3, N'XHstring3', 11, 0, N'string', 4, CAST(N'2024-06-27T01:10:54.5768913' AS DateTime2), CAST(N'2024-06-27T22:26:23.4044525' AS DateTime2), 3, CAST(N'2024-06-26T17:59:31.9920000' AS DateTime2), 1, N'string', 12, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (6, N'XHanhdd1505', 12, 0, N'no note', 4, CAST(N'2024-06-28T01:08:58.3820964' AS DateTime2), CAST(N'2024-06-28T01:27:04.2471182' AS DateTime2), 3, CAST(N'2024-06-27T18:06:34.4300000' AS DateTime2), 1, N'string', 12, 9, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (7, N'XHstring71', 11, 0, N'string', 3, CAST(N'2024-07-01T08:32:52.8761995' AS DateTime2), CAST(N'2024-07-01T01:30:59.3700000' AS DateTime2), 1, CAST(N'2024-07-01T01:30:59.3700000' AS DateTime2), 1, N'string', 12, 4, NULL)
INSERT [dbo].[ExportOrder] ([ExportId], [ExportCode], [UserId], [TotalPrice], [Note], [StatusId], [CreatedDate], [ExportedDate], [WarehouseId], [CancelDate], [DeliveryId], [image], [StaffId], [CustomerId], [WarehouseDestinationId]) VALUES (11, N'Test', 13, 0, N'sdfsg', 4, CAST(N'2024-07-07T00:00:00.0000000' AS DateTime2), CAST(N'2024-07-01T16:02:09.6167207' AS DateTime2), 3, NULL, 2, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[ExportOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] ON 

INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (1, 1, 50000, 1, 10, 12)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (2, 2, 25000, 2, 20, 1)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (3, 3, 15000, 3, 15, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (4, 1, 75000, 4, 25, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (5, 2, 30000, 2, 30, 4)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (6, 1, 40000, 6, 35, 5)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (7, 3, 55000, 7, 40, 4)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (8, 2, 60000, 3, 45, 6)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (9, 1, 20000, 9, 50, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (10, 3, 10000, 10, 55, 3)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (11, 6, 100000, 10, 15, 6)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (14, 11, 324, 1, 14, 2)
INSERT [dbo].[ExportOrderDetail] ([DetailId], [ExportId], [Price], [GoodsId], [Quantity], [ImportOrderDetailId]) VALUES (15, 11, 4234, 2, 24, 3)
SET IDENTITY_INSERT [dbo].[ExportOrderDetail] OFF
GO
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (1, N'Nhập hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (2, N'Xuất hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (3, N'Sửa hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (4, N'Khởi tạo', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (5, N'Kiểm hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (6, N'Trả hàng', NULL)
INSERT [dbo].[ActionType] ([ActionId], [Action], [Description]) VALUES (7, N'Nhập hàng trả', NULL)
GO
SET IDENTITY_INSERT [dbo].[GoodsHistory] ON 

INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (1, 2, 2, CAST(N'2024-06-27T21:59:25.9154980' AS DateTime2), 1.8E+07, NULL, 130, N'-20', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (2, 2, 2, CAST(N'2024-06-27T21:59:26.0393061' AS DateTime2), 1.8E+07, NULL, 100, N'-30', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (3, 3, 2, CAST(N'2024-06-27T21:59:26.0565666' AS DateTime2), 3E+07, NULL, 55, N'-45', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (4, 2, 2, CAST(N'2024-06-27T22:18:32.4245205' AS DateTime2), 1.8E+07, NULL, 80, N'-20', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (5, 2, 2, CAST(N'2024-06-27T22:19:43.7370055' AS DateTime2), 1.8E+07, NULL, 50, N'-30', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (6, 3, 2, CAST(N'2024-06-27T22:20:17.0670341' AS DateTime2), 3E+07, NULL, 10, N'-45', NULL, N'XHstring2', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (7, 3, 2, CAST(N'2024-06-27T22:26:23.4338053' AS DateTime2), 3E+07, NULL, 985, N'-15', NULL, N'XHstring3', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (8, 7, 2, CAST(N'2024-06-27T22:26:23.4575701' AS DateTime2), 4E+07, NULL, 960, N'-40', NULL, N'XHstring3', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (9, 10, 2, CAST(N'2024-06-27T22:26:23.4787233' AS DateTime2), 8000000, NULL, 945, N'-55', NULL, N'XHstring3', 11)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (10, 10, 2, CAST(N'2024-06-28T01:16:34.9569302' AS DateTime2), 8000000, NULL, 930, N'-15', NULL, N'XHanhdd1505', 12)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (11, 10, 2, CAST(N'2024-06-28T01:21:56.1059943' AS DateTime2), 8000000, NULL, 915, N'-15', NULL, N'XHanhdd1505', 12)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (12, 10, 2, CAST(N'2024-06-28T01:24:25.4962472' AS DateTime2), 8000000, NULL, 900, N'-15', NULL, N'XHanhdd1505', 12)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (13, 10, 2, CAST(N'2024-06-28T01:27:04.2659999' AS DateTime2), 8000000, NULL, 885, N'-15', NULL, N'XHanhdd1505', 12)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (14, 1, 2, CAST(N'2024-07-01T16:01:01.7798819' AS DateTime2), 2E+07, NULL, 986, N'-14', NULL, N'Test', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (15, 2, 2, CAST(N'2024-07-01T16:01:01.9406651' AS DateTime2), 1.8E+07, NULL, 976, N'-24', NULL, N'Test', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (16, 1, 2, CAST(N'2024-07-01T16:02:09.6337983' AS DateTime2), 2E+07, NULL, 972, N'-14', NULL, N'Test', 13)
INSERT [dbo].[GoodsHistory] ([HistoryId], [GoodsId], [ActionId], [Date], [CostPrice], [CostPriceDifferential], [Quantity], [QuantityDifferential], [Note], [OrderCode], [UserId]) VALUES (17, 2, 2, CAST(N'2024-07-01T16:02:09.6497719' AS DateTime2), 1.8E+07, NULL, 952, N'-24', NULL, N'Test', 13)
SET IDENTITY_INSERT [dbo].[GoodsHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Warehouse] ON 

INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1, 11, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (5, 11, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1001, 11, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (2, 12, 2)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (1002, 12, 3)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (3, 13, 1)
INSERT [dbo].[User_Warehouse] ([Id], [UserId], [WarehouseId]) VALUES (4, 14, 2)
SET IDENTITY_INSERT [dbo].[User_Warehouse] OFF
GO
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 1, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (1, 3, 972)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 1, 200)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 2, 50)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (2, 3, 952)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 1, 300)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 2, 10)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (3, 3, 985)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (7, 3, 960)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (10, 2, 100)
INSERT [dbo].[GoodsWarehouses] ([GoodsId], [WarehouseId], [Quantity]) VALUES (10, 3, 885)
GO
SET IDENTITY_INSERT [dbo].[EmailToken] ON 

INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (7, N'Wo4r2SFAJsKaMY2atkndfwAwYlzQUtjEkRRe7FvZ8HJo04v6HuUCw0TFMSxr72cE', 11, CAST(N'2024-04-19T13:38:42.7983638' AS DateTime2), CAST(N'2024-04-20T13:38:42.7983977' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (8, N'OGqkoSt9jkD6DCv1iQIhLyrCVv8yURmyUVTByNDldwlFgpmswLwUpsw2IaySSm8G', 12, CAST(N'2024-04-19T13:41:57.4011619' AS DateTime2), CAST(N'2024-04-20T13:41:57.4011620' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (9, N'aSVDaqTTNAhtospVmMcpEdIVLmxKi68PMi2b6KSBkfQyocUsV13TB7DjJ99tevId', 13, CAST(N'2024-04-19T13:42:13.7504234' AS DateTime2), CAST(N'2024-04-20T13:42:13.7504234' AS DateTime2), 1, 0)
INSERT [dbo].[EmailToken] ([TokenId], [Token], [UserId], [IssuedAt], [ExpiredAt], [IsUsed], [IsRevoked]) VALUES (10, N'cVZ8SdgkjgFnPGH7XfkWOThGKycvYhnZVCBj1gXkGt3fsk8mGxFx0OSllwRauCmh', 14, CAST(N'2024-04-19T13:42:28.0331631' AS DateTime2), CAST(N'2024-04-20T13:42:28.0331632' AS DateTime2), 1, 0)
SET IDENTITY_INSERT [dbo].[EmailToken] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 

INSERT [dbo].[RefreshToken] ([TokenId], [UserId], [Token], [Created], [ExpiredAt], [IsRevoked], [JwtId]) VALUES (82, 13, N'3KfkBfUNJTthmFJ5C2zdbSUFR3lm076IGh74UlEvPkg=', CAST(N'2024-04-23T17:32:19.1145504' AS DateTime2), CAST(N'2024-05-23T17:32:19.1145704' AS DateTime2), 0, N'f6c7d3c9-a190-4eef-bdfd-68c3a9dfc1e8')
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240625184459_AddCustomerAndUpdateExportOrder', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240627133002_AddActualQuantity', N'6.0.29')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240701092500_AddWarehouseDestinationForExport', N'6.0.29')
GO
