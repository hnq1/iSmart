using System;
using System.Collections.Generic;

namespace iSmart.Entity.Models
{
    public partial class Warehouse
    {
        public Warehouse()
        {
            Bills = new HashSet<Bill>();
            ExportOrders = new HashSet<ExportOrder>();
            Goods = new HashSet<Good>();
            ImportOrders = new HashSet<ImportOrder>();
            ReturnsOrders = new HashSet<ReturnsOrder>();
            UserWarehouses = new HashSet<UserWarehouse>();
        }

        public int WarehouseId { get; set; }
        public string WarehouseName { get; set; }
        public string? WarehouseAddress { get; set; }
        public string? WarehousePhone { get; set; }

        public virtual ICollection<Bill> Bills { get; set; }
        public virtual ICollection<ExportOrder> ExportOrders { get; set; }
        public virtual ICollection<Good> Goods { get; set; }
        public virtual ICollection<ImportOrder> ImportOrders { get; set; }
        public virtual ICollection<ReturnsOrder> ReturnsOrders { get; set; }
        public virtual ICollection<UserWarehouse> UserWarehouses { get; set; }
    }
}
