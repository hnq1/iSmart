using iSmart.Entity.Models;
using iSmart.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Test
{
    internal class TestSupplier
    {
        private SupplierService supplierService { get; set; } = null;
        private iSmartContext _context;

        [SetUp]
        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            supplierService = new SupplierService(context);
        }
        // get all category
        [Test]
        public void GetAllSupplier_Test()
        {
            var result = false;
            var suppliers = supplierService.GetAllSupplier();
            if (suppliers != null) result = true;
            Assert.That(result, Is.EqualTo(true));

        }
    }
}
