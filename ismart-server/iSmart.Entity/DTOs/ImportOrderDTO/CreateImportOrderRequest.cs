﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.DTOs.ImportOrderDTO
{
    public class CreateImportOrderRequest
    {
       //ublic int ImportId { get; set; }
        //public int UserId { get; set; }

        public int? SupplierId { get; set; }
       
        public float? TotalCost { get; set; }

        public string? Note { get; set; }

        public DateTime CreatedDate { get; set; }

        public DateTime? ImportedDate { get; set; }

        public int StatusId { get; set; }
       
        public string ImportCode { get; set; } = null!;

        public int WarehouseId { get; set; }      
       
        public int? DeliveryId { get; set; }
       
        public string? Image { get; set; }
        public int WarehouseDestinationId { get; set; }

        //public int? StokekeeperId { get; set; }
        //public List<ImportDetailDTO>? ImportOrderDetails { get; set; }

    }
}
