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
        //ImportOrderDetail? GetOrderDetailByOrderIdAndProductId(int oid, int pid);
        CreateImportOrderDetailResponse AddOrderDetail(CreateImportOrderDetailRequest detail);
        //UpdateImportOrderDetailResponse UpdateOrderDetail(UpdateImportOrderDetailRequest detail);
        //bool DeleteImportOrderDetail(int id);
        //List<ImportOrderDetail> GetOrderDetailsProcessByCustomerId(int cid);
        //List<ImportDetailDTO> GetOrderDetailsByOrderID(int oid);
    }
    public class ImportOrderDetailService : IImportOrderDetailService
    {
        private readonly iSmartContext _context;
        private readonly IImportOrderService _orderService;

        public ImportOrderDetailService(iSmartContext context, IImportOrderService orderService)
        {
            _context = context;
            _orderService = orderService;
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

                var product = _context.Goods.Find(requestOrder.GoodsId);
                if (product == null)
                {
                    return new CreateImportOrderDetailResponse
                    {
                        IsSuccess = false,
                        Message = $"Product with ID {requestOrder.GoodsId} not found"
                    };
                }

                // Cập nhật số lượng tồn kho
                product.InStock += requestOrder.Quantity;

                // Thêm chi tiết đơn hàng nhập
                _context.ImportOrderDetails.Add(requestOrder);
                _context.SaveChanges();

                return new CreateImportOrderDetailResponse
                {
                    IsSuccess = true,
                    Message = "Add order detail complete"
                };
            }
            catch (Exception e)
            {
                return new CreateImportOrderDetailResponse
                {
                    IsSuccess = false,
                    Message = $"Add order detail failed: {e.Message}"
                };
            }
        }


        //public bool DeleteImportOrderDetail(int id)
        //{
        //    try
        //    {

        //        var order = _context.ImportOrderDetails.SingleOrDefault(x => x.DetailId == id);
        //        _context.ImportOrderDetails.Remove(order);
        //        _context.SaveChanges();
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        throw new Exception(ex.Message);
        //    }
        //}



        //public ImportOrderDetail? GetOrderDetailByOrderIdAndProductId(int oid, int pid)
        //{
        //    throw new NotImplementedException();
        //}

        //public List<ImportDetailDTO> GetOrderDetailsByOrderID(int oid)
        //{
        //    try
        //    {
        //        var details = _context.ImportOrderDetails.Where(i => i.ImportId == oid)

        //          .Select(i => new ImportDetailDTO
        //          {
        //               DetailId = i.DetailId,
        //               ImportId = i.ImportId,
        //               CostPrice = i.CostPrice,
        //               GoodsId = i.GoodsId,
        //               GoodsCode = i.Goods.GoodsCode,
        //               Quantity = i.Quantity
        //           }).ToList();              
        //        return details;

        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception(e.Message);
        //    }
        //}

        //public List<ImportOrderDetail> GetOrderDetailsProcessByCustomerId(int cid)
        //{
        //    throw new NotImplementedException();
        //}

        //public bool DeleteImportOrderDetail(int oid, int pid)
        //{
        //    throw new NotImplementedException();
        //}

        //public UpdateImportOrderDetailResponse UpdateOrderDetail(UpdateImportOrderDetailRequest detail)
        //{
        //    try
        //    {
        //        var requestOrder = new ImportOrderDetail
        //        {
        //            DetailId = detail.DetailId,
        //            ImportId = detail.ImportId,
        //            GoodsId = detail.GoodsId,
        //            Quantity = detail.Quantity,
        //            CostPrice = detail.CostPrice
        //        };
        //        _context.Update(requestOrder);
        //        _context.SaveChanges();
        //        return new UpdateImportOrderDetailResponse { IsSuccess = true, Message = "Update order detail complete" };
        //    }
        //    catch (Exception e)
        //    {
        //        return new UpdateImportOrderDetailResponse { IsSuccess = false, Message = $"Update order detail failed {e.Message}" };
        //    }
        //}
    }
}
