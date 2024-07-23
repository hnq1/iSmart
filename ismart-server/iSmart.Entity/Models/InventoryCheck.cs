using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.Models
{
    public class InventoryCheck
    {
        public int Id { get; set; }
        public int WarehouseId { get; set; }
        public DateTime CheckDate { get; set; }

        // Navigation property
        public Warehouse Warehouse { get; set; }
        public ICollection<InventoryCheckDetail> InventoryCheckDetails { get; set; }
    }
}
