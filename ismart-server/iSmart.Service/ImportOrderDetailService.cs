using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs;
using iSmart.Entity.DTOs.ImportOrderDetailDTO;
using iSmart.Entity.DTOs.ImportOrderDTO;
using iSmart.Entity.Models;
using iSmart.Service;

namespace iSmart.Service
{
    public interface IImportOrderDetailService
    {
        List<ImportOrderDetail> GetAllOrderDetails();
        CreateImportOrderDetailResponse AddOrderDetail(CreateImportOrderDetailRequest detail);
        UpdateImportOrderDetailResponse UpdateOrderDetail(UpdateImportOrderDetailRequest detail);
        bool DeleteImportOrderDetail(int id);
        List<ImportDetailDTO> GetOrderDetailsByOrderID(int oid);
    }
    public class ImportOrderDetailService : IImportOrderDetailService
    {
        private readonly iSmartContext _context;
        private readonly IImportOrderService _orderService;
        private iSmartContext context;

        public ImportOrderDetailService(iSmartContext context, IImportOrderService orderService)
        {
            _context = context;
            _orderService = orderService;
        }

        public ImportOrderDetailService(iSmartContext context)
        {
            _context = context;
        }

        public List<ImportOrderDetail> GetAllOrderDetails()
        {
            try
            {
                var details = _context.ImportOrderDetails.ToList();
                return details;

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public CreateImportOrderDetailResponse AddOrderDetail(CreateImportOrderDetailRequest detail)
        {
            try
            {
                var requestOrder = new ImportOrderDetail
                {
                    ImportId = detail.ImportId,
                    GoodsId = (int)detail.GoodsId,
                    Quantity = (int)detail.Quantity,
                    CostPrice = detail.CostPrice,
                    BatchCode = detail.BatchCode,
                    ExpiryDate = detail.ExpiryDate,
                    ManufactureDate = detail.ManufactureDate,
                };
                _context.ImportOrderDetails.Add(requestOrder);
                _context.SaveChanges();

                // Calculate total cost and update ImportOrder's TotalCost
                var importOrder = _context.ImportOrders.FirstOrDefault(io => io.ImportId == detail.ImportId);
                if (importOrder != null)
                {
                    decimal totalCost = (decimal)importOrder.ImportOrderDetails.Sum(iod => iod.Quantity * iod.CostPrice);
                    importOrder.TotalCost = (float)totalCost;
                    _context.SaveChanges();
                }

                return new CreateImportOrderDetailResponse { IsSuccess = true, Message = "Add order detail complete" };
            }
            catch (Exception e)
            {
                return new CreateImportOrderDetailResponse { IsSuccess = false, Message = $"Add order detail failed {e.Message}" };

            }
        }


        public bool DeleteImportOrderDetail(int id)
        {
            try
            {

                var order = _context.ImportOrderDetails.SingleOrDefault(x => x.DetailId == id);
                _context.ImportOrderDetails.Remove(order);
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }



        public List<ImportDetailDTO> GetOrderDetailsByOrderID(int oid)
        {
            try
            {
                var details = _context.ImportOrderDetails.Where(i => i.ImportId == oid)

                  .Select(i => new ImportDetailDTO
                  {
                      DetailId = i.DetailId,
                      ImportId = i.ImportId,
                      CostPrice = i.CostPrice,
                      GoodsId = i.GoodsId,
                      GoodsCode = i.Goods.GoodsCode,
                      Quantity = i.Quantity,
                      BatchCode = i.BatchCode,
                      ExpiryDate = i.ExpiryDate,
                      ManufactureDate = i.ManufactureDate,
                  }).ToList();
                return details;

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }


        public UpdateImportOrderDetailResponse UpdateOrderDetail(UpdateImportOrderDetailRequest detail)
        {
            try
            {
                var requestOrder = new ImportOrderDetail
                {
                    ImportId = detail.ImportId,
                    GoodsId = (int)detail.GoodsId,
                    Quantity = (int)detail.Quantity,
                    CostPrice = detail.CostPrice,
                    BatchCode = detail.BatchCode,
                    ExpiryDate = detail.ExpiryDate,
                    ManufactureDate = detail.ManufactureDate,
                };
                _context.Update(requestOrder);
                _context.SaveChanges();
                return new UpdateImportOrderDetailResponse { IsSuccess = true, Message = "Update order detail complete" };
            }
            catch (Exception e)
            {
                return new UpdateImportOrderDetailResponse { IsSuccess = false, Message = $"Update order detail failed {e.Message}" };
            }
        }
    }
}
