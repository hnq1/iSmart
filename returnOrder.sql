USE [iSmart]
GO
/****** Object:  Table [dbo].[ReturnOrder]    Script Date: 7/11/2024 12:33:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReturnOrder](
	[ReturnOrderId] [int] IDENTITY(1,1) NOT NULL,
	[ReturnOrderCode] [nvarchar](50) NOT NULL,
	[ReturnedDate] [datetime2](7) NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[SupplierId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[ApprovedBy] [int] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_ReturnOrder] PRIMARY KEY CLUSTERED 
(
	[ReturnOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReturnOrderDetail]    Script Date: 7/11/2024 12:33:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ReturnOrder] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [ReturnedDate]
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
ALTER TABLE [dbo].[ReturnOrder]  WITH CHECK ADD  CONSTRAINT [FK_ReturnOrder_User_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[ReturnOrder] CHECK CONSTRAINT [FK_ReturnOrder_User_UserId]
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

INSERT INTO [dbo].[ReturnOrder] ([ReturnOrderCode], [ReturnedDate], [WarehouseId], [SupplierId], [StatusId], [CreatedBy], [ApprovedBy])
VALUES ('RO001', '2023-07-10 10:00:00', 1, 1, 1, 11, 12),
       ('RO002', '2023-07-11 09:30:00', 2, 2, 1, 12, 13),
       ('RO003', '2023-07-12 14:45:00', 3, 3, 2, 13, 11);

INSERT INTO [dbo].[ReturnOrderDetail] ([ReturnOrderId], [GoodsId], [Quantity], [Reason], [BatchCode])
VALUES (1, 1, 10, 'Damaged goods', 'BATCH001'),
       (1, 2, 5, 'Incorrect item', 'BATCH002'),
       (2, 3, 8, 'Expired goods', 'BATCH003'),
       (3, 1, 15, 'Faulty product', 'BATCH004');
