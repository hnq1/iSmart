using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.Models
{
    public class InventoryCheckDetail
    {
        public int Id { get; set; }
        public int InventoryCheckId { get; set; }
        public int GoodId { get; set; }
        public int ExpectedQuantity { get; set; }
        public int ActualQuantity { get; set; }
        public int Difference => ActualQuantity - ExpectedQuantity;
        public string? note { get; set; }

        // Navigation properties
        public InventoryCheck InventoryCheck { get; set; }
        public Good Good { get; set; }
    }
}
