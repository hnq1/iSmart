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
    internal class TestDelivery
    {
        private DeliveryService _deliveryService { get; set; } = null;
        private iSmartContext _context;

        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            _deliveryService = new DeliveryService(context);
        }

        [Test]
        public void UpdateDeleteStatusDelivery_Test()
        {
            var result = false;
            var deliverys = _deliveryService.UpdateDeleteStatusDelivery(1);
            if (deliverys != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }

        [Test]
        public void AddDelivery_Test()
        {
            var result = false;
            var deliveryEntry = new CreateDeliveryRequest
            {
                DeliveryName = "test"
            };
            var deliveryRespone = _deliveryService.AddDelivery(deliveryEntry);
            if (deliveryRespone != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
    }
}
