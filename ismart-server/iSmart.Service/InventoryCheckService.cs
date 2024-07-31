using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.DTOs.ImportOrderDTO;
using iSmart.Entity.DTOs.InventoryCheckDTO;
using iSmart.Entity.Migrations;
using iSmart.Entity.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Service
{
    public interface IInventoryCheckService
    {
        CreateInventoryCheckResponse CreateInventoryCheck(CreateInventoryCheckDTO inventoryCheck);

        Task<List<CreateInventoryCheckDTO>> GetAllInventoryChecksAsync();

        Task<List<CreateInventoryCheckDTO>> GetAllInventoryChecksAsync(int? warehouseId);

        Task<ResponseInventoryCheckDTO> GetInventoryCheckByIdAsync(int id);
        Task UpdateBatchQuantitiesAsync(Dictionary<string, int> batchQuantities);
    }

    public class InventoryCheckService : IInventoryCheckService
    {
        private readonly iSmartContext _context;
        public InventoryCheckService(iSmartContext context)
        {
            _context = context;
        }

        public CreateInventoryCheckResponse CreateInventoryCheck(CreateInventoryCheckDTO inventoryCheckDTO)
        {
            try
            {
                var inventoryCheck = new InventoryCheck
                {
                    WarehouseId = inventoryCheckDTO.WarehouseId,
                    CheckDate = inventoryCheckDTO.CheckDate,


                    StatusId = 3

                };
                _context.InventoryChecks.Add(inventoryCheck);
                _context.SaveChanges();
                foreach (var detail in inventoryCheckDTO.InventoryCheckDetails)
                {
                    var good = _context.Goods.SingleOrDefault(g => g.GoodsCode == detail.GoodCode);
                    if (good == null)
                    {
                        throw new Exception($"Good with code {detail.GoodCode} not found.");
                    }

                    int inventoryCheckId = inventoryCheck.Id;
                    var inventoryCheckDetail = new InventoryCheckDetail
                    {
                        InventoryCheckId = inventoryCheckId,
                        GoodId = good.GoodsId,
                        ExpectedQuantity = detail.ExpectedQuantity,
                        ActualQuantity = detail.ActualQuantity,
                        note = detail.Note
                    };

                    _context.InventoryCheckDetails.Add(inventoryCheckDetail);
                }
                _context.SaveChanges();
                return new CreateInventoryCheckResponse { IsSuccess = true, Message = "Tạo phiếu kiểm kê thành công" };
            }
            catch (Exception ex)
            {
                return new CreateInventoryCheckResponse { IsSuccess = false, Message = $"Tạo phiếu kiểm kê thất bại: {ex.Message}" };
            }
        }

<<<<<<< HEAD
        public async Task<List<CreateInventoryCheckDTO>> GetAllInventoryChecksAsync()
        {
            try
            {
                return await _context.InventoryChecks
=======
        public async Task<List<CreateInventoryCheckDTO>> GetAllInventoryChecksAsync(int? warehouseId)
        {
            try
            {
                var query = _context.InventoryChecks.AsQueryable();

                if (warehouseId.HasValue)
                {
                    query = query.Where(ic => ic.WarehouseId == warehouseId.Value);
                }

                return await query
>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
                    .Select(ic => new CreateInventoryCheckDTO
                    {
                        WarehouseId = ic.WarehouseId,
                        CheckDate = ic.CheckDate,
<<<<<<< HEAD
=======
                        status = ic.StatusId == 3 ? "On Progress" :
                         ic.StatusId == 4 ? "Completed" : "Cancel",
>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
                        InventoryCheckDetails = ic.InventoryCheckDetails.Select(d => new InventoryCheckDetailDTO
                        {
                            GoodCode = _context.Goods.FirstOrDefault(g => g.GoodsId == d.GoodId).GoodsCode,
                            ExpectedQuantity = d.ExpectedQuantity,
                            ActualQuantity = d.ActualQuantity,
<<<<<<< HEAD
                            Note = d.note
=======
                            Note = d.note,
                            
>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
                        }).ToList()
                    })
                    .ToListAsync();
            }
            catch (Exception ex)
            {
                throw new ApplicationException("An error occurred while fetching inventory checks.", ex);
            }
        }

<<<<<<< HEAD
=======

>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
        public async Task<ResponseInventoryCheckDTO> GetInventoryCheckByIdAsync(int id)
        {
                var inventoryCheck = await _context.InventoryChecks.Include(i => i.Warehouse).ThenInclude(i => i.UserWarehouses).ThenInclude(i => i.User).ThenInclude(I => I.Role)
                    .Include(ic => ic.InventoryCheckDetails)
                    .ThenInclude(d => d.Good)
                    .FirstOrDefaultAsync(ic => ic.Id == id);

                if (inventoryCheck == null)
                {
                    throw new Exception($"Inventory Check with ID {id} not found.");
                }

            var groupedDetails = inventoryCheck.InventoryCheckDetails
                .GroupBy(i => i.GoodId)
                .Select(g => new ResponseInventoryCheckDetailDTO
                {
                    goodCode = g.First().Good.GoodsCode,
                    goodName = g.First().Good.GoodsName,
                    ActualQuantity = g.Sum(i => i.ActualQuantity),
                    InAppQuantity = g.Sum(i => i.ExpectedQuantity),
                    Difference = g.Sum(i => i.ExpectedQuantity) - g.Sum(i => i.ActualQuantity),
                    MeasureUnit = g.First().Good.MeasuredUnit,
                    Note = string.Join(", ", g.Select(i => i.note).Where(n => !string.IsNullOrEmpty(n)))
                }).ToList();

            return new ResponseInventoryCheckDTO
            {
                AccountantName = inventoryCheck.Warehouse.UserWarehouses.FirstOrDefault(i => i.User.RoleId == 4)?.User.UserName,
                WarehouseName = inventoryCheck.Warehouse.WarehouseName,
                WarehouseAddress = inventoryCheck.Warehouse.WarehouseAddress,
                WarehouseManagerName = inventoryCheck.Warehouse.UserWarehouses.FirstOrDefault(i => i.User.RoleId == 2)?.User.UserName,
                Detail = groupedDetails
            };

        }

        public async Task UpdateBatchQuantitiesAsync(Dictionary<string, int> batchQuantities)
        {
            try
            {
                foreach (var batch in batchQuantities)
                {
                    var batchCode = batch.Key;
                    var quantity = batch.Value;

                    var inventoryBatch = await _context.ImportOrderDetails
                        .FirstOrDefaultAsync(b => b.BatchCode == batchCode);

                    if (inventoryBatch == null)
                    {
                        throw new Exception($"Batch with code {batchCode} not found.");
                    }

                    inventoryBatch.ActualQuantity = quantity;
                }

                await _context.SaveChangesAsync();
            }
            catch (Exception ex)
            {
                throw new Exception($"Update failed: {ex.Message}");
            }
        }



    }
}