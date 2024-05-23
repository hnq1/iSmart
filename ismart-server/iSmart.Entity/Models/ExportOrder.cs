using System;
using System.Collections.Generic;

namespace iSmart.Entity.Models
{
    public partial class ExportOrder
    {
        public ExportOrder()
        {
            AvailableForReturns = new HashSet<AvailableForReturn>();
            ExportOrderDetails = new HashSet<ExportOrderDetail>();
            ReturnsOrders = new HashSet<ReturnsOrder>();
        }

        public int ExportId { get; set; }
        public string ExportCode { get; set; }
        public int UserId { get; set; }
        public float TotalPrice { get; set; }
        public string? Note { get; set; }
        public int StatusId { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime? ExportedDate { get; set; }
        public int WarehouseId { get; set; }
        public int ProjectId { get; set; }
        public DateTime? CancelDate { get; set; }
        public int? DeliveryId { get; set; }
        public string? Image { get; set; }
        public int? StaffId { get; set; }
        public string? Customer { get; set; }
        public string? Address { get; set; }

        public virtual Delivery Delivery { get; set; }
        public virtual Status Status { get; set; }
        public virtual User User { get; set; }
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<AvailableForReturn> AvailableForReturns { get; set; }
        public virtual ICollection<ExportOrderDetail> ExportOrderDetails { get; set; }
        public virtual ICollection<ReturnsOrder> ReturnsOrders { get; set; }
    }
}
