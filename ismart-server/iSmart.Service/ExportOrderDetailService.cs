using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.ExportOrderDetailDTO;
using iSmart.Entity.DTOs.ExportOrderDTO;
using iSmart.Entity.Models;

namespace iSmart.Service
{
    public interface IExportOrderDetailService
    {
        List<ExportOrderDetail> GetAllExportOrderDetails();
        CreateExportOrderDetailResponse AddOrderDetail(CreateExportOrderDetailRequest detail);
        UpdateExportOrderDetailResponse UpdateOrderDetail(UpdateExportOrderDetailRequest detail);
        bool DeleteExportOrderDetail(int id);
        List<ExportDetailDTO> GetOrderDetailsByOrderID(int oid);
    }
    public class ExportOrderDetailService : IExportOrderDetailService
    {
        private readonly iSmartContext _context;
        private readonly IExportOrderService _orderService;

        public ExportOrderDetailService(iSmartContext context, IExportOrderService orderService)
        {
            _context = context;
            _orderService = orderService;
        }
        public CreateExportOrderDetailResponse AddOrderDetail(CreateExportOrderDetailRequest detail)
        {
            try
            {
                var requestOrder = new ExportOrderDetail
                {
                    ExportId = detail.ExportId,
                    GoodsId = detail.GoodsId,
                    Quantity = detail.Quantity,
                    Price = detail.Price,
                    ImportOrderDetailId = detail.ImportOrderDetailId
                };
                _context.ExportOrderDetails.Add(requestOrder);
                _context.SaveChanges();
                return new CreateExportOrderDetailResponse { IsSuccess = true, Message = "Add order detail complete" };
            }
            catch (Exception e)
            {
                return new CreateExportOrderDetailResponse { IsSuccess = false, Message = $"Add order detail failed {e.Message}" };

            }
        }

        public bool DeleteExportOrderDetail(int id)
        {
            try
            {
                var order = _context.ExportOrderDetails.SingleOrDefault(x => x.DetailId == id);
                _context.ExportOrderDetails.Remove(order);
                _context.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public List<ExportOrderDetail> GetAllExportOrderDetails()
        {
            try
            {
                var details = _context.ExportOrderDetails.ToList();
                return details;

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }


        public List<ExportDetailDTO> GetOrderDetailsByOrderID(int oid)
        {
            try
            {
                var details = _context.ExportOrderDetails.Where(i => i.ExportId == oid)
<<<<<<< HEAD
                    .Select( i => new ExportDetailDTO
                {
=======
                    .Select(i => new ExportDetailDTO
                    {
>>>>>>> main
                        DetailId = i.DetailId,
                        ExportId = i.ExportId,
                        GoodsId = i.GoodsId,
                        Price = i.Price,
                        Quantity = i.Quantity,
                        GoodsCode = i.Goods.GoodsCode,
                        ImportOrderDetailId = i.ImportOrderDetailId
<<<<<<< HEAD
                    })      
=======
                    })
>>>>>>> main
                     .ToList();
                return details;

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
<<<<<<< HEAD
  
=======

>>>>>>> main

        public UpdateExportOrderDetailResponse UpdateOrderDetail(UpdateExportOrderDetailRequest detail)
        {
            try
            {
                var requestOrder = new ExportOrderDetail
                {
                    DetailId = detail.DetailId,
                    ExportId = detail.ExportId,
                    GoodsId = detail.GoodsId,
                    Quantity = detail.Quantity,
                    Price = detail.Price,
                    ImportOrderDetailId = detail.ImportOrderDetailId
                };
                _context.Update(requestOrder);
                _context.SaveChanges();
                return new UpdateExportOrderDetailResponse { IsSuccess = true, Message = "Update order detail complete" };
            }
            catch (Exception e)
            {
                return new UpdateExportOrderDetailResponse { IsSuccess = false, Message = $"Update order detail failed {e.Message}" };
            }
        }
    }
}
