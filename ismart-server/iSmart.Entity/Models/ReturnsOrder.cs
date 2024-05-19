using System;
using System.Collections.Generic;

namespace iSmart.Entity.Models
{
    public partial class ReturnsOrder
    {
        public ReturnsOrder()
        {
            ReturnsOrderDetails = new HashSet<ReturnsOrderDetail>();
        }

        public int ReturnsId { get; set; }
        public int? ImportId { get; set; }
        public int? ExportId { get; set; }
        public int? SupplierId { get; set; }
        public int UserId { get; set; }
        public string Note { get; set; }
        public string Image { get; set; }
        public DateTime CreatedDate { get; set; }
        public string ReturnsCode { get; set; }
        public int WarehouseId { get; set; }
        public float TotalPrice { get; set; }
        public int StatusId { get; set; }
        public DateTime? ImportedDate { get; set; }

        public virtual ExportOrder Export { get; set; }
        public virtual ImportOrder Import { get; set; }
        public virtual Status Status { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual User User { get; set; }
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<ReturnsOrderDetail> ReturnsOrderDetails { get; set; }
    }
}
