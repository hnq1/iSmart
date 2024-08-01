using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.DTOs.InventoryCheckDTO
{
    public class CreateInventoryCheckDTO
    {
        public int WarehouseId { get; set; }
        public DateTime CheckDate { get; set; }
<<<<<<< HEAD


        public string? status { get; set; }

=======
>>>>>>> parent of 771822c (Merge branch 'main' of https://github.com/hnq1/iSmart into huynqhe150250)
        public List<InventoryCheckDetailDTO> InventoryCheckDetails { get; set; }
    }
}
