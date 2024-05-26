using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WM.Entity.Models;
namespace WM.Entity.DTOs
{
    public class ResponseData<T>
    {
        public List<T> Data { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
    }
}
