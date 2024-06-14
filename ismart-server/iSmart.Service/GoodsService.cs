﻿using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs;
using iSmart.Entity.DTOs.GoodsDTO;
using iSmart.Entity.Models;

namespace iSmart.Service
{
    public interface IGoodsService
    {
        GoodsFilterPaging GetGoodsByKeyword(int page, int? warehouseId, int? categoryId, int? supplierId, int? sortPriece, string? keyword = "");
        Task<List<Good>?> GetAllGoods();

        Task<List<Good>?> GetAllGoodsWithStorageAndSupplier(int storageId, int supplierId);
        Good GetGoodsById(int id);
        CreateGoodsResponse AddGoods(CreateGoodsRequest goods, int userId);
        CreateGoodsResponse AddGoodsByAdmin(CreateGoodsRequest goods, int warehouseId);
        UpdateGoodsResponse UpdateGoods(UpdateGoodsRequest goods);
        bool UpdateStatusGoods(int id, int StatusId);
        Task<List<GoodsDTO>?> GetGoodsInWarehouse(int warehouseId);



    }
    public class GoodsService : IGoodsService
    {
        private readonly iSmartContext _context;
        private readonly IUserWarehouseService _userWarehouseService;

        public GoodsService(iSmartContext context, IUserWarehouseService userWarehouseService)
        {
            _context = context;
            _userWarehouseService = userWarehouseService;
        }

        public CreateGoodsResponse AddGoodsByAdmin(CreateGoodsRequest goods, int warehouseId)
        {
            try
            {
                // Tạo hàng hóa mới
                var newGood = new Good
                {
                    GoodsName = goods.GoodsName,
                    GoodsCode = goods.GoodsCode,
                    CategoryId = goods.CategoryId,
                    Description = goods.Description,
                    SupplierId = goods.SupplierId,
                    MeasuredUnit = goods.MeasuredUnit,
                    Image = goods.Image,
                    StatusId = goods.StatusId,
                    StockPrice = goods.StockPrice,
                    CreatedDate = DateTime.Now,
                    WarrantyTime = goods.WarrantyTime,
                    Barcode = goods.Barcode,
                    MaxStock = goods.MaxStock,
                    MinStock = goods.MinStock
                };

                // Kiểm tra xem hàng hóa đã tồn tại trong cùng kho hàng chưa
                var existingGood = _context.Goods
                    .SingleOrDefault(i => i.GoodsCode == goods.GoodsCode);

                if (existingGood == null)
                {
                    // Thêm hàng hóa mới vào bảng Goods
                    _context.Goods.Add(newGood);
                    _context.SaveChanges();

                    // Tạo bản ghi trong bảng GoodsWarehouse để thiết lập mối quan hệ
                    var goodsWarehouse = new GoodsWarehouse
                    {
                        GoodsId = newGood.GoodsId,
                        WarehouseId = warehouseId,
                        Quantity = 0
                    };

                    _context.GoodsWarehouses.Add(goodsWarehouse);
                    _context.SaveChanges();

                    return new CreateGoodsResponse { IsSuccess = true, Message = "Thêm hàng hóa thành công" };
                }
                else
                {
                    return new CreateGoodsResponse { IsSuccess = false, Message = "Hàng đã tồn tại" };
                }
            }
            catch (Exception ex)
            {
                return new CreateGoodsResponse { IsSuccess = false, Message = $"Thêm hàng hóa thất bại, {ex.Message}" };
            }
        }

        public CreateGoodsResponse AddGoods(CreateGoodsRequest goods, int userId)
        {
            try
            {
                var warehouseId = _userWarehouseService.GetWarehouseIdByIdAsync(userId).Result;

                if (warehouseId == null)
                {
                    return new CreateGoodsResponse { IsSuccess = false, Message = "WarehouseId không tìm thấy" };
                }
                // Tạo hàng hóa mới
                var newGood = new Good
                {
                    GoodsName = goods.GoodsName,
                    GoodsCode = goods.GoodsCode,
                    CategoryId = goods.CategoryId,
                    Description = goods.Description,
                    SupplierId = goods.SupplierId,
                    MeasuredUnit = goods.MeasuredUnit,
                    Image = goods.Image,
                    StatusId = goods.StatusId,
                    StockPrice = goods.StockPrice,
                    CreatedDate = DateTime.Now,
                    WarrantyTime = goods.WarrantyTime,
                    Barcode = goods.Barcode,
                    MaxStock = goods.MaxStock,
                    MinStock = goods.MinStock
                };

                // Kiểm tra xem hàng hóa đã tồn tại trong cùng kho hàng chưa
                var existingGood = _context.Goods
                    .SingleOrDefault(i => i.GoodsCode == goods.GoodsCode);

                if (existingGood == null)
                {
                    // Thêm hàng hóa mới vào bảng Goods
                    _context.Goods.Add(newGood);
                    _context.SaveChanges();

                    // Tạo bản ghi trong bảng GoodsWarehouse để thiết lập mối quan hệ
                    var goodsWarehouse = new GoodsWarehouse
                    {
                        GoodsId = newGood.GoodsId,
                        WarehouseId = (int)warehouseId,
                        Quantity = 0
                    };

                    _context.GoodsWarehouses.Add(goodsWarehouse);
                    _context.SaveChanges();

                    return new CreateGoodsResponse { IsSuccess = true, Message = "Thêm hàng hóa thành công" };
                }
                else
                {
                    return new CreateGoodsResponse { IsSuccess = false, Message = "Hàng đã tồn tại" };
                }
            }
            catch (Exception ex)
            {
                return new CreateGoodsResponse { IsSuccess = false, Message = $"Thêm hàng hóa thất bại, {ex.Message}" };
            }
        }



        public async Task<List<Good>?> GetAllGoods()
        {
            try
            {
                var goods = await _context.Goods.ToListAsync();
                return goods;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<List<Good>?> GetAllGoodsWithStorageAndSupplier(int storageId, int supplierId)
        {
            try
            {
                var goods = await _context.Goods
                    .Where(g => g.GoodsWarehouses.Any(gw => gw.WarehouseId == storageId) && g.SupplierId == supplierId)
                    .ToListAsync();
                return goods;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public Good GetGoodsById(int id)
        {
            try
            {
                var goods = _context.Goods.FirstOrDefault(g => g.GoodsId == id);
                return goods ?? null;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public GoodsFilterPaging? GetGoodsByKeyword(int page, int? warehouseId, int? categoryId, int? supplierId, int? sortPrice, string? keyword = "")
        {
            try
            {
                // Đảm bảo giá trị page không âm hoặc bằng 0
                if (page < 1)
                {
                    page = 1;
                }

                var pageSize = 12;

                var goodsQuery = _context.Goods
                .Include(g => g.Status)
                .Include(g => g.Category)
                .Include(g => g.Supplier)
                .Include(g =>g.GoodsWarehouses)
                .Where(g => (!categoryId.HasValue || g.CategoryId == categoryId)
                    && (!supplierId.HasValue || g.SupplierId == supplierId) && (!warehouseId.HasValue || g.GoodsWarehouses.Any(gw => gw.WarehouseId == warehouseId)));

                // Kiểm tra và áp dụng điều kiện về keyword
                if (!string.IsNullOrEmpty(keyword))
                {
                    var keywords = keyword.ToLower().Split(' ', StringSplitOptions.RemoveEmptyEntries);
                    goodsQuery = goodsQuery.AsEnumerable().Where(g =>
                        keywords.Any(k => g.GoodsName.ToLower().Contains(k) ||
                                          g.GoodsCode.ToLower().Contains(k))
                    ).AsQueryable();
                }


                // Kiểm tra nếu muốn sắp xếp theo stockPrice từ bé đến lớn
                if (sortPrice == 1)
                {
                    goodsQuery = goodsQuery.OrderBy(g => g.StockPrice);
                }
                // Kiểm tra nếu muốn sắp xếp theo stockPrice từ lớn đến bé
                else if (sortPrice == 2)
                {
                    goodsQuery = goodsQuery.OrderByDescending(g => g.StockPrice);
                }

                var count = goodsQuery.Count();
                var goods = goodsQuery
                    .Skip((page - 1) * pageSize)
                    .Take(pageSize)
                    .Select(g => new GoodsDTO
                    {
                        GoodsId = g.GoodsId,
                        GoodsCode = g.GoodsCode,
                        GoodsName = g.GoodsName,
                        CategoryId = g.CategoryId,
                        CategoryName = g.Category.CategoryName,
                        Description = g.Description,
                        StockPrice = g.StockPrice,
                        MeasuredUnit = g.MeasuredUnit,
                        //InStock = g.InStock,
                        Image = g.Image,
                        CreatedDate = g.CreatedDate,
                        WarrantyTime = g.WarrantyTime,
                        Barcode = g.Barcode,
                        MinStock = g.MinStock,
                        MaxStock = g.MaxStock,
                        SupplierId = g.SupplierId,
                        SupplierName = g.Supplier.SupplierName,
                        StatusId = g.StatusId,
                        Status = g.Status.StatusType
                    }).ToList();

                var totalPages = (int)Math.Ceiling((double)count / pageSize);

                return new GoodsFilterPaging { TotalPages = totalPages, PageSize = pageSize, Data = goods };
            }
            catch (Exception ex)
            {
                // Xử lý ngoại lệ nếu có
                throw new Exception("An error occurred while fetching goods by keyword", ex);
            }
        }

        

        public UpdateGoodsResponse UpdateGoods(UpdateGoodsRequest goods)
        {
            try
            {
                var requestGoods = new Good

                {
                    GoodsId = goods.GoodsId,
                    GoodsName = goods.GoodsName,
                    GoodsCode = goods.GoodsCode,
                    CategoryId = goods.CategoryId,
                    Description = goods.Description,
                    SupplierId = goods.SupplierId,
                    StockPrice = goods.StockPrice,
                    MeasuredUnit = goods.MeasuredUnit,
                    //InStock = goods.InStock,
                    Image = goods.Image,
                    StatusId = goods.StatusId,
                    WarrantyTime = goods.WarrantyTime,
                    Barcode = goods.Barcode,
                    MaxStock = goods.MaxStock,
                    MinStock = goods.MinStock
                };
                _context.Goods.Update(requestGoods);
                _context.SaveChanges();
                return new UpdateGoodsResponse { IsSuccess = true, Message = $"Cập nhật hàng hóa thành công" };

            }
            catch (Exception ex)
            {
                return new UpdateGoodsResponse { IsSuccess = false, Message = $"Cập nhật hàng hóa thất bại" };
            }
        }

        public bool UpdateStatusGoods(int id, int StatusId)
        {
            try
            {
                var user = GetGoodsById(id);
                if (user == null)
                {
                    return false;
                }
                user.StatusId = StatusId;
                _context.Update(user);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public async Task<List<GoodsDTO>> GetGoodsInWarehouse(int warehouseId)
        {
            return await _context.GoodsWarehouses
                .Where(gw => gw.WarehouseId == warehouseId)
                .Select(gw => new GoodsDTO
                {
                    GoodsId = gw.Good.GoodsId,
                    GoodsCode = gw.Good.GoodsCode,
                    GoodsName = gw.Good.GoodsName,
                    CategoryId = gw.Good.CategoryId,
                    CategoryName = gw.Good.Category.CategoryName,
                    Description = gw.Good.Description,
                    StockPrice = gw.Good.StockPrice,
                    MeasuredUnit = gw.Good.MeasuredUnit,
                    InStock = gw.Quantity,
                    Image = gw.Good.Image,
                    CreatedDate = gw.Good.CreatedDate,
                    WarrantyTime = gw.Good.WarrantyTime,
                    Barcode = gw.Good.Barcode,
                    MinStock = gw.Good.MinStock,
                    MaxStock = gw.Good.MaxStock,
                    SupplierId = gw.Good.SupplierId,
                    SupplierName = gw.Good.Supplier.SupplierName,
                    StatusId = gw.Good.StatusId,
                    Status = gw.Good.Status.StatusType
                })
                .ToListAsync();
        }

    }
}
