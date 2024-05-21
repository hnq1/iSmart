using System;
using System.Collections.Generic;

namespace iSmart.Entity.Models
{
    public partial class ReturnsOrderDetail
    {
        public int DetailId { get; set; }
        public int ReturnsId { get; set; }
        public int GoodsId { get; set; }
        public float Price { get; set; }
        public int Quantity { get; set; }

        public virtual Good Goods { get; set; }
        public virtual ReturnsOrder Returns { get; set; }
    }
}
