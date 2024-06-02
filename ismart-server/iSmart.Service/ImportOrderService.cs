using Microsoft.EntityFrameworkCore;

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.ImportOrderDTO;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Entity.Models;

namespace WM.Service
{
    public interface IImportOrderService
    {
        //UpdateImportOrderResponse UpdateOrder(UpdateImportOrderRequest i);

        //int GetImportOrderNewest();
        List<ImportOrderDTO> GetAllImportOrder();
        //ImportOrder? GetImportOrderById(int id);
        //ImportOrder? GetImportOrderByOrderCode(string code);

        //CreateImportOrderResponse CreateImportOrder(CreateImportOrderRequest i);
        //ImportOrderFilterPaging ImportOrderFilterPaging(int page, int? storage, int? status, int? sortDate,  string? keyword = "");
    }

    public class ImportOrderService : IImportOrderService
    {
        private readonly iSmartContext _context;

        public ImportOrderService(iSmartContext context)
        {
            _context = context;
        }
        //public CreateImportOrderResponse CreateImportOrder(CreateImportOrderRequest i)
        //{
        //    try
        //    {
        //        var importOrder = new ImportOrder
        //        {
        //            //ImportId = i.ImportId,
        //            ImportCode = "NH"+i.ImportCode,
        //            UserId = i.UserId,
        //            SupplierId = i.SupplierId,
        //            TotalCost = i.TotalCost,
        //            Note = i.Note,
        //            CreatedDate = DateTime.Now,
        //            ImportedDate = i.ImportedDate,
        //            StatusId = i.StatusId,
        //            StorageId = i.StorageId,
        //            DeliveryId = i.DeliveryId,
        //            Image = i.Image,
        //            StorekeeperId = i.StokekeeperId,                   
        //        };
        //            if (_context.ImportOrders.SingleOrDefault(z => importOrder.ImportCode.ToLower() == z.ImportCode.ToLower()) == null)
        //            {
        //            _context.Add(importOrder);
        //            _context.SaveChanges();
        //            return new CreateImportOrderResponse { IsSuccess = true, Message = "Tao don hang nhap vao thanh cong" };
        //        }
        //        else return new CreateImportOrderResponse { IsSuccess = false, Message = $"Ma don hang da ton tai \n" };
        //    }
        //    catch (Exception e)
        //    {
        //       return new CreateImportOrderResponse { IsSuccess = false, Message = $"Tao don hang that bai \n + {e.Message}" };
        //     }
           
        //}

        //public int GetImportOrderNewest()
        //{
        //    var importOrderNewest = _context.ImportOrders.OrderByDescending(i => i.ImportId).FirstOrDefault();
        //    if(importOrderNewest != null)
        //    {
        //        return importOrderNewest.ImportId;
        //    }
        //    return 0;
           
        //}

        public List<ImportOrderDTO> GetAllImportOrder()
        {
            try
            {
                var importOrder = _context.ImportOrders
                    .Select( i=> new ImportOrderDTO
                    {
                        ImportId = i.ImportId,
                        ImportCode = i.ImportCode,
                        UserId = i.UserId,
                        UserName = i.User.UserName,
                        SupplierId = i.SupplierId,
                        SupplierName = i.Supplier.SupplierName,
                        TotalCost = i.TotalCost,
                        Note = i.Note,
                        CreatedDate = i.CreatedDate,
                        ImportedDate = i.ImportedDate,
                        StatusId = i.StatusId,
                        StatusType = i.Status.StatusType,
                        StorageId = i.WarehouseId,
                        StorageName = i.Warehouse.WarehouseName,
                        DeliveryId = i.DeliveryId,
                        DeliveryName = i.Delivery.DeliveryName,
                        Image = i.Image,
                        StorekeeperId = i.StaffId,
                        ImportOrderDetails = (List<ImportDetailDTO>)i.ImportOrderDetails
                        .Select(
                                i => new ImportDetailDTO { 
                                ImportId = i.ImportId,
                                CostPrice = i.CostPrice,
                                GoodsId = i.GoodsId,
                                GoodsCode = i.Goods.GoodsCode ?? null,
                                Quantity = i.Quantity,
                                BatchCode = i.BatchCode,
                                ManufactureDate = i.ManufactureDate,
                                ExpiryDate = i.ExpiryDate,
                                })
                    })
                    .ToList();
                return importOrder;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message); 
            }
        }

        //public ImportOrder? GetImportOrderById(int id)
        //{
        //    try
        //    {
        //        var importOrder = _context.ImportOrders
        //            .Include(i => i.Status).Include(i => i.User).Include(i => i.Storage).Include(i => i.Storage)
        //            .FirstOrDefault(i => i.ImportId == id);                  
        //        return importOrder;
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception(e.Message);
        //    }
        //}

        //public ImportOrder? GetImportOrderByOrderCode(string code)
        //{
        //    try
        //    {
        //        var importOrder = _context.ImportOrders
        //            .Include(i => i.Status).Include(i => i.User).Include(i => i.Storage).Include(i => i.Storage)
        //            .FirstOrDefault(i => i.ImportCode.ToLower().Contains(code.ToLower()));
        //        return importOrder ?? null;
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception(e.Message);
        //    }
        //}

        //public ImportOrderFilterPaging ImportOrderFilterPaging(int page, int? storage, int? status, int? sortDate,  string? keyword="")

        //{
        //    try
        //    {
        //        var pageSize = 6;
        //        if (page <= 0) page = 1;
        //        var users = _context.ImportOrders
                    
        //            //.Include(s => s.User).Include(s => s.Storage).Include(s => s.Status).Include( s => s.Supplier).Include(s => s.Project)
        //            .Where(s => s.ImportCode.ToLower().Contains(keyword.ToLower())
                                                                                                                                                               
        //                                              && (s.StatusId == status|| status == null)
        //                                              && (storage == null || s.StorageId == storage));
        //        if (sortDate != null)
        //        {
        //            users = users.OrderBy(s => s.ImportedDate);
        //        }
        //        var count = users.Count();
        //        var importOrder = users.Select(i => new ImportOrderDTO
        //        {
        //            ImportId = i.ImportId,
        //            ImportCode = i.ImportCode,
        //            UserId = i.UserId,
        //            UserName = i.User.UserName,
        //            SupplierId = i.SupplierId,
        //            SupplierName = i.Supplier.SupplierName,
        //            TotalCost = i.TotalCost,
        //            Note = i.Note,
        //            CreatedDate = i.CreatedDate,
        //            ImportedDate = i.ImportedDate,
        //            StatusId = i.StatusId,
        //            StatusType = i.Status.StatusType,
        //            StorageId = i.StorageId,
        //            StorageName = i.Storage.StorageName,                 
        //            DeliveryId = i.DeliveryId,
        //            DeliveryName = i.Delivery.DeliveryName,
        //            Image = i.Image,
        //            StorekeeperId = i.StorekeeperId,
        //            StorekeeperName = _context.Users.FirstOrDefault(u => u.UserId == i.StorekeeperId).UserName,
        //            ImportOrderDetails = (List<ImportDetailDTO>)i.ImportOrderDetails
        //                .Select(
        //                        i => new ImportDetailDTO
        //                        {
        //                            ImportId = i.ImportId,
        //                            // DetailId = i.DetailId,
        //                            CostPrice = i.CostPrice,
        //                            GoodsId = i.GoodsId,
        //                            GoodsCode = i.Goods.GoodsCode ?? "",
        //                            Quantity = i.Quantity,
        //                            // MeasureUnit = i.Goods.MeasuredUnit
        //                        })

        //        });
        //        var res = importOrder.Skip((page - 1) * pageSize).Take(pageSize).ToList();
        //        var totalPages = Math.Ceiling((double)count / pageSize);
        //        return new ImportOrderFilterPaging
        //        {
        //            Data = res,
        //            PageSize = pageSize,
        //            TotalPages = (int)totalPages
        //        };
        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception(e.Message);
        //    }
        //}

        //public UpdateImportOrderResponse UpdateOrder(UpdateImportOrderRequest i)
        //{
        //        try
        //        {


        //            var importOrder = new ImportOrder
        //            {
        //                ImportId = i.ImportId,
        //                ImportCode = i.ImportCode,
        //                UserId = i.UserId,                        
        //                SupplierId = i.SupplierId,                         
        //                TotalCost = i.TotalCost,
        //                Note = i.Note,
        //                CreatedDate = i.CreatedDate,
        //                ImportedDate = i.ImportedDate,
        //                StatusId = i.StatusId,                      
        //                StorageId = i.StorageId,                                               
        //                DeliveryId = i.DeliveryId,                     
        //                Image = i.Image,
        //                StorekeeperId = i.StokekeeperId,                        
        //            };
        //            _context.Update(importOrder);
        //            _context.SaveChanges();
        //            return new UpdateImportOrderResponse { IsSuccess = true, Message = "Cap nhap don hang nhap vao thanh cong" };
        //        }
        //        catch (Exception e)
        //        {
        //            return new UpdateImportOrderResponse { IsSuccess = false, Message = $"Cap nhap don hang that bai +{e.Message}" };
        //        }
            
        //}
    }
}
