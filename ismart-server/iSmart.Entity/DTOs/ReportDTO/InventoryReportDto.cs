using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.DTOs.ReportDTO
{
    public class InventoryReportDto
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public string MeasureUnit { get; set; }
        public int Imports { get; set; }
        public int Exports { get; set; }
        public int Balance { get; set; }
    }
}
