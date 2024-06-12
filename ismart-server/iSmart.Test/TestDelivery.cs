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
        public void GetAllDelivery_Test() 
        {
            var result = false;
            var delivverys = _deliveryService.GetAllDelivery();
            if (delivverys != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
    }
}
