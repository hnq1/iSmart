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
=======
        public string? status { get; set; }
>>>>>>> bf24d5b7e79b359d3851ca248b0f64624a58b629
        public List<InventoryCheckDetailDTO> InventoryCheckDetails { get; set; }
    }
}
