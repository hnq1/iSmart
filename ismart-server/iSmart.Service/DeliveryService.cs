using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WM.Entity.DTOs.DeliveryDTO;
using WM.Entity.DTOs.StorageDTO;
using WM.Entity.Models;

namespace WM.Service
{
    public interface IDeliveryService
    {
        DeliveryFilterPaging GetDeliveryByKeyWord(int page, string? keyword = "");
        List<Delivery> GetAllDelivery();
        Delivery GetDeliveryById(int id);
        CreateDeliveryResponse AddDelivery(CreateDeliveryRequest delivery);
        UpdateDeliveryResponse UpdateDelivery(UpdateDeliveryRequest delivery);

    }
    public class DeliveryService : IDeliveryService
    {
        private readonly WarehouseManagementContext _context;

        public DeliveryService(WarehouseManagementContext context)
        {
            _context = context;
        }

        public CreateDeliveryResponse AddDelivery(CreateDeliveryRequest delivery)
        {
            try
            {
                var requestDelivery = new Delivery
                {
                    DeliveryName = delivery.DeliveryName
                };
                _context.Deliveries.Add(requestDelivery);
                _context.SaveChanges();
                return new CreateDeliveryResponse { IsSuccess = true, Message = $"Thêm delivery thành công" };

            }catch (Exception ex)
            {
                return new CreateDeliveryResponse { IsSuccess = true, Message = $"Thêm delivery thất bại" };
            }
        }

        public List<Delivery> GetAllDelivery()
        {
            try
            {
                var deliveries = _context.Deliveries.ToList();
                return deliveries;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public Delivery GetDeliveryById(int id)
        {
            try
            {
                var deliveries = _context.Deliveries.FirstOrDefault(d => d.DeliveyId == id);
                return deliveries ?? null;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public DeliveryFilterPaging GetDeliveryByKeyWord(int page, string? keyword = "")
        {
            try
            {
                var pageSize = 6;

                var deliveries = _context.Deliveries.Where(d => d.DeliveryName.ToLower().Contains(keyword.ToLower()))                                                      
                                                .OrderBy(d => d.DeliveyId).ToList();
                var count = deliveries.Count();
                var res = deliveries.Skip((page - 1) * pageSize).Take(pageSize).ToList();
                var totalPages = Math.Ceiling((double)count / pageSize);
                return new DeliveryFilterPaging { TotalPages = (int)totalPages, PageSize = pageSize, Data = res };

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public UpdateDeliveryResponse UpdateDelivery(UpdateDeliveryRequest delivery)
        {
            try
            {
                var requestDelivery = new Delivery
                {
                    DeliveyId = delivery.DeliveyId,
                    DeliveryName = delivery.DeliveryName
                };
                _context.Deliveries.Update(requestDelivery);
                _context.SaveChanges();
                return new UpdateDeliveryResponse { IsSuccess = true, Message = $"Thay doi delivery thành công" };

            }
            catch (Exception ex)
            {
                return new UpdateDeliveryResponse { IsSuccess = false, Message = $"Thay doi delivery that bai" };
            }
        }
    }
}
