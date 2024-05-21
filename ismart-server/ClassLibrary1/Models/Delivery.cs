using System;
using System.Collections.Generic;

namespace iSmart.Entity.Models
{
    public partial class Delivery
    {
        public Delivery()
        {
            ExportOrders = new HashSet<ExportOrder>();
            ImportOrders = new HashSet<ImportOrder>();
        }

        public int DeliveyId { get; set; }
        public string DeliveryName { get; set; }

        public virtual ICollection<ExportOrder> ExportOrders { get; set; }
        public virtual ICollection<ImportOrder> ImportOrders { get; set; }
    }
}
