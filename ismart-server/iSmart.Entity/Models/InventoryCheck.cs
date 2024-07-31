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
        public int StatusId { get; set; }
        public DateTime CheckDate { get; set; }

        // Navigation property
<<<<<<< HEAD
=======
        public virtual Status Status { get; set; }
>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<InventoryCheckDetail> InventoryCheckDetails { get; set; }
    }
}
