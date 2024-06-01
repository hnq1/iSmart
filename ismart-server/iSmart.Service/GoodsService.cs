using Microsoft.EntityFrameworkCore;

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
        GoodsFilterPaging GetGoodsByKeyword(int page, int? categoryId, int? supplierId, int? sortPriece, string? keyword = "");
        Task<List<Good>?> GetAllGoods();

        Task<List<Good>?> GetAllGoodsWithStorageAndSupplier(int storageId, int supplierId);
        Good GetGoodsById(int id);
        CreateGoodsResponse AddGoods(CreateGoodsRequest goods);
        UpdateGoodsResponse UpdateGoods(UpdateGoodsRequest goods);
        bool UpdateStatusGoods(int id, int StatusId);

    }
    public class GoodsService : IGoodsService
    {
        private readonly iSmartContext _context;
        public GoodsService(iSmartContext context)
        {
            _context = context;
        }

        public CreateGoodsResponse AddGoods(CreateGoodsRequest goods)
        {
            try
            {

                var requestGoods = new Good
                {
                    GoodsName = goods.GoodsName,
                    GoodsCode = goods.GoodsCode,
                    CategoryId = goods.CategoryId,
                    Description = goods.Description,
                    SupplierId = goods.SupplierId,
                    MeasuredUnit = goods.MeasuredUnit,
                    InStock = goods.InStock,
                    Image = goods.Image,
                    StatusId = goods.StatusId,
                    StockPrice = goods.StockPrice,
                    CreatedDate = DateTime.Now,
                    WarrantyTime = goods.WarrantyTime,
                    Barcode = goods.Barcode,
                    MaxStock = goods.MaxStock,
                    MinStock = goods.MinStock

                };
                if (_context.Goods.SingleOrDefault(i => i.GoodsCode == goods.GoodsCode) == null)
                {
                    _context.Goods.Add(requestGoods);
                    _context.SaveChanges();
                    return new CreateGoodsResponse { IsSuccess = true, Message = $"Thêm hang hoa thành công" };
                }
                else return new CreateGoodsResponse { IsSuccess = false, Message = $"Hang da ton tai" };

            }
            catch (Exception ex)
            {
                return new CreateGoodsResponse { IsSuccess = false, Message = $"Thêm hàng hoa thất bại, {ex.Message}" };
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

        public GoodsFilterPaging? GetGoodsByKeyword(int page, int? categoryId, int? supplierId, int? sortPrice, string? keyword = "")
        {
            try
            {
                // Đảm bảo giá trị page không âm hoặc bằng 0
                if (page < 1)
                {
                    page = 1;
                }

                var pageSize = 6;

                var goodsQuery = _context.Goods.Include(g => g.Status).Include(g => g.Category).Include(g => g.Supplier)
                    .Where(g => (g.GoodsName.ToLower().Contains(keyword.ToLower()) || g.GoodsCode.ToLower().Contains(keyword.ToLower()))
                    && (categoryId == null || g.Category.CategoryId == categoryId)
                    && (supplierId == null || g.Supplier.SupplierId == supplierId)
                    );

                // Kiểm tra nếu muốn sắp xếp theo costPrice từ bé đến lớn
                if (sortPrice == 1)
                {
                    goodsQuery = goodsQuery.OrderBy(g => g.StockPrice);
                }
                // Kiểm tra nếu muốn sắp xếp theo costPrice từ lớn đến bé
                else if (sortPrice == 2)
                {
                    goodsQuery = goodsQuery.OrderByDescending(g => g.StockPrice);
                }

                var goods = goodsQuery
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
                        InStock = g.InStock,
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
                    });

                var count = goods.Count();
                var res = goods.Skip((page - 1) * pageSize).Take(pageSize).ToList();

                var totalPages = Math.Ceiling((double)count / pageSize);
                return new GoodsFilterPaging { TotalPages = (int)totalPages, PageSize = pageSize, Data = res };
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
                    InStock = goods.InStock,
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
    }
}
