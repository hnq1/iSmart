using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.DTOs.DeliveryDTO;
using iSmart.Entity.Models;
using iSmart.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Test
{
    public class TestDelivery
    {
        private DeliveryService _deliveryService { get; set; } = null;
        private iSmartContext _context;

        [SetUp]
        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            _deliveryService = new DeliveryService(context);
        }
        [Test]
        public void GetAllDelivery_Test() 
        {
            var result = false;
            List<Delivery> deliveries = _deliveryService.GetAllDelivery();
            if (deliveries != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }

        [Test]
        public void CreateDelivery_Test()
        {
            var result = false;
            var deliveryEntry = new CreateDeliveryRequest
            {
                DeliveryName = "Test",
            };
            var deliveryResponse = _deliveryService.AddDelivery(deliveryEntry);
            if (deliveryResponse.IsSuccess == true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        [Test]
        public void EditDelivery_Test()
        {
            var result = false;
            var deliveryEntry = new UpdateDeliveryRequest
            {
                DeliveryId = 1,
                DeliveryName = "TestUpdateDelivery",
            };
            var deliveryResponse = _deliveryService.UpdateDelivery(deliveryEntry);
            if (deliveryResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
    }
}
