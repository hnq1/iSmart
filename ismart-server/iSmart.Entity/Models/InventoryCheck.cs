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
<<<<<<< HEAD


        public virtual Status Status { get; set; }

=======
>>>>>>> parent of 771822c (Merge branch 'main' of https://github.com/hnq1/iSmart into huynqhe150250)
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<InventoryCheckDetail> InventoryCheckDetails { get; set; }
    }
}
