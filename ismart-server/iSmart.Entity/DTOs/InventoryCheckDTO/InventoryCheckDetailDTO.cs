using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.DTOs.InventoryCheckDTO
{
    public class InventoryCheckDetailDTO
    {
        public int GoodId { get; set; }
        public string GoodCode { get; set; }
        public int ExpectedQuantity { get; set; }
        public int ActualQuantity { get; set; }
        public string? Note { get; set; }
    }
}
