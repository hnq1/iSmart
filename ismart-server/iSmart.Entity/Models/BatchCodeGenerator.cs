using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.Models
{
    public static class BatchCodeGenerator
    {
        private static int _counter = 0;
        private static readonly object _lock = new object();

        public static string GenerateBatchCode(string warehousePrefix) //lấy theo tên kho để phân biệt lô ở kho nào
        {
            lock (_lock)
            {
                _counter++; //cho tăng dần
                return $"{warehousePrefix}{DateTime.Now:yyyyMMdd}{_counter:D3}"; //lấy theo ngày Vd: lô thứ nhất nhập kho sẽ là WH|29052024|001
            }
        }
    }

}
