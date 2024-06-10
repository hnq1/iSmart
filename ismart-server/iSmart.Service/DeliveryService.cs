﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.DeliveryDTO;
using iSmart.Entity.Models;
using Microsoft.AspNetCore.Mvc;

namespace iSmart.Service
{
    public interface IDeliveryService
    {
        DeliveryFilterPaging GetDeliveryByKeyWord(int page, string? keyword = "");
        List<Delivery> GetAllDelivery();
        Delivery GetDeliveryById(int id);
        CreateDeliveryResponse AddDelivery(CreateDeliveryRequest delivery);
        UpdateDeliveryResponse UpdateDelivery(UpdateDeliveryRequest delivery);

        bool UpdateDeleteStatusDelivery(int id);

    }
    public class DeliveryService : IDeliveryService
    {
        private readonly iSmartContext _context;

        public DeliveryService(iSmartContext context)
        {
            _context = context;
        }


        public bool UpdateDeleteStatusDelivery(int id)
        {
            try
            {
                var delivery = GetDeliveryById(id);
                if (delivery == null)
                {
                    return false;
                }

                delivery.StatusId = delivery.StatusId == 1 ? 2 : 1;

                _context.Deliveries.Update(delivery);
                _context.SaveChanges();

                return true;
            }
            catch (Exception)
            {
                return false;
            }
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
